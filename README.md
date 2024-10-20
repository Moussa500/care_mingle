
# Caremingle - Babysitting App 🍼

## Overview
**Caremingle** is a mobile app designed to connect parents with reliable babysitters. The app allows parents to easily search for babysitters, communicate with them, and manage favorite profiles. Babysitters can register their availability and provide details to help parents make informed hiring decisions. The app provides a seamless experience for both parents and babysitters, ensuring trust and convenience.

## Features
- **Splash Screen**: A welcoming screen introducing the app and its purpose for busy parents.
- **Sign-in and Sign-up**: Allows users to create accounts or log in securely.
- **Parent Registration**: Parents can register their children by entering details such as the number of children, age, and gender.
- **Babysitter Registration**: Babysitters can enter their availability and relevant details to make themselves discoverable by parents.
- **Home Screen**: Displays relevant information for both parents and babysitters, such as recommended babysitters or available jobs.
- **Messaging**: A chat feature that allows parents and babysitters to communicate.
- **Favorites**: Parents can save babysitter profiles they like for easy access later.
- **Profile Management**: Users can manage and update their profile information, including personal details and preferences.

## Screens
1. **Splash Screen**: Welcomes users with a calm, inviting message tailored to busy parents.
2. **Sign-In Screen**: A form to log into an existing account with email and password.
3. **Sign-Up Screen**: Allows new users to register by entering details such as name, email, password, and phone number.
4. **Parent Additional Info**: Screen for parents to register their children, including age and gender selections.
5. **Babysitter Registration**: Babysitters provide availability information and additional details to get hired.
6. **Home Screen**: Displays available babysitters for parents and relevant jobs for babysitters.
7. **Message Screen**: Provides a messaging interface to chat between parents and babysitters.
8. **Favorites Screen**: A list of babysitters that parents have marked as favorites for future reference.
9. **Profile Screen**: User's profile information with options to update details and manage settings.

## Technologies Used
- **Flutter**: For building the mobile app's user interface and handling interactions across platforms (iOS and Android).
- **Node.js**: For managing the backend, including handling user data, authentication, and real-time communication (via messaging).
- **Firebase Authentication**: For secure user login and registration.
- **Firestore**: For managing real-time data such as chat messages and profile information.

## Installation

### Backend (Node.js)

1. Clone the repository:
   ```bash
   git clone https://github.com/moussa500/care_mingle.git
   ```
2. Install dependencies:
   ```bash
   yarn install
   ```
3. Set up the environment:
   - Add the required `.env` variables (e.g., MongoDB URL, JWT secret).
4. Run the server:
   ```bash
   yarn start
   ```

### Frontend (Flutter)

1. Clone the repository:
   ```bash
  git clone https://github.com/moussa500/care_mingle.git
   ```
2. Navigate to the project directory:
   ```bash
   cd caremingle
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Set up Firebase:
   - Add your `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to the appropriate directories.
5. Run the app:
   ```bash
   flutter run
   ```

### Routes and API Endpoints
1. Users Router (/users)
GET /getAllUsers: Fetch all users.
GET /getUserById/
: Fetch a user by their ID.
POST /searchUserByName: Search users by their name.
PUT /updateUserBabySitter/
: Update babysitter details for a user.
PUT /updateUserAdmin/
: Update admin details for a user.
PUT /updateUserParent/
: Update parent details for a user.
DELETE /deleteUser/
: Delete a user by their ID.
POST /addUser: Add a new user.
2. Favorites Router (/favorite)
GET /getFavorites/
: Get a user’s list of favorite babysitters.
POST /addFavorite: Add a babysitter to the user’s favorites.
DELETE /deleteFavorite: Remove a babysitter from the user’s favorites.
3. Auth Router (/auth)
POST /login: Log in an existing user.
POST /register: Register a new user.
GET /protected: Access a protected route (requires authentication).
4. Permissions Router (/permission)
GET /getAdminPermission/
: Get the permission level of an admin.
POST /assignPermission/
: Assign a permission level to a user via their email.
POST /banAndUnbanUser: Ban or unban a user.
5. Booking Router (/booking)
POST /bookSitter: Book a babysitter.
POST /cancelBooking: Cancel an existing babysitter booking.
GET /getBookingByParent/
: Get booking details by the parent’s ID.
GET /getBookingByBabysitter/
: Get booking details by the babysitter’s ID.
6. Articles Router (/article)
POST /postArticle: Post a new article.
GET /getArticles: Get all posted articles.
PUT /updateArticle: Update an existing article.

## Contribution
We welcome contributions from the community! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m "Add your feature"`).
4. Push to your branch (`git push origin feature/your-feature`).
5. Create a pull request.
