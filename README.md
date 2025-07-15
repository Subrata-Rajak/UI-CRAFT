# UI Craft

A collection of reusable, customizable Flutter UI components designed to enhance your Flutter applications with modern and flexible UI elements.

# Purpose

This package provides a set of reusable UI components that can be used to create modern and flexible UI elements in your Flutter applications. Our goal is to provide One stop solution for all your UI needs with high-quality, customizable, and performant UI components.

## Features

- 🎨 Customizable UI components
- 🎯 Easy to use and integrate
- 🎯 Lightweight and performant
- 🎯 Fully customizable styling
- 🎯 Supports Flutter web, mobile, and desktop

## Available Components

### Containers
- DashedBorderContainer: Create unique visual effects with customizable dashed borders

### Shimmers
- ShimmerOverlay: Beautiful shimmer effects for loading states

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  ui_craft: ^0.0.1
```

### Versioning

This package follows semantic versioning (MAJOR.MINOR.PATCH):

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backwards compatible manner
- **PATCH** version when you make backwards compatible bug fixes

### Version History

- **0.0.1** - Initial release
  - Added DashedBorderContainer
  - Added ShimmerOverlay

### Upgrading

To upgrade to the latest version:

```bash
flutter pub upgrade ui_craft
```

Or specify a specific version in your `pubspec.yaml`:

```yaml
dependencies:
  ui_craft: ^0.0.1
```

Then run `flutter pub get` to install the package.

## Usage

Here's a quick example of how to use the DashedBorderContainer:

```dart
import 'package:ui_craft/ui_craft.dart';

DashedBorderContainer(
  child: Text('Hello World'),
  color: Colors.blue,
  strokeWidth: 2.0,
  dashWidth: 8.0,
  dashGap: 4.0,
  borderRadius: BorderRadius.circular(12),
  padding: const EdgeInsets.all(16),
)
```

And here's how to use the ShimmerOverlay:

```dart
import 'package:ui_craft/ui_craft.dart';

ShimmerOverlay(
  loading: true,
  child: Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you need help or want to report an issue, please open an issue in the GitHub repository.

## Creator

Created by Subrata Rajak

### Contact

- Email: subratarajak308@gmail.com
- GitHub: [Subrata-Rajak](https://github.com/Subrata-Rajak)
- LinkedIn: [Subrata-Rajak](https://www.linkedin.com/in/subrata-connect/)

### Custom Widget Requests

Need a custom animated or non-animated widget? Feel free to reach out!

When requesting a custom widget, please include:

1. Widget description and purpose
2. Specific requirements and features
3. Any design references or examples
4. Target platforms (web/mobile/desktop)

We can discuss:
- Custom animations and transitions
- Performance requirements
- Integration with existing components
- Custom styling and theming
- State management needs

## Acknowledgments

- Flutter team for creating such an amazing framework
- All contributors who have helped improve this package

## Development

To run the example app:

```bash
cd example
flutter run
```

To run tests:

```bash
flutter test
```

To format the code:

```bash
flutter format .
```

To analyze the code:

```bash
flutter analyze
```
