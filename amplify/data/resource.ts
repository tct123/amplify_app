import { a, defineData, type ClientSchema } from '@aws-amplify/backend';

const schema = a.schema({
  User: a.model({
    userId: a.id().required(),
    name: a.string(),
    age: a.integer(),
    gender: a.string(),
    gender_preference: a.string(),
    age_preference: a.integer().array(),
    location: a.customType({
      lat: a.float().required(),
      long: a.float().required(),
    }),
    radius: a.integer(),
    pictures: a.string().array(),
    profile_picture: a.string(),
    // Removed inverse relationships so they don't become required fields.
  })
  .identifier(['userId'])
  .authorization(allow => [allow.authenticated()]),

  // Define join models independently.
  UserLikes: a.model({
    id: a.id().required(),
    // The user who does the liking.
    user: a.belongsTo('User', 'id'),
    // The users that are liked.
    likedUsers: a.hasMany('User', 'userId'),
  }).authorization(allow => [allow.authenticated()]),

  UserMatches: a.model({
    id: a.id().required(),
    user: a.belongsTo('User', 'id'),
    userMatches: a.hasMany('User', 'userId'),
  }).authorization(allow => [allow.authenticated()]),

  UserDislikes: a.model({
    id: a.id().required(),
    user: a.belongsTo('User', 'id'),
    dislikedUsers: a.hasMany('User', 'userId'),
  }).authorization(allow => [allow.authenticated()])
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'apiKey',
    apiKeyAuthorizationMode: { expiresInDays: 30 }
  }
});

