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

  useEffect(() => {
    const getNativeGreeting = async () => {
      setGreeting(await NativeModules.HelloFromTheOtherSide.greet('Justin'));
    };
    getNativeGreeting();
  });

  return (
    <SafeAreaView>
      <Text>{greeting}</Text>
    </SafeAreaView>
  );
};

export default App;
