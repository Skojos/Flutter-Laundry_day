import 'package:flutter/cupertino.dart';
import 'package:laundry_day/models/event.dart';

class CalendarProvider with ChangeNotifier {
  final Map<DateTime, List<Event>> _eventList = {
    DateTime(2022, 01, 06).toUtc(): [
      Event(title: "07:00 - 14:00", isBooked: false, uid: ""),
      Event(title: "14:00 - 17:00", isBooked: false, uid: ""),
      Event(title: "17:00 - 20:00", isBooked: false, uid: "")
    ],
    DateTime(2022, 01, 07).toUtc(): [
      Event(title: "07:00 - 14:00", isBooked: false, uid: ""),
    ]
  };

  //Getter for eventlist
  Map<DateTime, List<Event>> get eventList => _eventList;

  //update event status on book
  void bookEvent(Event item) {
    item.isBooked = !item.isBooked;
    notifyListeners();
  }
}
