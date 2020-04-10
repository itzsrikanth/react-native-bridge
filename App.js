import React, {Component} from 'react';
import {View, StyleSheet, Button, Text} from 'react-native';
import {NativeModules} from 'react-native';

const Counter = NativeModules.Counter;
const LoadingOverlay = NativeModules.LoadingOverlay;

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {count: 0};
    this.updateCount();
  }

  increment = () => {
    Counter.increment();
    this.updateCount();
  };

  updateCount = () => {
    Counter.getCount((error, count) => {
      this.setState({count});
    });
  };

  componentDidMount() {
    LoadingOverlay.toggle(true);
    setTimeout(() => {
      LoadingOverlay.toggle(false);
    }, 3000);
  }

  render() {
    return (
      <View style={styles.background}>
        <Button onPress={this.increment} title="Magic" color="#841584" />
        <Text>Counter: {this.state.count}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  background: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
