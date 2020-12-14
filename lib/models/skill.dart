class Skill {
  int id;
  String titre;
  String desc;
  bool validated;
  bool autovalidated;

  Skill(int id, String titre, String desc, bool validated, bool autovalidated) {
    this.id = id;
    this.titre = titre;
    this.desc = desc;
    this.validated = validated;
    this.autovalidated = autovalidated;
  }

  int getId() {
    return this.id;
  }

  String getTitre() {
    return this.titre;
  }

  String getDesc() {
    return this.desc;
  }

  bool isValidated() {
    return validated;
  }

  void setValidated(bool isvalid) {
    this.validated = isvalid;
  }

  bool isAutoValidated() {
    return autovalidated;
  }

  void setAutoValidated(bool isvalid) {
    this.autovalidated = isvalid;
  }
}
