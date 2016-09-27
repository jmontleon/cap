import * as React from 'react';
import { connect } from 'react-redux';
import { Jumbotron } from 'react-bootstrap';
import JSONPretty from 'react-json-pretty';
import actions from '../actions';

class GraphNodeForm extends React.Component {
  render() {
    const { name, answers, onValueChange } = this.props;

    const renderInputs = () => {
      return Object.keys(answers).map((answer, idx) => {
        const defVal = answers[answer];
        const inputId = `${answer}-input`;

        return (
          <div className="answer-input clearfix" key={idx}>
            <label htmlFor={inputId} className="col-xs-2 col-form-label" >{answer}</label>
            <div className="col-xs-10">
              <input className="form-control" type="text" value={defVal} id={inputId}/>
            </div>
          </div>
        );
      });
    };

    return (
      <div>
        <h3>{name}</h3>
        <Jumbotron>
          <div className="form-group row">
            {renderInputs()}
          </div>
        </Jumbotron>
      </div>
    );
  }
}

export default GraphNodeForm;
