## Command to create module screens using ```screen_helper``` from [BrickHub](https://brickhub.dev/bricks/screen_helper)
``` 
mason make screen_helper
```

## Command to generate AutoRoute
Add this ```@RoutePage()``` above the UI class <br>
Now run this command to generate routes:
```
dart run build_runner build
```

## Create Asset class of pubspec.yaml assets
Add this ```Flutter Assets Get``` plugin in VS-Code <br>
Add this lines in ```pubspec.yaml```:
```
  assets:
    - assets/images/
flutter_assets:
  assets_path: assets/images/
  output_path: lib/core/constants/
  filename: app_assets.dart
```

Now follow this steps:
> ```Ctrl + Shift + P``` in VS-Code then select ```Flutter Assets: Generate```
