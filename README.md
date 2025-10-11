# omar_ahmed_mentor_ship

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# E-Commerce Flutter App

## Features

- User authentication (login, register, email verification)
- Home screen with product categories and new arrivals
- Product details screen with gallery, sizes, reviews, and add to cart
- Cart management with address, payment, and order summary
- Gender selection screen
- Toast notifications and custom UI widgets
- Error handling and secure storage
- Responsive, modern UI

## Project Architecture

- **Clean Architecture**: Separation of concerns into Data, Logic, UI, and Repository layers
- **Bloc Pattern**: State management using Cubit/Bloc for all features
- **Dependency Injection**: Centralized DI setup for easy testing and scalability
- **API Layer**: Dio for network requests, error handling, and token management
- **Modular Features**: Each feature (login, register, cart, product details, etc.) is self-contained

## Packages Used

- `flutter_bloc`: State management
- `dio`: Networking and API calls
- `dartz`: Functional error handling (Either)
- `get_it`: Dependency injection
- `shared_preferences`: Local storage
- `flutter_secure_storage`: Secure local storage
- (Add any other packages you use)

## Folder Structure Philosophy

```
lib/
	e_commers_app/
		core/
			constants/
			di/
			enums/
			helper/
			local/
			network/
			routing/
			styles/
			widgets/
		features/
			cart/
				data/
				logic/
					cubit/
				repo/
				ui/
			gender_choose_screen/
				widgets/
			home_screen/
				data/
				logic/
					cubit/
				repo/
				ui/
					widgets/
			login_screen/
				data/
				logic/
					cubit/
				repo/
				ui/
			product_details/
				data/
				logic/
					cubit/
				repo/
				ui/
			register_screen/
				data/
				logic/
					cubit/
				repo/
				ui/
			verify_email/
				cubit/
				repo/
				ui/
```

- **core/**: Shared utilities, styles, routing, and DI
- **features/**: Each feature is isolated with its own data, logic, repo, and UI folders
- **widgets/**: Reusable UI components

## Future Work

- Integrate real backend APIs for all features
- Add user profile and order history screens
- Implement payment gateway integration
- Add product search and filtering
- Improve accessibility and localization
- Add unit and widget tests
- Enhance error handling and offline support

---

Feel free to contribute or customize further!
