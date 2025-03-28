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
  final List<int>? _age_preference;
  final UserLocation? _location;
  final String? _aboutMe;
  final int? _radius;
  final List<String>? _pictures;
  final String? _profile_picture;
  final List<UserLike>? _likes;
  final List<UserLike>? _likedBy;
  final List<UserMatch>? _matches;
  final List<UserMatch>? _matchedBy;
  final List<UserDislike>? _dislikes;
  final List<UserDislike>? _dislikedBy;
  final List<Call>? _callList;
  final List<Call>? _called;
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
  
  String? get name {
    return _name;
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
  
  List<int>? get age_preference {
    return _age_preference;
  }
  
  UserLocation? get location {
    return _location;
  }
  
  String? get aboutMe {
    return _aboutMe;
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
  
  List<UserLike>? get likes {
    return _likes;
  }
  
  List<UserLike>? get likedBy {
    return _likedBy;
  }
  
  List<UserMatch>? get matches {
    return _matches;
  }
  
  List<UserMatch>? get matchedBy {
    return _matchedBy;
  }
  
  List<UserDislike>? get dislikes {
    return _dislikes;
  }
  
  List<UserDislike>? get dislikedBy {
    return _dislikedBy;
  }
  
  List<Call>? get callList {
    return _callList;
  }
  
  List<Call>? get called {
    return _called;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required userId, name, age, gender, gender_preference, age_preference, location, aboutMe, radius, pictures, profile_picture, likes, likedBy, matches, matchedBy, dislikes, dislikedBy, callList, called, createdAt, updatedAt}): _userId = userId, _name = name, _age = age, _gender = gender, _gender_preference = gender_preference, _age_preference = age_preference, _location = location, _aboutMe = aboutMe, _radius = radius, _pictures = pictures, _profile_picture = profile_picture, _likes = likes, _likedBy = likedBy, _matches = matches, _matchedBy = matchedBy, _dislikes = dislikes, _dislikedBy = dislikedBy, _callList = callList, _called = called, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({required String userId, String? name, int? age, String? gender, String? gender_preference, List<int>? age_preference, UserLocation? location, String? aboutMe, int? radius, List<String>? pictures, String? profile_picture, List<UserLike>? likes, List<UserLike>? likedBy, List<UserMatch>? matches, List<UserMatch>? matchedBy, List<UserDislike>? dislikes, List<UserDislike>? dislikedBy, List<Call>? callList, List<Call>? called}) {
    return User._internal(
      userId: userId,
      name: name,
      age: age,
      gender: gender,
      gender_preference: gender_preference,
      age_preference: age_preference != null ? List<int>.unmodifiable(age_preference) : age_preference,
      location: location,
      aboutMe: aboutMe,
      radius: radius,
      pictures: pictures != null ? List<String>.unmodifiable(pictures) : pictures,
      profile_picture: profile_picture,
      likes: likes != null ? List<UserLike>.unmodifiable(likes) : likes,
      likedBy: likedBy != null ? List<UserLike>.unmodifiable(likedBy) : likedBy,
      matches: matches != null ? List<UserMatch>.unmodifiable(matches) : matches,
      matchedBy: matchedBy != null ? List<UserMatch>.unmodifiable(matchedBy) : matchedBy,
      dislikes: dislikes != null ? List<UserDislike>.unmodifiable(dislikes) : dislikes,
      dislikedBy: dislikedBy != null ? List<UserDislike>.unmodifiable(dislikedBy) : dislikedBy,
      callList: callList != null ? List<Call>.unmodifiable(callList) : callList,
      called: called != null ? List<Call>.unmodifiable(called) : called);
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
      DeepCollectionEquality().equals(_age_preference, other._age_preference) &&
      _location == other._location &&
      _aboutMe == other._aboutMe &&
      _radius == other._radius &&
      DeepCollectionEquality().equals(_pictures, other._pictures) &&
      _profile_picture == other._profile_picture &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      DeepCollectionEquality().equals(_likedBy, other._likedBy) &&
      DeepCollectionEquality().equals(_matches, other._matches) &&
      DeepCollectionEquality().equals(_matchedBy, other._matchedBy) &&
      DeepCollectionEquality().equals(_dislikes, other._dislikes) &&
      DeepCollectionEquality().equals(_dislikedBy, other._dislikedBy) &&
      DeepCollectionEquality().equals(_callList, other._callList) &&
      DeepCollectionEquality().equals(_called, other._called);
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
    buffer.write("age_preference=" + (_age_preference != null ? _age_preference!.toString() : "null") + ", ");
    buffer.write("location=" + (_location != null ? _location!.toString() : "null") + ", ");
    buffer.write("aboutMe=" + "$_aboutMe" + ", ");
    buffer.write("radius=" + (_radius != null ? _radius!.toString() : "null") + ", ");
    buffer.write("pictures=" + (_pictures != null ? _pictures!.toString() : "null") + ", ");
    buffer.write("profile_picture=" + "$_profile_picture" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? name, int? age, String? gender, String? gender_preference, List<int>? age_preference, UserLocation? location, String? aboutMe, int? radius, List<String>? pictures, String? profile_picture, List<UserLike>? likes, List<UserLike>? likedBy, List<UserMatch>? matches, List<UserMatch>? matchedBy, List<UserDislike>? dislikes, List<UserDislike>? dislikedBy, List<Call>? callList, List<Call>? called}) {
    return User._internal(
      userId: userId,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      gender_preference: gender_preference ?? this.gender_preference,
      age_preference: age_preference ?? this.age_preference,
      location: location ?? this.location,
      aboutMe: aboutMe ?? this.aboutMe,
      radius: radius ?? this.radius,
      pictures: pictures ?? this.pictures,
      profile_picture: profile_picture ?? this.profile_picture,
      likes: likes ?? this.likes,
      likedBy: likedBy ?? this.likedBy,
      matches: matches ?? this.matches,
      matchedBy: matchedBy ?? this.matchedBy,
      dislikes: dislikes ?? this.dislikes,
      dislikedBy: dislikedBy ?? this.dislikedBy,
      callList: callList ?? this.callList,
      called: called ?? this.called);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? age,
    ModelFieldValue<String?>? gender,
    ModelFieldValue<String?>? gender_preference,
    ModelFieldValue<List<int>?>? age_preference,
    ModelFieldValue<UserLocation?>? location,
    ModelFieldValue<String?>? aboutMe,
    ModelFieldValue<int?>? radius,
    ModelFieldValue<List<String>?>? pictures,
    ModelFieldValue<String?>? profile_picture,
    ModelFieldValue<List<UserLike>?>? likes,
    ModelFieldValue<List<UserLike>?>? likedBy,
    ModelFieldValue<List<UserMatch>?>? matches,
    ModelFieldValue<List<UserMatch>?>? matchedBy,
    ModelFieldValue<List<UserDislike>?>? dislikes,
    ModelFieldValue<List<UserDislike>?>? dislikedBy,
    ModelFieldValue<List<Call>?>? callList,
    ModelFieldValue<List<Call>?>? called
  }) {
    return User._internal(
      userId: userId,
      name: name == null ? this.name : name.value,
      age: age == null ? this.age : age.value,
      gender: gender == null ? this.gender : gender.value,
      gender_preference: gender_preference == null ? this.gender_preference : gender_preference.value,
      age_preference: age_preference == null ? this.age_preference : age_preference.value,
      location: location == null ? this.location : location.value,
      aboutMe: aboutMe == null ? this.aboutMe : aboutMe.value,
      radius: radius == null ? this.radius : radius.value,
      pictures: pictures == null ? this.pictures : pictures.value,
      profile_picture: profile_picture == null ? this.profile_picture : profile_picture.value,
      likes: likes == null ? this.likes : likes.value,
      likedBy: likedBy == null ? this.likedBy : likedBy.value,
      matches: matches == null ? this.matches : matches.value,
      matchedBy: matchedBy == null ? this.matchedBy : matchedBy.value,
      dislikes: dislikes == null ? this.dislikes : dislikes.value,
      dislikedBy: dislikedBy == null ? this.dislikedBy : dislikedBy.value,
      callList: callList == null ? this.callList : callList.value,
      called: called == null ? this.called : called.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : _userId = json['userId'],
      _name = json['name'],
      _age = (json['age'] as num?)?.toInt(),
      _gender = json['gender'],
      _gender_preference = json['gender_preference'],
      _age_preference = (json['age_preference'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _location = json['location'] != null
          ? json['location']['serializedData'] != null
              ? UserLocation.fromJson(new Map<String, dynamic>.from(json['location']['serializedData']))
              : UserLocation.fromJson(new Map<String, dynamic>.from(json['location']))
        : null,
      _aboutMe = json['aboutMe'],
      _radius = (json['radius'] as num?)?.toInt(),
      _pictures = json['pictures']?.cast<String>(),
      _profile_picture = json['profile_picture'],
      _likes = json['likes']  is Map
        ? (json['likes']['items'] is List
          ? (json['likes']['items'] as List)
              .where((e) => e != null)
              .map((e) => UserLike.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['likes'] is List
          ? (json['likes'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => UserLike.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _likedBy = json['likedBy']  is Map
        ? (json['likedBy']['items'] is List
          ? (json['likedBy']['items'] as List)
              .where((e) => e != null)
              .map((e) => UserLike.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['likedBy'] is List
          ? (json['likedBy'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => UserLike.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _matches = json['matches']  is Map
        ? (json['matches']['items'] is List
          ? (json['matches']['items'] as List)
              .where((e) => e != null)
              .map((e) => UserMatch.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['matches'] is List
          ? (json['matches'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => UserMatch.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _matchedBy = json['matchedBy']  is Map
        ? (json['matchedBy']['items'] is List
          ? (json['matchedBy']['items'] as List)
              .where((e) => e != null)
              .map((e) => UserMatch.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['matchedBy'] is List
          ? (json['matchedBy'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => UserMatch.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _dislikes = json['dislikes']  is Map
        ? (json['dislikes']['items'] is List
          ? (json['dislikes']['items'] as List)
              .where((e) => e != null)
              .map((e) => UserDislike.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['dislikes'] is List
          ? (json['dislikes'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => UserDislike.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _dislikedBy = json['dislikedBy']  is Map
        ? (json['dislikedBy']['items'] is List
          ? (json['dislikedBy']['items'] as List)
              .where((e) => e != null)
              .map((e) => UserDislike.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['dislikedBy'] is List
          ? (json['dislikedBy'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => UserDislike.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _callList = json['callList']  is Map
        ? (json['callList']['items'] is List
          ? (json['callList']['items'] as List)
              .where((e) => e != null)
              .map((e) => Call.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['callList'] is List
          ? (json['callList'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Call.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _called = json['called']  is Map
        ? (json['called']['items'] is List
          ? (json['called']['items'] as List)
              .where((e) => e != null)
              .map((e) => Call.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['called'] is List
          ? (json['called'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Call.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'userId': _userId, 'name': _name, 'age': _age, 'gender': _gender, 'gender_preference': _gender_preference, 'age_preference': _age_preference, 'location': _location?.toJson(), 'aboutMe': _aboutMe, 'radius': _radius, 'pictures': _pictures, 'profile_picture': _profile_picture, 'likes': _likes?.map((UserLike? e) => e?.toJson()).toList(), 'likedBy': _likedBy?.map((UserLike? e) => e?.toJson()).toList(), 'matches': _matches?.map((UserMatch? e) => e?.toJson()).toList(), 'matchedBy': _matchedBy?.map((UserMatch? e) => e?.toJson()).toList(), 'dislikes': _dislikes?.map((UserDislike? e) => e?.toJson()).toList(), 'dislikedBy': _dislikedBy?.map((UserDislike? e) => e?.toJson()).toList(), 'callList': _callList?.map((Call? e) => e?.toJson()).toList(), 'called': _called?.map((Call? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'userId': _userId,
    'name': _name,
    'age': _age,
    'gender': _gender,
    'gender_preference': _gender_preference,
    'age_preference': _age_preference,
    'location': _location,
    'aboutMe': _aboutMe,
    'radius': _radius,
    'pictures': _pictures,
    'profile_picture': _profile_picture,
    'likes': _likes,
    'likedBy': _likedBy,
    'matches': _matches,
    'matchedBy': _matchedBy,
    'dislikes': _dislikes,
    'dislikedBy': _dislikedBy,
    'callList': _callList,
    'called': _called,
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
  static final ABOUTME = amplify_core.QueryField(fieldName: "aboutMe");
  static final RADIUS = amplify_core.QueryField(fieldName: "radius");
  static final PICTURES = amplify_core.QueryField(fieldName: "pictures");
  static final PROFILE_PICTURE = amplify_core.QueryField(fieldName: "profile_picture");
  static final LIKES = amplify_core.QueryField(
    fieldName: "likes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserLike'));
  static final LIKEDBY = amplify_core.QueryField(
    fieldName: "likedBy",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserLike'));
  static final MATCHES = amplify_core.QueryField(
    fieldName: "matches",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserMatch'));
  static final MATCHEDBY = amplify_core.QueryField(
    fieldName: "matchedBy",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserMatch'));
  static final DISLIKES = amplify_core.QueryField(
    fieldName: "dislikes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserDislike'));
  static final DISLIKEDBY = amplify_core.QueryField(
    fieldName: "dislikedBy",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserDislike'));
  static final CALLLIST = amplify_core.QueryField(
    fieldName: "callList",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Call'));
  static final CALLED = amplify_core.QueryField(
    fieldName: "called",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Call'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
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
      isRequired: false,
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
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.int.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'location',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'UserLocation')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ABOUTME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.LIKES,
      isRequired: false,
      ofModelName: 'UserLike',
      associatedKey: UserLike.LIKER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.LIKEDBY,
      isRequired: false,
      ofModelName: 'UserLike',
      associatedKey: UserLike.LIKED
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.MATCHES,
      isRequired: false,
      ofModelName: 'UserMatch',
      associatedKey: UserMatch.MATCHER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.MATCHEDBY,
      isRequired: false,
      ofModelName: 'UserMatch',
      associatedKey: UserMatch.MATCHED
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.DISLIKES,
      isRequired: false,
      ofModelName: 'UserDislike',
      associatedKey: UserDislike.DISLIKER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.DISLIKEDBY,
      isRequired: false,
      ofModelName: 'UserDislike',
      associatedKey: UserDislike.DISLIKED
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.CALLLIST,
      isRequired: false,
      ofModelName: 'Call',
      associatedKey: Call.CALLER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.CALLED,
      isRequired: false,
      ofModelName: 'Call',
      associatedKey: Call.CALLED
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