/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "tool_kind": "text-analysis",
///   "title": "Text analyzer",
///   "action_label": "Analyze text",
///   "rerun_action_label": "Analyze again",
///   "fields": [{"name":"input_text","label":"Text","type":"text","default":"MoonAP runs browser-local WebAssembly tools.","help":"Enter text to count characters, words, lines, and estimated reading time."}]
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP text analyzer")
}
