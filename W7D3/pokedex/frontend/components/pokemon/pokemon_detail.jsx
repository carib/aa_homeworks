import React from 'react';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  render() {
    if (!this.props.pokemon) return null;
    const pokedeets = Object.entries(this.props.pokemon).map((deet) => {
      if (deet[0] === 'image_url') {
        return <img src={deet[1]} />;
      } else {
        return <li>{deet[0]}:  {deet[1]}</li>;
      }
    });
    return(
      <section className="pokedex-detail">
        {pokedeets}
      </section>
    );
  }
}
export default PokemonDetail;
