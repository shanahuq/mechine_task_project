
class PlansModel {
    int? id;
    String? data;
    String? voice;
    int? validity;
    String? srp;
    String? mrp;
    String? description;
    String? image;
    int? cardsCount;
    String? type;
    Operator? operator;

    PlansModel({this.id, this.data, this.voice, this.validity, this.srp, this.mrp, this.description, this.image, this.cardsCount, this.type, this.operator});

    PlansModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        data = json["data"];
        voice = json["voice"];
        validity = json["validity"];
        srp = json["srp"];
        mrp = json["mrp"];
        description = json["description"];
        image = json["image"];
        cardsCount = json["cards_count"];
        type = json["type"];
        operator = json["operator"] == null ? null : Operator.fromJson(json["operator"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["data"] = data;
        _data["voice"] = voice;
        _data["validity"] = validity;
        _data["srp"] = srp;
        _data["mrp"] = mrp;
        _data["description"] = description;
        _data["image"] = image;
        _data["cards_count"] = cardsCount;
        _data["type"] = type;
        if(operator != null) {
            _data["operator"] = operator?.toJson();
        }
        return _data;
    }
}

class Operator {
    int? id;
    String? title;
    String? imageLink;

    Operator({this.id, this.title, this.imageLink});

    Operator.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        imageLink = json["image_link"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["image_link"] = imageLink;
        return _data;
    }
}