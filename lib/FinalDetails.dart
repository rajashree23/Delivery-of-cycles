class DriverLocation {
  final int fromplace;
  final int toplace;
  final int done;

  DriverLocation({this.fromplace,this.toplace,this.done});
  factory DriverLocation.fromJson(Map<String, dynamic> parsedJson) {
    return  DriverLocation(
        fromplace: parsedJson['fromplace'],
        toplace: parsedJson['toplace'],
        done:parsedJson['done']);
        
  }
}