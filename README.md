# Проблема
- ### При использовании версии SDK 2.2.3 все работает как и ожидается - открывается чат
- ### При использовании версии SDK 2.3.0 некорректно открыается база знаний с темным экраном
<br/>

# Установка
```
$ git clone https://github.com/davidnum/react-native-usedesk-issue.git
```
```
$ cd react-native-usedesk-issue
```
```
$ yarn
```
```
$ cd ios && pod install
```

Открываем `src/App.tsx` и вписываем параметры из письма:

```jsx
import React from 'react';
import {Button, SafeAreaView, View} from 'react-native';
import {Usedesk} from './Usedesk';

const App = () => {
  const onPress = () => {
    Usedesk.start(
      {
        withCompanyID: 'PLACE HERE COMPANY ID', // <---- Company ID
        chanelId: 'PLACE HERE CHANNEL ID', // <---- Channel ID
        api_token: 'PLACE HERE API TOKEN', // <---- API Token
        url: 'pubsubsec.usedesk.ru',
        urlAPI: 'secure.usedesk.ru',
        name: '',
        email: '',
        phone: '87777777777',
      },
      () => {},
      () => {},
    );
  };

  return (
    <SafeAreaView style={{flex: 1}}>
      <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
        <Button title="Open chat" onPress={onPress} />
      </View>
    </SafeAreaView>
  );
};

export default App;
```
<br/>

# Запуск
### 1. Заходим в XCode и открываем `ios/UsedeskIssue.xcworkspace`
### 2. Дальше запускаем как обычный XCode проект
### 3. Чтобы открыть чат нажимаем на кнопку `Open chat` в приложении
____
### Для изменения версии SDK нужно в файле `ios/Podfile` поменять номер версии, переустановить поды и перезапусть приложение в XCode

