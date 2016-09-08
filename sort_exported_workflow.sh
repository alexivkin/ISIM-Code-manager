#!/bin/bash
# sorts operational workflows exported from ITIM's LDAP to assist in DIFF'ing two workflows that were internally re-arranged by TIM
# The sorted files are broken - do not import these back (currently not all nodes are showing up in the output file)
# Use only for workflow analysis and comparison
# run as $0 infile outfile
xsltproc -o $2 sort_workflow_contents.xslt $1 