# Testing-of-autosave-flows-and-project-loading
A minimal UIKit-based iOS project that demonstrates how to implement and test **autosave** and **automatic project loading** using native frameworks like `Codable`, `FileManager`, and `XCTest`.

This project simulates a drawing or creative environment where user data is saved automatically in the background and restored when the app launches again — ensuring a smooth and reliable user experience.

---

## Project Structure

- `ProjectModel.swift` — Simple Codable model
- `ProjectPersistence.swift` — Handles save/load using FileManager
- `DrawViewController.swift` — Main UI with autosave simulation
- `AppDelegate.swift` — Entry point (no storyboard used)
- `DrawProjectAutosaveTests.swift` — Unit test for save/load flow

---

## How It Works

- A `Timer` triggers an **autosave** every 5 seconds.
- Each autosave writes the current `ProjectModel` to disk using `Codable`.
- A short animation (a green pulse) reinforces visually when a save occurs.
- On app launch, the last saved project is automatically loaded and shown in the UI.
- A unit test confirms that the saved file is readable and accurately restored.

---

## Preview

The screen displays the current project name and a counter of how many times it has been autosaved. Every save triggers a quick visual cue on screen.

---

## Ideas for Extension

- Add real-time drawing with `CAShapeLayer` and save strokes to the model.
- Implement undo/redo using an array of saved states.
- Add versioning support to the project data.
- Store user preferences alongside the project.
- Visualize autosave activity with a subtle timeline or progress view.

---

## License

MIT License. Feel free to use and modify.
