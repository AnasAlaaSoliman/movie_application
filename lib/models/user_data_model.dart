class UserDataModel {
  static String collectionName = 'Users';
  final String? userId;
  final String userName;
  final String userEmail;
  final String phoneNumber;
  UserDataModel({this.userId, required this.userName, required this.userEmail, required this.phoneNumber});

  factory UserDataModel.fromFireStore(Map<String, dynamic> json) {
    return UserDataModel(userId: json['userId'],userName: json['userName'], userEmail: json['userEmail'],
    phoneNumber: json['phoneNumber']);
  }

  Map<String , dynamic> toFireStore(UserDataModel user){
    return
      {
        'userId' :user.userId,
        'userName' : user.userName,
        'userEmail': user.userEmail,
        'phoneNumber':user.phoneNumber,
      };
  }
}
