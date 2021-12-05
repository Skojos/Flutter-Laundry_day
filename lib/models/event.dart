class Event {
  String title;
  bool isBooked;
  String uid;

  Event({required this.title, required this.isBooked, required this.uid});

  @override
  String toString() {
    return this.title;
  }
}
