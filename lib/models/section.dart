import 'package:knowledge_checker/models/skill.dart';

class Section {
  String titre;
  String image;
  List<Skill> skills;

  Section(String titre, String image, List<Skill> skills) {
    this.titre = titre;
    this.image = image;
    this.skills = skills;
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
