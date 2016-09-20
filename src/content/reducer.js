import actions, { actionTypes } from './actions';

const nuleculesReducer = (prevState={}, action) => {
  let nextState = prevState;

  switch(action.type) {
    case actionTypes.LOAD_NULECULES_FULFILLED:
      nextState = action.payload.data.nulecules.reduce((nulecules, id) => {
        nulecules[id] = {};
        return nulecules;
      }, {});
      break;
  }

  return nextState;
}

export default nuleculesReducer;
