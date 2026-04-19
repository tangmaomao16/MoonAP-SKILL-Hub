/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Convert Celsius to Fahrenheit",
///   "action_label": "Convert temperature",
///   "rerun_action_label": "Convert again",
///   "fields": [{"name":"celsius","label":"Celsius temperature","type":"float","default":25,"step":0.1,"help":"Enter the Celsius value to convert."}],
///   "computed_outputs": [{"name":"fahrenheit","label":"Fahrenheit temperature","expression":"celsius * 9 / 5 + 32","decimals":2}],
///   "result_template": "Celsius: {{celsius}}\nFahrenheit: {{fahrenheit}}",
///   "summary_template": "Converted {{celsius}} Celsius to {{fahrenheit}} Fahrenheit."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP Celsius to Fahrenheit converter")
}
