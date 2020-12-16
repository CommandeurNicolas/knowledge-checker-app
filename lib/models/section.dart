import 'package:knowledge_checker/models/skill.dart';

class Section {
  String titre;
  String image;
  String desc;
  List<Skill> skills;

  Section(String titre, String desc, String image, List<Skill> skillList) {
    this.titre = titre;
    this.image = image;
    this.desc = desc;
    this.skills = skillList;
  }

  String getTitre() {
    return this.titre;
  }

  String getImage() {
    return this.image;
  }

  List<Skill> getSkills() {
    return this.skills;
  }
}
