---
name: Text Analyzer
description: Count characters, words, lines, and estimated reading time.
---

# Key Attributes
- task kind: generic-task
- runtime mode: form
- result mode: text
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- input_text: Text [text] (default: MoonAP runs browser-local WebAssembly tools.)

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "form",
"tool_kind": "text-analysis",
"title": "Text analyzer",
"action_label": "Analyze text",
"rerun_action_label": "Analyze again",
"fields": [{"name":"input_text","label":"Text","type":"text","default":"MoonAP runs browser-local WebAssembly tools.","help":"Enter text to count characters, words, lines, and estimated reading time."}]
}
```
