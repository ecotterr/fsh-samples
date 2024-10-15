Alias: $SCT = http://snomed.info/sct
Alias: $LOINC = http://loinc.org

Profile: COVID19PatientProfile
Parent: Patient

Id: covid19-patient
Title: "COVID-19 Patient Profile"
Description: "Profile for patients with confirmed or suspected COVID-19"
* identifier 1..* MS
* name 1..* MS
* birthDate 1..1 MS
* gender 1..1 MS
* extension contains
    VaccinationStatus named vaccinationStatus 0..1 MS and
    IsolationRequired named isolationRequired 0..1 MS
	Extension: VaccinationStatus

Id: vaccination-status
Title: "COVID-19 Vaccination Status"
Description: "Indicates the patient's COVID-19 vaccination status"
* value[x] only CodeableConcept
* valueCodeableConcept from COVID19VaccinationStatusVS (required)
	Extension: IsolationRequired

Id: isolation-required
Title: "Isolation Required"
Description: "Indicates whether the patient requires isolation"
* value[x] only boolean
	Profile: COVID19ConditionProfile
Parent: Condition
Id: covid19-condition
Title: "COVID-19 Condition Profile"
Description: "Profile for recording COVID-19 diagnosis and symptoms"
* code from COVID19DiagnosisVS (required)
* severity from COVID19SeverityVS (required)
* subject only Reference(COVID19PatientProfile)
* onset[x] 1..1 MS
* clinicalStatus 1..1 MS
	ValueSet: COVID19DiagnosisVS

Id: covid19-diagnosis-vs
Title: "COVID-19 Diagnosis Value Set"
Description: "Codes for COVID-19 diagnosis"
* $SCT#840539006 "COVID-19"
* $SCT#840544004 "Suspected COVID-19"
	ValueSet: COVID19SeverityVS

Id: covid19-severity-vs
Title: "COVID-19 Severity Value Set"
Description: "Codes for COVID-19 severity"
* $SCT#255604002 "Mild"
* $SCT#6736007 "Moderate"
* $SCT#24484000 "Severe"
* $SCT#442452003 "Critical"
	ValueSet: COVID19VaccinationStatusVS
    
Id: covid19-vaccination-status-vs
Title: "COVID-19 Vaccination Status Value Set"
Description: "Codes for COVID-19 vaccination status"
* $SCT#1324761000000105 "Received first dose of COVID-19 vaccine"
* $SCT#1324771000000104 "Received all doses of COVID-19 vaccine"
* $SCT#1324781000000101 "Not vaccinated against COVID-19"
	Instance: ExampleCOVID19Patient
InstanceOf: COVID19PatientProfile
Description: "Example of a COVID-19 patient"
* identifier[0].system = "http://hospital.example.org/patients"
* identifier[0].value = "12345"
* name[0].family = "Smith"
* name[0].given[0] = "John"
* birthDate = "1980-01-01"
* gender = #male
* extension[vaccinationStatus].valueCodeableConcept = $SCT#1324771000000104 "Received all doses of COVID-19 vaccine"
* extension[isolationRequired].valueBoolean = false
	Instance: ExampleCOVID19Condition
InstanceOf: COVID19ConditionProfile
Description: "Example of a COVID-19 condition"
* subject = Reference(ExampleCOVID19Patient)
* code = $SCT#840539006 "COVID-19"
* severity = $SCT#6736007 "Moderate"
* onset[x] = "2023-03-15"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
