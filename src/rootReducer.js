import { combineReducers } from 'redux';
import nuleculesReducer from './content/reducer';

export default combineReducers({
  nulecules: nuleculesReducer
});
