class CurrencyService {

  // Get full name from currency short version
  String getCurrency(String currency) {
    if(currency == "USD") return "United State Dollar";
    else if(currency == "INR") return "Indian Rupee";
    else return currency;
  }
}