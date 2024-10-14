// (1) Declaration
Instance: JaneDoe

// (2): Keywords
InstanceOf: Patient // could also be a profile
Description: "A sample patient instance"

// (3) rules - note that these are all Assignment Rules (a = b) since this is an instance
* active = true
* name[0].given[0] = "Jane"
* name[0].family = "Doe"
* gender = #female
* birthDate = "1965-01-01"
* maritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus#L "Legally Seperated"
* generalPractitioner = Reference(DrSurtinLee)