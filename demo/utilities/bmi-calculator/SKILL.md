---
name: BMI Calculator
description: Calculate body mass index from weight and height.
---

# Key Attributes
- task kind: generic-task
- runtime mode: form
- result mode: text
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- weight_kg: Weight in kg [float] (default: 70)
- height_m: Height in meters [float] (default: 1.75)

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "form",
"title": "Calculate BMI",
"action_label": "Calculate BMI",
"rerun_action_label": "Calculate again",
"fields": [{"name":"weight_kg","label":"Weight in kg","type":"float","default":70,"step":0.1},{"name":"height_m","label":"Height in meters","type":"float","default":1.75,"step":0.01}],
"computed_outputs": [{"name":"bmi","label":"BMI","expression":"weight_kg / (height_m * height_m)","decimals":2}],
"result_template": "Weight: {{weight_kg}} kg\nHeight: {{height_m}} m\nBMI: {{bmi}}",
"summary_template": "Calculated BMI {{bmi}}."
}
```
