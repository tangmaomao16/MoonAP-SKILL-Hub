/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Tip calculator",
///   "action_label": "Calculate tip",
///   "rerun_action_label": "Calculate again",
///   "fields": [{"name":"bill_amount","label":"Bill amount","type":"float","default":50,"step":0.01},{"name":"tip_percent","label":"Tip percent","type":"float","default":18,"step":0.1},{"name":"people","label":"Number of people","type":"int","default":2,"min":1,"step":1}],
///   "computed_outputs": [{"name":"tip_amount","label":"Tip amount","expression":"bill_amount * tip_percent / 100","decimals":2},{"name":"total_amount","label":"Total amount","expression":"bill_amount + tip_amount","decimals":2},{"name":"per_person","label":"Per person","expression":"total_amount / people","decimals":2}],
///   "result_template": "Bill: {{bill_amount}}\nTip: {{tip_amount}}\nTotal: {{total_amount}}\nPer person: {{per_person}}",
///   "summary_template": "Total is {{total_amount}}, or {{per_person}} per person."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP tip calculator")
}
