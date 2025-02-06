class UserModel{
  String name,email, address, Mobilenumber;

  UserModel({
    required this.name,
    required this.address,
    required this.email,
    required this.Mobilenumber
  });

  // convert the json to object model
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(name: json["name"]??"User",
     address: json["address"]??"", email:json["email"]??"",
        Mobilenumber: json["Mobilenumber"]??"");
  }
}