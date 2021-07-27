# save it to ..Lib/site-packages/DynamicTagAndTestCaseCreation.py.

from __future__ import print_function
from robot.running.model import TestSuite

class DynamicTestCaseCreation(object):
    ROBOT_LISTENER_API_VERSION = 3
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self
        self.current_suite = None

    def _start_suite(self, suite, result):
        # save current suite so that we can modify it later
        self.current_suite = suite
        suite.filter(excluded_tags="placeholder")

    def add_test_case(self, name, tag, kwname, *args): #*kwargs
        tc = self.current_suite.tests.create(name=name, tags=tag)
        tc.keywords.create(name=kwname, args=args)

# To get our class to load, the module needs to have a class
# with the same name of a module. This makes that happen:
globals()[__name__] = DynamicTagAndTestCaseCreation
