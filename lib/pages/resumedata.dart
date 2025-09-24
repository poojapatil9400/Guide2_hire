class Project {
  final String title;
  final String description;
  final String duration;

  Project({
    required this.title,
    required this.description,
    required this.duration,
  });
}

class Contact {
  final String email;
  final String phone;
  final String linkedIn;
  final String github;

  Contact({
    required this.email,
    required this.phone,
    required this.linkedIn,
    required this.github,
  });
}

class Education {
  final String degree;
  final String institution;
  final String duration;
  final String details;

  Education({
    required this.degree,
    required this.institution,
    required this.duration,
    required this.details,
  });
}

class Experience {
  final String role;
  final String company;
  final String duration;
  final String description;

  Experience({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class ResumeData {
  final String name;
  final String title;
  final String profileImage;
  final String profileSummary;
  final List<Education> education;
  final List<String> skills;
  final List<Experience> experience;
  final List<Project> projects;
  final Contact contact;
  final List<String> certifications;
  final List<String> awards;
  final List<String> internships;
  final List<String> languagesKnown;
  final List<String> involvements; // Added involvements

  ResumeData({
    required this.name,
    required this.title,
    required this.profileImage,
    required this.profileSummary,
    required this.education,
    required this.skills,
    required this.experience,
    required this.projects,
    required this.contact,
    required this.certifications,
    required this.awards,
    required this.internships,
    required this.languagesKnown,
    required this.involvements, // Include involvements in the constructor
  });
}
