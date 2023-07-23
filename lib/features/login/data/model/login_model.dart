class LoginModel {
  String? message;
  bool? isSuccee;
  int? returnId;
  List<dynamic>? results;

  LoginModel({
    this.message,
    this.isSuccee,
    this.returnId,
    this.results,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccee = json['IsSuccee'];
    returnId = json['ReturnId'];
    results =json['Results']??[];
  }

  Map<String, dynamic> toJson() {
    return  {
      'Message':message,
      'IsSuccee':isSuccee,
      'ReturnId':returnId,
      'Results':results,
    };
  }

}
class UserGroups {
  int? groupID;

  UserGroups({this.groupID});

  UserGroups.fromJson(Map<String, dynamic> json) {
    groupID = json['GroupID'];
  }
  Map<String, dynamic> toJson() {
    return {
      'GroupID': groupID,
    };
  }
}

class MasterAPI{

}
