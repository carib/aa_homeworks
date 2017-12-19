import { connect } from 'react-redux';
import { allTodos } from '../../reducers/selectors';
// import * as TodoList from './todo_list.jsx';
import { receiveTodo, fetchTodos } from '../../actions/todo_actions';
import TodoList from './todo_list';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);


// through the connect function, were taking todo list component,
// gives it access to functions and objects that we specify ..
// in this case allTodos and receiveTodos
