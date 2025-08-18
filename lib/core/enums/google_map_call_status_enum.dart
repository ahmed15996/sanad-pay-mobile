enum GoogleMapsCallStatus {
  ok('OK'),
  denied('REQUEST_DENIED'),
  invalidRequest('INVALID_REQUEST');

  const GoogleMapsCallStatus(this.value);
  final String value;
}