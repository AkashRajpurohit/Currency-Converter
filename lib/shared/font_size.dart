double getFontSize(String value) {
  if(value.length >= 15) return 45.0;
  if(value.length >= 12) return 55.0;
  else if(value.length >= 9) return 65.0;
  else if(value.length >= 6) return 85.0;
  else if(value.length < 6) return 120.0;
  else return 35.0;
}