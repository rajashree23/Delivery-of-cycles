class DriverLocation {
  final int fromplace;
  final int toplace;
  final int done;
  final int cycles;

  DriverLocation({this.fromplace,this.toplace,this.done,this.cycles});
  factory DriverLocation.fromJson(Map<String, dynamic> parsedJson) {
    return  DriverLocation(
        fromplace: parsedJson['fromplace'],
        toplace: parsedJson['toplace'],
        done:parsedJson['done'],
        cycles: parsedJson['cycles']);
        
  }
}