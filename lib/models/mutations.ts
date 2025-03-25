/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

import * as APITypes from "./API";
type GeneratedMutation<InputType, OutputType> = string & {
  __generatedMutationInput: InputType;
  __generatedMutationOutput: OutputType;
};

export const createCall = /* GraphQL */ `mutation CreateCall(
  $condition: ModelCallConditionInput
  $input: CreateCallInput!
) {
  createCall(condition: $condition, input: $input) {
    calledId {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    caller {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    callerId
    createdAt
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.CreateCallMutationVariables,
  APITypes.CreateCallMutation
>;
export const createUser = /* GraphQL */ `mutation CreateUser(
  $condition: ModelUserConditionInput
  $input: CreateUserInput!
) {
  createUser(condition: $condition, input: $input) {
    aboutMe
    age
    age_preference
    callList {
      nextToken
      __typename
    }
    called {
      callerId
      createdAt
      id
      updatedAt
      __typename
    }
    createdAt
    dislikedBy {
      nextToken
      __typename
    }
    dislikes {
      nextToken
      __typename
    }
    gender
    gender_preference
    likedBy {
      nextToken
      __typename
    }
    likes {
      nextToken
      __typename
    }
    location {
      lat
      long
      __typename
    }
    matchedBy {
      nextToken
      __typename
    }
    matches {
      nextToken
      __typename
    }
    name
    pictures
    profile_picture
    radius
    updatedAt
    userId
    __typename
  }
}
` as GeneratedMutation<
  APITypes.CreateUserMutationVariables,
  APITypes.CreateUserMutation
>;
export const createUserDislike = /* GraphQL */ `mutation CreateUserDislike(
  $condition: ModelUserDislikeConditionInput
  $input: CreateUserDislikeInput!
) {
  createUserDislike(condition: $condition, input: $input) {
    createdAt
    disliked {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    dislikedId
    disliker {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    dislikerId
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.CreateUserDislikeMutationVariables,
  APITypes.CreateUserDislikeMutation
>;
export const createUserLike = /* GraphQL */ `mutation CreateUserLike(
  $condition: ModelUserLikeConditionInput
  $input: CreateUserLikeInput!
) {
  createUserLike(condition: $condition, input: $input) {
    createdAt
    id
    liked {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    likedId
    liker {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    likerId
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.CreateUserLikeMutationVariables,
  APITypes.CreateUserLikeMutation
>;
export const createUserMatch = /* GraphQL */ `mutation CreateUserMatch(
  $condition: ModelUserMatchConditionInput
  $input: CreateUserMatchInput!
) {
  createUserMatch(condition: $condition, input: $input) {
    createdAt
    id
    matched {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    matchedId
    matcher {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    matcherId
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.CreateUserMatchMutationVariables,
  APITypes.CreateUserMatchMutation
>;
export const deleteCall = /* GraphQL */ `mutation DeleteCall(
  $condition: ModelCallConditionInput
  $input: DeleteCallInput!
) {
  deleteCall(condition: $condition, input: $input) {
    calledId {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    caller {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    callerId
    createdAt
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.DeleteCallMutationVariables,
  APITypes.DeleteCallMutation
>;
export const deleteUser = /* GraphQL */ `mutation DeleteUser(
  $condition: ModelUserConditionInput
  $input: DeleteUserInput!
) {
  deleteUser(condition: $condition, input: $input) {
    aboutMe
    age
    age_preference
    callList {
      nextToken
      __typename
    }
    called {
      callerId
      createdAt
      id
      updatedAt
      __typename
    }
    createdAt
    dislikedBy {
      nextToken
      __typename
    }
    dislikes {
      nextToken
      __typename
    }
    gender
    gender_preference
    likedBy {
      nextToken
      __typename
    }
    likes {
      nextToken
      __typename
    }
    location {
      lat
      long
      __typename
    }
    matchedBy {
      nextToken
      __typename
    }
    matches {
      nextToken
      __typename
    }
    name
    pictures
    profile_picture
    radius
    updatedAt
    userId
    __typename
  }
}
` as GeneratedMutation<
  APITypes.DeleteUserMutationVariables,
  APITypes.DeleteUserMutation
>;
export const deleteUserDislike = /* GraphQL */ `mutation DeleteUserDislike(
  $condition: ModelUserDislikeConditionInput
  $input: DeleteUserDislikeInput!
) {
  deleteUserDislike(condition: $condition, input: $input) {
    createdAt
    disliked {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    dislikedId
    disliker {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    dislikerId
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.DeleteUserDislikeMutationVariables,
  APITypes.DeleteUserDislikeMutation
>;
export const deleteUserLike = /* GraphQL */ `mutation DeleteUserLike(
  $condition: ModelUserLikeConditionInput
  $input: DeleteUserLikeInput!
) {
  deleteUserLike(condition: $condition, input: $input) {
    createdAt
    id
    liked {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    likedId
    liker {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    likerId
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.DeleteUserLikeMutationVariables,
  APITypes.DeleteUserLikeMutation
>;
export const deleteUserMatch = /* GraphQL */ `mutation DeleteUserMatch(
  $condition: ModelUserMatchConditionInput
  $input: DeleteUserMatchInput!
) {
  deleteUserMatch(condition: $condition, input: $input) {
    createdAt
    id
    matched {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    matchedId
    matcher {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    matcherId
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.DeleteUserMatchMutationVariables,
  APITypes.DeleteUserMatchMutation
>;
export const updateCall = /* GraphQL */ `mutation UpdateCall(
  $condition: ModelCallConditionInput
  $input: UpdateCallInput!
) {
  updateCall(condition: $condition, input: $input) {
    calledId {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    caller {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    callerId
    createdAt
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.UpdateCallMutationVariables,
  APITypes.UpdateCallMutation
>;
export const updateUser = /* GraphQL */ `mutation UpdateUser(
  $condition: ModelUserConditionInput
  $input: UpdateUserInput!
) {
  updateUser(condition: $condition, input: $input) {
    aboutMe
    age
    age_preference
    callList {
      nextToken
      __typename
    }
    called {
      callerId
      createdAt
      id
      updatedAt
      __typename
    }
    createdAt
    dislikedBy {
      nextToken
      __typename
    }
    dislikes {
      nextToken
      __typename
    }
    gender
    gender_preference
    likedBy {
      nextToken
      __typename
    }
    likes {
      nextToken
      __typename
    }
    location {
      lat
      long
      __typename
    }
    matchedBy {
      nextToken
      __typename
    }
    matches {
      nextToken
      __typename
    }
    name
    pictures
    profile_picture
    radius
    updatedAt
    userId
    __typename
  }
}
` as GeneratedMutation<
  APITypes.UpdateUserMutationVariables,
  APITypes.UpdateUserMutation
>;
export const updateUserDislike = /* GraphQL */ `mutation UpdateUserDislike(
  $condition: ModelUserDislikeConditionInput
  $input: UpdateUserDislikeInput!
) {
  updateUserDislike(condition: $condition, input: $input) {
    createdAt
    disliked {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    dislikedId
    disliker {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    dislikerId
    id
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.UpdateUserDislikeMutationVariables,
  APITypes.UpdateUserDislikeMutation
>;
export const updateUserLike = /* GraphQL */ `mutation UpdateUserLike(
  $condition: ModelUserLikeConditionInput
  $input: UpdateUserLikeInput!
) {
  updateUserLike(condition: $condition, input: $input) {
    createdAt
    id
    liked {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    likedId
    liker {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    likerId
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.UpdateUserLikeMutationVariables,
  APITypes.UpdateUserLikeMutation
>;
export const updateUserMatch = /* GraphQL */ `mutation UpdateUserMatch(
  $condition: ModelUserMatchConditionInput
  $input: UpdateUserMatchInput!
) {
  updateUserMatch(condition: $condition, input: $input) {
    createdAt
    id
    matched {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    matchedId
    matcher {
      aboutMe
      age
      age_preference
      createdAt
      gender
      gender_preference
      name
      pictures
      profile_picture
      radius
      updatedAt
      userId
      __typename
    }
    matcherId
    updatedAt
    __typename
  }
}
` as GeneratedMutation<
  APITypes.UpdateUserMatchMutationVariables,
  APITypes.UpdateUserMatchMutation
>;
