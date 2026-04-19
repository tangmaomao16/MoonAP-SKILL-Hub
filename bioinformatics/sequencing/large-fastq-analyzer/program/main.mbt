struct FastqStats {
  file_name : String
  file_size : Int
  chunk_count : Int
  total_lines : Int
  estimated_read_count : Int
  total_bases : Int
  a_count : Int
  c_count : Int
  g_count : Int
  t_count : Int
  n_count : Int
  other_count : Int
  min_read_length : Int
  max_read_length : Int
  malformed_record_count : Int
  preview_reads : String
}

fn min_int(a : Int, b : Int) -> Int {
  if a < b { a } else { b }
}

fn max_int(a : Int, b : Int) -> Int {
  if a > b { a } else { b }
}

fn count_a(sequence : String, index : Int, acc : Int) -> Int {
  if index >= sequence.length() {
    acc
  } else if sequence[index] == 'A' {
    count_a(sequence, index + 1, acc + 1)
  } else {
    count_a(sequence, index + 1, acc)
  }
}

fn count_c(sequence : String, index : Int, acc : Int) -> Int {
  if index >= sequence.length() {
    acc
  } else if sequence[index] == 'C' {
    count_c(sequence, index + 1, acc + 1)
  } else {
    count_c(sequence, index + 1, acc)
  }
}

fn count_g(sequence : String, index : Int, acc : Int) -> Int {
  if index >= sequence.length() {
    acc
  } else if sequence[index] == 'G' {
    count_g(sequence, index + 1, acc + 1)
  } else {
    count_g(sequence, index + 1, acc)
  }
}

fn count_t(sequence : String, index : Int, acc : Int) -> Int {
  if index >= sequence.length() {
    acc
  } else if sequence[index] == 'T' {
    count_t(sequence, index + 1, acc + 1)
  } else {
    count_t(sequence, index + 1, acc)
  }
}

fn count_n(sequence : String, index : Int, acc : Int) -> Int {
  if index >= sequence.length() {
    acc
  } else if sequence[index] == 'N' {
    count_n(sequence, index + 1, acc + 1)
  } else {
    count_n(sequence, index + 1, acc)
  }
}

fn other_bases(sequence : String) -> Int {
  sequence.length() - count_a(sequence, 0, 0) - count_c(sequence, 0, 0) - count_g(sequence, 0, 0) - count_t(sequence, 0, 0) - count_n(sequence, 0, 0)
}

fn percent(value : Int, total : Int) -> Int {
  if total == 0 {
    0
  } else {
    value * 100 / total
  }
}

fn valid_record(header : String, plus : String, sequence : String, quality : String) -> Bool {
  header.length() > 0 && header[0] == '@' && plus.length() > 0 && plus[0] == '+' && sequence.length() == quality.length()
}

fn add_record(stats : FastqStats, header : String, sequence : String, plus : String, quality : String, preview_limit : Int) -> FastqStats {
  let malformed = if valid_record(header, plus, sequence, quality) { 0 } else { 1 }
  let reads = stats.estimated_read_count + 1
  let min_len = if stats.estimated_read_count == 0 { sequence.length() } else { min_int(stats.min_read_length, sequence.length()) }
  let preview = if reads <= preview_limit {
    stats.preview_reads + header + "\n" + sequence + "\n"
  } else {
    stats.preview_reads
  }
  {
    file_name: stats.file_name,
    file_size: stats.file_size,
    chunk_count: stats.chunk_count,
    total_lines: stats.total_lines + 4,
    estimated_read_count: reads,
    total_bases: stats.total_bases + sequence.length(),
    a_count: stats.a_count + count_a(sequence, 0, 0),
    c_count: stats.c_count + count_c(sequence, 0, 0),
    g_count: stats.g_count + count_g(sequence, 0, 0),
    t_count: stats.t_count + count_t(sequence, 0, 0),
    n_count: stats.n_count + count_n(sequence, 0, 0),
    other_count: stats.other_count + other_bases(sequence),
    min_read_length: min_len,
    max_read_length: max_int(stats.max_read_length, sequence.length()),
    malformed_record_count: stats.malformed_record_count + malformed,
    preview_reads: preview,
  }
}

fn empty_stats(file_name : String, file_size : Int, chunk_count : Int) -> FastqStats {
  {
    file_name,
    file_size,
    chunk_count,
    total_lines: 0,
    estimated_read_count: 0,
    total_bases: 0,
    a_count: 0,
    c_count: 0,
    g_count: 0,
    t_count: 0,
    n_count: 0,
    other_count: 0,
    min_read_length: 0,
    max_read_length: 0,
    malformed_record_count: 0,
    preview_reads: "",
  }
}

fn average_read_length(stats : FastqStats) -> Int {
  if stats.estimated_read_count == 0 {
    0
  } else {
    stats.total_bases / stats.estimated_read_count
  }
}

fn render_stats(stats : FastqStats) -> String {
  let gc = stats.g_count + stats.c_count
  "MoonAP large-file analysis runtime profile\n" +
  "mode=browser-local-chunked-fastq-analysis\n" +
  "file_name=" + stats.file_name + "\n" +
  "file_size=" + stats.file_size.to_string() + "\n" +
  "chunk_count=" + stats.chunk_count.to_string() + "\n" +
  "total_lines=" + stats.total_lines.to_string() + "\n" +
  "estimated_read_count=" + stats.estimated_read_count.to_string() + "\n" +
  "total_bases=" + stats.total_bases.to_string() + "\n" +
  "A=" + stats.a_count.to_string() + "\n" +
  "C=" + stats.c_count.to_string() + "\n" +
  "G=" + stats.g_count.to_string() + "\n" +
  "T=" + stats.t_count.to_string() + "\n" +
  "N=" + stats.n_count.to_string() + "\n" +
  "other=" + stats.other_count.to_string() + "\n" +
  "A_percent=" + percent(stats.a_count, stats.total_bases).to_string() + "\n" +
  "C_percent=" + percent(stats.c_count, stats.total_bases).to_string() + "\n" +
  "G_percent=" + percent(stats.g_count, stats.total_bases).to_string() + "\n" +
  "T_percent=" + percent(stats.t_count, stats.total_bases).to_string() + "\n" +
  "N_percent=" + percent(stats.n_count, stats.total_bases).to_string() + "\n" +
  "other_percent=" + percent(stats.other_count, stats.total_bases).to_string() + "\n" +
  "GC_percent=" + percent(gc, stats.total_bases).to_string() + "\n" +
  "N_total_percent=" + percent(stats.n_count, stats.total_bases).to_string() + "\n" +
  "min_read_length=" + stats.min_read_length.to_string() + "\n" +
  "max_read_length=" + stats.max_read_length.to_string() + "\n" +
  "average_read_length=" + average_read_length(stats).to_string() + "\n" +
  "malformed_record_count=" + stats.malformed_record_count.to_string() + "\n" +
  "contents_stay_in_browser=true\n" +
  "preview_reads:\n" + stats.preview_reads
}

fn sample_analysis() -> String {
  let stats0 = empty_stats("browser-local.fastq", 1073741824, 1024)
  let stats1 = add_record(stats0, "@SEQ_1", "ACGTNACGTN", "+", "IIIIIIIIII", 2)
  let stats2 = add_record(stats1, "@SEQ_2", "NNNNACGT", "+", "IIIIIIII", 2)
  render_stats(stats2)
}

fn moonap_runtime_spec() -> String {
  "{\"profile_id\":\"large-file-generation\",\"platform_fields\":[\"output_name\",\"target_size_mb\",\"chunk_size_bytes\"],\"app_fields\":[\"max_preview_reads\",\"validate_fastq_structure\",\"count_bases\",\"report_base_percentages\",\"report_gc_percent\",\"report_n_percent\"],\"output_name\":\"fastq-analysis.txt\",\"target_size_mb\":1,\"chunk_size_bytes\":1048576}"
}

fn moonap_preview(params_json : String) -> String {
  ignore(params_json)
  sample_analysis()
}

fn moonap_generate_chunk(params_json : String, start_index : Int, max_bytes : Int) -> String {
  ignore(params_json)
  ignore(start_index)
  ignore(max_bytes)
  sample_analysis()
}

fn main {
  ignore(moonap_runtime_spec())
  ignore(moonap_preview("{}"))
  ignore(moonap_generate_chunk("{}", 0, 4096))
}