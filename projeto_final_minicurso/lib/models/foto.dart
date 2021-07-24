class Foto {
  int? id;
  String? foto;
  String? titulo;
  String? comentario;
  String? latitude;
  String? longitude;
  String? data;

  Foto(this.foto, this.titulo, this.comentario, this.latitude, this.longitude, this.data);

  Foto.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.foto = json['foto'];
    this.titulo = json['titulo'];
    this.comentario = json['comentario'];
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
    this.data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'foto': this.foto,
      'titulo': this.titulo,
      'comentario': this.comentario, 
      'latitude': this.latitude,
      'longitude': this.longitude,
      'data': this.data,
    };
  }

  @override
  String toString() {
    return '$id - $foto - $titulo - $comentario - $latitude - $longitude - $data';
  }
}