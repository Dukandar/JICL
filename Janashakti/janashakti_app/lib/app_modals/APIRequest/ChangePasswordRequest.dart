class ChangePasswordRequest{
  String userName;
  String oldPassword;
  String newPassword;

  ChangePasswordRequest({
    this.userName,
    this.oldPassword,
    this.newPassword
  });

  ChangePasswordRequest.fromJson(Map _details){
    userName = _details["userName"];
    oldPassword = _details["oldPassword"];
    newPassword = _details["newPassword"];
  }

  Map toJson()=>{
    "userName" : userName,
    "oldPassword" : oldPassword,
    "newPassword" : newPassword
  };

}