import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';


// import {fetchSearchGiphys} from './actions/giphy_actions';
//
// window.fetchSearchGiphys = fetchSearchGiphys;


// window.store = store;
document.addEventListener("DOMContentLoaded", () => {
        const store = configureStore();
        const root = document.getElementById('root');
        ReactDOM.render(<Root store={store} />, root);
});
