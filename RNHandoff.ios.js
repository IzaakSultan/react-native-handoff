import { PureComponent } from 'react'
import { NativeModules } from 'react-native'

const { RNHandoff } = NativeModules

export default class Handoff extends PureComponent {
  state = {
    active: false,
    id: 'react-native-handoff',
  }

  componentDidMount() {
    const { type, title, url } = this.props
    const { id } = this.state

    RNHandoff.becomeCurrent(id, type, title, url)

    this.setState({ active: true })
  }

  componentWillUnmount() {
    const { active, id } = this.state

    if (active) {
      RNHandoff.invalidate(id)
    }
  }

  render() {
    return null
  }
}
