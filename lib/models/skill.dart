class Skill {
  int id;
  String titre;
  String desc;
  bool validated;

  Skill(int id, String titre, String desc, bool validated) {
    this.id = id;
    this.titre = titre;
    this.desc = desc;
    this.validated = validated;
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
}
