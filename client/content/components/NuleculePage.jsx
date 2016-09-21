import * as React from 'react';
import { connect } from 'react-redux';
import { Jumbotron } from 'react-bootstrap';
import JSONPretty from 'react-json-pretty';
import actions from '../actions';

import Layout from '../../base/components/Layout';
//import actions from '../actions'

class NuleculePage extends React.Component {
  componentWillMount() {
    console.debug('NuleculePage::componentWillMount');
    this.props.loadNulecule(this.props.params.nuleculeId);
  }
  render() {
    const { nuleculeId } = this.props.params;
    console.debug('nulecules -> ', this.props.nulecules)
    let nulecule;
    if(this.props.nulecules && this.props.nulecules[nuleculeId]) {
      nulecule = this.props.nulecules[nuleculeId];
    }
    console.debug('nulecule -> ', nulecule);

    const ff = (nulecule) => {
      if(nulecule) {
        return (
          <JSONPretty id="nulecule-json" json={nulecule}></JSONPretty>
        )
      } else {
        return null;
      }
    }

    return (
      <Layout>
        <Jumbotron className="nulecule-detail">
          <h2>{nuleculeId} detail page.</h2>
        </Jumbotron>
        {ff(nulecule)}
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
    loadNulecules: () => dispatch(actions.loadNulecules()),
    loadNulecule: (nuleculeId) => dispatch(actions.loadNulecule(nuleculeId))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(NuleculePage);
