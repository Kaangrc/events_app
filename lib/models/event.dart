class Event {
  final int id;
  final String name;
  final String image;
  final String description;
  final String location;
  final DateTime date;
  final int capacity;
  final int registeredCount;

  Event({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.date,
    required this.capacity,
    required this.registeredCount,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      capacity: json['capacity'],
      registeredCount: json['registered_count'],
    );
  }

  bool get isExpired => date.isBefore(DateTime.now());
}
