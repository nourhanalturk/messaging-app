class MessageModel {
  String? text ;
  dynamic? time;
  String? senderId;
  String? receiverId ;


  MessageModel({
    this.time,
    this.receiverId,
    this.senderId,
    this.text,
  });

  MessageModel.fromJson(Map<String,dynamic>json){
    senderId = json['senderId'];
    text = json['text'];
    receiverId = json['receiverId'];
    time = json['time'];
  }

  Map<String,dynamic> toMap(){
    return {
      'senderId':senderId,
      'text':text,
      'receiverId':receiverId,
      'time':time,

    };
  }


}