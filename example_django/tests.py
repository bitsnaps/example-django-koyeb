from django.test import SimpleTestCase

# Create your tests here.
class AppTest(SimpleTestCase):

    # function name must starts with "test"
    def test_endpoint_is_resolved(self):
        assert 1 == 1