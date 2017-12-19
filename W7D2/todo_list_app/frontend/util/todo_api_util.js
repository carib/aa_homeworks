
export const uniqueId = () => {

    return new Date().getTime();
};
//
export const fetchTodos = todos => {
  return $.ajax({
    method: 'GET',
    url: '/api/todos'
  });
};
