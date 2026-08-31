# Flag Public App

Public App do **Flag Platform** — acompanhamento de campeonatos por atletas e torcedores.

## Documentação

| Seção | Descrição |
|-------|-----------|
| [Fluxo de Telas](./screen-flow.md) | Navegação completa do app: rotas, cenários, estados |
| [Diagrama Mermaid](./diagrama.md) | Fluxo de telas em versão interativa |
| [Arquivo Draw.io](./assets/flag-public-app-flow.drawio) | Diagrama editável (abrir no draw.io / diagrams.net) |

## Stack

- **Framework:** Flutter (`^3.41.0`) / Dart (`^3.11.4`)
- **Estado:** Riverpod (`flutter_riverpod`)
- **Navegação:** GoRouter (`go_router`) com `StatefulShellRoute`
- **HTTP:** Dio
- **Storage:** SharedPreferences, FlutterSecureStorage

## Estrutura (pós-migração monolítica)

```
lib/
├── main.dart
├── domain.dart   ← barrel (models/enums)
├── core.dart     ← barrel (widgets/tema/config)
├── api.dart      ← barrel (services)
└── src/
    ├── domain/   ← enums + models (Team, Roster, CompetitionTeam, ...)
    ├── core/     ← widgets Kickster, tema, config, sessão
    ├── api/      ← ApiClient + services (TeamApi, RosterApi, ...)
    ├── providers/
    ├── router/
    ├── screens/
    └── widgets/
```

## Setup

```bash
flutter pub get
flutter run -d chrome     # web (dev)
flutter run               # dispositivo
```

## Qualidade

```bash
dart analyze
flutter test
```