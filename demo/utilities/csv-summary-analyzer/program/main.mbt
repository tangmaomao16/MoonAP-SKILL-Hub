/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "file",
///   "analysis_type": "csv-summary",
///   "title": "CSV analyzer",
///   "action_label": "Analyze CSV",
///   "rerun_action_label": "Analyze CSV again",
///   "result_mode": "report",
///   "io_contract": {"browser_local_only": true, "llm_receives_file_contents": false, "host_capability": "csv-summary", "input_mode": "file", "output_mode": "report", "supported_extensions": ["csv", "tsv", "txt"]},
///   "fields": []
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP CSV analyzer")
}
