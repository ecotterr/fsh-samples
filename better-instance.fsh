// we can use aliases for brevity.
Alias: $marital = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus

Instance: JaneDoe
InstanceOf: Patient
Description: "A sample patient instance"
* active = true
* name[0]
  * given[0] = "Jane" // indent 2 spaces for nesting
  * family = "Doe"
* gender = #female
* birthDate = "1965-01-01"
* maritalStatus = $marital#L "Legally Seperated"
* generalPractitioner = Reference(DrSurtinLee)