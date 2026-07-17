
class PurchaseModel {
    List<Data>? data;

    PurchaseModel({this.data});

    PurchaseModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Data {
    String? orderId;
    String? orderDate;
    String? totalAmount;
    List<Plans>? plans;
    List<Operator>? operator;

    Data({this.orderId, this.orderDate, this.totalAmount, this.plans, this.operator});

    Data.fromJson(Map<String, dynamic> json) {
        orderId = json["order_id"];
        orderDate = json["order_date"];
        totalAmount = json["total_amount"];
        plans = json["plans"] == null ? null : (json["plans"] as List).map((e) => Plans.fromJson(e)).toList();
        operator = json["operator"] == null ? null : (json["operator"] as List).map((e) => Operator.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["order_id"] = orderId;
        _data["order_date"] = orderDate;
        _data["total_amount"] = totalAmount;
        if(plans != null) {
            _data["plans"] = plans?.map((e) => e.toJson()).toList();
        }
        if(operator != null) {
            _data["operator"] = operator?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Operator {
    int? id;
    String? title;
    String? description;

    Operator({this.id, this.title, this.description});

    Operator.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        description = json["description"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["description"] = description;
        return _data;
    }
}

class Plans {
    String? code;
    String? shortDesc;
    int? quantity;
    String? unitPrice;
    String? description;
    String? totalAmount;
    List<Cards>? cards;

    Plans({this.code, this.shortDesc, this.quantity, this.unitPrice, this.description, this.totalAmount, this.cards});

    Plans.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        shortDesc = json["short_desc"];
        quantity = json["quantity"];
        unitPrice = json["unit_price"];
        description = json["description"];
        totalAmount = json["total_amount"];
        cards = json["cards"] == null ? null : (json["cards"] as List).map((e) => Cards.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        _data["short_desc"] = shortDesc;
        _data["quantity"] = quantity;
        _data["unit_price"] = unitPrice;
        _data["description"] = description;
        _data["total_amount"] = totalAmount;
        if(cards != null) {
            _data["cards"] = cards?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Cards {
    String? number;
    String? serialNumber;

    Cards({this.number, this.serialNumber});

    Cards.fromJson(Map<String, dynamic> json) {
        number = json["number"];
        serialNumber = json["serial_number"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["number"] = number;
        _data["serial_number"] = serialNumber;
        return _data;
    }
}