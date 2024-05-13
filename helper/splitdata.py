import numpy as np
def extract_facts_and_modes_from_file(file_path):
    # Initialize containers for the different types of facts and mode declarations
    positive_facts = []
    negative_facts = []
    background_facts = []
    mode_declarations = []

    # Open and read the file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Iterate over each line to categorize it
    for line in lines:
        clean_line = line.strip()
        if clean_line.startswith('modeh(') or clean_line.startswith('modeb('):
            mode_declarations.append(clean_line)
        elif clean_line.startswith('complication('):
            if ', absent).' in clean_line:
                negative_facts.append(clean_line)
            else:
                positive_facts.append(clean_line)
        else:
            if clean_line:  # ensuring not to include empty lines
                background_facts.append(clean_line)

    return positive_facts, negative_facts, background_facts, mode_declarations

# Use the function
file_path = '/path/to/your/full_data.pl'  # Replace with your actual file path
positive_facts, negative_facts, background_facts, mode_declarations = extract_facts_and_modes_from_file(file_path)

# Example output
print("Mode Declarations:", mode_declarations)
print("Positive Facts:", positive_facts)
print("Negative Facts:", negative_facts)
print("Background Facts:", background_facts)

# Function to distribute background knowledge based on patient indices in examples
def extract_relevant_background(background_facts, examples):
    relevant_background = []
    patient_ids_in_examples = {line.split('(')[1].split(')')[0] for line in examples}
    for fact in background_facts:
        if fact.split('(')[1].split(',')[0] in patient_ids_in_examples:
            relevant_background.append(fact)
    return relevant_background

# Randomly shuffle the positive and negative examples to distribute them randomly into three files
np.random.shuffle(positive_facts)
np.random.shuffle(negative_facts)

# Define the number of examples per file based on the smallest example set (negative, because it has fewer entries)
num_files = 3
num_positive_per_file = len(positive_facts) // num_files
num_negative_per_file = len(negative_facts) // num_files

# Create three files with balanced content
files_content = []

for i in range(num_files):
    start_pos = i * num_positive_per_file
    end_pos = start_pos + num_positive_per_file
    start_neg = i * num_negative_per_file
    end_neg = start_neg + num_negative_per_file
    
    pos_examples_for_file = positive_facts[start_pos:end_pos]
    neg_examples_for_file = negative_facts[start_neg:end_neg]
    
    # Extract relevant background knowledge
    relevant_background = extract_relevant_background(background_facts, pos_examples_for_file + neg_examples_for_file)
    
    # Prepare content for each file
    content = mode_declarations + "\n"
    content += ":- begin_bg.\n" + "\n".join(relevant_background) + "\n:- end_bg.\n\n"
    content += ":- begin_in_pos.\n" + "\n".join(pos_examples_for_file) + "\n:- end_in_pos.\n\n"
    content += ":- begin_in_neg.\n" + "\n".join(neg_examples_for_file) + "\n:- end_in_neg."
    
    files_content.append(content)

# Save each part to a separate file
file_paths = []
for i in range(num_files):
    file_path = f'/mnt/data/balanced_progol_data_part_{i+1}.pl'
    with open(file_path, 'w') as file:
        file.write(files_content[i])
    file_paths.append(file_path)

file_paths