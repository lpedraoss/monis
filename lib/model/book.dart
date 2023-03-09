// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final String? id;
  final String tittle;
  final String author;
  final String description;
  final String coverUrl;
  Book({
    this.id,
    required this.tittle,
    this.author = '',
    this.description = '',
    this.coverUrl = '',
  });
//modelo book

  // Book.fromJson(String id, Map<String, dynamic> json)
  //     : this(
  //         id,
  //         json['name'] as String,
  //         json['author'] as String,
  //         json['summary'] as String,
  //         json.containsKey('coverUrl')
  //             ? json['coverUrl'] as String
  //             : 'assets/images/book2.jpeg', /*si no existe portada se coloca una predeterminada*/
  //       );

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as String,
      tittle: map['name'] as String,
      author: map['author'] as String,
      description: map['summary'] as String,
      coverUrl: map.containsKey('coverUrl')
          ? map['coverUrl'] as String
          : 'assets/images/book2.jpeg', /*si no existe portada se coloca una predeterminada*/
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'author': author,
      'description': description,
      'coverUrl': coverUrl,
    };
  }

  Book copyWith({
    String? id,
    String? tittle,
    String? author,
    String? description,
    String? coverUrl,
  }) {
    return Book(
      id: id ?? this.id,
      tittle: tittle ?? this.tittle,
      author: author ?? this.author,
      description: description ?? this.description,
      coverUrl: coverUrl ?? this.coverUrl,
    );
  }
}
