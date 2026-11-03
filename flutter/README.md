FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the steadfast people of Angola to view examples:

https://platexample.ir/#/discover/angola:flutter

# angola_plate

Angola's licence plates for the plate_core library — the 1996 white-on-black series, themes, alphabets, advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/angola_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/angola:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/angola_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/angola:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/angola_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/angola:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/angola_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/angola:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  angola_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `AngolaPlates.standard`
- `AngolaPlates.stacked`

## Themes

- `AngolaThemes.standard`
- `AngolaThemes.stacked`

## Change it

`PlateCanvas` takes `spec:` (an entry of `AngolaPlates`) and `theme:` (an entry of `AngolaThemes`). Set `validator:` to `AngolaValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `AngolaCountry` — the country panel.
- `AngolaValidator` — the plate validator.

## Plates

Two designs of AA-##-##-AA with groups `region`, `first`, `second`,
`suffix`: `standard` on one row, `stacked` with the region on its own row.

Both pair with the theme in `themeOf`. The earlier AAA-##-## series and the
2024 redesign are not implemented.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/angola_plate/blob/main/LICENSE).
