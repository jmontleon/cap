import axios from 'axios';
import { browserHistory } from 'react-router';
import { getBaseUrl } from '../shared/api';

const actionTypes = {
  LOAD_NULECULES: 'content.LOAD_NULECULES',
  LOAD_NULECULES_PENDING: 'content.LOAD_NULECULES_PENDING',
  LOAD_NULECULES_FULFILLED: 'content.LOAD_NULECULES_FULFILLED',
  LOAD_NULECULES_REJECTED: 'content.LOAD_NULECULES_REJECTED',
  LOAD_NULECULE: 'content.LOAD_NULECULE',
  LOAD_NULECULE_PENDING: 'content.LOAD_NULECULE_PENDING',
  LOAD_NULECULE_FULFILLED: 'content.LOAD_NULECULE_FULFILLED',
  LOAD_NULECULE_REJECTED: 'content.LOAD_NULECULE_REJECTED',
};

const actions = {
  loadNulecules: () => {
    const url = getBaseUrl() + '/nulecules';
    console.debug('trying to hit nulecules -> ', url);

    return {
      type: actionTypes.LOAD_NULECULES,
      payload: axios(url)
    };
  },
  loadNulecule: (nuleculeId) => {
    const url = getBaseUrl() + '/nulecules/' + nuleculeId;
    console.debug('trying to load a nulecule detail -> ', url);

    return {
      type: actionTypes.LOAD_NULECULE,
      payload: axios(url),
      meta: {
        nuleculeId: nuleculeId
      }
    };
  },
  postAnswers: (nuleculeId) => {
    console.debug('nuleculeId -> ', nuleculeId);

    // Chaining actions with redux-promise-middleware
    return dispatch => { // Thunk
      return dispatch({ // Promise
        type: 'POST_ANSWERS',
        payload: new Promise((res, rej) => {
            setTimeout(() => {
              res({foo: 'bar'})
            }, 3000);
          })
      }).then(({value, action}) => {
        const reviewPath = `/nulecules/${nuleculeId}/review`;
        console.debug('then handler running');
        console.debug('conditional doing a thing...')
        console.debug('routing to path -> ', reviewPath);
        browserHistory.push(reviewPath);
      });
    }
  }
};

export { actionTypes };
export default actions;
