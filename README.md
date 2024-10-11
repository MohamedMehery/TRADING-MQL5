# MQL5 Programming Course for C++ Developers

Welcome to the **MQL5 Programming Course**! This course is designed for C++ developers to learn how to develop automated trading systems and Expert Advisors (EAs) using MetaTrader 5's MQL5 language. The course is organized into daily lessons to help you build a strong foundation in MQL5, leveraging your existing knowledge of C++.

## Course Outline

### Week 1: Fundamentals and Syntax
#### Day 1: Introduction to MQL5 & MetaEditor
- Understanding MetaEditor (IDE) for MQL5
- Types of MQL5 programs (Expert Advisors, Indicators, Scripts)
- Basic file types: `.mq5`, `.ex5`, `.mqh`
- Compiling and debugging in MetaEditor

#### Day 2: Variables & Data Types
- Variable declaration and initialization
- Data types: Integers, real numbers, strings, booleans, colors, datetime
- Constants and arrays
- Enumerations and structures

#### Day 3: Operations
- Arithmetic operations (Addition, Subtraction, Multiplication, Division)
- Modulus and assignment operations
- Relational and boolean operations

#### Day 4: Conditional & Loop Operators
- `if`, `else`, `switch` operators
- Looping with `for`, `while`, `do-while`
- Control statements: `break`, `continue`

#### Day 5: Functions & Parameter Passing
- Defining and calling functions
- Passing parameters by reference or value
- Function overloading and default values
- The `void` type and `return` operator

#### Day 6: Object-Oriented Programming in MQL5
- Classes and access modifiers
- Constructors, derived classes, virtual functions
- Working with objects in MQL5

### Week 2: Expert Advisors and Trading Logic
#### Day 7: Structure of an MQL5 Program
- Preprocessor directives (`#property`, `#include`, `#define`)
- Input and global variables
- Event handlers and their significance (OnInit, OnTick, OnDeinit)

#### Day 8: Expert Advisor Basics
- Understanding market orders and deals
- Implementing basic event handlers in EAs
- Creating EAs using the MQL5 Wizard

#### Day 9: Order Placement
- Placing market orders with `OrderSend()`
- Working with `MqlTradeRequest` and `MqlTradeResult`
- Adding stop loss and take profit

#### Day 10: Creating an Order Placement Class
- Building the `CTrade` class for order management
- Implementing error handling and retries
- Setting deviation and fill types

#### Day 11: Stop Loss & Take Profit Management
- Calculating fixed stop loss and take profit prices
- Dynamic stop loss
- Creating verification functions for stop levels

#### Day 12: Handling, Modifying & Closing Positions
- Position information functions
- Creating functions to modify and close positions

### Week 3: Advanced Trading Concepts
#### Day 13: Pending Orders & Trailing Stops
- Opening and managing pending orders
- Using trailing stops and implementing dynamic trailing stops

#### Day 14: Money Management & Trade Sizing
- Implementing trade volume verification
- Creating basic money management techniques

#### Day 15: Bar and Price Data
- Accessing current prices and bar data with `MqlTick` and `CopyRates()`
- Using price-based trading signals

#### Day 16: Using Indicators in Expert Advisors
- Accessing single and multi-buffer indicators
- Using custom indicators in EAs

#### Day 17: Working with Time and Date
- Creating time-based trading logic
- Using datetime functions and `OnTimer()`

#### Day 18: Advanced Techniques & Putting It All Together
- Building a complete template for EAs
- Implementing trading systems based on moving averages and breakout strategies

### Week 4: Debugging, Testing, and Beyond
#### Day 19: Debugging and Testing in MetaTrader
- Debugging techniques in MQL5
- Using the Strategy Tester for backtesting EAs
- Optimizing EA performance

#### Day 20: Indicators, Scripts & Libraries
- Building custom indicators and scripts
- Creating reusable libraries for MQL5 projects

#### Day 21: Review and Final Project
- Review key concepts
- Implement a custom EA using the learned techniques

---

## How to Use This Repository

- Each day's lesson will have its own folder with the lesson material and code samples.
- Follow the lessons sequentially for a structured learning experience.
- Contribute by submitting your own examples or improvements to the course material!

### Requirements
- MetaTrader 5
- Basic knowledge of programming
- Familiarity with Forex and trading concepts is a plus

---

### License

This course is licensed under the [Creative Commons Attribution-NonCommercial 3.0 Unported license](http://creativecommons.org/licenses/by-nc/3.0/).
