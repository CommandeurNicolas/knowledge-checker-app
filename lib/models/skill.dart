class Skill {
  int id;
  String titre;
  String desc;
  String image;

  // TODO enlever image --> test pour faire passer la class skill en section (list de skill)
  Skill(int id, String titre, String desc, String image) {
    this.id = id;
    this.titre = titre;
    this.desc = desc;
    this.image = image;
  }

  String getTitre() {
    return this.titre;
  }

  String getDesc() {
    return this.desc;
  }

  int getId() {
    return this.id;
  }

  String getImage() {
    return this.image;
  }
}
