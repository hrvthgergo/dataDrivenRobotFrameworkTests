# dataDrivenRobotFrameworkTests
How to create test cases and tags based on data driven methodology when the number of test cases is unknown before test run.

## Set up
Save [DynamicTagAndTestCaseCreation.py](https://github.com/hrvthgergo/dataDrivenRobotFrameworkTests/blob/main/DynamicTagAndTestCaseCreation.py) into your python site packages -> ..Lib/site-packages/DynamicTagAndTestCaseCreation.py.

## Test Cases
Create Test Cases based on the quieried data from any source, in the example I used database.

step 1: Suite Setup  Preparation: Creating Test Cases By Ids -> call the Preparation: Creating Test Cases By Ids Keyword to create test cases based on queried data.

step 2: Listing Identifiers from DB -> collect and return the data from DB as a list, based on the given query.

step 3: 

```robot
:FOR  ${list_of_id}  IN  @{list_of_ids}
    \  Add Test Case
```
 Create test cases according to the length of the @{list_of_ids} list. The order of the input/set up data can be managed by the add_test_case(self, name, tag, kwname, *args) function ([DynamicTagAndTestCaseCreation.py](https://github.com/hrvthgergo/dataDrivenRobotFrameworkTests/blob/main/DynamicTagAndTestCaseCreation.py)).
