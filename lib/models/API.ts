/* tslint:disable */
/* eslint-disable */
//  This file was automatically generated and should not be edited.

export type Call = {
  __typename: "Call",
  calledId?: User | null,
  caller?: User | null,
  callerId: string,
  createdAt: string,
  id: string,
  updatedAt: string,
};

export type User = {
  __typename: "User",
  aboutMe?: string | null,
  age?: number | null,
  age_preference?: Array< number | null > | null,
  callList?: ModelCallConnection | null,
  called?: Call | null,
  createdAt: string,
  dislikedBy?: ModelUserDislikeConnection | null,
  dislikes?: ModelUserDislikeConnection | null,
  gender?: string | null,
  gender_preference?: string | null,
  likedBy?: ModelUserLikeConnection | null,
  likes?: ModelUserLikeConnection | null,
  location?: UserLocation | null,
  matchedBy?: ModelUserMatchConnection | null,
  matches?: ModelUserMatchConnection | null,
  name?: string | null,
  pictures?: Array< string | null > | null,
  profile_picture?: string | null,
  radius?: number | null,
  updatedAt: string,
  userId: string,
};

export type ModelCallConnection = {
  __typename: "ModelCallConnection",
  items:  Array<Call | null >,
  nextToken?: string | null,
};

export type ModelUserDislikeConnection = {
  __typename: "ModelUserDislikeConnection",
  items:  Array<UserDislike | null >,
  nextToken?: string | null,
};

export type UserDislike = {
  __typename: "UserDislike",
  createdAt: string,
  disliked?: User | null,
  dislikedId: string,
  disliker?: User | null,
  dislikerId: string,
  id: string,
  updatedAt: string,
};

export type ModelUserLikeConnection = {
  __typename: "ModelUserLikeConnection",
  items:  Array<UserLike | null >,
  nextToken?: string | null,
};

export type UserLike = {
  __typename: "UserLike",
  createdAt: string,
  id: string,
  liked?: User | null,
  likedId: string,
  liker?: User | null,
  likerId: string,
  updatedAt: string,
};

export type UserLocation = {
  __typename: "UserLocation",
  lat: number,
  long: number,
};

export type ModelUserMatchConnection = {
  __typename: "ModelUserMatchConnection",
  items:  Array<UserMatch | null >,
  nextToken?: string | null,
};

export type UserMatch = {
  __typename: "UserMatch",
  createdAt: string,
  id: string,
  matched?: User | null,
  matchedId: string,
  matcher?: User | null,
  matcherId: string,
  updatedAt: string,
};

export type ModelCallFilterInput = {
  and?: Array< ModelCallFilterInput | null > | null,
  callerId?: ModelIDInput | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  not?: ModelCallFilterInput | null,
  or?: Array< ModelCallFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelIDInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  size?: ModelSizeInput | null,
};

export enum ModelAttributeTypes {
  _null = "_null",
  binary = "binary",
  binarySet = "binarySet",
  bool = "bool",
  list = "list",
  map = "map",
  number = "number",
  numberSet = "numberSet",
  string = "string",
  stringSet = "stringSet",
}


export type ModelSizeInput = {
  between?: Array< number | null > | null,
  eq?: number | null,
  ge?: number | null,
  gt?: number | null,
  le?: number | null,
  lt?: number | null,
  ne?: number | null,
};

export type ModelStringInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  size?: ModelSizeInput | null,
};

export enum ModelSortDirection {
  ASC = "ASC",
  DESC = "DESC",
}


export type ModelUserDislikeFilterInput = {
  and?: Array< ModelUserDislikeFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  dislikedId?: ModelIDInput | null,
  dislikerId?: ModelIDInput | null,
  id?: ModelIDInput | null,
  not?: ModelUserDislikeFilterInput | null,
  or?: Array< ModelUserDislikeFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelUserLikeFilterInput = {
  and?: Array< ModelUserLikeFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  likedId?: ModelIDInput | null,
  likerId?: ModelIDInput | null,
  not?: ModelUserLikeFilterInput | null,
  or?: Array< ModelUserLikeFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelUserMatchFilterInput = {
  and?: Array< ModelUserMatchFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  id?: ModelIDInput | null,
  matchedId?: ModelIDInput | null,
  matcherId?: ModelIDInput | null,
  not?: ModelUserMatchFilterInput | null,
  or?: Array< ModelUserMatchFilterInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type ModelUserFilterInput = {
  aboutMe?: ModelStringInput | null,
  age?: ModelIntInput | null,
  age_preference?: ModelIntInput | null,
  and?: Array< ModelUserFilterInput | null > | null,
  createdAt?: ModelStringInput | null,
  gender?: ModelStringInput | null,
  gender_preference?: ModelStringInput | null,
  id?: ModelIDInput | null,
  name?: ModelStringInput | null,
  not?: ModelUserFilterInput | null,
  or?: Array< ModelUserFilterInput | null > | null,
  pictures?: ModelStringInput | null,
  profile_picture?: ModelStringInput | null,
  radius?: ModelIntInput | null,
  updatedAt?: ModelStringInput | null,
  userId?: ModelIDInput | null,
};

export type ModelIntInput = {
  attributeExists?: boolean | null,
  attributeType?: ModelAttributeTypes | null,
  between?: Array< number | null > | null,
  eq?: number | null,
  ge?: number | null,
  gt?: number | null,
  le?: number | null,
  lt?: number | null,
  ne?: number | null,
};

export type ModelUserConnection = {
  __typename: "ModelUserConnection",
  items:  Array<User | null >,
  nextToken?: string | null,
};

export type ModelCallConditionInput = {
  and?: Array< ModelCallConditionInput | null > | null,
  callerId?: ModelIDInput | null,
  createdAt?: ModelStringInput | null,
  not?: ModelCallConditionInput | null,
  or?: Array< ModelCallConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateCallInput = {
  callerId: string,
  id?: string | null,
};

export type ModelUserConditionInput = {
  aboutMe?: ModelStringInput | null,
  age?: ModelIntInput | null,
  age_preference?: ModelIntInput | null,
  and?: Array< ModelUserConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  gender?: ModelStringInput | null,
  gender_preference?: ModelStringInput | null,
  name?: ModelStringInput | null,
  not?: ModelUserConditionInput | null,
  or?: Array< ModelUserConditionInput | null > | null,
  pictures?: ModelStringInput | null,
  profile_picture?: ModelStringInput | null,
  radius?: ModelIntInput | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateUserInput = {
  aboutMe?: string | null,
  age?: number | null,
  age_preference?: Array< number | null > | null,
  gender?: string | null,
  gender_preference?: string | null,
  location?: UserLocationInput | null,
  name?: string | null,
  pictures?: Array< string | null > | null,
  profile_picture?: string | null,
  radius?: number | null,
  userId: string,
};

export type UserLocationInput = {
  lat: number,
  long: number,
};

export type ModelUserDislikeConditionInput = {
  and?: Array< ModelUserDislikeConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  dislikedId?: ModelIDInput | null,
  dislikerId?: ModelIDInput | null,
  not?: ModelUserDislikeConditionInput | null,
  or?: Array< ModelUserDislikeConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateUserDislikeInput = {
  dislikedId: string,
  dislikerId: string,
  id?: string | null,
};

export type ModelUserLikeConditionInput = {
  and?: Array< ModelUserLikeConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  likedId?: ModelIDInput | null,
  likerId?: ModelIDInput | null,
  not?: ModelUserLikeConditionInput | null,
  or?: Array< ModelUserLikeConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateUserLikeInput = {
  id?: string | null,
  likedId: string,
  likerId: string,
};

export type ModelUserMatchConditionInput = {
  and?: Array< ModelUserMatchConditionInput | null > | null,
  createdAt?: ModelStringInput | null,
  matchedId?: ModelIDInput | null,
  matcherId?: ModelIDInput | null,
  not?: ModelUserMatchConditionInput | null,
  or?: Array< ModelUserMatchConditionInput | null > | null,
  updatedAt?: ModelStringInput | null,
};

export type CreateUserMatchInput = {
  id?: string | null,
  matchedId: string,
  matcherId: string,
};

export type DeleteCallInput = {
  id: string,
};

export type DeleteUserInput = {
  userId: string,
};

export type DeleteUserDislikeInput = {
  id: string,
};

export type DeleteUserLikeInput = {
  id: string,
};

export type DeleteUserMatchInput = {
  id: string,
};

export type UpdateCallInput = {
  callerId?: string | null,
  id: string,
};

export type UpdateUserInput = {
  aboutMe?: string | null,
  age?: number | null,
  age_preference?: Array< number | null > | null,
  gender?: string | null,
  gender_preference?: string | null,
  location?: UserLocationInput | null,
  name?: string | null,
  pictures?: Array< string | null > | null,
  profile_picture?: string | null,
  radius?: number | null,
  userId: string,
};

export type UpdateUserDislikeInput = {
  dislikedId?: string | null,
  dislikerId?: string | null,
  id: string,
};

export type UpdateUserLikeInput = {
  id: string,
  likedId?: string | null,
  likerId?: string | null,
};

export type UpdateUserMatchInput = {
  id: string,
  matchedId?: string | null,
  matcherId?: string | null,
};

export type ModelSubscriptionCallFilterInput = {
  and?: Array< ModelSubscriptionCallFilterInput | null > | null,
  callerId?: ModelSubscriptionIDInput | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionCallFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionIDInput = {
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  in?: Array< string | null > | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  notIn?: Array< string | null > | null,
};

export type ModelSubscriptionStringInput = {
  beginsWith?: string | null,
  between?: Array< string | null > | null,
  contains?: string | null,
  eq?: string | null,
  ge?: string | null,
  gt?: string | null,
  in?: Array< string | null > | null,
  le?: string | null,
  lt?: string | null,
  ne?: string | null,
  notContains?: string | null,
  notIn?: Array< string | null > | null,
};

export type ModelSubscriptionUserFilterInput = {
  aboutMe?: ModelSubscriptionStringInput | null,
  age?: ModelSubscriptionIntInput | null,
  age_preference?: ModelSubscriptionIntInput | null,
  and?: Array< ModelSubscriptionUserFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  gender?: ModelSubscriptionStringInput | null,
  gender_preference?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  name?: ModelSubscriptionStringInput | null,
  or?: Array< ModelSubscriptionUserFilterInput | null > | null,
  pictures?: ModelSubscriptionStringInput | null,
  profile_picture?: ModelSubscriptionStringInput | null,
  radius?: ModelSubscriptionIntInput | null,
  updatedAt?: ModelSubscriptionStringInput | null,
  userId?: ModelSubscriptionIDInput | null,
};

export type ModelSubscriptionIntInput = {
  between?: Array< number | null > | null,
  eq?: number | null,
  ge?: number | null,
  gt?: number | null,
  in?: Array< number | null > | null,
  le?: number | null,
  lt?: number | null,
  ne?: number | null,
  notIn?: Array< number | null > | null,
};

export type ModelSubscriptionUserDislikeFilterInput = {
  and?: Array< ModelSubscriptionUserDislikeFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  dislikedId?: ModelSubscriptionIDInput | null,
  dislikerId?: ModelSubscriptionIDInput | null,
  id?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionUserDislikeFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionUserLikeFilterInput = {
  and?: Array< ModelSubscriptionUserLikeFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  likedId?: ModelSubscriptionIDInput | null,
  likerId?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionUserLikeFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type ModelSubscriptionUserMatchFilterInput = {
  and?: Array< ModelSubscriptionUserMatchFilterInput | null > | null,
  createdAt?: ModelSubscriptionStringInput | null,
  id?: ModelSubscriptionIDInput | null,
  matchedId?: ModelSubscriptionIDInput | null,
  matcherId?: ModelSubscriptionIDInput | null,
  or?: Array< ModelSubscriptionUserMatchFilterInput | null > | null,
  updatedAt?: ModelSubscriptionStringInput | null,
};

export type FilterUserGroupsQueryVariables = {
};

export type FilterUserGroupsQuery = {
  filterUserGroups?: string | null,
};

export type GetCallQueryVariables = {
  id: string,
};

export type GetCallQuery = {
  getCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type GetUserQueryVariables = {
  userId: string,
};

export type GetUserQuery = {
  getUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type GetUserDislikeQueryVariables = {
  id: string,
};

export type GetUserDislikeQuery = {
  getUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type GetUserLikeQueryVariables = {
  id: string,
};

export type GetUserLikeQuery = {
  getUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type GetUserMatchQueryVariables = {
  id: string,
};

export type GetUserMatchQuery = {
  getUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};

export type ListCallsQueryVariables = {
  filter?: ModelCallFilterInput | null,
  id?: string | null,
  limit?: number | null,
  nextToken?: string | null,
  sortDirection?: ModelSortDirection | null,
};

export type ListCallsQuery = {
  listCalls?:  {
    __typename: "ModelCallConnection",
    items:  Array< {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListUserDislikesQueryVariables = {
  filter?: ModelUserDislikeFilterInput | null,
  id?: string | null,
  limit?: number | null,
  nextToken?: string | null,
  sortDirection?: ModelSortDirection | null,
};

export type ListUserDislikesQuery = {
  listUserDislikes?:  {
    __typename: "ModelUserDislikeConnection",
    items:  Array< {
      __typename: "UserDislike",
      createdAt: string,
      dislikedId: string,
      dislikerId: string,
      id: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListUserLikesQueryVariables = {
  filter?: ModelUserLikeFilterInput | null,
  id?: string | null,
  limit?: number | null,
  nextToken?: string | null,
  sortDirection?: ModelSortDirection | null,
};

export type ListUserLikesQuery = {
  listUserLikes?:  {
    __typename: "ModelUserLikeConnection",
    items:  Array< {
      __typename: "UserLike",
      createdAt: string,
      id: string,
      likedId: string,
      likerId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListUserMatchesQueryVariables = {
  filter?: ModelUserMatchFilterInput | null,
  id?: string | null,
  limit?: number | null,
  nextToken?: string | null,
  sortDirection?: ModelSortDirection | null,
};

export type ListUserMatchesQuery = {
  listUserMatches?:  {
    __typename: "ModelUserMatchConnection",
    items:  Array< {
      __typename: "UserMatch",
      createdAt: string,
      id: string,
      matchedId: string,
      matcherId: string,
      updatedAt: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type ListUsersQueryVariables = {
  filter?: ModelUserFilterInput | null,
  limit?: number | null,
  nextToken?: string | null,
  sortDirection?: ModelSortDirection | null,
  userId?: string | null,
};

export type ListUsersQuery = {
  listUsers?:  {
    __typename: "ModelUserConnection",
    items:  Array< {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null >,
    nextToken?: string | null,
  } | null,
};

export type CreateCallMutationVariables = {
  condition?: ModelCallConditionInput | null,
  input: CreateCallInput,
};

export type CreateCallMutation = {
  createCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type CreateUserMutationVariables = {
  condition?: ModelUserConditionInput | null,
  input: CreateUserInput,
};

export type CreateUserMutation = {
  createUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type CreateUserDislikeMutationVariables = {
  condition?: ModelUserDislikeConditionInput | null,
  input: CreateUserDislikeInput,
};

export type CreateUserDislikeMutation = {
  createUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type CreateUserLikeMutationVariables = {
  condition?: ModelUserLikeConditionInput | null,
  input: CreateUserLikeInput,
};

export type CreateUserLikeMutation = {
  createUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type CreateUserMatchMutationVariables = {
  condition?: ModelUserMatchConditionInput | null,
  input: CreateUserMatchInput,
};

export type CreateUserMatchMutation = {
  createUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};

export type DeleteCallMutationVariables = {
  condition?: ModelCallConditionInput | null,
  input: DeleteCallInput,
};

export type DeleteCallMutation = {
  deleteCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type DeleteUserMutationVariables = {
  condition?: ModelUserConditionInput | null,
  input: DeleteUserInput,
};

export type DeleteUserMutation = {
  deleteUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type DeleteUserDislikeMutationVariables = {
  condition?: ModelUserDislikeConditionInput | null,
  input: DeleteUserDislikeInput,
};

export type DeleteUserDislikeMutation = {
  deleteUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type DeleteUserLikeMutationVariables = {
  condition?: ModelUserLikeConditionInput | null,
  input: DeleteUserLikeInput,
};

export type DeleteUserLikeMutation = {
  deleteUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type DeleteUserMatchMutationVariables = {
  condition?: ModelUserMatchConditionInput | null,
  input: DeleteUserMatchInput,
};

export type DeleteUserMatchMutation = {
  deleteUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};

export type UpdateCallMutationVariables = {
  condition?: ModelCallConditionInput | null,
  input: UpdateCallInput,
};

export type UpdateCallMutation = {
  updateCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type UpdateUserMutationVariables = {
  condition?: ModelUserConditionInput | null,
  input: UpdateUserInput,
};

export type UpdateUserMutation = {
  updateUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type UpdateUserDislikeMutationVariables = {
  condition?: ModelUserDislikeConditionInput | null,
  input: UpdateUserDislikeInput,
};

export type UpdateUserDislikeMutation = {
  updateUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type UpdateUserLikeMutationVariables = {
  condition?: ModelUserLikeConditionInput | null,
  input: UpdateUserLikeInput,
};

export type UpdateUserLikeMutation = {
  updateUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type UpdateUserMatchMutationVariables = {
  condition?: ModelUserMatchConditionInput | null,
  input: UpdateUserMatchInput,
};

export type UpdateUserMatchMutation = {
  updateUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateCallSubscriptionVariables = {
  filter?: ModelSubscriptionCallFilterInput | null,
};

export type OnCreateCallSubscription = {
  onCreateCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnCreateUserSubscriptionVariables = {
  filter?: ModelSubscriptionUserFilterInput | null,
};

export type OnCreateUserSubscription = {
  onCreateUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type OnCreateUserDislikeSubscriptionVariables = {
  filter?: ModelSubscriptionUserDislikeFilterInput | null,
};

export type OnCreateUserDislikeSubscription = {
  onCreateUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnCreateUserLikeSubscriptionVariables = {
  filter?: ModelSubscriptionUserLikeFilterInput | null,
};

export type OnCreateUserLikeSubscription = {
  onCreateUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type OnCreateUserMatchSubscriptionVariables = {
  filter?: ModelSubscriptionUserMatchFilterInput | null,
};

export type OnCreateUserMatchSubscription = {
  onCreateUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteCallSubscriptionVariables = {
  filter?: ModelSubscriptionCallFilterInput | null,
};

export type OnDeleteCallSubscription = {
  onDeleteCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteUserSubscriptionVariables = {
  filter?: ModelSubscriptionUserFilterInput | null,
};

export type OnDeleteUserSubscription = {
  onDeleteUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type OnDeleteUserDislikeSubscriptionVariables = {
  filter?: ModelSubscriptionUserDislikeFilterInput | null,
};

export type OnDeleteUserDislikeSubscription = {
  onDeleteUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteUserLikeSubscriptionVariables = {
  filter?: ModelSubscriptionUserLikeFilterInput | null,
};

export type OnDeleteUserLikeSubscription = {
  onDeleteUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type OnDeleteUserMatchSubscriptionVariables = {
  filter?: ModelSubscriptionUserMatchFilterInput | null,
};

export type OnDeleteUserMatchSubscription = {
  onDeleteUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateCallSubscriptionVariables = {
  filter?: ModelSubscriptionCallFilterInput | null,
};

export type OnUpdateCallSubscription = {
  onUpdateCall?:  {
    __typename: "Call",
    calledId?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    caller?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    callerId: string,
    createdAt: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateUserSubscriptionVariables = {
  filter?: ModelSubscriptionUserFilterInput | null,
};

export type OnUpdateUserSubscription = {
  onUpdateUser?:  {
    __typename: "User",
    aboutMe?: string | null,
    age?: number | null,
    age_preference?: Array< number | null > | null,
    callList?:  {
      __typename: "ModelCallConnection",
      nextToken?: string | null,
    } | null,
    called?:  {
      __typename: "Call",
      callerId: string,
      createdAt: string,
      id: string,
      updatedAt: string,
    } | null,
    createdAt: string,
    dislikedBy?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    dislikes?:  {
      __typename: "ModelUserDislikeConnection",
      nextToken?: string | null,
    } | null,
    gender?: string | null,
    gender_preference?: string | null,
    likedBy?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    likes?:  {
      __typename: "ModelUserLikeConnection",
      nextToken?: string | null,
    } | null,
    location?:  {
      __typename: "UserLocation",
      lat: number,
      long: number,
    } | null,
    matchedBy?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    matches?:  {
      __typename: "ModelUserMatchConnection",
      nextToken?: string | null,
    } | null,
    name?: string | null,
    pictures?: Array< string | null > | null,
    profile_picture?: string | null,
    radius?: number | null,
    updatedAt: string,
    userId: string,
  } | null,
};

export type OnUpdateUserDislikeSubscriptionVariables = {
  filter?: ModelSubscriptionUserDislikeFilterInput | null,
};

export type OnUpdateUserDislikeSubscription = {
  onUpdateUserDislike?:  {
    __typename: "UserDislike",
    createdAt: string,
    disliked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikedId: string,
    disliker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    dislikerId: string,
    id: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateUserLikeSubscriptionVariables = {
  filter?: ModelSubscriptionUserLikeFilterInput | null,
};

export type OnUpdateUserLikeSubscription = {
  onUpdateUserLike?:  {
    __typename: "UserLike",
    createdAt: string,
    id: string,
    liked?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likedId: string,
    liker?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    likerId: string,
    updatedAt: string,
  } | null,
};

export type OnUpdateUserMatchSubscriptionVariables = {
  filter?: ModelSubscriptionUserMatchFilterInput | null,
};

export type OnUpdateUserMatchSubscription = {
  onUpdateUserMatch?:  {
    __typename: "UserMatch",
    createdAt: string,
    id: string,
    matched?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matchedId: string,
    matcher?:  {
      __typename: "User",
      aboutMe?: string | null,
      age?: number | null,
      age_preference?: Array< number | null > | null,
      createdAt: string,
      gender?: string | null,
      gender_preference?: string | null,
      name?: string | null,
      pictures?: Array< string | null > | null,
      profile_picture?: string | null,
      radius?: number | null,
      updatedAt: string,
      userId: string,
    } | null,
    matcherId: string,
    updatedAt: string,
  } | null,
};
