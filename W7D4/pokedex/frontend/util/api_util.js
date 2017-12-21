export const fetchAllPokemon = () => {
  return (
    $.ajax({
      url: '/api/pokemon/',
      method: 'GET'
    })
  );
};

export const fetchSinglePokemon = (pokemonId) => {
  return (
    $.ajax({
      url: `/api/pokemon/${pokemonId}`,
      method: 'GET'
    })
  );
};
