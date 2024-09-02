class AuthModel {
  Wallet? wallet;
  String? sId;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? createdAt;
  String? updatedAt;

  AuthModel(
      {this.wallet,
      this.sId,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.createdAt,
      this.updatedAt});

  AuthModel.fromJson(Map<String, dynamic> json) {
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Wallet {
  String? balance;
  bool? haveLoan;

  Wallet({this.balance, this.haveLoan});

  Wallet.fromJson(Map<String, dynamic> json) {
    balance = json['balance'].toString();
    haveLoan = json['haveLoan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['haveLoan'] = this.haveLoan;
    return data;
  }
}
