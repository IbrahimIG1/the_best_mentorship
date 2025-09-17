# Omar Ahmed Mentorship – OOP & SOLID

This repository contains my mentorship exercises and solutions, focusing on **Object-Oriented Programming (OOP)** and the **SOLID principles**, inspired by the book *The Object-Oriented Thought Process*.

---

## Question 1
   What is the primary issue, and how to fix it for extensibility (e.g., adding video in a Flutter app for displaying multi-type content)?
  ## Answer is C (Open-Closed Principle)
  ## Explain the issue:-
“The main issue in this code is when we want to add a new widget or new feature we must add it in the if conditions, this mean, if we have a 10 option text, image, audio, video…, we must add every one as an if condition (if else if else) ,this makes the code difficult to add smoothly. this is against the of open & closed principle.”
<img width="750" height="770" alt="isuue_1" src="https://github.com/user-attachments/assets/1bd13461-5b87-49e9-94c9-8e020ebaa3e3" />

## Explain answer reason:-
Using Polymorphism in this case help to make code smoothly to add any new feature because we will make the main class “ContentItem” is abstract class and responsible for do build function this build function works as the employer wants, not what the owner wants.
For example:
The painter he can draw but He draw what I want not What he want, the same thing in this case the painter is ContentItem Class he can paint and child is text class he want draw a text the function work as child want not the painter want.
<img width="750" height="770" alt="answer_1" src="https://github.com/user-attachments/assets/fb63e8c6-d5d5-4ff4-991c-b0f5bed71ef0" />

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
<img width="750" height="770" alt="issue_2" src="https://github.com/user-attachments/assets/820179e4-987e-4036-af5a-067a4ac9c43e" />

## Explain answer reason:-
1- Using encapsulation ,make the user model parameter private that doesn’t make edit on user model data is disable but make it done with the right way by using update function ,
this is right way because we can add validation on email for example to sure it enter by the right syntax we want”.
2-	“Using Single Responsibility this separation of concerns improves modularity, maintainability, and aligns with the object-oriented principles”
<img width="750" height="770" alt="answer_2" src="https://github.com/user-attachments/assets/03e803f3-fecf-4b08-8d1d-d2975526a086" />

--------------------------------------------------------------

## Question 3
this Question about Liskov substitutoin Princeble.
## Answer is B
## Explain the issue:-
The problem is that a subclass (`SettingsScreen`) inherits from a parent class (`Screen`) but does **not behave consistently**.  
Instead of implementing the navigation like the parent, it throws an exception.  
This breaks the substitution rule, because code using the parent (`NavigationButton`) expects all child classes to navigate safely.
<img width="750" height="770" alt="issue_3" src="https://github.com/user-attachments/assets/29f3d291-e658-42c8-a435-9b71a3c8a975" />

## Explain answer reason:-
The solution is to follow the **Liskov Substitution Principle**:  
- Only classes that truly support navigation should inherit or implement a `Navigable` interface.  
- Subclasses like `SettingsScreen` that don’t follow the same behavior must not extend the `Screen` base class.
This keeps the hierarchy safe, avoids runtime errors, and ensures behavioral consistency.
<img width="750" height="770" alt="answer_3" src="https://github.com/user-attachments/assets/92665107-df94-47a3-a0a5-b64b2397bea2" />

--------------------------------------------------------------

## Question 4
this Question about Interface Segregation Principle.
## Answer is C
## Explain the issue:-
The problem is that a class implements an interface but does not use all its methods and that break Interface Segregation Principle.
<img width="750" height="770" alt="issue_4" src="https://github.com/user-attachments/assets/3c2bf1d8-45c0-48f4-b8d0-b33ea7859ad5" />

## Explain answer reason:-
"The solution is to split WidgetController into smaller, role-specific interfaces. For example, BasicController for initState and dispose, AnimationController for animation handling, and NetworkController for network operations.
<img width="750" height="770" alt="answer_4" src="https://github.com/user-attachments/assets/66f0bfcb-b6a0-4f70-9926-a0aaf9fdde02" />
