# Pico-8 iOS Wrapper

Enables releasing Pico-8 games to the AppStore.
[https://www.lexaloffle.com/pico-8.php](https://www.lexaloffle.com/pico-8.php).

![](https://user-images.githubusercontent.com/292738/62010641-6eb42f80-b13b-11e9-9efc-2bf9b0dcbbfc.png)

## Instructions

- 1. (in Pico-8) Export your game to html. `export game.html` (use `folder` to see the contents).
- 2. Copy the contents of the javascript file to `Game/Pico8/game.js`.
- 3. Configure your Xcode project and upload it to AppStore.

### Note

The default `html` exported file does not works well in iOS because
autoplay is not enabled. This wrapper contains a web view
and special configurations in the `index.html` that can support autoplay in iOS.

### Requirements

- iOS 9 or newer.
- Pico-8 0.1.12.c or newer.

Made with <i class="fa fa-heart">&#9829;</i> by <a href="http://ninjas.cl" target="_blank">Ninjas.cl</a>.