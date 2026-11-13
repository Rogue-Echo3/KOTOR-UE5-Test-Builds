# KOTOR UE5 playtests

Windows playtests of our KOTOR 1 project in Unreal Engine 5.8. This repository
provides packaged game downloads and bug reporting; editable project files are
kept in a separate private repository.

## Latest build: TEST9790

[Download TEST9790](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/releases/tag/test-9790).
The complete game package is split into numbered ZIP parts. For the easiest
setup, download **Download-Helper-9790.zip** from that release, extract it into
a new folder with at least 65 GB free, and run **Download KOTOR Test.cmd**.
It downloads, verifies and extracts every part, then checks every extracted file
against the verified archive before automatically deleting the ZIP and numbered
download parts. Allow about 65 GB temporarily during setup; the installed game
uses about 22 GB afterward. Failed downloads or verification keep the archives
for recovery. Your game, saves and unrelated files are never part of cleanup. Start **KOTOR UE5 Playtest.exe**
or **Start KOTOR Test.cmd** in the extracted game folder.

Keep every ZIP part together if downloading manually. Do not extract a single
part by itself. No Unreal Editor installation is needed to play this package.

## Changes to check

- Defeated nonlethal Taris duelists return to their original friendly faction
  and idle. Existing completed-duel story snapshots recover without changing
  rewards or stopping an active rematch. Bendak's deathmatch remains separate.
- Close Hutt dialogue shots frame the face rather than the side of the body.
- Taris transition zones follow the displayed doorway width, including the
  Upper City North/South connection. A physical clearance check excludes walls;
  closed/moving doors remain blocked and destination banners require an open door.

Seven targeted packaged checks passed, including an off-centre crossing with
controlled Carth that preserved identity, credits and active party at arrival.
These are scoped fixtures, not certification of a complete human playthrough.
Civilian close-ups can still look soft or faceted. Please report other issues.

**Escape** opens Options outside cutscenes. **Left-click** advances dialogue
lines. R no longer resets the game. Use Gameplay â†’ Key Mapping for bindings.

## Saves and bug reports

To retain progress, copy your old **UserData/Saved/SaveGames** into the matching
new game folder and keep your original copy. Personal saves and logs are excluded
from release downloads.

Use the [bug-report form](https://github.com/Rogue-Echo3/KOTOR-UE5-Test-Builds/issues/new?template=bug-report.yml).
Include TEST9790, the area, steps, expected/actual behavior and screenshots or a
short video. The latest log is in **UserData/Saved/Logs**. Remove private details
before uploading it.

## Visual credits

- [Revamped FX](https://deadlystream.com/files/file/2581-revamped-fx/), by Olegkuz1997.
- [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730), by vurt.
- [KotOR 1 Remastered AI Upscaled Cutscenes](https://www.nexusmods.com/kotor/mods/1306), by Naelavok.

The project owner confirmed permission for integration and test distribution.
This notice does not grant others a general redistribution license. See the
packaged notices for details.
