class Book {
  final String id;
  final String tittle;
  final String author;
  final String description;
  final String coverUrl;

  const Book(
      this.id, this.tittle, this.author, this.description, this.coverUrl);
  Book.fromJson(String id, Map<String, dynamic> json)
      : this(
          id,
          json['name'] as String,
          json['author'] as String,
          json['summary'] as String,
          json['coverUrl'] as String,
        );
  toJson() {
    //TODO
    throw UnimplementedError();
  }
}
