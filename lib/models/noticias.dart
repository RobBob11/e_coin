/**
 * Modelos generados con quicktype, 
 * Quicktype genera los recursos necesarios para consumir una API a partir de la respuesta
 * que esta arroje al generar una petición, esta viene en formato JSON y se genera el código 
 * necesario, la herramienta se adapta al lenguaje que se esté utilizando (DART) 
*/

/// CONSIDERACIONES IMPORTANTES
/// Factory: un constructor que no siempre crea una nueva instancia de su clase.
///
/// fromJson: el método fromJson requiere de un tipo de dato Map<String, dynamic>
/// ya que por un lado almacena la parte que conocemos del API (clave)-->(String) y dynamic
/// porque el contenido (valor) de esa clave puede ser de cualquier tipo,
/// los almacena en este tipo de colección.
///
/// ModeloNoticia es la clase principal por así decirlo, esta contiene una lista de
/// objetos, en este caso son de la clase Article que estos a su vez contienen un
/// atributo de la clase Source, esto es fácil de identificar en la estructura
/// de la API --> newsapi.org

import 'dart:convert';

ModeloNoticia modeloNoticiaFromJson(String str) =>
    ModeloNoticia.fromJson(json.decode(str));

String modeloNoticiaToJson(ModeloNoticia data) => json.encode(data.toJson());

class ModeloNoticia {
  ModeloNoticia({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory ModeloNoticia.fromJson(Map<String, dynamic> json) => ModeloNoticia(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required  this.url,
    required this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? 'empy' : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content == null ? null : content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}