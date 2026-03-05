class UserDataModel {
  static String collectionName = 'Users';
  String? userId;
  String userName;
  String userEmail;
  String phoneNumber;

  UserDataModel({
    this.userId,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
  });

  factory UserDataModel.fromFireStore(Map<String, dynamic> json) {
    return UserDataModel(
      userId: json['userId'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'phoneNumber': phoneNumber,
    };
  }
}