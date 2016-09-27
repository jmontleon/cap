import React from 'react';
import {
  Router, Route, IndexRoute, browserHistory
} from 'react-router';

import NuleculePage from './content/components/NuleculePage';
import NuleculeReviewPage from './content/components/NuleculeReviewPage';
import HomePage from './content/components/HomePage';

const Routes = () => {
  return (
    <Router history={browserHistory}>
      <Route path="/" component={HomePage} />
      <Route path="/nulecules/:nuleculeId" component={NuleculePage} />
      <Route path="/nulecules/:nuleculeId/review" component={NuleculeReviewPage} />
    </Router>
  );
};

export default Routes;
