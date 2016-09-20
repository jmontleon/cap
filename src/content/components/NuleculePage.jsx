import * as React from 'react';
import { connect } from 'react-redux';
import { Jumbotron } from 'react-bootstrap';

import Layout from '../../base/components/Layout';
//import actions from '../actions'

class NuleculePage extends React.Component {
  render() {
    const { nuleculeId } = this.props.params;

    return (
      <Layout>
        <Jumbotron className="nulecule-detail">
          <h2>{nuleculeId} detail page.</h2>
        </Jumbotron>
      </Layout>
    );
  }
}

//const mapStateToProps = (state) => {
  //return {
    //nulecules: state.nulecules
  //};
//};

//const mapDispatchToProps = (dispatch) => {
  //return {
    //loadNulecules: () => dispatch(actions.loadNulecules())
  //};
//};

//export default connect(
  //mapStateToProps,
  //mapDispatchToProps
//)(NuleculePage);

export default NuleculePage;
