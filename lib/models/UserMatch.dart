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


/** This is an auto generated class representing the UserMatch type in your schema. */
class UserMatch extends amplify_core.Model {
  static const classType = const _UserMatchModelType();
  final String id;
  final User? _matcher;
  final User? _matched;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserMatchModelIdentifier get modelIdentifier {
      return UserMatchModelIdentifier(
        id: id
      );
  }
  
  User? get matcher {
    return _matcher;
  }
  
  User? get matched {
    return _matched;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserMatch._internal({required this.id, matcher, matched, createdAt, updatedAt}): _matcher = matcher, _matched = matched, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserMatch({String? id, User? matcher, User? matched}) {
    return UserMatch._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      matcher: matcher,
      matched: matched);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserMatch &&
      id == other.id &&
      _matcher == other._matcher &&
      _matched == other._matched;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserMatch {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("matcher=" + (_matcher != null ? _matcher!.toString() : "null") + ", ");
    buffer.write("matched=" + (_matched != null ? _matched!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserMatch copyWith({User? matcher, User? matched}) {
    return UserMatch._internal(
      id: id,
      matcher: matcher ?? this.matcher,
      matched: matched ?? this.matched);
  }
  
  UserMatch copyWithModelFieldValues({
    ModelFieldValue<User?>? matcher,
    ModelFieldValue<User?>? matched
  }) {
    return UserMatch._internal(
      id: id,
      matcher: matcher == null ? this.matcher : matcher.value,
      matched: matched == null ? this.matched : matched.value
    );
  }
  
  UserMatch.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _matcher = json['matcher'] != null
        ? json['matcher']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['matcher']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['matcher']))
        : null,
      _matched = json['matched'] != null
        ? json['matched']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['matched']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['matched']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'matcher': _matcher?.toJson(), 'matched': _matched?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'matcher': _matcher,
    'matched': _matched,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserMatchModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserMatchModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final MATCHER = amplify_core.QueryField(
    fieldName: "matcher",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final MATCHED = amplify_core.QueryField(
    fieldName: "matched",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserMatch";
    modelSchemaDefinition.pluralName = "UserMatches";
    
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
      key: UserMatch.MATCHER,
      isRequired: false,
      targetNames: ['matcherId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: UserMatch.MATCHED,
      isRequired: false,
      targetNames: ['matchedId'],
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

class _UserMatchModelType extends amplify_core.ModelType<UserMatch> {
  const _UserMatchModelType();
  
  @override
  UserMatch fromJson(Map<String, dynamic> jsonData) {
    return UserMatch.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserMatch';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserMatch] in your schema.
 */
class UserMatchModelIdentifier implements amplify_core.ModelIdentifier<UserMatch> {
  final String id;

  /** Create an instance of UserMatchModelIdentifier using [id] the primary key. */
  const UserMatchModelIdentifier({
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
  String toString() => 'UserMatchModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserMatchModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}