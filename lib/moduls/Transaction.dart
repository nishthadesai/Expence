
class Transaction{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String? description; //lege to bhi chalega nhi lege to bhi chalega

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.description,
});
}