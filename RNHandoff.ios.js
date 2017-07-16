import { Component } from 'react';
import { NativeModules } from 'react-native'

const { RNHandoff } = NativeModules;

let id = 0;

export default class Handoff extends Component {
    id = -1;

    componentWillMount() {
        const { type, title, url } = this.props;

        this.id = ++id;

        RNHandoff.becomeCurrent(this.id, type, title, url);
    }

    componentWillUnmount() {
        if (this.id !== -1) {
            RNHandoff.invalidate(this.id);
        }
    }

    render() {
        return null;
    }
}
