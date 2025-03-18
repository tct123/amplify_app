import { a, defineData, type ClientSchema } from '@aws-amplify/backend';
import { filterUsersFunctionHandler } from '../functions/filter-users/resource';

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
    // Many-to-many relationships via join models.
    likes: a.hasMany('UserLike', 'likerId'),
    likedBy: a.hasMany('UserLike', 'likedId'),
    matches: a.hasMany('UserMatch', 'matcherId'),
    matchedBy: a.hasMany('UserMatch', 'matchedId'),
    dislikes: a.hasMany('UserDislike', 'dislikerId'),
    dislikedBy: a.hasMany('UserDislike', 'dislikedId'),
    callList: a.hasMany('Call', 'callerId'),
    called: a.belongsTo('Call', 'userId'),
  })
  .identifier(['userId'])
  .authorization(allow => [allow.authenticated()]),

  UserLike: a.model({
    id: a.id().required(),
    // The user who does the liking.
    likerId: a.id().required(),
    // The user being liked.
    likedId: a.id().required(),
    liker: a.belongsTo('User', 'likerId'),
    liked: a.belongsTo('User', 'likedId'),
  }).authorization(allow => [allow.authenticated()]),

  UserMatch: a.model({
    id: a.id().required(),
    matcherId: a.id().required(),
    matchedId: a.id().required(),
    matcher: a.belongsTo('User', 'matcherId'),
    matched: a.belongsTo('User', 'matchedId'),
  }).authorization(allow => [allow.authenticated()]),

  Queue: a.model({
    id: a.id().required(),
    queueId: a.hasOne('Event', 'queueId'),
    userList: a.string().array(),
    isMaleList: a.boolean()
  }).authorization(allow => [allow.authenticated()]),



  Event: a.model({
    id: a.id().required(),
    shouldAddMan: a.boolean(),
    orientation: a.string().required(),
    date: a.string().required(),
    location: a.customType({
      lat: a.float().required(),
      long: a.float().required(),
    }),
    queueId: a.id(),
    eventId: a.id().required(),
    event: a.belongsTo('Call', 'eventId'),
    queue: a.belongsTo('Queue', 'queueId')
  }).authorization(allow => [allow.authenticated()]),


  Call: a.model({
    id: a.id().required(),
    callerId: a.id().required(),
    caller: a.belongsTo('User', 'callerId'),
    calledId: a.hasOne('User', 'userId'),
    eventId: a.hasOne('Event', 'eventId')
  }).authorization(allow => [allow.authenticated()]),


  UserDislike: a.model({
    id: a.id().required(),
    dislikerId: a.id().required(),
    dislikedId: a.id().required(),
    disliker: a.belongsTo('User', 'dislikerId'),
    disliked: a.belongsTo('User', 'dislikedId'),
  }).authorization(allow => [allow.authenticated()]),

  filterUserGroups: a.query()
    .returns(a.string()) // Adjust return type as needed (could be an object, list, etc.)
    .authorization(allow => [allow.authenticated()])  // Specify who can access this query.
    .handler(a.handler.function(filterUsersFunctionHandler)),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'apiKey',
    apiKeyAuthorizationMode: { expiresInDays: 30 }
  }
});

