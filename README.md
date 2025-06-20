# README - App Minhas Viagens

## 📌 Visão Geral
Aplicativo Flutter para gerenciar e registrar locais visitados, com integração de mapas e geolocalização. Permite salvar coordenadas, endereços e informações detalhadas dos lugares, além de visualizá-los em um mapa interativo.

## ✨ Funcionalidades
- 🗺️ Visualização de mapas com OpenStreetMap
- 📍 Marcação de locais no mapa
- 🔍 Reverse Geocoding para obter endereços a partir de coordenadas
- 📝 Adição de locais visitados com informações personalizadas
- 📊 Listagem de viagens com detalhes completos
- 🗑️ Exclusão de registros
- 📏 Ordenação por proximidade da localização atual
- ⚙️ Gerenciamento de permissões de localização

## 📦 Dependências Principais
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_map: ^7.0.2
  latlong2: ^0.9.1
  geolocator: ^13.0.2
  geocoding: ^3.0.0
  http: ^1.4.0
```

## 🛠️ Configuração

### Pré-requisitos
- Flutter SDK (versão 3.0.0 ou superior)
- Android Studio/VSCode com extensão Flutter
- Dispositivo físico ou emulador com serviços de localização habilitados

### Instalação
1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITÓRIO]
```

2. Acesse o diretório do projeto:
```bash
cd minhas_viagens
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Adicione as permissões no `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

5. Execute o app:
```bash
flutter run
```

## 🗂️ Estrutura do Projeto
```
lib/
├── geocoding_service.dart  # Serviço de geocodificação
├── Home.dart               # Tela principal com lista de viagens
├── main.dart               # Ponto de entrada do app
├── Mapas.dart              # Tela de mapas interativa
├── SplashScreen.dart       # Tela de abertura
└── viagem_model.dart       # Modelo de dados para viagens
```

## 📱 Telas

### Splash Screen
- Tela inicial com logo do app
- Duração de 5 segundos antes de redirecionar

### Tela Principal
- Lista de locais visitados
- Botão flutuante para adicionar novos locais
- Opção de ordenar por proximidade
- Exclusão de itens com gesto

### Tela de Mapas
- Mapa interativo com OpenStreetMap
- Marcadores para localização atual e selecionada
- Confirmação de local com botão de check

## Vídeo mostrando a utilização do app


https://github.com/user-attachments/assets/25871aea-29bd-4209-b57d-2d91d7fa90ae



## Link para testar a versão web da aplicação Flutter
https://minhas-viagens-delta.vercel.app/

## 🚀 Como Usar
1. Ao abrir o app, aguarde a tela inicial
2. Clique no botão "+" para adicionar um novo local
3. No mapa, toque no local desejado
4. Confirme com o ícone de check (✔) no canto superior direito
5. Insira um nome personalizado para o local
6. Visualize seu local salvo na lista principal

## 📄 Licença
Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## ✉️ Contato
Para dúvidas ou sugestões, entre em contato com opeconrado@gmail.com

---

**Nota**: Para usar a API do Google Maps (opcional), adicione sua chave de API no método `getGoogleAddress()` no arquivo `geocoding_service.dart`.
