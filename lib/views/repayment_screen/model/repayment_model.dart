class RepaymentModel {
  String? sId;
  String? repaymentTime;
  String? loanDate;
  String? deadlineDate;
  bool? isPaid;
  String? userId;
  String? amount;
  String? repaymentTotal;
  String? outstanding;
  String? status;
  String? createdAt;
  String? updatedAt;

  RepaymentModel(
      {this.sId,
      this.repaymentTime,
      this.loanDate,
      this.deadlineDate,
      this.isPaid,
      this.userId,
      this.amount,
      this.repaymentTotal,
      this.outstanding,
      this.status,
      this.createdAt,
      this.updatedAt});

  RepaymentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    repaymentTime = json['repaymentTime'];
    loanDate = json['loanDate'];
    deadlineDate = json['deadlineDate'];
    isPaid = json['isPaid'];
    userId = json['userId'];
    amount = json['amount'].toString();
    repaymentTotal = json['repaymentTotal'].toString();
    outstanding = json['outstanding'].toString();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['repaymentTime'] = this.repaymentTime;
    data['loanDate'] = this.loanDate;
    data['deadlineDate'] = this.deadlineDate;
    data['isPaid'] = this.isPaid;
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['repaymentTotal'] = this.repaymentTotal;
    data['outstanding'] = this.outstanding;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
