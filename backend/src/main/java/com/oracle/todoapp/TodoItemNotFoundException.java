/*
## MyToDoReact version 1.0.
##
*/
package com.oracle.todoapp;

public class TodoItemNotFoundException extends RuntimeException {
  private static final long serialVersionUID = -7836707150113921385L;

  public TodoItemNotFoundException(String id) {
    super("TodoItem:" + id + " was not found!");
  }
}
