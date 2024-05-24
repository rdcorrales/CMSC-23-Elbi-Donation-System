import 'dart:convert';
import 'donor.dart';

// model for donation-drives in elbi-donation system, based on model in sheets.
class DonationDrive {
  String? driveId;
  String driveName;
  DateTime startDate;
  DateTime endDate;
  int status;
  // List<Donation> donations;
  List<Donor>? donors;
  DonationDrive({
    this.driveId,
    required this.driveName,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.donors,
  });

  // Factory constructor to instantiate object from json format
  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
        driveId: json['driveId'],
        driveName: json['driveName'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        status: json['status']);
  }

  static List<DonationDrive> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<DonationDrive>((dynamic d) => DonationDrive.fromJson(d))
        .toList();
  }

  //Will be used to add to db by firebase_Users_api.dart
  Map<String, dynamic> toJson(DonationDrive drive) {
    return {
      'driveName': drive.driveName,
      'startDate': drive.startDate,
      'endDate': drive.endDate,
      'status': drive.status,
      // 'todos': Users.todos
    };
  }
}
