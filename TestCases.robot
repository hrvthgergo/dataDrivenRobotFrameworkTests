*** Settings ***
Documentation  How to create dinamically/data driven Test Cases and Tags in Robot Framework

Library  DynamicTagAndTestCaseCreation

Suite Setup  Preparation: Creating Test Cases By Ids

*** Test Cases ***

#This test case is neccessary becouse of the Listener Interface functionality ,but this test case is filtered out in ..Lib/site-packages/DynamicTagAndTestCaseCreation.py.
Placeholder Test Case
  [Tags]  placeholder
  No Operation

*** Keywords ***

#practically save it to a different file
Listing Identifiers from DB
	No Operation
	# the query for the below sample looks like:
	#select id_1,id_2,id_3, tag
	#from table
	#where condition;

#practically save it to a different file	
Test Steps
	No Operation

Preparation: Creating Test Cases By Ids
  # Collecting the Ids to create dinamic test cases based on these identifiers.
  @{list_of_ids} =  Listing Identifiers from DB
  # Creating test cases by IDs.
  :FOR  ${list_of_id}  IN  @{list_of_ids}
  \  Add Test Case  ID_1: ${list_of_id[0]}, ID_2: ${list_of_id[1]} ID_3:${list_of_id[2]}  Tag:${list_of_id[3]}  Test Steps  ${list_of_id}  #based in def add_test_case(self, name, tag, kwname, *args)
  #name:  ID_1: ${list_of_id[0]}, ID_2: ${list_of_id[1]} ID_3:${list_of_id[2]}-> depends on your will.
  #tag: Tag:${list_of_id[3]}-> depends on your will.
  #kwname: Test Steps, 
  #*args: ${list_of_id}-> input args of the keyword.
