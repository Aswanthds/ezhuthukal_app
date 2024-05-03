
import 'dart:convert';

List<UserData> userDataFromJson(String str) => List<UserData>.from(json.decode(str).map((x) => UserData.fromJson(x)));

String userDataToJson(List<UserData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
    int id;
    String firstName;
    String lastName;
    String email;
    String profilePicture;
    bool isStaff;

    UserData({
       required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.profilePicture,
        required this.isStaff,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePicture: json["profile_picture"],
        isStaff: json["is_staff"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_picture": profilePicture,
        "is_staff": isStaff,
    };
}