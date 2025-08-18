
enum Payment {
  online(2),
  applePay(1),
  wallet(3),
  ;

  const Payment(this.id);
  final int id;
}