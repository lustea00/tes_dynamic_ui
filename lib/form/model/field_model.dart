// To parse this JSON data, do
//
//     final fieldModel = fieldModelFromJson(jsonString);

import 'dart:convert';

class FieldModel {
    FieldModel({
        this.name = "",
        this.label = "",
        this.type = "",
        this.validation,
        this.item,
    });

    String name;
    String label;
    String type;
    Validation? validation;
    List<Item>? item;

    factory FieldModel.fromRawJson(String str) => FieldModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FieldModel.fromJson(Map<String, dynamic> json) => FieldModel(
        name: json["name"] == null ? null : json["name"],
        label: json["label"] == null ? null : json["label"],
        type: json["type"] == null ? null : json["type"],
        validation: json["validation"] == null ? null : Validation.fromJson(json["validation"]),
        item: json["item"] == null ? null : List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "label": label == null ? null : label,
        "type": type == null ? null : type,
        "validation": validation == null ? null : validation!.toJson(),
        "item": item == null ? null : List<dynamic>.from(item!.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.value = "",
        this.label = "",
    });

    String value;
    String label;

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        value: json["value"] == null ? null : json["value"],
        label: json["label"] == null ? null : json["label"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "label": label == null ? null : label,
    };
}

class Validation {
    Validation({
        this.required = false,
        this.minimum,
    });

    bool required;
    int? minimum;

    factory Validation.fromRawJson(String str) => Validation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        required: json["required"] == null ? null : json["required"],
        minimum: json["minimum"] == null ? null : json["minimum"],
    );

    Map<String, dynamic> toJson() => {
        "required": required == null ? null : required,
        "minimum": minimum == null ? null : minimum,
    };
}
