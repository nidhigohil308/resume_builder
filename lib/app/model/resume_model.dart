// resume_model.dart
class ResumeModel {
  int? id; // SQLite auto-incremented ID
  String? imagePath;
  String? name;
  String? email;
  String? phoneNumber;
  String? education;
  String? workExperience;
  String? skills;
  String? languages;


  ResumeModel({
    this.id,
    this.imagePath,
    this.name,
    this.email,
    this.phoneNumber,
    this.education,
    this.workExperience,
    this.skills,
    this.languages
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image_path':imagePath,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'education': education,
      'work_experience': workExperience,
      'skills':skills,
      'languages':languages
    };
  }
}
