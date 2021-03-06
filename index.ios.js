'use strict';

import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  ListView,
  Image
} from 'react-native';

class RNHighScores extends React.Component {
  constructor(props) {
    super(props);
    const ds = new ListView.DataSource({ rowHasChanged: (r1, r2) => r1 !== r2 });
    this.state = {
      dataSource: ds.cloneWithRows([
        [{label:"A",image:"blue.png"}, {label:"B",image:"blue.png"},]
      ])
    };
  }
  render() {
    var contents = this.props["scores"].map(
      score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
    );
    return (
      <ListView
        dataSource={this.state.dataSource}
        renderRow={this.renderRow.bind(this)}
        contentContainerStyle={styles.contentViewStyle}
        scrollEnabled={false}
        />
    );
  }
  renderRow(rowData) {
    return (
      <View>
        {this.renderList(rowData)}
      </View>
      
    );
  }
  renderList(list){
    return list.map( item => this.renderItem(item) );
  }

  renderItem(item) {
    return (
           <View style={styles.cellStyle}>             
           <Image source={{uri:item.image}} style={{width:52,height:52}}/>             
           <Text>{item.label}</Text>           
           </View>
       );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  contentViewStyle: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems:'flex-start',
  },
});

// 整体js模块的名称
AppRegistry.registerComponent('RNHighScores', () => RNHighScores);