import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => {

  return <li key={pokemon.id}>
            <Link to={`/pokemon/${pokemon.id}`}>
              <span>{pokemon.name}</span>
              <br />
              <img src={pokemon.image_url}
                   style={{width: '5%', height: '5%'}}>
              </img>
            </Link>
          </li>;

};

export default PokemonIndexItem;
