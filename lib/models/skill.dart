class Skill {
  int id;
  String titre;
  String desc;
  bool selfValidated;
  bool validated;
  bool autovalidated;

  Skill(int id, String titre, String desc, bool selfValidated, bool validated) {
    this.id = id;
    this.titre = titre;
    this.desc = desc;
    this.selfValidated = selfValidated;
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

  bool isSelfValidated() {
    return selfValidated;
  }

  void setSelfValidated(bool isvalid) {
    this.selfValidated = isvalid;
  }
}
