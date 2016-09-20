import * as React from 'react';
import { Jumbotron } from 'react-bootstrap';

import Layout from '../../base/components/Layout';

import '../styles/homePage.scss';

const HomePage = () => {
  return (
    <Layout>
      <Jumbotron>
        <h1>CAP POC</h1>
      </Jumbotron>
    </Layout>
  );
};

export default HomePage;
