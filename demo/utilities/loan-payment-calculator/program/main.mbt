/// MOONAP_RUNTIME_SPEC_BEGIN
/// {
///   "mode": "form",
///   "title": "Loan payment calculator",
///   "action_label": "Calculate payment",
///   "rerun_action_label": "Calculate again",
///   "fields": [{"name":"principal","label":"Principal","type":"float","default":10000,"step":100},{"name":"annual_interest_rate","label":"Annual interest rate (%)","type":"float","default":5,"step":0.01},{"name":"months","label":"Months","type":"int","default":36,"min":1,"step":1}],
///   "computed_outputs": [{"name":"monthly_payment","label":"Monthly payment","expression":"principal * (annual_interest_rate / 100 / 12) / (1 - pow(1 + annual_interest_rate / 100 / 12, 0 - months))","decimals":2},{"name":"total_paid","label":"Total paid","expression":"monthly_payment * months","decimals":2},{"name":"total_interest","label":"Total interest","expression":"total_paid - principal","decimals":2}],
///   "result_template": "Principal: {{principal}}\nAnnual interest rate: {{annual_interest_rate}}%\nMonths: {{months}}\nMonthly payment: {{monthly_payment}}\nTotal paid: {{total_paid}}\nTotal interest: {{total_interest}}",
///   "summary_template": "Monthly payment is {{monthly_payment}}."
/// }
/// MOONAP_RUNTIME_SPEC_END
///|
fn main {
  println("MoonAP loan payment calculator")
}
