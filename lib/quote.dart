class Quote {
  final String text;
  final String author;

  const Quote({required this.text, required this.author});

  // Turns a quote into a Map so it can be saved as text (JSON)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'author': author,
    };
  }

  // Builds a quote back from a saved Map
  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      text: map['text'].toString(),
      author: map['author'].toString(),
    );
  }
}
