# KOTOR UE5 — Windows Playtest Builds

Experimental Windows playtests of a fan-made Knights of the Old Republic recreation in Unreal Engine 5. Unreal Editor and project files are not required.

A replacement with portrait restoration and melee animation repairs is being prepared. TEST9782 has been withdrawn from public download during that work. The available build below is TEST9781.

## Download and play

Latest: **[TEST9781](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/tag/test-9781)**

1. Download [Download-Helper-9781.zip](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/download/test-9781/Download-Helper-9781.zip).
2. Extract the helper into a writable folder with about **64 GB free**.
3. Run **Download KOTOR Test.cmd**. It downloads, verifies, joins and extracts the game.
4. Run **Start KOTOR Test.cmd** from the resulting game folder. Keep its files together.

Use Releases for game downloads. Code → Download ZIP contains instructions and helpers.

## This build

Adds **Vurt's KotOR Visual Resurgence 0.99a + patch 0.99b** textures throughout the existing game and **Naelavok's 3840x2160 upscaled cinematics**. Preserves the existing level geometry, UVs, animation and lighting. Retains all previous TEST9773 gameplay, controls, workbench, transitions and Taris wake-crash repairs. The 4K media increases download size and video-decoding demands.

Corrects legacy character texture orientation and the wake-up idle interruption. Restores existing lit materials on companion clothes after armor/disguise changes. The first apartment departure opens the visible party selector with **Carth required**, even if he was already selected.

**Escape** opens options. **F4/F5** quicksave/quickload. **W/S** move, **Z/C** strafe, **A/D** rotate the camera, **Q/E** select targets and **R** performs the default action. Change bindings under Gameplay → Key Mapping.

This is an experimental playtest. Targeted packaged opening, movie handoffs, Taris wake/save-load and rendered appearance checks are documented with the release. Campaign content is included; every quest branch, a full uninterrupted campaign, audible quality and other computers' performance are not certified.

## Saves and bug reports

Copy your old **UserData/Saved/SaveGames** into the matching new folder to retain progress. Keep the old folder as a backup. Personal saves and logs are excluded from downloads.

Use the [bug-report form](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/issues/new?template=bug-report.yml). Include TEST9781, area, steps and result, relevant screenshots/video and the latest log from UserData/Saved/Logs. Remove private information before uploading.

## Visual credits

- [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730), by **vurt**.
- [KotOR 1 Remastered AI Upscaled Cutscenes](https://www.nexusmods.com/kotor/mods/1306), by **Naelavok**.

The project owner confirmed permission for integration and test distribution. This notice does not grant others a general redistribution license. See the packaged notices for details.
