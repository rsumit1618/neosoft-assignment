import 'package:assignment_one/core/enums.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNum;
  final String email;
  final Gender gender;
  final String password;
  final UserAddress? userAddress;
  final UserEducationInfo? educationInfo;

  UserModel({
    this.firstName = '',
    this.lastName = '',
    this.phoneNum = '',
    this.email = '',
    this.gender = Gender.male,
    this.password = '',
    this.userAddress,
    this.educationInfo,
  });

  UserModel copyWith({
    final String? firstName,
    final String? lastName,
    final String? phoneNum,
    final String? email,
    final Gender? gender,
    final String? password,
    final UserAddress? userAddress,
    final UserEducationInfo? educationInfo,
  }) {
    return UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNum: phoneNum ?? this.phoneNum,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        userAddress: userAddress ?? this.userAddress,
        educationInfo: educationInfo ?? this.educationInfo,
        password: password ?? this.password);
  }
}

class UserAddress {
  final String addressLine;
  final String landMark;
  final String city;
  final String state;
  final num pinCode;

  UserAddress(
      {this.addressLine = '',
      this.landMark = '',
      this.city = '',
      this.state = '',
      this.pinCode = 0});

  UserAddress copyWith({
    final String? addressLine,
    final String? landMark,
    final String? city,
    final String? state,
    final num? pinCode,
  }) {
    return UserAddress(
      addressLine: addressLine ?? this.addressLine,
      landMark: landMark ?? this.landMark,
      city: city ?? this.city,
      state: state ?? this.state,
      pinCode: pinCode ?? this.pinCode,
    );
  }
}

class UserEducationInfo {
  final Education education;
  final num yearOfPassing;
  final String grade;
  final String experience;
  final String designation;
  final String domain;

  UserEducationInfo({
    this.education = Education.graduate,
    this.yearOfPassing = 00,
    this.grade = '',
    this.experience = '',
    this.designation = '',
    this.domain = '',
  });

  UserEducationInfo copyWith({
    final Education? education,
    final num? yearOfPassing,
    final String? grade,
    final String? experience,
    final String? designation,
    final String? domain,
  }) {
    return UserEducationInfo(
      education: education!,
      yearOfPassing: yearOfPassing ?? this.yearOfPassing,
      grade: grade ?? this.grade,
      experience: experience ?? this.experience,
      designation: designation ?? this.designation,
      domain: domain ?? this.domain,
    );
  }
}
