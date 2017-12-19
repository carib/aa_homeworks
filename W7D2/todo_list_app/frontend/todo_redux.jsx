import React from 'react';
import ReactDOM from 'react-dom';

import { receiveTodos, receiveTodo } from './actions/todo_actions.js';
import configureStore from './store/store.js';
import { allTodos } from './reducers/selectors.js';
import Root from './components/root';

const store = configureStore;

window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos;


document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root store={ store }/>, document.getElementById('root'));
});
