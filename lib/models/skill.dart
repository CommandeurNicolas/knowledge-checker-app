class Skill {
  int id;
  String titre;
  String desc;

  Skill(int id, String titre, String desc) {
    this.id = id;
    this.titre = titre;
    this.desc = desc;
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
}
