# KOTOR UE5 — Windows Playtest Builds

Experimental Windows playtests of a fan-made Knights of the Old Republic recreation in Unreal Engine 5. Unreal Editor and project files are not required.



## Download and play

Latest: **[TEST9789](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/tag/test-9789)**

1. Download [Download-Helper-9789.zip](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/download/test-9789/Download-Helper-9789.zip).
2. Extract the helper into a writable folder with about **65 GB free**.
3. Run **Download KOTOR Test.cmd**. It downloads, verifies, joins and extracts the game.
4. Run **KOTOR UE5 Playtest.exe** from the resulting game folder. Keep its files together.

Use Releases for game downloads. Code → Download ZIP contains instructions and helpers.

## This build

TEST9789 restores the second Security door as the boarding-scene trigger, protects its staged cast, improves automatic companion approach and hostile pursuit/opening pause, turns the actual post-duel troopers toward the party, and corrects the damaged droid�s entrance facing and door traversal. The yellow shadow-overflow overlay is hidden.

**Escape** opens Options outside cutscenes. **Left-click** advances dialogue. R no longer resets the game. Left-click advances only the active dialogue line. **F4/F5** quicksave and quickload. Change bindings under Gameplay → Key Mapping.

Nine targeted packaged checks passed, including scene recovery, checked combat approaches, closed-door sight, one opening combat pause, reinforcement facing, autonomous droid opening/crossing, and checkpoint write/load. These are scoped checks; campaign-wide verification remains open. Civilian close-ups can still look soft or faceted.

## Saves and bug reports

Copy your old **UserData/Saved/SaveGames** into the matching new folder to retain progress. Keep the old folder as a backup. Personal saves and logs are excluded from downloads.

Use the [bug-report form](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/issues/new?template=bug-report.yml). Include TEST9789, area, steps and result, relevant screenshots/video and the latest log from UserData/Saved/Logs. Remove private information before uploading.

## Visual credits

- [Revamped FX](https://deadlystream.com/files/file/2581-revamped-fx/), by **Olegkuz1997**.

- [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730), by **vurt**.
- [KotOR 1 Remastered AI Upscaled Cutscenes](https://www.nexusmods.com/kotor/mods/1306), by **Naelavok**.

The project owner confirmed permission for integration and test distribution. This notice does not grant others a general redistribution license. See the packaged notices for details.
