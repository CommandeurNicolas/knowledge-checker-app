class Skill {
  String titre;
  String desc;
  bool selfValidated;
  bool validated;
  bool autovalidated;
  String idOwner;
  String proof;

  Skill(String titre, String desc, bool selfValidated, bool validated,
      String idOwner, String proof) {
    this.titre = titre;
    this.desc = desc;
    this.selfValidated = selfValidated;
    this.validated = validated;
    this.autovalidated = autovalidated;
    this.idOwner = idOwner;
    this.proof = proof;
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
