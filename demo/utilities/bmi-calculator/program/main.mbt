/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Calculate BMI",
///   "action_label": "Calculate BMI",
///   "rerun_action_label": "Calculate again",
///   "fields": [{"name":"weight_kg","label":"Weight in kg","type":"float","default":70,"step":0.1},{"name":"height_m","label":"Height in meters","type":"float","default":1.75,"step":0.01}],
///   "computed_outputs": [{"name":"bmi","label":"BMI","expression":"weight_kg / (height_m * height_m)","decimals":2}],
///   "result_template": "Weight: {{weight_kg}} kg\nHeight: {{height_m}} m\nBMI: {{bmi}}",
///   "summary_template": "Calculated BMI {{bmi}}."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP BMI calculator")
}
