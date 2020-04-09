import React, {Component} from 'react';
import {View, StyleSheet} from 'react-native';
import {NativeModules} from 'react-native';

class App extends Component {
  componentDidMount() {
    var LoadingOverlay = NativeModules.LoadingOverlay;
    //Let's show it
    LoadingOverlay.toggle(true);
    // And let's hide it after 3 seconds
    setTimeout(() => {
      LoadingOverlay.toggle(false);
    }, 3000);
  }

  render() {
    return <View style={styles.background} />;
  }
}

const styles = StyleSheet.create({
  background: {
    backgroundColor: '#6ce6cb',
    flex: 1,
  },
});

export default App;
