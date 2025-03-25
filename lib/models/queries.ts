/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

import * as APITypes from "./API";
type GeneratedQuery<InputType, OutputType> = string & {
  __generatedQueryInput: InputType;
  __generatedQueryOutput: OutputType;
};

export const filterUserGroups = /* GraphQL */ `query FilterUserGroups {
  filterUserGroups
}
` as GeneratedQuery<
  APITypes.FilterUserGroupsQueryVariables,
  APITypes.FilterUserGroupsQuery
>;
export const getCall = /* GraphQL */ `query GetCall($id: ID!) {
  getCall(id: $id) {
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
` as GeneratedQuery<APITypes.GetCallQueryVariables, APITypes.GetCallQuery>;
export const getUser = /* GraphQL */ `query GetUser($userId: ID!) {
  getUser(userId: $userId) {
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
` as GeneratedQuery<APITypes.GetUserQueryVariables, APITypes.GetUserQuery>;
export const getUserDislike = /* GraphQL */ `query GetUserDislike($id: ID!) {
  getUserDislike(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetUserDislikeQueryVariables,
  APITypes.GetUserDislikeQuery
>;
export const getUserLike = /* GraphQL */ `query GetUserLike($id: ID!) {
  getUserLike(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetUserLikeQueryVariables,
  APITypes.GetUserLikeQuery
>;
export const getUserMatch = /* GraphQL */ `query GetUserMatch($id: ID!) {
  getUserMatch(id: $id) {
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
` as GeneratedQuery<
  APITypes.GetUserMatchQueryVariables,
  APITypes.GetUserMatchQuery
>;
export const listCalls = /* GraphQL */ `query ListCalls(
  $filter: ModelCallFilterInput
  $id: ID
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listCalls(
    filter: $filter
    id: $id
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      callerId
      createdAt
      id
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<APITypes.ListCallsQueryVariables, APITypes.ListCallsQuery>;
export const listUserDislikes = /* GraphQL */ `query ListUserDislikes(
  $filter: ModelUserDislikeFilterInput
  $id: ID
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listUserDislikes(
    filter: $filter
    id: $id
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      createdAt
      dislikedId
      dislikerId
      id
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListUserDislikesQueryVariables,
  APITypes.ListUserDislikesQuery
>;
export const listUserLikes = /* GraphQL */ `query ListUserLikes(
  $filter: ModelUserLikeFilterInput
  $id: ID
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listUserLikes(
    filter: $filter
    id: $id
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      createdAt
      id
      likedId
      likerId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListUserLikesQueryVariables,
  APITypes.ListUserLikesQuery
>;
export const listUserMatches = /* GraphQL */ `query ListUserMatches(
  $filter: ModelUserMatchFilterInput
  $id: ID
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
) {
  listUserMatches(
    filter: $filter
    id: $id
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
  ) {
    items {
      createdAt
      id
      matchedId
      matcherId
      updatedAt
      __typename
    }
    nextToken
    __typename
  }
}
` as GeneratedQuery<
  APITypes.ListUserMatchesQueryVariables,
  APITypes.ListUserMatchesQuery
>;
export const listUsers = /* GraphQL */ `query ListUsers(
  $filter: ModelUserFilterInput
  $limit: Int
  $nextToken: String
  $sortDirection: ModelSortDirection
  $userId: ID
) {
  listUsers(
    filter: $filter
    limit: $limit
    nextToken: $nextToken
    sortDirection: $sortDirection
    userId: $userId
  ) {
    items {
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
    nextToken
    __typename
  }
}
` as GeneratedQuery<APITypes.ListUsersQueryVariables, APITypes.ListUsersQuery>;
