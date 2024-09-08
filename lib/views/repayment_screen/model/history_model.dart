class HistoryModel {
  String? sId;
  String? requestId;
  String? amountPaid;
  String? createdAt;
  String? type;
  String? amount;

  HistoryModel(
      {this.sId,
      this.requestId,
      this.amountPaid,
      this.createdAt,
      this.amount,
      this.type,
      required String description});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    requestId = json['requestId'];
    amountPaid = json['amountPaid'].toString();
    createdAt = json['createdAt'];
    type = json['type'];
    amount = json['amount'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['amount'] = this.amount;
    data['requestId'] = this.requestId;
    data['amountPaid'] = this.amountPaid;
    data['createdAt'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}
