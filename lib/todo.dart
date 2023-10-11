class Todo {
  String details;
  DateTime createdDateTime;
  DateTime updatedDateTime;
  String status;

  Todo(
      {required this.details,
      required this.createdDateTime,
      required this.updatedDateTime,
      this.status = 'pending'});
}
