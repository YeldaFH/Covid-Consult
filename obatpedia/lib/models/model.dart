class MedicineModel {
  late int id;
  late String name;
  late String description;
  late String composition;
  late String dosageInstructions;
  late String sideEffects;
  late String image;

  MedicineModel(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.composition,
        required this.dosageInstructions,
        required this.sideEffects,
        required this.image});

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    id: json['pk'],
    name: json["fields"]['name'],
    description: json["fields"]['description'],
    composition: json["fields"]['composition'],
    dosageInstructions: json["fields"]['dosage_instructions'],
    sideEffects: json["fields"]['side_effects'],
    image: json["fields"]['image'],
  );

  Map<String, dynamic> toJson() => {
    "pk": id,
    "name": name,
    "description": description,
    "composition": composition,
    "dosage_instructions": dosageInstructions,
    "side_effects": sideEffects,
    "image": image,
  };
}
