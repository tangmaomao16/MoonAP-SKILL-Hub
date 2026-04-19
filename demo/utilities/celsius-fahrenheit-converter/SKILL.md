---
name: Celsius Fahrenheit Converter
description: Convert Celsius temperatures to Fahrenheit in the browser.
---

# Key Attributes
- task kind: generic-task
- runtime mode: form
- result mode: text
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- celsius: Celsius temperature [float] (default: 25)

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "form",
"title": "Convert Celsius to Fahrenheit",
"action_label": "Convert temperature",
"rerun_action_label": "Convert again",
"fields": [{"name":"celsius","label":"Celsius temperature","type":"float","default":25,"step":0.1,"help":"Enter the Celsius value to convert."}],
"computed_outputs": [{"name":"fahrenheit","label":"Fahrenheit temperature","expression":"celsius * 9 / 5 + 32","decimals":2}],
"result_template": "Celsius: {{celsius}}\nFahrenheit: {{fahrenheit}}",
"summary_template": "Converted {{celsius}} Celsius to {{fahrenheit}} Fahrenheit."
}
```
