# Desktop Automation Suite

## Description
This project is an automated desktop workflow suite designed to prepare a seamless daily workspace. Upon triggering a global hotkey, the pipeline silently executes a series of scripts across multiple languages (Python, AutoHotkey, Batch, VBScript) to:
1. Interface with the Notion API to reset daily tracking lists and gratitude checklists.
2. Launch designated Notion workspaces and Notion Calendar applications.
3. Automatically organize and snap opened windows across multimonitor displays to prepare an optimal productivity layout.

## Installation
1. **Prerequisites:** 
   - [Python 3.x](https://www.python.org/downloads/)
   - [AutoHotkey v2](https://www.autohotkey.com/)
   - Notion Calendar Web app installed locally.
2. **Setup Dependencies:** Install required Python packages.
   ```bash
   pip install python-dotenv
   ```
3. **Environment Variables:** Create a `.env` file in the root directory and add your Notion integration details:
   ```env
   NOTION_API_KEY=your_secret_integration_key
   ```
   *(Note: The integration requires editing capabilities on the target blocks/pages).*

## Usage
1. Open and run the `master.ahk` file (this allows the script to run in the background).
2. Press the hotkey combination `Win + Alt + S` from anywhere on your desktop.
3. The script will automatically trigger the pipeline: resetting Notion states, launching applications, and snapping windows into their mapped orientations.

## Project Structure
- `master.ahk`: Primary entry point for registering hotkeys.
- `src/python/`: Python scripts (e.g., Notion API interactions).
- `src/ahk/`: Core AutoHotkey scripts handling desktop UI orchestration.
- `hotkeys/`: Individual `.ahk` trigger combinations/bindings.
- `scripts/`: Batch and VBScript files for background/silent executions.
