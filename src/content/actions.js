import axios from 'axios';
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
  }
};

export { actionTypes };
export default actions;
