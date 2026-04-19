---
name: large-fastq-analyzer
description: Analyze a large FastQ file with chunked browser-local streaming and report read/base metrics.
---

# Key Attributes
- task kind: large-fastq-analysis
- runtime mode: file
- result mode: report
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- max_preview_reads: Preview reads [int] (default: 3)
- validate_fastq_structure: Validate FastQ structure [bool] (default: true)
- count_bases: Count A/C/G/T/N bases [bool] (default: true)

# Output
A browser-visible report. Latest result summary: Analyzed moonap-output-1G.fastq locally: 3307239 FastQ reads, 496085850 bases.

# Runtime Spec
```json
{
  "mode": "file",
  "title": "Analyze large FastQ file",
  "action_label": "Run FastQ analysis",
  "rerun_action_label": "Run FastQ analysis again",
  "domain_profile": "fastq",
  "io_contract": {
    "protocol": "moonap.large-file.v1",
    "browser_local_only": true,
    "llm_receives_file_contents": false,
    "host_capability": "chunked-local-analysis",
    "input_mode": "streaming-text",
    "output_mode": "report",
    "chunk_size_bytes": 4194304,
    "carry_strategy": "fastq-record-boundary",
    "supported_extensions": [
      "fastq",
      "fq",
      "txt"
    ]
  },
  "fields": [
    {
      "name": "max_preview_reads",
      "label": "Preview reads",
      "type": "int",
      "default": 3,
      "min": 0,
      "max": 20,
      "step": 1,
      "help": "Only controls how many reads appear in the report preview. It does not limit full-file analysis."
    },
    {
      "name": "validate_fastq_structure",
      "label": "Validate FastQ structure",
      "type": "bool",
      "default": true,
      "help": "Check @ header, + separator, and sequence/quality length for each four-line FastQ record."
    },
    {
      "name": "count_bases",
      "label": "Count A/C/G/T/N bases",
      "type": "bool",
      "default": true,
      "help": "Count base composition while streaming. Turn off only if you want a lighter structural scan."
    }
  ]
}
```