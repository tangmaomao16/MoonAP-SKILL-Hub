/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Convert minutes and seconds",
///   "action_label": "Convert time",
///   "rerun_action_label": "Convert again",
///   "fields": [{"name":"minutes","label":"Minutes","type":"float","default":1,"step":0.01,"help":"Enter minutes to convert to seconds."},{"name":"seconds","label":"Seconds","type":"float","default":60,"step":0.01,"help":"Enter seconds to convert to minutes."}],
///   "computed_outputs": [{"name":"minutes_to_seconds","label":"Minutes to Seconds","expression":"minutes * 60","decimals":4},{"name":"seconds_to_minutes","label":"Seconds to Minutes","expression":"seconds / (60)","decimals":4}],
///   "result_template": "Minutes: {{minutes}} -> {{minutes_to_seconds}} seconds\nSeconds: {{seconds}} -> {{seconds_to_minutes}} minutes",
///   "summary_template": "Converted minutes and seconds."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP minutes and seconds converter")
}
