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


/** This is an auto generated class representing the UserLike type in your schema. */
class UserLike extends amplify_core.Model {
  static const classType = const _UserLikeModelType();
  final String id;
  final User? _liker;
  final User? _liked;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserLikeModelIdentifier get modelIdentifier {
      return UserLikeModelIdentifier(
        id: id
      );
  }
  
  User? get liker {
    return _liker;
  }
  
  User? get liked {
    return _liked;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserLike._internal({required this.id, liker, liked, createdAt, updatedAt}): _liker = liker, _liked = liked, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserLike({String? id, User? liker, User? liked}) {
    return UserLike._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      liker: liker,
      liked: liked);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLike &&
      id == other.id &&
      _liker == other._liker &&
      _liked == other._liked;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserLike {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("liker=" + (_liker != null ? _liker!.toString() : "null") + ", ");
    buffer.write("liked=" + (_liked != null ? _liked!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserLike copyWith({User? liker, User? liked}) {
    return UserLike._internal(
      id: id,
      liker: liker ?? this.liker,
      liked: liked ?? this.liked);
  }
  
  UserLike copyWithModelFieldValues({
    ModelFieldValue<User?>? liker,
    ModelFieldValue<User?>? liked
  }) {
    return UserLike._internal(
      id: id,
      liker: liker == null ? this.liker : liker.value,
      liked: liked == null ? this.liked : liked.value
    );
  }
  
  UserLike.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _liker = json['liker'] != null
        ? json['liker']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['liker']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['liker']))
        : null,
      _liked = json['liked'] != null
        ? json['liked']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['liked']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['liked']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'liker': _liker?.toJson(), 'liked': _liked?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'liker': _liker,
    'liked': _liked,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserLikeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserLikeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final LIKER = amplify_core.QueryField(
    fieldName: "liker",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final LIKED = amplify_core.QueryField(
    fieldName: "liked",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserLike";
    modelSchemaDefinition.pluralName = "UserLikes";
    
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
      amplify_core.ModelIndex(fields: const ["id"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: UserLike.LIKER,
      isRequired: false,
      targetNames: ['likerId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: UserLike.LIKED,
      isRequired: false,
      targetNames: ['likedId'],
      ofModelName: 'User'
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

class _UserLikeModelType extends amplify_core.ModelType<UserLike> {
  const _UserLikeModelType();
  
  @override
  UserLike fromJson(Map<String, dynamic> jsonData) {
    return UserLike.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserLike';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserLike] in your schema.
 */
class UserLikeModelIdentifier implements amplify_core.ModelIdentifier<UserLike> {
  final String id;

  /** Create an instance of UserLikeModelIdentifier using [id] the primary key. */
  const UserLikeModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'UserLikeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserLikeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}