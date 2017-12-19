import React, { Component } from 'react';
import { uniqueId } from '../../util/todo_api_util.js';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: ''
    };
    this.submit = this.submit.bind(this);
  }

  handleChange(field) {
    return event => {
      this.setState({[field]: event.currentTarget.value});
    };
  }

  submit(e){
    e.preventDefault();
    this.props.receiveTodo(Object.assign({}, this.state, {id: uniqueId()}));
    this.setState({title: ''});

  }

  render() {
    return (
      <div>
        <form onSubmit={ this.submit }>
          <label>Make Todo
            <input
              onChange={this.handleChange('title')}
              value={ this.state.title }
              />
            <button> Create Todo! </button>
          </label>
        </form>
      </div>
    );
  }
}

export default TodoForm;
