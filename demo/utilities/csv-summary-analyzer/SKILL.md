---
name: CSV Summary Analyzer
description: Analyze a browser-local CSV or TSV file for rows, columns, missing values, and numeric summaries.
---

# Key Attributes
- task kind: generic-task
- runtime mode: file
- result mode: report
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- input_file: Browser-local file selected by the user.

# Output
Browser-local runtime result rendered from this SKILL runtime spec.

# Runtime Spec
```json
{
"mode": "file",
"analysis_type": "csv-summary",
"title": "CSV analyzer",
"action_label": "Analyze CSV",
"rerun_action_label": "Analyze CSV again",
"result_mode": "report",
"io_contract": {"browser_local_only": true, "llm_receives_file_contents": false, "host_capability": "csv-summary", "input_mode": "file", "output_mode": "report", "supported_extensions": ["csv", "tsv", "txt"]},
"fields": []
}
```
