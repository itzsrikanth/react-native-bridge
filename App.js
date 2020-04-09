/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {NativeModules} from 'react-native';

const LoadingOverlay = NativeModules.LoadingOverlay;
export default class App extends React.Component {
  render() {
    LoadingOverlay.toggle(true).then(result => {
      console.log('show', result);
    });
    setTimeout(() => {
      LoadingOverlay.toggle(false).then(result => {
        console.log('hide', result);
      });
    }, 3000);
    return <></>;
  }
}
