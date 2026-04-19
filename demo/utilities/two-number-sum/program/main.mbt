/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Add two numbers",
///   "action_label": "Calculate sum",
///   "rerun_action_label": "Calculate again",
///   "fields": [{"name":"number_a","label":"First number","type":"float","default":1,"step":1},{"name":"number_b","label":"Second number","type":"float","default":2,"step":1}],
///   "computed_outputs": [{"name":"sum","label":"Sum","expression":"number_a + number_b","decimals":4}],
///   "result_template": "First number: {{number_a}}\nSecond number: {{number_b}}\nSum: {{sum}}",
///   "summary_template": "Calculated sum {{sum}}."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP two number sum calculator")
}
