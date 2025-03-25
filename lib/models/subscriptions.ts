/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

import * as APITypes from "./API";
type GeneratedSubscription<InputType, OutputType> = string & {
  __generatedSubscriptionInput: InputType;
  __generatedSubscriptionOutput: OutputType;
};

export const onCreateCall = /* GraphQL */ `subscription OnCreateCall($filter: ModelSubscriptionCallFilterInput) {
  onCreateCall(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnCreateCallSubscriptionVariables,
  APITypes.OnCreateCallSubscription
>;
export const onCreateUser = /* GraphQL */ `subscription OnCreateUser($filter: ModelSubscriptionUserFilterInput) {
  onCreateUser(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnCreateUserSubscriptionVariables,
  APITypes.OnCreateUserSubscription
>;
export const onCreateUserDislike = /* GraphQL */ `subscription OnCreateUserDislike(
  $filter: ModelSubscriptionUserDislikeFilterInput
) {
  onCreateUserDislike(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnCreateUserDislikeSubscriptionVariables,
  APITypes.OnCreateUserDislikeSubscription
>;
export const onCreateUserLike = /* GraphQL */ `subscription OnCreateUserLike($filter: ModelSubscriptionUserLikeFilterInput) {
  onCreateUserLike(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnCreateUserLikeSubscriptionVariables,
  APITypes.OnCreateUserLikeSubscription
>;
export const onCreateUserMatch = /* GraphQL */ `subscription OnCreateUserMatch($filter: ModelSubscriptionUserMatchFilterInput) {
  onCreateUserMatch(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnCreateUserMatchSubscriptionVariables,
  APITypes.OnCreateUserMatchSubscription
>;
export const onDeleteCall = /* GraphQL */ `subscription OnDeleteCall($filter: ModelSubscriptionCallFilterInput) {
  onDeleteCall(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnDeleteCallSubscriptionVariables,
  APITypes.OnDeleteCallSubscription
>;
export const onDeleteUser = /* GraphQL */ `subscription OnDeleteUser($filter: ModelSubscriptionUserFilterInput) {
  onDeleteUser(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnDeleteUserSubscriptionVariables,
  APITypes.OnDeleteUserSubscription
>;
export const onDeleteUserDislike = /* GraphQL */ `subscription OnDeleteUserDislike(
  $filter: ModelSubscriptionUserDislikeFilterInput
) {
  onDeleteUserDislike(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnDeleteUserDislikeSubscriptionVariables,
  APITypes.OnDeleteUserDislikeSubscription
>;
export const onDeleteUserLike = /* GraphQL */ `subscription OnDeleteUserLike($filter: ModelSubscriptionUserLikeFilterInput) {
  onDeleteUserLike(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnDeleteUserLikeSubscriptionVariables,
  APITypes.OnDeleteUserLikeSubscription
>;
export const onDeleteUserMatch = /* GraphQL */ `subscription OnDeleteUserMatch($filter: ModelSubscriptionUserMatchFilterInput) {
  onDeleteUserMatch(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnDeleteUserMatchSubscriptionVariables,
  APITypes.OnDeleteUserMatchSubscription
>;
export const onUpdateCall = /* GraphQL */ `subscription OnUpdateCall($filter: ModelSubscriptionCallFilterInput) {
  onUpdateCall(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnUpdateCallSubscriptionVariables,
  APITypes.OnUpdateCallSubscription
>;
export const onUpdateUser = /* GraphQL */ `subscription OnUpdateUser($filter: ModelSubscriptionUserFilterInput) {
  onUpdateUser(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnUpdateUserSubscriptionVariables,
  APITypes.OnUpdateUserSubscription
>;
export const onUpdateUserDislike = /* GraphQL */ `subscription OnUpdateUserDislike(
  $filter: ModelSubscriptionUserDislikeFilterInput
) {
  onUpdateUserDislike(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnUpdateUserDislikeSubscriptionVariables,
  APITypes.OnUpdateUserDislikeSubscription
>;
export const onUpdateUserLike = /* GraphQL */ `subscription OnUpdateUserLike($filter: ModelSubscriptionUserLikeFilterInput) {
  onUpdateUserLike(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnUpdateUserLikeSubscriptionVariables,
  APITypes.OnUpdateUserLikeSubscription
>;
export const onUpdateUserMatch = /* GraphQL */ `subscription OnUpdateUserMatch($filter: ModelSubscriptionUserMatchFilterInput) {
  onUpdateUserMatch(filter: $filter) {
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
` as GeneratedSubscription<
  APITypes.OnUpdateUserMatchSubscriptionVariables,
  APITypes.OnUpdateUserMatchSubscription
>;
