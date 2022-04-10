import '../../domain/entities/clist_resources_entity.dart';

class CListResourceModel extends CListResource {
  final String icon;
  final int id;
  CListResourceModel({required this.icon, required this.id})
      : super(icon: icon, id: id);
  List<Object> get props => [icon, id];
  factory CListResourceModel.fromJson(Map<String, dynamic> json) {
    return CListResourceModel(icon: json['icon'], id: json['id']);
  }
  Map<String, dynamic> toJson() {
    return {'icon': icon, 'id': id};
  }

  CListResource toEntity() {
    return CListResource(icon: this.icon, id: this.id);
  }
}
