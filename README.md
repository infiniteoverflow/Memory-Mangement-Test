<h2>Aim</h2>
Understand retain cycle when working with closures in swift

<h2>Pre-setup</h2>

Follow the steps to setup a alert when a ViewController is deallocated:

- In Xcode, go to the Breakpoint navigator (Cmd+8)
- At the bottom-left on the screen, tap '+', then select "Symbolic Breakpoint..." from the menu
- Fill the form:
  - **Name:** UIViewController dealloc
  - **Symbol:** -[UIViewController dealloc]
  - **Module:** UIKitCore (or leave empty)
  - **Condition:** !(BOOL)([[$arg1 description] containsString:@"Input"]) to exclude UIInputViewController, UICompatibilityInputViewController, etc.
  - **Ignore:** leave at zero
  - **Action:** Select "Log Message"
  - **Enter:** --- dealloc @(id)[$arg1 description]@ @(id)[$arg1 title]@ (or customize as needed)
  - Select "Log message to console"
  - Next to "Action: Log Message", tap on '+' to add a new Action
  - Select: "Sound" and choose any sound from the list (Submarine, Pop...)
  - Check "Automatically continue after evaluating actions" so Xcode does not stop at the breakpoint

![Screenshot 2024-03-16 at 11 13 18](https://github.com/infiniteoverflow/Memory-Mangement-Test/assets/40236624/dae83f63-ddf5-4777-9703-09302a27d643)

<h2>Run the app</h2>

- Move onto the second screen, and wait for the callback to be received (check the logs)
- Press the back button. Nothing really happened.
- Now uncomment the code inside `lazy var delayViewModel = DelayViewModel` and re-run the app.
- Go to the second screen, wait for the callback, and then press back.
- If your Pre-setup was successful, you should hear a sound with the text in the logs:
```
--- dealloc @"<MemoryManagementTest.CallbackViewController: 0x1032133f0>" 0x0
```
This means the `CallbackViewController` was deallocated successfully.

