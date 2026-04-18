---
name: fastq-generator
description: Generate a synthetic FASTQ file for testing, demos, or sequencing pipeline validation.
version: 0.1.0
---

# Key Attributes
- task kind: fastq-generator
- runtime mode: form
- result mode: download
- wasm path: program/main.wasm
- moonbit source path: program/main.mbt

# Inputs
- read_count: Read count [int] (default: 10000)
- read_length: Read length [int] (default: 150)
- n_rate: N rate [float] (default: 0.01)
- random_seed: Random seed [int] (default: 42)

# Output
A downloadable synthetic FASTQ file generated from the provided parameters.

# Runtime Spec
```json
{
  "mode": "form",
  "title": "Generate FASTQ file",
  "primary_action_label": "Run generator",
  "fields": [
    {
      "name": "read_count",
      "label": "Read count",
      "type": "int",
      "default": 10000,
      "min": 1,
      "max": 1000000,
      "step": 1
    },
    {
      "name": "read_length",
      "label": "Read length",
      "type": "int",
      "default": 150,
      "min": 1,
      "max": 10000,
      "step": 1
    },
    {
      "name": "n_rate",
      "label": "N rate",
      "type": "float",
      "default": 0.01,
      "min": 0,
      "max": 1,
      "step": 0.001
    },
    {
      "name": "random_seed",
      "label": "Random seed",
      "type": "int",
      "default": 42,
      "step": 1
    }
  ]
}
```
