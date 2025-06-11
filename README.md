<!DOCTYPE html>
<html lang="en">
<body>

<h1>BLoC Clean Architecture</h1>
<p>A new Flutter project using <strong>BLoC</strong> and <strong>Clean Architecture</strong> principles.</p>

<hr>

<h2>🚀 Getting Started</h2>

<h3>✅ Step 1: Add Dependencies</h3>
<pre><code class="language-yaml">
dependencies:
  http: ^1.4.0
  bloc: ^9.0.0
  flutter_bloc: ^9.1.1
  get_it: ^8.0.3
  freezed_annotation: ^3.0.0
  json_annotation: ^4.9.0
  fluttertoast: ^8.2.12
  cached_network_image: ^3.4.1
  another_flushbar: ^1.12.30
  equatable: ^2.0.7
  flutter_secure_storage: ^9.2.4
  freezed: ^3.0.6
  google_fonts: ^6.2.1

dev_dependencies:
  build_runner: ^2.4.15
  json_serializable: ^6.9.5
</code></pre>

<hr>

<h3>🛠️ Step 2: Change SDK Version</h3>
<p>In <code>android/app/build.gradle.kts</code>:</p>
<pre><code class="language-kotlin">minSdk = 21</code></pre>

<hr>

<h3>📁 Step 3: Project Structure</h3>
<pre><code>
lib/
├── bloc/
│   ├── login_bloc.dart                     # BLoC logic for login
│   ├── login_event.dart                    # Events for login
│   └── login_states.dart                   # States for login
│
├── config/
│   ├── colors/
│   │   └── colors.dart                     # App theme colors
│   ├── components/
│   │   ├── internet_exception_widget.dart  # Widget for no internet UI
│   │   ├── loading_widget.dart             # Widget for loaders/spinners
│   │   └── round_button_widget.dart        # Reusable round button
│   ├── routes/
│   │   ├── routes.dart                     # Route generator
│   │   └── routes_name.dart                # Route name constants
│   └── app_url.dart                        # Base URLs & endpoints
│
├── data/
│   ├── exceptions/
│   │   └── app_exceptions.dart             # Custom app exceptions
│   └── network/
│       ├── base_api_services.dart          # Abstract base API methods (get, post, delete)
│       └── network_services_api.dart       # Concrete API service implementations
│
├── models/
│   └── user/
│       ├── user_model.dart                 # User model class
│       ├── user_model.freezed.dart         # Freezed-generated code
│       └── user_model.g.dart               # JSON serialization code
│
├── repository/
│   └── auth/
│       └── login_repository.dart           # Repository for login logic
│
├── services/
│   └── splash/
│       └── splash_services.dart            # Logic for splash screen navigation
│
├── utils/
│   ├── enums.dart                          # Common enums
│   └── validations.dart                    # Form and field validations
│
├── views/
│   ├── splash/
│   │   └── splash_screen.dart              # Splash screen UI
│   ├── login/
│   │   ├── login_screen.dart               # Login screen UI
│   │   └── widgets/
│   │       ├── email_input_widget.dart     # Email input field
│   │       ├── login_button_widget.dart    # Login button
│   │       ├── password_input_widget.dart  # Password input
│   │       └── widget.dart                 # Widget barrel file
│   ├── home/
│   │   └── home_screen.dart                # Home screen UI
│   └── view.dart/                          # Barrel file for views
│
└── main.dart                               # Entry point of the app
</code></pre>

<hr>

<h3>📌 Step 4: Define Route Names</h3>
<pre><code class="language-dart">
class RoutesName {
  static const String splashScreen = 'splash';
  static const String loginScreen = 'login';
  static const String homeScreen = 'home';
}
</code></pre>

<hr>

<h3>🧭 Step 5: Write Route Generator</h3>
<pre><code class="language-dart">
import 'package:flutter/material.dart';
import '../../views/home/home_screen.dart';
import '../../views/login/login_screen.dart';
import '../../views/splash/splash_screen.dart';
import 'routes_name.dart';

class AppRoutes {
  static Route&lt;dynamic&gt; generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined")),
          ),
        );
    }
  }
}
</code></pre>

<hr>

<h3>🏁 Step 6: Add Routes in <code>main.dart</code></h3>
<pre><code class="language-dart">
import 'package:flutter/material.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
</code></pre>

<hr>

<h3>🏗️ Step 7: Create Components</h3>
<ul>
  <li><code>loading_widget.dart</code> – for showing loading indicators</li>
  <li><code>round_button_widget.dart</code> – for consistent button styles</li>
  <li><code>internet_exception_widget.dart</code> – shows message when no internet</li>
</ul>

<hr>

<h3>🎨 Step 8: Create Color File</h3>
<p>Define all theme and color constants in <code>colors.dart</code> for maintaining consistent styling across the app.</p>

<hr>

<h3>🧩 Step 9: Add Exception Handling</h3>
<p>In <code>data/exceptions/app_exceptions.dart</code>, define custom exception classes for better error handling:</p>
<ul>
  <li><code>NoInternetException</code></li>
  <li><code>UnauthorizedException</code></li>
  <li><code>RequestTimeoutException</code></li>
  <li><code>FetchDataException</code></li>
</ul>

<hr>

<h3>🧩 Step 10: Network API Services</h3>
<p>Create <code>data/network/base_api_services.dart</code> with:</p>
<pre><code class="language-dart">
Future<dynamic> getApi(String url);
Future<dynamic> postApi(String url, var data);
Future<dynamic> deleteApi(String url);
</code></pre>
<p>Then create actual implementations in <code>network_services_api.dart</code>.</p>

<hr>

<h3>🧩 Step 11: User model & Login API</h3>
<p>Implement <code>user_model.dart</code> and login API handling inside repository.</p>

<hr>

<h2>🧠 Navigation Reference</h2>
<pre><code class="language-dart">
// Old Method
Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

// New Method
Navigator.pushNamed(context, RoutesName.homeScreen);
</code></pre>

</body>
</html>
