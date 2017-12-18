import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';


const initialState = { 2: {id: 2, title: "YO"} };

const todosReducer = (state = initialState, action) => {
  let newState;
  switch(action.type) {
    case RECEIVE_TODOS:
      newState = {};
      action.todos.forEach( (todo) => (newState[todo.id] = todo));
      return newState;
    case RECEIVE_TODO:
      newState = Object.assign({}, state, {[action.todo.id]: todo});
      return newState;
    default:
      return state;
  }
};
// whenever you dispatch an action, your reducer needs to re-render
// something ... therefor default is required

export default todosReducer;
