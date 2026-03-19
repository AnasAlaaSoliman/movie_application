class UserDataModel {
  static String collectionName = 'Users';
  String? userId;
  String userName;
  String userEmail;
  String phoneNumber;
  int avatarIndex;

  UserDataModel({
    this.userId,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.avatarIndex,
  });

  factory UserDataModel.fromFireStore(Map<String, dynamic> json) {
    return UserDataModel(
      userId: json['userId'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      phoneNumber: json['phoneNumber'],
      avatarIndex: json['avatarIndex'] ?? 0,
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'phoneNumber': phoneNumber,
      'avatarIndex': avatarIndex,
    };
  }
}