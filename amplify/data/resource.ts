import { a, defineData, type ClientSchema } from '@aws-amplify/backend';

const schema = a.schema({
  User: a.model({
    userId: a.id().required(),
    name: a.string().required(),
    age: a.integer(),
    gender: a.string(),
    gender_preference: a.integer().array(),
    age_preference: a.integer().array(),
    location: a.customType({
      lat: a.float().required(),
      long: a.float().required(),
    }),
    radius: a.integer(),
    pictures: a.string().array(),
    profile_picture: a.string(),
    // Inverse relationships: reference the join model field names.
    likes: a.hasMany('UserLikes', 'id'),
    likedBy: a.belongsTo('UserLikes', 'userId'),
    matches: a.hasMany('UserMatches', 'id'),
    matchedBy: a.belongsTo('UserMatches', 'userId'),
    dislikes: a.hasMany('UserDislikes', 'id'),
    dislikedBy: a.belongsTo('UserDislikes', 'userId'),
  })
  .identifier(['userId'])
  .authorization(allow => [allow.publicApiKey()]),

  UserLikes: a.model({
    id: a.id().required(),
    // The user doing the like
    user: a.belongsTo('User', 'id'),
    // The user being liked
    likedUsers: a.hasMany('User', 'userId'),
  }).authorization(allow => [allow.publicApiKey()]),

  UserMatches: a.model({
    id: a.id().required(),
    user: a.belongsTo('User', 'id'),
    userMatches: a.hasMany('User', 'userId'),
  }).authorization(allow => [allow.publicApiKey()]),

  UserDislikes: a.model({
    id: a.id().required(),
    user: a.belongsTo('User', 'id'),
    dislikedUsers: a.hasMany('User', 'userId'),
  }).authorization(allow => [allow.publicApiKey()])
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'apiKey',
    apiKeyAuthorizationMode: { expiresInDays: 30 }
  }
});

