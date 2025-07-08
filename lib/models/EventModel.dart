class Event {
  final String id;
  final String title;
  final String shortDescription;
  final String date;
  final String location;
  final String image;
  final String time;
  final String longDescription;

  Event({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.date,
    required this.location,
    required this.image,
    required this.time,
    required this.longDescription,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      shortDescription: json['short_description'],
      date: json['date'],
      location: json['location'],
      image: json['image'],
      time: json['time'],
      longDescription: json['long_description'],
    );
  }
}