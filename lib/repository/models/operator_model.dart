
class OperatorModel {
    int? id;
    String? title;
    String? description;
    String? imageLink;

    OperatorModel({this.id, this.title, this.description, this.imageLink});

    OperatorModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        description = json["description"];
        imageLink = json["image_link"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["description"] = description;
        _data["image_link"] = imageLink;
        return _data;
    }
}