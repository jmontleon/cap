import React from 'react';
import {
  Router, Route, IndexRoute, hashHistory
} from 'react-router';

import HomePage from './content/components/HomePage';

//import NuleculePage from './content/components/NuleculePage';
//<Route path="/nulecule/:nuleculeId" component={NuleculePage} />

const Routes = () => {
  return (
    <Router history={hashHistory}>
      <Route path="/" component={HomePage} />
    </Router>
  );
};

export default Routes;
