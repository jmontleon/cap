import axios from 'axios';
import { getBaseUrl } from '../shared/api';

const actionTypes = {
  LOAD_NULECULES: 'dns.LOAD_NULECULES',
  LOAD_NULECULES_PENDING: 'dns.LOAD_NULECULES_PENDING',
  LOAD_NULECULES_FULFILLED: 'dns.LOAD_NULECULES_FULFILLED',
  LOAD_NULECULES_REJECTED: 'dns.LOAD_NULECULES_REJECTED',
};

const actions = {
  loadNulecules: () => {
    const url = getBaseUrl() + '/nulecules';
    console.debug('trying to hit nulecules -> ', url);

    return {
      type: actionTypes.LOAD_NULECULES,
      payload: axios(url)
    }
  }
};

export { actionTypes };
export default actions;
