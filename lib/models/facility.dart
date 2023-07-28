class Facility {
  Facility({required this.data, this.userDistance = double.maxFinite}) {
    this.name = data[1].split(",")[0];
    this.address = data[1];
    this.contactDetails = data[2];
    this.otherDetails = data[3];
    this.latitude = double.parse(data[5].trim());
    this.longitude = double.parse(data[6].trim());
  }

  final List<String> data;
  double userDistance;
  String? name;
  String? address;
  String? contactDetails;
  String? otherDetails;
  double? latitude;
  double? longitude;
}
