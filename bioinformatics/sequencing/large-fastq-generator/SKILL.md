---
name: large-fastq-generator
description: Generate a large browser-local file with chunked streaming output instead of buffering the whole artifact in memory.
---

# Key Attributes
- task kind: large-file-generation
- runtime mode: form
- result mode: download
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- output_name: Output FastQ file name [text] (default: moonap-output.fastq)
- target_size_mb: Target size (MB) [int] (default: 128)
- read_length: Read length [int] (default: 150)
- read_header_prefix: Read header prefix [text] (default: moonap_read)
- random_seed: Random seed [int] (default: 42)
- n_rate: N base rate [float] (default: 0.01)
- quality_char: Quality character [text] (default: I)

# Output
A downloadable artifact. Latest result summary: Generated moonap-output.fastq locally with browser streaming output (207469 FastQ reads).

# Runtime Spec
```json
{
  "mode": "form",
  "title": "Generate large browser-local file",
  "primary_action_label": "Generate with streaming writer",
  "rerun_action_label": "Generate with streaming writer again",
  "io_contract": {
    "protocol": "moonap.large-file.v1",
    "browser_local_only": true,
    "llm_receives_file_contents": false,
    "host_capability": "streamed-local-generation",
    "input_mode": "none",
    "output_mode": "browser-local-save-stream",
    "chunk_size_bytes": 4194304,
    "save_picker_required": true
  },
  "fields": [
    {
      "name": "output_name",
      "label": "Output FastQ file name",
      "type": "text",
      "default": "moonap-output.fastq"
    },
    {
      "name": "target_size_mb",
      "label": "Target size (MB)",
      "type": "int",
      "default": 128,
      "min": 1,
      "max": 1024,
      "step": 1
    },
    {
      "name": "read_length",
      "label": "Read length",
      "type": "int",
      "default": 150,
      "min": 20,
      "max": 20000,
      "step": 1
    },
    {
      "name": "read_header_prefix",
      "label": "Read header prefix",
      "type": "text",
      "default": "moonap_read"
    },
    {
      "name": "random_seed",
      "label": "Random seed",
      "type": "int",
      "default": 42,
      "min": 0,
      "max": 2147483647,
      "step": 1
    },
    {
      "name": "n_rate",
      "label": "N base rate",
      "type": "float",
      "default": 0.01,
      "min": 0,
      "max": 1,
      "step": 0.001
    },
    {
      "name": "quality_char",
      "label": "Quality character",
      "type": "text",
      "default": "I"
    }
  ]
}
```