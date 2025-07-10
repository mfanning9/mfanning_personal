import re
from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck

class GmailEmailCheck(BaseResourceCheck):
    def __init__(self):
        name = "No personal gmail emails"
        id = "CKV_CUSTOM_002"
        supported_resources = ["*"]  # all resource types
        categories = [CheckCategories.SECRETS]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_entity_conf(self, conf):
        pattern = re.compile(r".*@gmail\.com", re.IGNORECASE)
        def check_value(val):
            if isinstance(val, str):
                if pattern.search(val):
                    return True
            elif isinstance(val, list):
                for item in val:
                    if isinstance(item, str) and pattern.search(item):
                        return True
            return False

        def recursive_search(obj):
            if isinstance(obj, dict):
                for v in obj.values():
                    if recursive_search(v):
                        return True
            elif isinstance(obj, list):
                for item in obj:
                    if recursive_search(item):
                        return True
            else:
                return check_value(obj)
            return False

        if recursive_search(conf):
            return CheckResult.FAILED
        return CheckResult.PASSED

check = GmailEmailCheck()
