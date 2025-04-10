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


/** This is an auto generated class representing the MatchUsersReturnType type in your schema. */
class MatchUsersReturnType {
  final String? _callId;
  final MatchUsersReturnTypeMatchedUser? _matchedUser;
  final String? _status;
  final String? _error;

  String? get callId {
    return _callId;
  }
  
  MatchUsersReturnTypeMatchedUser? get matchedUser {
    return _matchedUser;
  }
  
  String? get status {
    return _status;
  }
  
  String? get error {
    return _error;
  }
  
  const MatchUsersReturnType._internal({callId, matchedUser, status, error}): _callId = callId, _matchedUser = matchedUser, _status = status, _error = error;
  
  factory MatchUsersReturnType({String? callId, MatchUsersReturnTypeMatchedUser? matchedUser, String? status, String? error}) {
    return MatchUsersReturnType._internal(
      callId: callId,
      matchedUser: matchedUser,
      status: status,
      error: error);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchUsersReturnType &&
      _callId == other._callId &&
      _matchedUser == other._matchedUser &&
      _status == other._status &&
      _error == other._error;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MatchUsersReturnType {");
    buffer.write("callId=" + "$_callId" + ", ");
    buffer.write("matchedUser=" + (_matchedUser != null ? _matchedUser!.toString() : "null") + ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("error=" + "$_error");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MatchUsersReturnType copyWith({String? callId, MatchUsersReturnTypeMatchedUser? matchedUser, String? status, String? error}) {
    return MatchUsersReturnType._internal(
      callId: callId ?? this.callId,
      matchedUser: matchedUser ?? this.matchedUser,
      status: status ?? this.status,
      error: error ?? this.error);
  }
  
  MatchUsersReturnType copyWithModelFieldValues({
    ModelFieldValue<String?>? callId,
    ModelFieldValue<MatchUsersReturnTypeMatchedUser?>? matchedUser,
    ModelFieldValue<String?>? status,
    ModelFieldValue<String?>? error
  }) {
    return MatchUsersReturnType._internal(
      callId: callId == null ? this.callId : callId.value,
      matchedUser: matchedUser == null ? this.matchedUser : matchedUser.value,
      status: status == null ? this.status : status.value,
      error: error == null ? this.error : error.value
    );
  }
  
  MatchUsersReturnType.fromJson(Map<String, dynamic> json)  
    : _callId = json['callId'],
      _matchedUser = json['matchedUser'] != null
          ? json['matchedUser']['serializedData'] != null
              ? MatchUsersReturnTypeMatchedUser.fromJson(new Map<String, dynamic>.from(json['matchedUser']['serializedData']))
              : MatchUsersReturnTypeMatchedUser.fromJson(new Map<String, dynamic>.from(json['matchedUser']))
        : null,
      _status = json['status'],
      _error = json['error'];
  
  Map<String, dynamic> toJson() => {
    'callId': _callId, 'matchedUser': _matchedUser?.toJson(), 'status': _status, 'error': _error
  };
  
  Map<String, Object?> toMap() => {
    'callId': _callId,
    'matchedUser': _matchedUser,
    'status': _status,
    'error': _error
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MatchUsersReturnType";
    modelSchemaDefinition.pluralName = "MatchUsersReturnTypes";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'callId',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'matchedUser',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'MatchUsersReturnTypeMatchedUser')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'status',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'error',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}