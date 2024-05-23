Вот пример `README.md` для вашей библиотеки на Dart, которая взаимодействует с API сервиса АТОЛ Онлайн. Этот файл можно разместить на pub.dev, чтобы пользователи могли понять, как использовать вашу библиотеку.

```markdown
# Atol API Client

A Dart library for interacting with the ATOL Online service API. This library allows you to authenticate, register documents, and retrieve document processing results.

## Features

- User authentication
- Document registration
- Retrieving document processing results

## Installation

Add `atol_api_client` to your `pubspec.yaml`:

```yaml
dependencies:
  atol_api_client:
    git:
      url: https://github.com/yourusername/atol_api_client.git
      ref: main
```

## Usage

### Import the package

```dart
import 'package:atol_api_client/atol_api_client.dart';
```

### Example

Here's a complete example of how to use the library:

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atol_api_client/atol_api_client.dart';

void main() async {
  const login = 'your_login';
  const password = 'your_password';
  const groupCode = 'your_group_code';
  const documentUuid = 'document_uuid';

  try {
    // Get authorization token
    final token = await getAuthToken(login, password);
    print('Token: $token');

    // Example document data
    final documentData = {
      'data': 'value',  // Replace with actual document data
    };

    // Register document
    await registerDocument(token, documentData);
    print('Document registered successfully');

    // Get document processing result
    final result = await getDocumentResult(token, groupCode, documentUuid);
    print('Document result: $result');
  } catch (e) {
    print('Error: $e');
  }
}
```

### Functions

#### `getAuthToken(String login, String password, [http.Client? client])`

Gets an authorization token.

- `login`: Your ATOL Online login.
- `password`: Your ATOL Online password.
- `client`: (Optional) Custom HTTP client for testing.

Returns a `Future<String>` containing the token.

#### `registerDocument(String token, Map<String, dynamic> documentData, [http.Client? client])`

Registers a document with the ATOL Online service.

- `token`: Authorization token.
- `documentData`: Map containing the document data.
- `client`: (Optional) Custom HTTP client for testing.

Returns a `Future<void>`.

#### `getDocumentResult(String token, String groupCode, String uuid, [http.Client? client])`

Gets the processing result of a registered document.

- `token`: Authorization token.
- `groupCode`: Your group code.
- `uuid`: Document UUID.
- `client`: (Optional) Custom HTTP client for testing.

Returns a `Future<Map<String, dynamic>>` containing the document result.

## Testing

Run the tests using the `test` package:

```bash
dart test
```

## License

MIT License. See [LICENSE](LICENSE) for more details.
```

### Notes

1. Ensure that the URL in the `dependencies` section points to the correct repository for your library.
2. Replace placeholders like `your_login`, `your_password`, `your_group_code`, and `document_uuid` with actual values in the example code.
3. Add any additional details about your library's features, configuration, or limitations as needed.

This `README.md` provides a clear and concise guide for users to understand how to install and use your library, along with an example and explanations of the core functions.