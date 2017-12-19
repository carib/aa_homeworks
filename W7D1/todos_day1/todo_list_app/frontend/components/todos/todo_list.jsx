import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';
// only need render if its a class component
const TodoList = (props) => {
function componentDidMount() {
  this.props.fetchTodos();
}

const todos = props.todos.map((todo, idx) => {
  return <TodoListItem todo={todo} key={todo.id} />;
});
    return (
      <div className="todo-list">
        <ul className="todo-list-items">
          {todos}
        </ul>
        <TodoForm receiveTodo={props.receiveTodo} />
      </div>
    );
};
  // todoListItems(props)

export default TodoList;
