/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_app/models/UserLocation.dart';

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String? _userId;
  final String? _name;
  final int? _age;
  final String? _gender;
  final String? _gender_preference;
  final String? _age_preference;
  final UserLocation? _location;
  final int? _radius;
  final List<String>? _pictures;
  final String? _profile_picture;
  final List<String>? _likes;
  final List<String>? _likedBy;
  final List<String>? _matches;
  final List<String>? _dislikes;
  final List<String>? _dislikedBy;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  UserModelIdentifier get modelIdentifier {
    try {
      return UserModelIdentifier(
        userId: _userId!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int? get age {
    return _age;
  }
  
  String? get gender {
    return _gender;
  }
  
  String? get gender_preference {
    return _gender_preference;
  }
  
  String? get age_preference {
    return _age_preference;
  }
  
  UserLocation? get location {
    return _location;
  }
  
  int? get radius {
    return _radius;
  }
  
  List<String>? get pictures {
    return _pictures;
  }
  
  String? get profile_picture {
    return _profile_picture;
  }
  
  List<String>? get likes {
    return _likes;
  }
  
  List<String>? get likedBy {
    return _likedBy;
  }
  
  List<String>? get matches {
    return _matches;
  }
  
  List<String>? get dislikes {
    return _dislikes;
  }
  
  List<String>? get dislikedBy {
    return _dislikedBy;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required userId, required name, age, gender, gender_preference, age_preference, location, radius, pictures, profile_picture, likes, likedBy, matches, dislikes, dislikedBy, createdAt, updatedAt}): _userId = userId, _name = name, _age = age, _gender = gender, _gender_preference = gender_preference, _age_preference = age_preference, _location = location, _radius = radius, _pictures = pictures, _profile_picture = profile_picture, _likes = likes, _likedBy = likedBy, _matches = matches, _dislikes = dislikes, _dislikedBy = dislikedBy, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({required String userId, required String name, int? age, String? gender, String? gender_preference, String? age_preference, UserLocation? location, int? radius, List<String>? pictures, String? profile_picture, List<String>? likes, List<String>? likedBy, List<String>? matches, List<String>? dislikes, List<String>? dislikedBy}) {
    return User._internal(
      userId: userId,
      name: name,
      age: age,
      gender: gender,
      gender_preference: gender_preference,
      age_preference: age_preference,
      location: location,
      radius: radius,
      pictures: pictures != null ? List<String>.unmodifiable(pictures) : pictures,
      profile_picture: profile_picture,
      likes: likes != null ? List<String>.unmodifiable(likes) : likes,
      likedBy: likedBy != null ? List<String>.unmodifiable(likedBy) : likedBy,
      matches: matches != null ? List<String>.unmodifiable(matches) : matches,
      dislikes: dislikes != null ? List<String>.unmodifiable(dislikes) : dislikes,
      dislikedBy: dislikedBy != null ? List<String>.unmodifiable(dislikedBy) : dislikedBy);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      _userId == other._userId &&
      _name == other._name &&
      _age == other._age &&
      _gender == other._gender &&
      _gender_preference == other._gender_preference &&
      _age_preference == other._age_preference &&
      _location == other._location &&
      _radius == other._radius &&
      DeepCollectionEquality().equals(_pictures, other._pictures) &&
      _profile_picture == other._profile_picture &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      DeepCollectionEquality().equals(_likedBy, other._likedBy) &&
      DeepCollectionEquality().equals(_matches, other._matches) &&
      DeepCollectionEquality().equals(_dislikes, other._dislikes) &&
      DeepCollectionEquality().equals(_dislikedBy, other._dislikedBy);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("age=" + (_age != null ? _age!.toString() : "null") + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("gender_preference=" + "$_gender_preference" + ", ");
    buffer.write("age_preference=" + "$_age_preference" + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("radius=" + (_radius != null ? _radius!.toString() : "null") + ", ");
    buffer.write("pictures=" + (_pictures != null ? _pictures!.toString() : "null") + ", ");
    buffer.write("profile_picture=" + "$_profile_picture" + ", ");
    buffer.write("likes=" + (_likes != null ? _likes!.toString() : "null") + ", ");
    buffer.write("likedBy=" + (_likedBy != null ? _likedBy!.toString() : "null") + ", ");
    buffer.write("matches=" + (_matches != null ? _matches!.toString() : "null") + ", ");
    buffer.write("dislikes=" + (_dislikes != null ? _dislikes!.toString() : "null") + ", ");
    buffer.write("dislikedBy=" + (_dislikedBy != null ? _dislikedBy!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? name, int? age, String? gender, String? gender_preference, String? age_preference, UserLocation? location, int? radius, List<String>? pictures, String? profile_picture, List<String>? likes, List<String>? likedBy, List<String>? matches, List<String>? dislikes, List<String>? dislikedBy}) {
    return User._internal(
      userId: userId,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      gender_preference: gender_preference ?? this.gender_preference,
      age_preference: age_preference ?? this.age_preference,
      location: location ?? this.location,
      radius: radius ?? this.radius,
      pictures: pictures ?? this.pictures,
      profile_picture: profile_picture ?? this.profile_picture,
      likes: likes ?? this.likes,
      likedBy: likedBy ?? this.likedBy,
      matches: matches ?? this.matches,
      dislikes: dislikes ?? this.dislikes,
      dislikedBy: dislikedBy ?? this.dislikedBy);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<int?>? age,
    ModelFieldValue<String?>? gender,
    ModelFieldValue<String?>? gender_preference,
    ModelFieldValue<String?>? age_preference,
    ModelFieldValue<UserLocation?>? location,
    ModelFieldValue<int?>? radius,
    ModelFieldValue<List<String>?>? pictures,
    ModelFieldValue<String?>? profile_picture,
    ModelFieldValue<List<String>?>? likes,
    ModelFieldValue<List<String>?>? likedBy,
    ModelFieldValue<List<String>?>? matches,
    ModelFieldValue<List<String>?>? dislikes,
    ModelFieldValue<List<String>?>? dislikedBy
  }) {
    return User._internal(
      userId: userId,
      name: name == null ? this.name : name.value,
      age: age == null ? this.age : age.value,
      gender: gender == null ? this.gender : gender.value,
      gender_preference: gender_preference == null ? this.gender_preference : gender_preference.value,
      age_preference: age_preference == null ? this.age_preference : age_preference.value,
      location: location == null ? this.location : location.value,
      radius: radius == null ? this.radius : radius.value,
      pictures: pictures == null ? this.pictures : pictures.value,
      profile_picture: profile_picture == null ? this.profile_picture : profile_picture.value,
      likes: likes == null ? this.likes : likes.value,
      likedBy: likedBy == null ? this.likedBy : likedBy.value,
      matches: matches == null ? this.matches : matches.value,
      dislikes: dislikes == null ? this.dislikes : dislikes.value,
      dislikedBy: dislikedBy == null ? this.dislikedBy : dislikedBy.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : _userId = json['userId'],
      _name = json['name'],
      _age = (json['age'] as num?)?.toInt(),
      _gender = json['gender'],
      _gender_preference = json['gender_preference'],
      _age_preference = json['age_preference'],
      _location = json['location'] != null
          ? json['location']['serializedData'] != null
              ? UserLocation.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
              : UserLocation.fromJson(new Map<String, dynamic>.from(json['location']))
        : null,
      _radius = (json['radius'] as num?)?.toInt(),
      _pictures = json['pictures']?.cast<String>(),
      _profile_picture = json['profile_picture'],
      _likes = json['likes']?.cast<String>(),
      _likedBy = json['likedBy']?.cast<String>(),
      _matches = json['matches']?.cast<String>(),
      _dislikes = json['dislikes']?.cast<String>(),
      _dislikedBy = json['dislikedBy']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'userId': _userId, 'name': _name, 'age': _age, 'gender': _gender, 'gender_preference': _gender_preference, 'age_preference': _age_preference, 'location': _location?.toJson(), 'radius': _radius, 'pictures': _pictures, 'profile_picture': _profile_picture, 'likes': _likes, 'likedBy': _likedBy, 'matches': _matches, 'dislikes': _dislikes, 'dislikedBy': _dislikedBy, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'userId': _userId,
    'name': _name,
    'age': _age,
    'gender': _gender,
    'gender_preference': _gender_preference,
    'age_preference': _age_preference,
    'location': _location,
    'radius': _radius,
    'pictures': _pictures,
    'profile_picture': _profile_picture,
    'likes': _likes,
    'likedBy': _likedBy,
    'matches': _matches,
    'dislikes': _dislikes,
    'dislikedBy': _dislikedBy,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelIdentifier>();
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final AGE = amplify_core.QueryField(fieldName: "age");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final GENDER_PREFERENCE = amplify_core.QueryField(fieldName: "gender_preference");
  static final AGE_PREFERENCE = amplify_core.QueryField(fieldName: "age_preference");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final RADIUS = amplify_core.QueryField(fieldName: "radius");
  static final PICTURES = amplify_core.QueryField(fieldName: "pictures");
  static final PROFILE_PICTURE = amplify_core.QueryField(fieldName: "profile_picture");
  static final LIKES = amplify_core.QueryField(fieldName: "likes");
  static final LIKEDBY = amplify_core.QueryField(fieldName: "likedBy");
  static final MATCHES = amplify_core.QueryField(fieldName: "matches");
  static final DISLIKES = amplify_core.QueryField(fieldName: "dislikes");
  static final DISLIKEDBY = amplify_core.QueryField(fieldName: "dislikedBy");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        provider: amplify_core.AuthRuleProvider.APIKEY,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["userId"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.AGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.GENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.GENDER_PREFERENCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.AGE_PREFERENCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'UserLocation')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.RADIUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PICTURES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PROFILE_PICTURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.LIKES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.LIKEDBY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.MATCHES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.DISLIKES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.DISLIKEDBY,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
class UserModelIdentifier implements amplify_core.ModelIdentifier<User> {
  final String userId;

  /** Create an instance of UserModelIdentifier using [userId] the primary key. */
  const UserModelIdentifier({
    required this.userId});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'userId': userId
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'UserModelIdentifier(userId: $userId)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      userId == other.userId;
  }
  
  @override
  int get hashCode =>
    userId.hashCode;
}
