<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Bloc Clean Architecture - YT</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism.min.css" />
  <style>
    body {
      font-family: sans-serif;
      padding: 2rem;
      line-height: 1.6;
    }
    pre {
      background: #f5f5f5;
      padding: 1rem;
      border-radius: 6px;
      overflow-x: auto;
    }
    h1, h2, h3 {
      margin-top: 2rem;
    }
    code {
      background-color: #eee;
      padding: 0.2rem 0.4rem;
      border-radius: 4px;
    }
    hr {
      margin: 2rem 0;
    }
  </style>
</head>
<body>

<h1>Bloc Clean Architecture - YT</h1>
<p>A new Flutter project using <strong>BLoC</strong> and <strong>Clean Architecture</strong> principles.</p>

<hr>

<h2>🚀 Getting Started</h2>

<h3>✅ Step 1: Add Dependencies</h3>
<pre><code class="language-yaml">dependencies:
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
  json_serializable: ^6.9.5</code></pre>

<hr>

<h3>🛠️ Step 2: Change SDK Version</h3>
<p>In <code>android/app/build.gradle.kts</code>:</p>
<pre><code class="language-kotlin">minSdk = 21</code></pre>

<hr>

<h3>📁 Step 3: Project Structure</h3>
<pre><code class="language-text">lib/
├── config/
│   ├── colors/
│   │   └── colors.dart
│   ├── components/
│   │   ├── internet_exception_widget.dart        
│   │   ├── loading_widget.dart        
│   │   └── round_button_widget.dart
│   └── routes/
│       ├── routes.dart
│       └── routes_name.dart
├── data/
│   └── exceptions/
│       └── app_exceptions.dart
├── views/
│   ├── view/
│   ├── home/
│   │   └── home_screen.dart
│   ├── login/
│   │   └── login_screen.dart
│   └── splash/
│       └── splash_screen.dart</code></pre>

<hr>

<h3>📌 Step 4: Define Route Names</h3>
<pre><code class="language-dart">class RoutesName {
  static const String splashScreen = 'splash';
  static const String loginScreen = 'login';
  static const String homeScreen = 'home';
}</code></pre>

<hr>

<h3>🧭 Step 5: Write Route Generator</h3>
<pre><code class="language-dart">import 'package:flutter/material.dart';
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
}</code></pre>

<hr>

<h3>🏁 Step 6: Add Routes in <code>main.dart</code></h3>
<pre><code class="language-dart">import 'package:flutter/material.dart';
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
}</code></pre>

<hr>

<h3>🏗️ Step 7: Create Components</h3>
<ul>
  <li><code>loading_widget.dart</code> – for showing loading indicators</li>
  <li><code>round_button_widget.dart</code> – for consistent button styles</li>
  <li><code>internet_exception_widget.dart</code> – shows message when no internet</li>
</ul>

<h3>🎨 Step 8: Create Color File</h3>
<p>Define all theme and color constants in <code>colors.dart</code> for maintaining consistent styling across the app.</p>

<h3>🧩 Step 9: Add Exception Handling</h3>
<p>In <code>data/exceptions/app_exceptions.dart</code>, define custom exception classes for better error handling:</p>
<ul>
  <li><code>NoInternetException</code></li>
  <li><code>UnauthorizedException</code></li>
  <li><code>RequestTimeoutException</code></li>
  <li><code>FetchDataException</code></li>
</ul>

<hr>

<h2>🧠 Navigation Reference</h2>
<pre><code class="language-dart">// Old Method
Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

// New Method
Navigator.pushNamed(context, RoutesName.homeScreen);
</code></pre>

<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-dart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-yaml.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-kotlin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-text.min.js"></script>

</body>
</html>
