# About This Project

The Goal of this project, which was created for a workshop at Swift Aveiro, is to learn the fundemental ideas behind a unidirectional data flow architecture for UI applications.

The total timeframe for the project, including a brief intro to Flux, is 2 hours.

This project will focus on the basics, but the solution will point to further reading on more advanced topics.

## Starter Project

As part of this repository you can find a simple Tic Tac Toe implementation, that is implemented in what (I think) most people would consider MVC.

The center of the appy is the `TicTacToeViewController`, which owns a `Game` model and a `TicTacToeView` to visualize the game.

## Problems With the Starter Project

One of the main benefits of Flux is that it provides a state container that stores all state for a given view. 

In the current example app most state is contained in the `Game` model, but some state also lives directly in the ViewController (e.g. the value of the instruction label). Having this state spread out across multiple types makes the code harder to read and test. 

This project only provides a minimal example, so state management might not seem like a huge issue, but these issues compound on larger projects.

## Project Goals

The goal of this project is to refactor the View Controller to use a Flux-like pattern. 

To demonstrate that the ideas behind Flux are relatively simple we want to avoid using any third party libraries and implement everything from scratch.

At the end of the project we want to extend the app in the following ways:

1. Restructure the app to use a Flux-like pattern (store, state, actions)
2. Add undo/redo buttons to step forwards and backwards in time, through the moves that players made
3. Add unit tests to the store you are about to create:
   1. Test the game instruction for the initial state of the game
   2. Test that the game instruction updates after placing a token
   3. Test the new undo functionality 
4. *Optionally*, extend the app such that the user sees a separate scene before starting a game. The app should also return to that scene when the game is over

## Hints/Help

Creating the solution will likely involve three new categories of types:

- State
  - Describes all the state relevant to the ViewController
- Actions
  - Describes all the possible interactions that lead to state changes (one action for each state change)
- Store
  - Container for the state object
  - Provides an interface to consume actions and updates state in response to that
  - Provides an interface for subscribing to state updates. The ViewController will use that interface to receive the latest state whenever it changes