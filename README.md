# react-native-handoff

## Usage

```javascript
import React, { Component } from 'react';
import { Text, View } from 'react-native';
import Handoff from 'react-native-handoff';


export default class MyComponent extends Component {
    render() {
        return (
            <View>
                <Handoff
                    title="My Page" 
                    type="com.example.myapp.lookingAtPage" 
                    url="https://example.com" />
                <View>
                    <Text>My Example Page</Text>
                </View>
            </View>
        )l
    }
}
```
