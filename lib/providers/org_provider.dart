import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../api/firebase_org_api.dart';
import '../data_models/organization.dart';

class OrgListProvider with ChangeNotifier {
  FirebaseOrgAPI firebaseService = FirebaseOrgAPI();
  // late Stream<QuerySnapshot> _orgStream;
  late Stream<QuerySnapshot> _approvedOrgStream;
  late Stream<QuerySnapshot> _unapprovedOrgStream;

  OrgListProvider() {
    // fetchOrgs();
    fectApprovedOrgs();
    fectUnapprovedOrgs();
  }

  // Stream<QuerySnapshot> get orgs => _orgStream;
  Stream<QuerySnapshot> get approvedOrgs => _approvedOrgStream;
  Stream<QuerySnapshot> get unapproved => _unapprovedOrgStream;

  void fectUnapprovedOrgs() {
    _unapprovedOrgStream = firebaseService.getUnapprovedOrgs();
    print(
        "successfully fetched unapproved orgs ${_unapprovedOrgStream.length}");
    notifyListeners();
  }

  void fectApprovedOrgs() {
    _approvedOrgStream = firebaseService.getApprovedOrgs();
    print("successfully fetched approved orgs ${_approvedOrgStream.length}");
    notifyListeners();
  }

  // void fetchOrgs() {
  //   _orgStream = firebaseService.getAllOrgs();
  //   print("successfully fetched orgs");
  //   notifyListeners();
  // }

  Organization getCurrentOrg(String id) {
    return Organization.fromJson(
        firebaseService.getOrg(id) as Map<String, dynamic>);
  }

  Future<void> addOrg(Organization organization) async {
    String message = await firebaseService.addOrg(
        organization.toJson(organization), organization.uid);
    print(message);
    print("ADDED");
    notifyListeners();
  }
}
