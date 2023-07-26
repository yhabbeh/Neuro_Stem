class LoginModel {

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
  String? message;
  bool? isSuccee;
  int? returnId;
  List<dynamic>? results;

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

  UserGroups({this.groupID});

  UserGroups.fromJson(Map<String, dynamic> json) {
    groupID = json['GroupID'];
  }
  int? groupID;
  Map<String, dynamic> toJson() {
    return {
      'GroupID': groupID,
    };
  }
}

class MasterAPI{

}
