class ChatRoomModel {
  int id;
  int receiverId;
  int transmitterId;
  int unreadMessageCount;
  bool isActive;
  String creationTime;

  ChatRoomModel(
      {this.id,
      this.receiverId,
      this.transmitterId,
      this.unreadMessageCount,
      this.isActive,
      this.creationTime});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    receiverId = json['receiverId'];
    transmitterId = json['transmitterId'];
    unreadMessageCount = json['unreadMessageCount'];
    isActive = json['isActive'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['receiverId'] = receiverId;
    data['transmitterId'] = transmitterId;
    data['unreadMessageCount'] = unreadMessageCount;
    data['isActive'] = isActive;
    data['creationTime'] = creationTime;
    return data;
  }
}