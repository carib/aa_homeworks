import React from 'react';
import ReactDOM from 'react-dom';


import configureStore from './store/store.js';
import Root from './root.jsx';

import { fetchSinglePokemon } from './util/api_util.js';
import { requestSinglePokemon } from './actions/pokemon_actions';


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById('root');

  window.fetchSinglePokemon = fetchSinglePokemon;
  window.requestSinglePokemon = requestSinglePokemon;
  window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={store}/>, root);
});
