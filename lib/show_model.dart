class Show {
  final String name;
  final String? imageUrl;
  final String summary;

  Show({
    required this.name,
    required this.imageUrl,
    required this.summary,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    final showData = json['show'];
    return Show(
      name: showData['name'] ?? 'Untitled',
      imageUrl: showData['image']?['medium'], // Use `medium` size image from API
      summary: showData['summary'] ?? 'No summary available.',
    );
  }
}
