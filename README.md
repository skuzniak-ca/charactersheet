# Charactersheet

Charactersheet is a locally-running tabletop RPG character tracker. It lets you define your own "universe" metadata - the stats, skills, resource tracks, and currencies that your game system uses - and then build characters under those universes. So you can run a Dungeons & Dragons character with Strength / Dexterity / Constitution alongside a homebrew character whose stats are Curiosity / Intrigue / Gumption, in the same app, without the data model getting in the way. Built in Flutter so the same codebase can target Linux desktop today and Android / iOS later.


## How It Works

1. You create a "universe" - a rule system or campaign setting (D&D 5e, Pathfinder, your homebrew, anything you can describe in stats and skills)
2. The universe defines its own stats (e.g. STR/DEX/CON, or APP/POW/EDU, or whatever you want), resource tracks (HP, Sanity, Mana), currencies (gold, credits, eurodollars), and skills
3. You create characters under that universe; each character inherits the universe's metadata and gets editable values for every stat, track, currency, and skill
4. Each character also has a name, race, multi-class list, level, status (active/retired/deceased), portrait, backstory, session notes, and a rich inventory table
5. A tree-style home page shows universes → characters; archived universes move to an "Orphaned Characters" section so you never lose a sheet
6. Custom universe definitions can be exported and imported as JSON to share with your group

## Architecture

- **Local storage**: SQLite via [drift](https://drift.simonbinder.eu/) (type-safe Dart ORM), with foreign-key enforcement and platform-native bindings via `sqlite3_flutter_libs`
- **State**: [Riverpod](https://riverpod.dev/) providers expose reactive streams for the tree view and one-shot futures for detail/form pages
- **Universe-driven UI**: forms read the active universe's metadata at runtime to render the right stat/track/currency/skill editors per character - no rebuild needed when you add a new system
- **Cross-platform-ready**: Flutter codebase compiles to Linux desktop today; Android / iOS targets can be enabled with `flutter create --platforms=android,ios .` for future mobile releases while keeping the same codebase

# Getting Started

## Requirements

- [Flutter](https://docs.flutter.dev/get-started/install) 3.44+ (Dart 3.12+)
- Linux build deps: `clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev`
- SQLite is bundled via `sqlite3_flutter_libs`, no system install required
- A display server (X11 or Wayland) for the desktop UI

## Dependencies

```yaml
dependencies:
  flutter_riverpod: ^3.3.1
  drift: ^2.33.0
  drift_flutter: ^0.3.0
  sqlite3_flutter_libs: ^0.6.0+eol
  path_provider: ^2.1.5
  path: ^1.9.1
  file_picker: ^11.0.2
  image_picker: ^1.2.2
  uuid: ^4.5.3
  intl: ^0.20.2
  cupertino_icons: ^1.0.8

dev_dependencies:
  drift_dev: ^2.33.0
  build_runner: ^2.15.0
  flutter_lints: ^6.0.0
```

## Installation

Charactersheet is built with Flutter, so you need the Flutter SDK first. Flutter has no installer - download the SDK archive (3.44+), extract it somewhere (e.g. `~/flutter`), and add its `bin/` directory to your `PATH`. See the [official install guide](https://docs.flutter.dev/get-started/install/linux).

```bash
# Clone the repo
git clone https://github.com/skuzniak-ca/charactersheet.git
cd charactersheet

# Install Flutter Linux build deps
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# Fetch packages and generate drift code
flutter pub get
dart run build_runner build
```

## Usage

### Compiling yourself

```bash
# Release build (optimised, no debug overhead - recommended)
flutter build linux --release
# Output: build/linux/x64/release/bundle/charactersheet

# Debug build (includes hot reload and Dart VM - useful during development)
flutter run -d linux
# Or build without launching:
flutter build linux --debug
# Output: build/linux/x64/debug/bundle/charactersheet
```

The `build/` folder is produced by these commands; it is generated output and is not committed to the repo.

### Running the compiled release

Once you've built a release, launch the app directly - no Flutter toolchain needed:

```bash
./build/linux/x64/release/bundle/charactersheet
```

The `bundle/` folder contains the binary and its shared libraries. Keep the whole folder together if you move it.

The first launch seeds the database with seven default universes. The SQLite file lives at `~/.local/share/com.charactersheet.charactersheet/charactersheet.sqlite`; delete it to reset back to factory state.

### Default Universes

Charactersheet ships with seven seeded universes, with accurate stats, resource tracks, currencies, and skill lists:

- **Dungeons & Dragons 5e** - STR/DEX/CON/INT/WIS/CHA, HP, 5 coin tiers, 18 skills
- **Pathfinder 2e** - same six stats, HP, 4 coin tiers, 16 skills
- **Call of Cthulhu 7e** - 8 stats, HP/Sanity/Magic Points/Luck tracks, 35 skills
- **Vampire: The Masquerade 5e** - 9 attributes (Phys/Soc/Mental × 3), Health/Willpower/Hunger/Humanity, 27 skills
- **Cyberpunk RED** - 10 stats, HP/Humanity, Eurodollars, 23 skills
- **Star Wars (Genesys/FFG)** - 6 characteristics, Wound/Strain thresholds, Credits, 22 skills
- **Fate Core** - no traditional stats, Physical/Mental Stress + Fate Points, 18 skills

You can edit any of these freely, build new universes from scratch, or import a universe JSON file shared by someone else.

## Project Structure

```
charactersheet/
├── pubspec.yaml
├── analysis_options.yaml
├── README.md
├── LICENSE
├── lib/
│   ├── main.dart                          # App entry, first-run seeding
│   ├── data/
│   │   ├── tables.dart                    # drift table definitions
│   │   ├── database.dart                  # drift DB wiring + FK enforcement
│   │   ├── database.g.dart                # generated drift code
│   │   ├── repository.dart                # CRUD + JSON import/export
│   │   └── seed.dart                      # 7 default universes
│   ├── state/
│   │   └── providers.dart                 # Riverpod providers
│   └── ui/
│       ├── pages/
│       │   ├── tree_home_page.dart        # Tree of universes → characters
│       │   ├── universe_form_page.dart    # Create/edit universe
│       │   ├── universe_detail_page.dart  # Universe summary + child list
│       │   ├── character_form_page.dart   # Create/edit character
│       │   └── character_detail_page.dart # Character sheet view
│       └── widgets/
│           └── confirm_dialogs.dart       # Delete dialogs + file pickers
├── linux/                                 # Linux desktop platform
└── test/
    └── widget_test.dart
```


## Acknowledgements

Built with assistance from [Claude](https://claude.ai) by Anthropic.
