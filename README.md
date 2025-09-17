# Omar Ahmed Mentorship – OOP & SOLID

This repository contains my mentorship exercises and solutions, focusing on **Object-Oriented Programming (OOP)** and the **SOLID principles**, inspired by the book *The Object-Oriented Thought Process*.

---

## Question 1
   What is the primary issue, and how to fix it for extensibility (e.g., adding video in a Flutter app for displaying multi-type content)?
  ## Answer is C (Open-Closed Principle)
  ## Explain the issue:-
“The main issue in this code is when we want to add a new widget or new feature we must add it in the if conditions, this mean, if we have a 10 option text, image, audio, video…, we must add every one as an if condition (if else if else) ,this makes the code difficult to add smoothly. this is against the of open & closed principle.”
## Explain answer reason:-
Using Polymorphism in this case help to make code smoothly to add any new feature because we will make the main class “ContentItem” is abstract class and responsible for do build function this build function works as the employer wants, not what the owner wants.
For example:
The painter he can draw but He draw what I want not What he want, the same thing in this case the painter is ContentItem Class he can paint and child is text class he want draw a text the function work as child want not the painter want.

--------------------------------------------------------------

## Question 2
this Question about have class user model has public variables and do more than one job
## Answer is C (Encapsulation - Single Responsibility Principle (SRP))
Encapsulation broken: fields (name, age, email) are public, so any external code can change them without validation, which can lead to invalid states.
Single Responsibility Principle (SRP) violated: the class mixes user data representation with persistence logic (saveToFirestore). This makes the class harder to maintain, test, and reuse.
## Explain the issue:-
Make the fields private (_name, _age, _email) and expose them through getters/setters with validation to protect data integrity.
Move persistence logic into a separate class (e.g., FirestoreService). This way, UserModel is only responsible for holding and managing user data, while FirestoreService handles saving to the database.
This approach improves modularity, testability, and maintainability, and aligns with The Object-Oriented Thought Process principles.

--------------------------------------------------------------

## Question 3

