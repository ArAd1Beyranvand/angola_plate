FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the steadfast people of Angola to view examples:

https://platexample.ir/#/discover/angola

# angola_plate

Angola's licence plates for the `plate_core` library. The 1996 white-on-black series in its one-row and two-row designs, a theme each, Latin alphabets and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  angola_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:angola_plate/angola_plate.dart';

PlateCanvas(
  spec: AngolaPlates.standard,
  theme: AngolaThemes.standard,
  validator: const AngolaValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `AngolaCountry` — country panel: `angola`.
- `AngolaPlates` — 2 plate specs: `standard`, `stacked`.
- `AngolaThemes` — 2 themes: `standard`, `stacked`.
- `AngolaValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

Two designs of AA-##-##-AA with groups `region`, `first`, `second`,
`suffix`: `standard` on one row, `stacked` with the region on its own row.

Both pair with the theme in `themeOf`. The earlier AAA-##-## series and the
2024 redesign are not implemented.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

