# ISIM PowerTools for Code Versioning and Management

This is a set of Security Directory Integrator Assembly Lines intended to aid in exporting and importing of the custom IBM Security Identity Management code.
It handles ACLs, Forms, Workflows, Mail Templates, and Provisioning Policies. Also included is an XSLT script to sort the inside of exported workflow XMLS to aid in comparing different versions of the same workflow.

ISIM sometimes re-orders internal elements of the workflow, and, while the order does not affect the workflow function, it does mess up the diff-ing. This script helps overcome that issue.

## How it works
The provided assembly lines iterate over the LDAP entries that ISIM uses to store custom objects and export associated code and, and in some cases, additional attributes (e.g. ACL) into XML files.
The assembly line use a strict naming convention for the exported files, that allows the code to be re-imported back into ISIM into the same objects.

You need to have TDI 7.1.1 or better installed to run this code. An alternative way to export all the code, that only needs a python interpreter is to use the [ISIM Code Extractor](https://github.com/BlueBayTechnologies/Automatic-ISIM-Workflow-Documentation/blob/master/itimcodeextractor.py) script from a sister repo.
itimcodeextractor.py can only export code, not import, but it uses the same naming convention as this code, so you can later re-import the code back using the provided assembly lines. As an added benefit, the python script creates a statistics file that shows all services, people, account, role and provisioning policies found in the LDAP.

## Usage
1. First, load the project into TDI or SDI 7.2. You can do this by clicking File -> Import, selecting General, then "Existing Project into Workspace" and picking the "ITIM PowerTools" folder.
2. Expand Resources/Properties and edit ITIM and ITIM PowerTools settings, configuring the proper host names, user names, password and Export/Import folder locations.
3. You can then run the Export and Import assembly line normally. The ExportAllCustomCode assembly line kicks off all export assembly lines and is provided as a convinience.

Once exported, you can modify the XML code as you wish, copy it into the "Import" folders and run the import assembly lines to re-import the modified code.

## Notes
To do the code versioning and backups, you could automate running the ExportAllCustomCode assembly line like this:
`ibmdisrv -c"D:\PowerTools\rs.xml" -r"ExportAllCustomCode"`
and then push the code automatically into the code versioning repository of your choice.

## Limitations
Right now it is not possible to create new workflows by using Import assembly lines on files, i.e. you can only update already existing code. To overcome this limitation, use ISIM's built in import/export functionality to create the workflows first, then you can use the provided assembly lines.