#!/usr/bin/env python3
import os
import re


def clean_windowrulev2(config_path):
    full_path = os.path.expanduser(config_path)

    if not os.path.exists(full_path):
        print(f"File not found: {full_path}")
        return

    with open(full_path, "r") as file:
        lines = file.readlines()

    updated_lines = []
    changes = 0

    for line in lines:
        # This regex looks for: windowrulev2 = [rule], [class/identifier]
        # It specifically looks for cases where "class:" is missing
        match = re.match(r"^\s*windowrulev2\s*=\s*([^,]+),\s*([^/][^:]+)$", line)

        if match:
            rule = match.group(1).strip()
            identifier = match.group(2).strip()

            # Add regex anchors for precision
            if not identifier.startswith("^"):
                identifier = "^" + identifier
            if not identifier.endswith("$"):
                identifier = identifier + "$"

            # Format to the explicit 'class:' syntax
            new_line = f"windowrulev2 = {rule}, class:{identifier}\n"
            updated_lines.append(new_line)
            changes += 1
        else:
            # If it already has 'class:' or isn't a windowrule, leave it alone
            updated_lines.append(line)

    if changes > 0:
        with open(full_path, "w") as file:
            file.writelines(updated_lines)
        print(f"Cleaned up {changes} lines in {full_path}")
    else:
        print("No lines needed updating.")


clean_windowrulev2("~/.config/hypr/conf/windowrule.conf")
