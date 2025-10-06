# Pokedex Flutter App

## Descrição

Este é um projeto Flutter desenvolvido para visualizar Pokemons como uma Pokedex, podendo favoritar e buscar seus pokemons favoritos. Ele utiliza uma arquitetura modularizada com **Flutter Modular** e gerenciamento de estado via **MobX**.

---

## Tecnologias e Bibliotecas

O projeto utiliza as seguintes bibliotecas principais:

- **[flutter_modular](https://pub.dev/packages/flutter_modular)**: Para modularização da aplicação e injeção de dependências.
- **[mobx](https://pub.dev/packages/mobx) / [flutter_mobx](https://pub.dev/packages/flutter_mobx)**: Para gerenciamento reativo de estado.
- **[dio](https://pub.dev/packages/dio)**: Para comunicação HTTP com a API.
- **[easy_localization](https://pub.dev/packages/easy_localization)**: Para suporte a múltiplos idiomas.
- **[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)**: Para gerenciar variáveis de ambiente.
- **[google_fonts](https://pub.dev/packages/google_fonts)**: Para usar fontes customizadas facilmente.
- **[fluttertoast](https://pub.dev/packages/fluttertoast)**: Para exibir notificações rápidas (toasts) ao usuário.
- **[mask_text_input_formatter](https://pub.dev/packages/mask_text_input_formatter)**: Para mascaramento de campos como telefone e data.
- **[brasil_fields](https://pub.dev/packages/brasil_fields)**: Para validação e formatação de dados brasileiros (CPF, telefone, CEP).
- **[flutter_svg](https://pub.dev/packages/flutter_svg)**: Para exibir imagens no formato SVG.
- **[timezone](https://pub.dev/packages/timezone)**: Para manipulação de datas e fusos horários.
- **[path_provider](https://pub.dev/packages/path_provider)**: Para acesso a diretórios locais no dispositivo.

Essas bibliotecas foram escolhidas para proporcionar uma aplicação escalável, modular, reativa e compatível com padrões modernos de Flutter.

---

## Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) >= 3.9.0
- Android Studio ou VS Code com suporte a Flutter
- Emulador ou dispositivo físico para testes

---

## Instalação

1. Instale as dependências:

```bash
  flutter pub get
```

2. Execução do MobX:

- Para executar uma vez e gerar os aquivos .g correspondentes:

  ```bash
    dart run build_runner build
  ```

- Para ficar ouvindo qualquer alteração em tempo real e gerar os aquivos .g correspondentes:
  ```bash
    dart run build_runner watch
  ```

## Execução

1. Emulador Android

```bash
  flutter run
```

## Estrutura do Projeto

```shell

lib
├── app
│ ├── core # Camada central da aplicação, com recursos reutilizáveis
│ │ ├── configs # Configurações globais, como tema, rotas, variáveis de ambiente
│ │ ├── enums # Enumerações utilizadas em toda a aplicação
│ │ ├── interfaces # Interfaces para padronizar serviços
│ │ ├── models # Modelos de dados globais e DTOs
│ │ ├── shared # Widgets, utilitários e funções reutilizáveis
│ │ └── themes # Configurações de cores, tipografia e temas da aplicação
│
│ ├── services # Comunicação com APIs externas
│ │ ├── pokemon # Chamadas relacionadas a pokemon
│ │ ├── http # Implementação do HTTP client (Dio)
│ │ ├── interfaces # Interfaces que definem contratos de services
│ │ └── login # Chamadas relacionadas a login e cadastro
│
│ ├── modules # Funcionalidades principais da aplicação, cada módulo isolado
│ │ ├── pokemon # Módulo de pokemon
│ │ │ ├── controller # Gerencia a lógica do módulo de pokemon
│ │ │ ├── models # Modelos de dados específicos do módulo
│ │ │ └── views # Telas e widgets do módulo
│ │ └── menu # Módulo do menu lateral
└── main.dart # Ponto de entrada da aplicação
```

### Descrição das Pastas Principais

- **core**: Contém toda a lógica compartilhada e configurações globais, garantindo que o código repetido seja minimizado.
- **services**: Responsáveis por todas as chamadas à API, separados por contexto (pokemons, etc.).
- **modules**: Cada módulo representa uma funcionalidade da aplicação, com sua própria lógica, modelos e telas.
- **main.dart**: Inicializa a aplicação e carrega os módulos via Flutter Modular.

---

Essa organização permite escalabilidade, separação de responsabilidades e facilita testes e manutenção do projeto.

## Observações

- A aplicação utiliza Flutter Modular para organizar a arquitetura e facilitar a injeção de dependências.
- O gerenciamento de estado com MobX garante que as alterações de dados sejam refletidas imediatamente na UI.
- Todas as mensagens de erro são exibidas ao usuário via FlutterToast para melhor experiência.
- Suporte a múltiplos idiomas está habilitado com easy_localization.
