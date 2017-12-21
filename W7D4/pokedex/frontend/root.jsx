import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter, Route, Switch } from 'react-router-dom';

import PokemonIndexContainer from './components/pokemon/pokemon_index_container';
import PokemonDetailContainer from './components/pokemon/pokemon_detail_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <div>
        <Switch>
          <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
          <Route exact path="/" component={PokemonIndexContainer} />
        </Switch>
      </div>
    </HashRouter>
  </Provider>
);

export default Root;
