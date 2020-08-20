/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useState, useEffect} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  FlatList,
  Text,
  StatusBar,
  NativeModules,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

const App: () => React$Node = () => {
  const [greeting, setGreeting] = useState('');
  const [names, setNames] = useState([]);
  const [user, setUser] = useState({});

  useEffect(() => {
    const getNativeGreeting = async () => {
      setGreeting(await NativeModules.HelloFromTheOtherSide.greet('Justin'));
    };
    getNativeGreeting();
  }, []);

  useEffect(() => {
    const generateNames = async () => {
      setNames(await NativeModules.HelloFromTheOtherSide.generateNames(8));
    };
    generateNames();
  }, []);
  console.log(names);

  useEffect(() => {
    const capitaliseUserNames = async (user) => {
      try {
        const capitalizedUser = await NativeModules.HelloFromTheOtherSide.capitaliseUserNames(user);
        setUser(capitalizedUser);
      } catch (err) {
        console.log(err);
      }
    };
    const user = {firstName: 'justin', lastName: 'g'};
    capitaliseUserNames(user);
  }, []);

  console.log(user);
  return (
    <SafeAreaView>
      <Text>{greeting}</Text>
      <FlatList
        data={names}
        keyExtractor={(item, index) => `${index}`}
        renderItem={({item}) => <Text>{item}</Text>}
      />
    </SafeAreaView>
  );
};

export default App;
