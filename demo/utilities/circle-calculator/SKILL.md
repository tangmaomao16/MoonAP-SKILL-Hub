---
name: Circle Calculator
description: Calculate circle area and circumference from radius.
---

# Key Attributes
- task kind: generic-task
- runtime mode: form
- result mode: text
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- radius: Radius [float] (default: 1)

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "form",
"title": "Circle measurements",
"action_label": "Calculate circle",
"rerun_action_label": "Calculate again",
"fields": [{"name":"radius","label":"Radius","type":"float","default":1,"step":0.01}],
"computed_outputs": [{"name":"area","label":"Area","expression":"radius * radius * 3.141592653589793","decimals":4},{"name":"circumference","label":"Circumference","expression":"2 * 3.141592653589793 * radius","decimals":4}],
"result_template": "Radius: {{radius}}\nArea: {{area}}\nCircumference: {{circumference}}",
"summary_template": "Calculated circle area {{area}} and circumference {{circumference}}."
}
```
