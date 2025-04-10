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


/** This is an auto generated class representing the MatchUsersReturnTypeMatchedUser type in your schema. */
class MatchUsersReturnTypeMatchedUser {
  final String? _userId;
  final String? _name;
  final String? _profilePicture;

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
  
  String? get profilePicture {
    return _profilePicture;
  }
  
  const MatchUsersReturnTypeMatchedUser._internal({required userId, required name, profilePicture}): _userId = userId, _name = name, _profilePicture = profilePicture;
  
  factory MatchUsersReturnTypeMatchedUser({required String userId, required String name, String? profilePicture}) {
    return MatchUsersReturnTypeMatchedUser._internal(
      userId: userId,
      name: name,
      profilePicture: profilePicture);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchUsersReturnTypeMatchedUser &&
      _userId == other._userId &&
      _name == other._name &&
      _profilePicture == other._profilePicture;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MatchUsersReturnTypeMatchedUser {");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("profilePicture=" + "$_profilePicture");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MatchUsersReturnTypeMatchedUser copyWith({String? userId, String? name, String? profilePicture}) {
    return MatchUsersReturnTypeMatchedUser._internal(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture);
  }
  
  MatchUsersReturnTypeMatchedUser copyWithModelFieldValues({
    ModelFieldValue<String>? userId,
    ModelFieldValue<String>? name,
    ModelFieldValue<String?>? profilePicture
  }) {
    return MatchUsersReturnTypeMatchedUser._internal(
      userId: userId == null ? this.userId : userId.value,
      name: name == null ? this.name : name.value,
      profilePicture: profilePicture == null ? this.profilePicture : profilePicture.value
    );
  }
  
  MatchUsersReturnTypeMatchedUser.fromJson(Map<String, dynamic> json)  
    : _userId = json['userId'],
      _name = json['name'],
      _profilePicture = json['profilePicture'];
  
  Map<String, dynamic> toJson() => {
    'userId': _userId, 'name': _name, 'profilePicture': _profilePicture
  };
  
  Map<String, Object?> toMap() => {
    'userId': _userId,
    'name': _name,
    'profilePicture': _profilePicture
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MatchUsersReturnTypeMatchedUser";
    modelSchemaDefinition.pluralName = "MatchUsersReturnTypeMatchedUsers";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'userId',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'name',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'profilePicture',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}