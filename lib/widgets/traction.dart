class Transaction {
  final String id;
  final String name;
  final double prise;
  final DateTime time;

  Transaction(
      {required this.id,
      required this.name,
      required this.prise,
      required this.time});
}
