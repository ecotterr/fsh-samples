# FSH Samples

Define FHIR profiles, instances, extensions, value sets and more with FSH (pronounced 'fish').

Check out https://fshschool.org

# How can I compile a FSH file into an IG?

1. Install the LTS [Node.js](https://nodejs.org/) release for your OS

2. `npm install -g fsh-sushi`
or check the SUSHI install instructions [here](https://fshschool.org/docs/sushi/installation/)

3. `sushi init` will create working SUSHI project in your working directory with a project name of your choice.

4. copy any *.fsh files into the `./<my-sushi-project>/input` directory

5. `sushi ./<my-sushi-project>` will assemble IGs for any profiles, extensions, resources, valuesets, etc. sitting in the `input` folder.

6. To publish the IGs, follow the full steps on [HL7 IG Publisher site](https://hl7.github.io/docs/ig_publisher/getting-started)
