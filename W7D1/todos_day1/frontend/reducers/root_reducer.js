
import { combineReducers } from 'redux';
import todosReducer from './todos_reducer.js';


const rootReducer = combineReducers({
      todos: todosReducer,
});



export default rootReducer;
// combine reducers takes entire state, calls .todos, sends that section into
// todos_reducer ... so todos_reducer is dealing with todos slice of state
