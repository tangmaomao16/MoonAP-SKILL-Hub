---
name: JSON Formatter Validator
description: Validate and pretty-print JSON text locally in the browser.
---

# Key Attributes
- task kind: generic-task
- runtime mode: form
- result mode: text
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- json_text: JSON text [text] (default: {"hello":"moonap"})

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "form",
"tool_kind": "json-formatter",
"title": "JSON formatter and validator",
"action_label": "Format JSON",
"rerun_action_label": "Format again",
"fields": [{"name":"json_text","label":"JSON text","type":"text","default":"{\"hello\":\"moonap\"}","help":"Paste JSON text to validate and pretty-print locally."}]
}
```
