import { defineBackend } from '@aws-amplify/backend';
import { auth } from './auth/resource';
import { data } from './data/resource';
import { filterUsersFunctionHandler } from './functions/filter-users/resource';
import { matchUsers } from './functions/match-users/resource';
import { createEventFunctionHandler } from './functions/create-event/resource'; 
import { storage } from './storage/resource';
/**
 * @see https://docs.amplify.aws/react/build-a-backend/ to add storage, functions, and more
 */
defineBackend({
  auth,
  data,
  storage,
  filterUsersFunctionHandler,
  createEventFunctionHandler,
  matchUsers
});

