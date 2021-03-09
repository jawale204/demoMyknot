class Appt {
  final String place;
  final String name;
  final String time;
  Appt({this.place, this.name, this.time});
  factory Appt.fromJson(Map<String, dynamic> data) {
    return Appt(
        place: data['place'],
        time: data['time'].toString(),
        name: data['signerFullName']);
  }
}
