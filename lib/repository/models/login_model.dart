
class LoginModel {
    Data? data;

    LoginModel({this.data});

    LoginModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    String? name;
    String? mobile;
    String? email;
    String? createdAt;
    String? walletBalance;
    List<String>? permissions;
    dynamic deviceModelNumber;
    dynamic deviceSerialNumber;
    dynamic crNumber;
    dynamic location;
    dynamic shopName;
    dynamic retailerId;
    dynamic terminalId;
    int? profitPendingBalance;

    Data({this.name, this.mobile, this.email, this.createdAt, this.walletBalance, this.permissions, this.deviceModelNumber, this.deviceSerialNumber, this.crNumber, this.location, this.shopName, this.retailerId, this.terminalId, this.profitPendingBalance});

    Data.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        mobile = json["mobile"];
        email = json["email"];
        createdAt = json["created_at"];
        walletBalance = json["wallet_balance"];
        permissions = json["permissions"] == null ? null : List<String>.from(json["permissions"]);
        deviceModelNumber = json["device_model_number"];
        deviceSerialNumber = json["device_serial_number"];
        crNumber = json["cr_number"];
        location = json["location"];
        shopName = json["shop_name"];
        retailerId = json["retailer_id"];
        terminalId = json["terminal_id"];
        profitPendingBalance = json["profit_pending_balance"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["mobile"] = mobile;
        _data["email"] = email;
        _data["created_at"] = createdAt;
        _data["wallet_balance"] = walletBalance;
        if(permissions != null) {
            _data["permissions"] = permissions;
        }
        _data["device_model_number"] = deviceModelNumber;
        _data["device_serial_number"] = deviceSerialNumber;
        _data["cr_number"] = crNumber;
        _data["location"] = location;
        _data["shop_name"] = shopName;
        _data["retailer_id"] = retailerId;
        _data["terminal_id"] = terminalId;
        _data["profit_pending_balance"] = profitPendingBalance;
        return _data;
    }
}