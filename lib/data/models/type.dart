import 'package:filcnaplo/data/models/evaluation.dart';

class Type {
  String id;
  String description;
  String name;

  Type(this.id, this.description, this.name);

  factory Type.fromJson(Map json) {
    String id = json["Uid"] ?? "";
    String description = json["Leiras"] != "Na" ? json["Leiras"] ?? "" : "";
    String name = json["Nev"] != "Na" ? json["Nev"] ?? "" : "";

    return Type(id, description, name);
  }

  static EvalType getEvalType(String string) {
    return <String, EvalType>{
      "evkozi_jegy_ertekeles": EvalType.midYear,
      "I_ne_jegy_ertekeles": EvalType.firstQ,
      "II_ne_jegy_ertekeles": EvalType.secondQ,
      "felevi_jegy_ertekeles": EvalType.halfYear,
      "III_ne_jegy_ertekeles": EvalType.thirdQ,
      "IV_ne_jegy_ertekeles": EvalType.fourthQ,
      "evvegi_jegy_ertekeles": EvalType.endYear,
    }[string];
  }
}
