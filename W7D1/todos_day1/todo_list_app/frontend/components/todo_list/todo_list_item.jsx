import React from 'react';
// anytime we user JSX syntax, must use React


const TodoListItem = ({todo}) => {
  return (
    <li>
      { todo.title }
    </li>
  );
};
// module.exports = () => <h3>Todo List goes here!</h3>;
// presentational component is just returning content, not doing
// any work here
export default TodoListItem;
