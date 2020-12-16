class Skill {
  String titre;
  String desc;
  bool selfValidated;
  bool validated;
  bool autovalidated;
  String idOwner;

  Skill(String titre, String desc, bool selfValidated, bool validated,
      String idOwner) {
    this.titre = titre;
    this.desc = desc;
    this.selfValidated = selfValidated;
    this.validated = validated;
    this.autovalidated = autovalidated;
    this.idOwner = idOwner;
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
