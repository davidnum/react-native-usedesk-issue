import React from 'react';
import {Button, SafeAreaView, View} from 'react-native';
import {Usedesk} from './Usedesk';

const App = () => {
  const onPress = () => {
    Usedesk.start(
      {
        withCompanyID: '159063',
        chanelId: '22065',
        api_token: 'f7fab529cbc28be4678ae8f4f7ea0255c20286c1',
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
