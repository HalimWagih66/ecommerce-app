
/// value : "0101070070"
/// msg : "accept only egypt phone numbers"
/// param : "phone"
/// location : "body"

class SeverErrorEntity {
  SeverErrorEntity({
      this.value, 
      this.msg, 
      this.param, 
      this.location,});


  String? value;
  String? msg;
  String? param;
  String? location;
}