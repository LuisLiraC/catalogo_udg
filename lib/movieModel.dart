class MovieDTO {
  String? _title;
  String? _year;
  String? _gender;
  String? _director;
  String? _synopsis;
  String? _thumbnail;

  MovieDTO(
      this._title,
      this._year,
      this._gender,
      this._director,
      this._synopsis,
      this._thumbnail
      );

  String? get title => _title;
  String? get year => _year;
  String? get gender => _gender;
  String? get director => _director;
  String? get synopsis => _synopsis;
  String? get thumbnail => _thumbnail;
}

class Movie {
  String _id;
  String _title;
  String _year;
  String _gender;
  String _director;
  String _synopsis;
  String _thumbnail;

  Movie(
      this._id,
      this._title,
      this._year,
      this._gender,
      this._director,
      this._synopsis,
      this._thumbnail
      );

  String get id => _id;
  String get title => _title;
  String get year => _year;
  String get gender => _gender;
  String get director => _director;
  String get synopsis => _synopsis;
  String get thumbnail => _thumbnail;
}