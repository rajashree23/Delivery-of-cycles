class DriverLocation {
  final double lattitude;
  final double longitude;

  DriverLocation({this.lattitude, this.longitude});
  factory DriverLocation.fromJson(Map<String, dynamic> parsedJson) {
    return  DriverLocation(
        lattitude: parsedJson['lattitude'],
        longitude: parsedJson['longitude']);
        
  }
}