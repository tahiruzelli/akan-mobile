import 'package:akan_mobile/Globals/constans/urls.dart';

class ProposalModel {
  int proposalId;
  int advertId;
  int transmitterId;
  String transmitterName;
  String transmitterPhoto;
  bool isProposalAccepted;
  String chatId;
  String proposalCreationTime;

  ProposalModel(
      {this.proposalId,
      this.advertId,
      this.transmitterId,
      this.transmitterName,
      this.transmitterPhoto,
      this.isProposalAccepted,
      this.chatId,
      this.proposalCreationTime});

  ProposalModel.fromJson(Map<String, dynamic> json) {
    proposalId = json['proposalId'];
    advertId = json['advertID'];
    transmitterId = json['transmitterId'];
    transmitterName = json['transmitterName'];
    transmitterPhoto = json['transmitterPhoto']??defaultPhotoUrl;
    isProposalAccepted = json['isProposalAccepted'];
    chatId = json['chatId']??'';
    proposalCreationTime = json['proposalCreationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['proposalId'] = proposalId;
    data['advertId'] = advertId;
    data['transmitterId'] = transmitterId;
    data['transmitterName'] = transmitterName;
    data['transmitterPhoto'] = transmitterPhoto;
    data['isProposalAccepted'] = isProposalAccepted;
    data['chatId'] = chatId;
    data['proposalCreationTime'] = proposalCreationTime;
    return data;
  }
}