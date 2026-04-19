fn clamp_positive(value : Int, fallback : Int) -> Int {
  if value <= 0 {
    fallback
  } else {
    value
  }
}

fn next_seed(seed : Int) -> Int {
  (seed * 1664525 + 1013904223) % 2147483647
}

fn pick_base(seed : Int) -> String {
  let value = seed % 5
  if value == 0 {
    "A"
  } else if value == 1 {
    "C"
  } else if value == 2 {
    "G"
  } else if value == 3 {
    "T"
  } else {
    "N"
  }
}

fn repeat_char(ch : String, count : Int, acc : String) -> String {
  if count <= 0 {
    acc
  } else {
    repeat_char(ch, count - 1, acc + ch)
  }
}

fn repeat_template(template : String, count : Int, acc : String) -> String {
  if count <= 0 {
    acc
  } else {
    repeat_template(template, count - 1, acc + template)
  }
}

fn template_line(template : String, read_length : Int) -> String {
  if template == "" {
    ""
  } else {
    let repeats = read_length / template.length() + 1
    repeat_template(template, repeats, "")
  }
}

fn build_sequence(seed : Int, read_length : Int, acc : String) -> (String, Int) {
  if read_length <= 0 {
    (acc, seed)
  } else {
    let next = next_seed(seed)
    build_sequence(next, read_length - 1, acc + pick_base(next))
  }
}

fn build_quality(read_length : Int) -> String {
  repeat_char("I", read_length, "")
}

fn build_header(header_template : String, index : Int) -> String {
  if header_template == "" {
    "@moonap_read_" + index.to_string()
  } else {
    "@" + header_template + "_" + index.to_string()
  }
}

fn build_fastq_record(seed : Int, index : Int, read_length : Int, header_template : String, line_template : String) -> (String, Int) {
  let length = clamp_positive(read_length, 100)
  let (random_sequence, next) = build_sequence(seed, length, "")
  let sequence = if line_template == "" {
    random_sequence
  } else {
    template_line(line_template, length)
  }
  let quality = build_quality(sequence.length())
  let record = build_header(header_template, index) + "\n" + sequence + "\n+\n" + quality + "\n"
  (record, next)
}

fn estimate_record_bytes(read_length : Int, header_template : String) -> Int {
  build_header(header_template, 1).length() + read_length + read_length + 5
}

fn estimate_record_count(target_mb : Int, read_length : Int, header_template : String) -> Int {
  let mb = clamp_positive(target_mb, 1)
  let bytes = mb * 1024 * 1024
  let record_bytes = estimate_record_bytes(read_length, header_template)
  if record_bytes <= 0 {
    0
  } else {
    bytes / record_bytes + 1
  }
}

fn build_preview_chunk(seed : Int, count : Int, index : Int, read_length : Int, header_template : String, line_template : String, acc : String) -> (String, Int) {
  if count <= 0 {
    (acc, seed)
  } else {
    let (record, next) = build_fastq_record(seed, index, read_length, header_template, line_template)
    build_preview_chunk(next, count - 1, index + 1, read_length, header_template, line_template, acc + record)
  }
}

fn build_limited_chunk(seed : Int, index : Int, read_length : Int, header_template : String, line_template : String, max_bytes : Int, acc : String) -> String {
  if max_bytes <= 0 {
    acc
  } else {
    let (record, next) = build_fastq_record(seed, index, read_length, header_template, line_template)
    if record.length() > max_bytes {
      acc
    } else {
      build_limited_chunk(next, index + 1, read_length, header_template, line_template, max_bytes - record.length(), acc + record)
    }
  }
}

fn large_file_generation_profile(output_name : String, target_mb : Int, read_length : Int, header_template : String, line_template : String, random_seed : Int) -> String {
  let records = estimate_record_count(target_mb, read_length, header_template)
  let (preview, _) = build_preview_chunk(random_seed, 3, 1, read_length, header_template, line_template, "")
  "MoonAP Large-file generation runtime profile\n" +
  "mode=browser-local-streamed-output\n" +
  "output_file=" + output_name + "\n" +
  "target_size_mb=" + target_mb.to_string() + "\n" +
  "read_length=" + read_length.to_string() + "\n" +
  "random_seed=" + random_seed.to_string() + "\n" +
  "estimated_fastq_records=" + records.to_string() + "\n" +
  "contents_stay_in_browser=true\n" +
  "streaming_note=write records incrementally instead of buffering the full 1GB file\n" +
  "preview_chunk:\n" + preview
}

fn moonap_runtime_spec() -> String {
  "{\"profile_id\":\"large-file-generation\",\"platform_fields\":[\"output_name\",\"target_size_mb\",\"chunk_size_bytes\"],\"app_fields\":[\"read_length\",\"header_prefix\",\"line_template\",\"random_seed\",\"quality_char\"],\"output_name\":\"moonap-output.fastq\",\"target_size_mb\":1024,\"chunk_size_bytes\":1048576}"
}

fn moonap_preview(params_json : String) -> String {
  ignore(params_json)
  large_file_generation_profile("moonap-output.fastq", 1024, 150, "moonap_read", "", 42)
}

fn moonap_generate_chunk(params_json : String, start_index : Int, max_bytes : Int) -> String {
  ignore(params_json)
  let safe_start = clamp_positive(start_index, 1)
  let safe_bytes = clamp_positive(max_bytes, 4096)
  build_limited_chunk(42 + safe_start, safe_start, 150, "moonap_read", "", safe_bytes, "")
}

fn main {
  ignore(moonap_runtime_spec())
  ignore(moonap_preview("{}"))
  ignore(moonap_generate_chunk("{}", 1, 4096))
}