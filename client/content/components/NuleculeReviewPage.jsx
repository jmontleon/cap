import * as React from 'react';
import { connect } from 'react-redux';
import { Jumbotron } from 'react-bootstrap';
//import JSONPretty from 'react-json-pretty';
import actions from '../actions';

import Layout from '../../base/components/Layout';
//import GraphNodeForm from './GraphNodeForm';

class NuleculeReviewPage extends React.Component {
  render() {
    const { nuleculeId } = this.props.params;
    let nulecule;
    if(this.props.nulecules && this.props.nulecules[nuleculeId]) {
      nulecule = this.props.nulecules[nuleculeId];
    }

    const onDeployClick = this.props.deploy.bind(this, nuleculeId);

    return (
      <Layout>
        <Jumbotron className="nulecule-review">
          <h3>Review {nuleculeId}</h3>
        </Jumbotron>
        <button className="btn btn-primary" onClick={onDeployClick}>Deploy</button>
      </Layout>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    nulecules: state.nulecules
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    deploy: (nuleculeId) => console.debug('deploying -> ', nuleculeId)
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(NuleculeReviewPage);
