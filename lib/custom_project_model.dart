class CustomProject {
  final String name;
  final String content;
  final String imageUrl;
  final String projectUrl; // Added field
  final String showcaseVideo; // Added field
  final List<String> tech;

  const CustomProject({
    required this.name,
    required this.content,
    required this.imageUrl,
    required this.projectUrl,
    required this.showcaseVideo,
    required this.tech,
  });

  factory CustomProject.fromJson(Map<String, dynamic> json) => CustomProject(
        name: json["name"],
        content: json["content"],
        imageUrl: json["imageUrl"],
        projectUrl: json["project_url"], // Added field
        showcaseVideo: json["showcase_video"], // Added field
        tech: List<String>.from(json["tech"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "content": content,
        "imageUrl": imageUrl,
        "project_url": projectUrl, // Added field
        "showcase_video": showcaseVideo, // Added field
        "tech": List<dynamic>.from(tech.map((x) => x)),
      };
}
