import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  final int id;
  final String firstName;
  final String lastName;
  final String? middleName;
  final DateTime dob;
  final String balance;
  final String commission;
  final String username;
  final String email;
  final String phone;
  final String? country;
  final String? state;
  final String? localGov;
  final String? address;
  final int status;
  final int isAggregator;
  final String role;
  final String gender;
  final String? image;
  final String deviceModel;
  final String deviceId;
  final DateTime? emailVerifiedAt;
  final DateTime? bvnVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.dob,
    required this.balance,
    required this.commission,
    required this.username,
    required this.email,
    required this.phone,
    this.country,
    this.state,
    this.localGov,
    this.address,
    required this.status,
    required this.isAggregator,
    required this.role,
    required this.gender,
    this.image,
    required this.deviceModel,
    required this.deviceId,
    this.emailVerifiedAt,
    this.bvnVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      middleName: json['middle_name'],
      dob: DateTime.parse(json['dob'] ?? ''),
      balance: json['balance'] ?? '0.00',
      commission: json['commission'] ?? '0.00',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country: json['country'],
      state: json['state'],
      localGov: json['local_gov'],
      address: json['address'],
      status: json['status'] ?? 0,
      isAggregator: json['isAggregator'] ?? 0,
      role: json['role'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'],
      deviceModel: json['device_model'] ?? '',
      deviceId: json['device_id'] ?? '',
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      bvnVerifiedAt: json['bvn_verified_at'] != null
          ? DateTime.parse(json['bvn_verified_at'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }
}
