---
name: Two Number Sum
description: Add two numbers locally in the browser.
---

# Key Attributes
- task kind: generic-task
- runtime mode: form
- result mode: text
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- number_a: First number [float] (default: 1)
- number_b: Second number [float] (default: 2)

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "form",
"title": "Add two numbers",
"action_label": "Calculate sum",
"rerun_action_label": "Calculate again",
"fields": [{"name":"number_a","label":"First number","type":"float","default":1,"step":1},{"name":"number_b","label":"Second number","type":"float","default":2,"step":1}],
"computed_outputs": [{"name":"sum","label":"Sum","expression":"number_a + number_b","decimals":4}],
"result_template": "First number: {{number_a}}\nSecond number: {{number_b}}\nSum: {{sum}}",
"summary_template": "Calculated sum {{sum}}."
}
```
