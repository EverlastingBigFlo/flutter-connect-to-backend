// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

StateProvider<String> dobProvider = StateProvider<String>((ref) => '');
StateProvider<String> genderProvider = StateProvider<String>((ref) => '');
StateProvider<Map> signUpProvider = StateProvider<Map>((ref) => {});
StateProvider<Map> txPinProvider = StateProvider<Map>((ref) => {});
StateProvider<String> goToProvider = StateProvider<String>((ref) => '');
StateProvider<String> reasonProvider = StateProvider<String>((ref) => '');
StateProvider<bool> bvnProvider = StateProvider<bool>((ref) => false);


StateProvider<UserModel> userProvider = StateProvider<UserModel>((ref) {
  return UserModel(
    id: 0,
    firstName: '',
    lastName: '',
    dob: DateTime.now(),
    balance: '0.00',
    commission: '0.00',
    username: '',
    email: '',
    phone: '',
    status: 0,
    isAggregator: 0,
    role: '',
    gender: '',
    deviceModel: '',
    deviceId: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
});

// Define more providers as needed
