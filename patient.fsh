// This is a comment

// (1) Declaration
Profile: MyPatientProfile

// (2) Keywords
Parent: Patient // Must specify a parent resource or profile
Description: "Example Patient"

// (3) Rules are always defined with *s
* name 1..2
* name.given and name.family MS
* maritalStatus from https://hl7.org/fhir/ValueSet/marital-status
* deceased[x] only boolean
