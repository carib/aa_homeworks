
export const allTodos = ({ todos }) => (
  Object.keys(todos).map(id => todos[id])
);
// 'todos' is being deconstructed from 'state.todos'

// export default allTodos;

// if you export const, MUST import with {} ....
// export with default, not necessary
