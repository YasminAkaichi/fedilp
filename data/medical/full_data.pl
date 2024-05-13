modeh(1, complication(+patient)).
modeb(*, experience(+patient)).
modeb(*, hta(+patient)).
modeb(*, diabete(+patient)).
modeb(*, bpco(+patient)).
modeb(*, asthme(+patient)).
modeb(*, coronarien(+patient)).
modeb(*, ic(+patient)).
modeb(*, patientobese(+patient)).
modeb(*, higharcadepalete(+patient)).
modeb(*, shortneck(+patient)).
modeb(*, necktrauma(+patient)).
modeb(*, beardormoustache(+patient)).
modeb(*, largetongue(+patient)).
modeb(*, openingmouth(+patient)).
modeb(*, thyromentaldistance(+patient)).
modeb(*, extubation(+patient)).
modeb(*, betweenhyoidboneandthyroid(+patient)).

modeb(*, cervicalcollar(+patient)).
modeb(*, cormack(+patient)).
modeb(*, elderly(+patient)).
modeb(*, eichman(+patient)).
modeb(*, laryngodifficile(+patient)).
modeb(*, secondoperator(+patient)).
modeb(*, intubationdifficile(+patient)).
modeb(*, cardiacarrest(+patient)).
modeb(*, hypotention(+patient)).
modeb(*, bradycardie(+patient)).
modeb(*, intubationselective(+patient)).
modeb(*, intubationoesophagienne(+patient)).

determination(complication/1, intubationselective/1).
determination(complication/1, intubationoesophagienne/1).
determination(complication/1, bradycardie/1).
determination(complication/1, experience/1).
determination(complication/1, hta/1).
determination(complication/1, extubation/1).
determination(complication/1, diabete/1).
determination(complication/1, bpco/1).
determination(complication/1, asthme/1).
determination(complication/1, coronarien/1).
determination(complication/1, ic/1).
determination(complication/1, patientobese/1).
determination(complication/1, higharcadepalete/1).
determination(complication/1, shortneck/1).
determination(complication/1, necktrauma/1).
determination(complication/1, beardormoustache/1).
determination(complication/1, largetongue/1).
determination(complication/1, openingmouth/1).
determination(complication/1, thyromentaldistance/1).
determination(complication/1, betweenhyoidboneandthyroid/1).
determination(complication/1, cervicalcollar/1).
determination(complication/1, cormack/1).
determination(complication/1, elderly/1).
determination(complication/1, laryngodifficile/1).
determination(complication/1, eichman/1).
determination(complication/1, intubationdifficile/1).
determination(complication/1, secondoperator/1).
determination(complication/1, cardiacarrest/1).
determination(complication/1, hypotention/1).

:- begin_bg.
hta(patient0).
coronarien(patient0).
ic(patient0).
beardormoustache(patient0).
elderly(patient0).
laryngodifficile(patient0).
largetongue(patient1).
laryngodifficile(patient1).
cardiacarrest(patient1).
hta(patient2).
diabete(patient2).
patientobese(patient2).
shortneck(patient2).
openingmouth(patient2).
elderly(patient2).
laryngodifficile(patient2).
eichman(patient2).
intubationdifficile(patient2).
cardiacarrest(patient2).
cormack(patient2).


cormack(patient3).
cormack(patient11).
cormack(patient48).
cormack(patient68).
cormack(patient8).
cormack(patient13).
cormack(patient14).
cormack(patient103).
cormack(patient0).
cormack(patient4).
cormack(patient7).

cormack(patient15).
cormack(patient19).
cormack(patient32).
cormack(patient36).
cormack(patient52).
cormack(patient57).
cormack(patient58).
cormack(patient70).
cormack(patient72).
cormack(patient78).
cormack(patient80).
cormack(patient82).

cormack(patient95).
cormack(patient96).
cormack(patient98).
cormack(patient101).
cormack(patient102).
cormack(patient111).
cormack(patient116).
cormack(patient117).


experience(patient3).
higharcadepalete(patient3).
largetongue(patient3).
openingmouth(patient3).
elderly(patient3).
laryngodifficile(patient3).
secondoperator(patient3).
hypotention(patient3).
cardiacarrest(patient3).
hta(patient4).
diabete(patient4).
patientobese(patient4).
largetongue(patient4).
laryngodifficile(patient4).
secondoperator(patient4).
eichman(patient4).
intubationdifficile(patient4).
desaturation(patient4).
cardiacarrest(patient4).

hta(patient5).
bpco(patient5).
patientobese(patient5).
shortneck(patient5).
largetongue(patient5).
openingmouth(patient5).
thyromentaldistance(patient5).
secondoperator(patient5).
eichman(patient5).
intubationdifficile(patient5).
hypotention(patient5).
desaturation(patient5).
hta(patient6).
beardormoustache(patient6).
largetongue(patient6).
openingmouth(patient6).
thyromentaldistance(patient6).
betweenhyoidboneandthyroid(patient6).
elderly(patient6).
eichman(patient6).
intubationdifficile(patient6).
hypotention(patient6).
desaturation(patient6).
cardiacarrest(patient6).
bradycardie(patient6).
bpco(patient7).
beardormoustache(patient7).
largetongue(patient7).
laryngodifficile(patient7).
secondoperator(patient7).
eichman(patient7).
intubationdifficile(patient7).
hypotention(patient7).
desaturation(patient7).
extubation(patient7).
experience(patient8).
hta(patient8).
diabete(patient8).
coronarien(patient8).
higharcadepalete(patient8).
largetongue(patient8).
elderly(patient8).
laryngodifficile(patient8).
hypotention(patient8).
desaturation(patient8).
cardiacarrest(patient8).
patientobese(patient9).
shortneck(patient9).
hypotention(patient9).
desaturation(patient9).
bradycardie(patient9).
largetongue(patient10).
openingmouth(patient10).
eichman(patient10).
intubationdifficile(patient10).
cardiacarrest(patient10).
experience(patient11).
bpco(patient11).
coronarien(patient11).
patientobese(patient11).
higharcadepalete(patient11).
beardormoustache(patient11).
largetongue(patient11).
laryngodifficile(patient11).
eichman(patient12).
intubationdifficile(patient12).
cardiacarrest(patient12).
experience(patient13).
hta(patient13).
patientobese(patient13).
beardormoustache(patient13).
elderly(patient13).
laryngodifficile(patient13).
desaturation(patient13).
cardiacarrest(patient13).
experience(patient14).
hta(patient14).
bpco(patient14).
patientobese(patient14).
shortneck(patient14).
largetongue(patient14).
laryngodifficile(patient14).
desaturation(patient14).
cardiacarrest(patient14).
higharcadepalete(patient15).
largetongue(patient15).
laryngodifficile(patient15).
secondoperator(patient15).
eichman(patient15).
moyensupraglottique(patient15).
intubationdifficile(patient15).
hypotention(patient15).
desaturation(patient15).
cardiacarrest(patient15).
intubationselective(patient15).
intubationoesophagienne(patient15).
experience(patient16).
patientobese(patient16).
shortneck(patient16).
openingmouth(patient16).
eichman(patient16).
cardiacarrest(patient16).
experience(patient17).
hypotention(patient17).
diabete(patient18).
eichman(patient18).
intubationdifficile(patient18).
cardiacarrest(patient18).
experience(patient19).
laryngodifficile(patient19).
eichman(patient19).
intubationdifficile(patient19).
desaturation(patient19).
fracturedentaire(patient19).
cardiacarrest(patient19).
experience(patient20).
hta(patient20).
diabete(patient20).
patientobese(patient20).
shortneck(patient20).
openingmouth(patient20).
elderly(patient20).
eichman(patient20).
intubationdifficile(patient20).
hypotention(patient20).
experience(patient21).
bpco(patient21).
ic(patient21).
higharcadepalete(patient21).
elderly(patient21).
hypotention(patient21).
desaturation(patient21).
cardiacarrest(patient21).
diabete(patient22).
beardormoustache(patient22).
largetongue(patient22).
betweenhyoidboneandthyroid(patient22).
elderly(patient22).
extubation(patient22).
hta(patient24).
diabete(patient24).
patientobese(patient24).
shortneck(patient24).
elderly(patient24).
cardiacarrest(patient24).
hta(patient25).
diabete(patient25).
patientobese(patient25).
largetongue(patient25).
secondoperator(patient25).
cardiacarrest(patient25).
beardormoustache(patient26).
largetongue(patient26).
hypotention(patient26).
desaturation(patient26).
diabete(patient27).
coronarien(patient27).

elderly(patient27).
desaturation(patient27).
cardiacarrest(patient27).
openingmouth(patient28).
hta(patient29).
diabete(patient29).

hypotention(patient29).
hta(patient30).

secondoperator(patient30).
eichman(patient30).
intubationdifficile(patient30).
hypotention(patient30).
desaturation(patient30).
hta(patient31).
largetongue(patient31).
hta(patient32).
diabete(patient32).
coronarien(patient32).
patientobese(patient32).
shortneck(patient32).
laryngodifficile(patient32).
cardiacarrest(patient32).
patientobese(patient33).
shortneck(patient33).
experience(patient34).

hypotention(patient34).
desaturation(patient34).
hta(patient35).
ic(patient35).
patientobese(patient35).
shortneck(patient35).
largetongue(patient35).
cardiacarrest(patient35).
experience(patient36).
coronarien(patient36).
ic(patient36).
higharcadepalete(patient36).
largetongue(patient36).
laryngodifficile(patient36).
secondoperator(patient36).
eichman(patient36).
intubationdifficile(patient36).
desaturation(patient36).
cardiacarrest(patient36).
experience(patient37).
hta(patient37).

hta(patient39).
higharcadepalete(patient39).
openingmouth(patient39).
secondoperator(patient39).
desaturation(patient39).
experience(patient40).

experience(patient41).
hta(patient41).
diabete(patient41).
shortneck(patient41).
beardormoustache(patient41).
openingmouth(patient41).
elderly(patient41).
hypotention(patient41).
experience(patient42).
higharcadepalete(patient42).
desaturation(patient42).
experience(patient43).
coronarien(patient44).
elderly(patient44).
hypotention(patient44).
desaturation(patient44).

experience(patient47).
shortneck(patient47).
necktrauma(patient47).
cervicalcollar(patient47).
experience(patient48).
higharcadepalete(patient48).
shortneck(patient48).
openingmouth(patient48).
thyromentaldistance(patient48).
laryngodifficile(patient48).
experience(patient49).

desaturation(patient49).
experience(patient50).
diabete(patient50).

elderly(patient50).
experience(patient51).

intubationselective(patient51).
beardormoustache(patient52).
largetongue(patient52).
laryngodifficile(patient52).
hta(patient53).
patientobese(patient53).
shortneck(patient53).
thyromentaldistance(patient53).
betweenhyoidboneandthyroid(patient53).
cardiacarrest(patient53).
experience(patient54).
hta(patient54).
diabete(patient54).
thyromentaldistance(patient54).
elderly(patient54).
secondoperator(patient54).
hypotention(patient54).
hta(patient55).
patientobese(patient55).
shortneck(patient55).
thyromentaldistance(patient56).
experience(patient57).


laryngodifficile(patient57).
secondoperator(patient57).
hypotention(patient57).
desaturation(patient57).
intubationoesophagienne(patient57).
experience(patient58).

laryngodifficile(patient58).
experience(patient59).
hta(patient59).
bpco(patient59).
shortneck(patient59).
elderly(patient59).
hypotention(patient59).

patientobese(patient63).
largetongue(patient63).
hypotention(patient63).
desaturation(patient63).
cardiacarrest(patient63).
experience(patient64).
hta(patient64).
diabete(patient64).
coronarien(patient64).
patientobese(patient64).
beardormoustache(patient64).
largetongue(patient64).
elderly(patient64).
intubationdifficile(patient64).
desaturation(patient64).
experience(patient65).
hta(patient65).
diabete(patient65).
higharcadepalete(patient65).
largetongue(patient65).
openingmouth(patient65).
bradycardie(patient65).
experience(patient66).

intubationselective(patient66).

shortneck(patient68).
largetongue(patient68).
thyromentaldistance(patient68).
betweenhyoidboneandthyroid(patient68).
laryngodifficile(patient68).
secondoperator(patient68).
eichman(patient68).
intubationdifficile(patient68).
desaturation(patient68).
cardiacarrest(patient68).
intubationoesophagienne(patient68).
coronarien(patient69).

elderly(patient69).
hypotention(patient69).
desaturation(patient69).
thyromentaldistance(patient70).
laryngodifficile(patient70).
secondoperator(patient70).
eichman(patient70).
intubationdifficile(patient70).
desaturation(patient70).
experience(patient71).
asthme(patient71).

desaturation(patient71).
bradycardie(patient71).
experience(patient72).

laryngodifficile(patient72).
hypotention(patient72).
diabete(patient73).
patientobese(patient73).
shortneck(patient73).
desaturation(patient73).
experience(patient74).
openingmouth(patient74).
bpco(patient75).
secondoperator(patient75).
hta(patient76).
diabete(patient76).
elderly(patient76).
secondoperator(patient76).
intubationdifficile(patient76).
coronarien(patient77).
patientobese(patient77).
higharcadepalete(patient77).
shortneck(patient77).
openingmouth(patient77).
patientobese(patient78).

laryngodifficile(patient78).
secondoperator(patient78).
hta(patient79).
ic(patient79).
patientobese(patient79).
shortneck(patient79).
hypotention(patient79).
cardiacarrest(patient79).
bpco(patient80).
laryngodifficile(patient80).
secondoperator(patient80).
hypotention(patient80).
desaturation(patient80).
cardiacarrest(patient80).
diabete(patient81).

secondoperator(patient81).
intubationdifficile(patient81).
hypotention(patient81).
desaturation(patient81).
intubationoesophagienne(patient81).
hta(patient82).
higharcadepalete(patient82).
openingmouth(patient82).
laryngodifficile(patient82).
secondoperator(patient82).
eichman(patient82).
moyensupraglottique(patient82).
intubationdifficile(patient82).
desaturation(patient82).
intubationselective(patient82).
intubationoesophagienne(patient82).
hta(patient83).
diabete(patient83).
patientobese(patient83).


desaturation(patient85).
hta(patient86).
diabete(patient86).
coronarien(patient86).
ic(patient86).
shortneck(patient86).
secondoperator(patient86).
desaturation(patient86).
cardiacarrest(patient86).
hta(patient87).
diabete(patient87).
coronarien(patient87).
ic(patient87).
higharcadepalete(patient87).

elderly(patient87).
secondoperator(patient87).
hypotention(patient87).
desaturation(patient87).
cardiacarrest(patient87).

desaturation(patient88).
experience(patient89).
hta(patient89).
diabete(patient89).
coronarien(patient89).

desaturation(patient89).
patientobese(patient90).
shortneck(patient90).
hypotention(patient90).
experience(patient91).
hta(patient91).
secondoperator(patient91).
hypotention(patient91).
hta(patient92).
hypotention(patient92).
desaturation(patient92).
bradycardie(patient92).
experience(patient93).
asthme(patient93).
thyromentaldistance(patient93).
desaturation(patient93).
experience(patient94).
bpco(patient94).
openingmouth(patient94).
hypotention(patient94).
experience(patient95).
shortneck(patient95).
betweenhyoidboneandthyroid(patient95).
laryngodifficile(patient95).
eichman(patient95).
intubationdifficile(patient95).
experience(patient96).
hta(patient96).
diabete(patient96).
patientobese(patient96).
shortneck(patient96).
thyromentaldistance(patient96).
laryngodifficile(patient96).
experience(patient97).
thyromentaldistance(patient97).
experience(patient98).
hta(patient98).
ic(patient98).
shortneck(patient98).
openingmouth(patient98).
laryngodifficile(patient98).
hypotention(patient98).
cardiacarrest(patient98).

hta(patient99).
diabete(patient99).

experience(patient101).

patientobese(patient101).
shortneck(patient101).
thyromentaldistance(patient101).
laryngodifficile(patient101).
diabete(patient102).
laryngodifficile(patient102).
secondoperator(patient102).
desaturation(patient102).
intubationoesophagienne(patient102).
hta(patient103).
diabete(patient103).
coronarien(patient103).
patientobese(patient103).
shortneck(patient103).
thyromentaldistance(patient103).
betweenhyoidboneandthyroid(patient103).
laryngodifficile(patient103).
secondoperator(patient103).
intubationdifficile(patient103).
desaturation(patient103).

beardormoustache(patient105).
hta(patient106).
patientobese(patient106).
necktrauma(patient106).

patientobese(patient107).

diabete(patient108).
bpco(patient108).
beardormoustache(patient108).
openingmouth(patient108).
elderly(patient108).
bpco(patient110).
ic(patient110).
hta(patient111).
diabete(patient111).
patientobese(patient111).
openingmouth(patient111).
elderly(patient111).
laryngodifficile(patient111).
eichman(patient111).
intubationdifficile(patient111).
desaturation(patient111).
hta(patient113).
diabete(patient113).
coronarien(patient113).
experience(patient114).
hta(patient114).
diabete(patient114).
patientobese(patient114).
shortneck(patient114).
openingmouth(patient114).
hypotention(patient114).
desaturation(patient114).
experience(patient115).
asthme(patient115).
cardiacarrest(patient115).
bradycardie(patient115).
experience(patient116).
hta(patient116).
diabete(patient116).
ic(patient116).
laryngodifficile(patient116).
secondoperator(patient116).
eichman(patient116).
intubationdifficile(patient116).
desaturation(patient116).
cardiacarrest(patient116).
experience(patient117).
hta(patient117).
diabete(patient117).
patientobese(patient117).
thyromentaldistance(patient117).
laryngodifficile(patient117).
eichman(patient117).
intubationdifficile(patient117).
:- end_bg.

:- begin_in_pos.
complication(patient1).
complication(patient2).
complication(patient3).
complication(patient4).
complication(patient5).
complication(patient6).
complication(patient7).
complication(patient8).
complication(patient9).
complication(patient10).
complication(patient12).
complication(patient13).
complication(patient14).
complication(patient15).
complication(patient16).
complication(patient17).
complication(patient18).
complication(patient19).
complication(patient20).
complication(patient21).
complication(patient22).
complication(patient24).
complication(patient25).
complication(patient26).
complication(patient27).
complication(patient29).
complication(patient30).
complication(patient32).
complication(patient34).
complication(patient35).
complication(patient36).
complication(patient39).
complication(patient41).
complication(patient42).
complication(patient44).
complication(patient49).
complication(patient51).
complication(patient53).
complication(patient54).
complication(patient57).
complication(patient59).
complication(patient63).
complication(patient64).
complication(patient65).
complication(patient66).
complication(patient68).
complication(patient69).
complication(patient70).
complication(patient71).
complication(patient72).
complication(patient73).
complication(patient79).
complication(patient80).
complication(patient81).
complication(patient82).
complication(patient85).
complication(patient86).
complication(patient87).
complication(patient88).
complication(patient89).
complication(patient90).
complication(patient91).
complication(patient92).
complication(patient93).
complication(patient94).
complication(patient98).
complication(patient102).
complication(patient103).
complication(patient111).
complication(patient114).
complication(patient115).
complication(patient116).
:- end_in_pos.

:- begin_in_neg.
complication(patient0).
complication(patient11).
complication(patient23).
complication(patient28).
complication(patient31).
complication(patient33).
complication(patient37).
complication(patient38).
complication(patient40).
complication(patient43).
complication(patient45).
complication(patient46).
complication(patient47).
complication(patient48).
complication(patient50).
complication(patient52).
complication(patient55).
complication(patient56).
complication(patient58).
complication(patient60).
complication(patient61).
complication(patient62).
complication(patient67).
complication(patient74).
complication(patient75).
complication(patient76).
complication(patient77).
complication(patient78).
complication(patient83).
complication(patient84).
complication(patient95).
complication(patient96).
complication(patient97).
complication(patient99).
complication(patient100).
complication(patient101).
complication(patient104).
complication(patient105).
complication(patient106).
complication(patient107).
complication(patient108).
complication(patient109).
complication(patient110).
complication(patient112).
complication(patient113).
complication(patient117).
:- end_in_neg.