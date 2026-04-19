/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Circle measurements",
///   "action_label": "Calculate circle",
///   "rerun_action_label": "Calculate again",
///   "fields": [{"name":"radius","label":"Radius","type":"float","default":1,"step":0.01}],
///   "computed_outputs": [{"name":"area","label":"Area","expression":"radius * radius * 3.141592653589793","decimals":4},{"name":"circumference","label":"Circumference","expression":"2 * 3.141592653589793 * radius","decimals":4}],
///   "result_template": "Radius: {{radius}}\nArea: {{area}}\nCircumference: {{circumference}}",
///   "summary_template": "Calculated circle area {{area}} and circumference {{circumference}}."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP circle measurement calculator")
}
