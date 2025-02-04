import 'package:cat/features/cat/data/model/cat_image_model.dart';
import 'package:cat/features/cat/data/model/cat_weight_model.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';

class CatBreedModel extends CatBreed {
  // final CatWeight weight;
  // final String? id;
  // final String? name;
  // final String? cfaUrl;
  // final String? vetstreetUrl;
  // final String? vcahospitalsUrl;
  // final String? temperament;
  // final String? origin;
  // final String? countryCodes;
  // final String? countryCode;
  // final String? description;
  // final String? lifeSpan;
  // final int? indoor;
  // final int? lap;
  // final String? altNames;
  // final int? adaptability;
  // final int? affectionLevel;
  // final int? childFriendly;
  // final int? dogFriendly;
  // final int? energyLevel;
  // final int? grooming;
  // final int? healthIssues;
  // final int? intelligence;
  // final int? sheddingLevel;
  // final int? socialNeeds;
  // final int? strangerFriendly;
  // final int? vocalisation;
  // final int? experimental;
  // final int? hairless;
  // final int? natural;
  // final int? rare;
  // final int? rex;
  // final int? suppressedTail;
  // final int? shortLegs;
  // final String? wikipediaUrl;
  // final int? hypoallergenic;
  // final String? referenceImageId;
  // final CatImage? image;

  // CatBreedModel({
  //   required this.weight,
  //   required this.id,
  //   required this.name,
  //   required this.cfaUrl,
  //   required this.vetstreetUrl,
  //   required this.vcahospitalsUrl,
  //   required this.temperament,
  //   required this.origin,
  //   required this.countryCodes,
  //   required this.countryCode,
  //   required this.description,
  //   required this.lifeSpan,
  //   required this.indoor,
  //   required this.lap,
  //   required this.altNames,
  //   required this.adaptability,
  //   required this.affectionLevel,
  //   required this.childFriendly,
  //   required this.dogFriendly,
  //   required this.energyLevel,
  //   required this.grooming,
  //   required this.healthIssues,
  //   required this.intelligence,
  //   required this.sheddingLevel,
  //   required this.socialNeeds,
  //   required this.strangerFriendly,
  //   required this.vocalisation,
  //   required this.experimental,
  //   required this.hairless,
  //   required this.natural,
  //   required this.rare,
  //   required this.rex,
  //   required this.suppressedTail,
  //   required this.shortLegs,
  //   required this.wikipediaUrl,
  //   required this.hypoallergenic,
  //   required this.referenceImageId,
  //   required this.image,
  // });

  CatBreedModel({
    required super.weight,
    required super.id,
    required super.name,
    required super.cfaUrl,
    required super.vetstreetUrl,
    required super.vcahospitalsUrl,
    required super.temperament,
    required super.origin,
    required super.countryCodes,
    required super.countryCode,
    required super.description,
    required super.lifeSpan,
    required super.indoor,
    required super.lap,
    required super.altNames,
    required super.adaptability,
    required super.affectionLevel,
    required super.childFriendly,
    required super.dogFriendly,
    required super.energyLevel,
    required super.grooming,
    required super.healthIssues,
    required super.intelligence,
    required super.sheddingLevel,
    required super.socialNeeds,
    required super.strangerFriendly,
    required super.vocalisation,
    required super.experimental,
    required super.hairless,
    required super.natural,
    required super.rare,
    required super.rex,
    required super.suppressedTail,
    required super.shortLegs,
    required super.wikipediaUrl,
    required super.hypoallergenic,
    required super.referenceImageId,
    required super.image,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    return CatBreedModel(
      weight: CatWeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      cfaUrl: json['cfaUrl'] as String?,
      vetstreetUrl: json['vetstreet_url'] as String?,
      vcahospitalsUrl: json['vcahospitals_url'] as String?,
      temperament: json['temperament'] as String?,
      origin: json['origin'] as String?,
      countryCodes: json['country_codes'] as String?,
      countryCode: json['country_code'] as String?,
      description: json['description'] as String?,
      lifeSpan: json['lifeSpan'] as String?,
      indoor: json['indoor'] as int?,
      lap: json['lap'] as int?,
      altNames: json['alt_names'] as String?,
      adaptability: json['adaptability'] as int?,
      affectionLevel: json['affection_level'] as int?,
      childFriendly: json['child_friendly'] as int?,
      dogFriendly: json['dog_friendly'] as int?,
      energyLevel: json['energy_level'] as int?,
      grooming: json['grooming'] as int?,
      healthIssues: json['health_issues'] as int?,
      intelligence: json['intelligence'] as int?,
      sheddingLevel: json['shedding_level'] as int?,
      socialNeeds: json['social_needs'] as int?,
      strangerFriendly: json['stranger_friendly'] as int?,
      vocalisation: json['vocalisation'] as int?,
      experimental: json['experimental'] as int?,
      hairless: json['hairless'] as int?,
      natural: json['natural'] as int?,
      rare: json['rare'] as int?,
      rex: json['rex'] as int?,
      suppressedTail: json['suppressed_tail'] as int?,
      shortLegs: json['short_legs'] as int?,
      wikipediaUrl: json['wikipedia_url'] as String?,
      hypoallergenic: json['hypoallergenic'] as int?,
      referenceImageId: json['reference_image_id'] as String?,
      image: json['image'] != null
          ? CatImageModel.fromJson(json['image'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': (weight as CatWeightModel).toJson(),
      'id': id,
      'name': name,
      'cfaUrl': cfaUrl,
      'vetstreetUrl': vetstreetUrl,
      'vcahospitalsUrl': vcahospitalsUrl,
      'temperament': temperament,
      'origin': origin,
      'countryCodes': countryCodes,
      'countryCode': countryCode,
      'description': description,
      'lifeSpan': lifeSpan,
      'indoor': indoor,
      'lap': lap,
      'altNames': altNames,
      'adaptability': adaptability,
      'affectionLevel': affectionLevel,
      'childFriendly': childFriendly,
      'dogFriendly': dogFriendly,
      'energyLevel': energyLevel,
      'grooming': grooming,
      'healthIssues': healthIssues,
      'intelligence': intelligence,
      'sheddingLevel': sheddingLevel,
      'socialNeeds': socialNeeds,
      'strangerFriendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressedTail': suppressedTail,
      'shortLegs': shortLegs,
      'wikipediaUrl': wikipediaUrl,
      'hypoallergenic': hypoallergenic,
      'referenceImageId': referenceImageId,
      'image': (image as CatImageModel).toJson(),
    };
  }
}
