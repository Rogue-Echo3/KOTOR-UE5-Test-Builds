# KOTOR UE5 — Windows Playtest Builds

Experimental Windows playtests of a fan-made Knights of the Old Republic recreation in Unreal Engine 5. Unreal Editor and project files are not required.

## Download and play

Latest: **[TEST9767](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/tag/test-9767)**

1. Download [Download-Helper-9767.zip](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/download/test-9767/Download-Helper-9767.zip).
2. Extract the helper into a writable folder with about **16 GB free**.
3. Run **Download KOTOR Test.cmd**. It downloads, checks, joins and extracts the game.
4. Run **Start KOTOR Test.cmd** from the resulting game folder. Keep its files together.

Use Releases for game downloads. Code → Download ZIP contains instructions and helpers.

## This build

Combat Suit hand deformation during pistol/sword movement; original workbench components and saber colors; shared transition labels; original desktop key mappings; Escape options; renderer, sound and feedback controls; mini-game pause/resume. Earlier gameplay and visual repairs remain included.

**Escape** opens options. **F4/F5** quicksave/quickload. **W/S** move, **Z/C** strafe, **A/D** rotate the camera, **Q/E** select targets and **R** performs the default action. Change bindings under Gameplay → Key Mapping.

The cooked executable passed targeted opening, workbench, settings, mini-game and regression checks. Campaign content is included; a full uninterrupted campaign, every branch, audible quality and other computers' performance are not fully verified. Legacy EAX/software-audio selection is replaced by working master volume and the Windows default audio device.

## Saves and bug reports

Copy your old **UserData/Saved/SaveGames** into the matching new folder to retain progress. Keep the old folder as a backup. Personal saves and logs are excluded from the download.

Use the [bug-report form](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/issues/new?template=bug-report.yml). Include TEST9767, the area, steps and result, relevant screenshots/video and the latest log from UserData/Saved/Logs. Remove private information before uploading.
