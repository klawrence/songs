import React from 'react'
import ReactWordcloud from 'react-wordcloud'
import {fetchCloud} from './api'

const size = [800, 400]
const options = {
  fontFamily: 'impact',
  rotations: 0
}

export class Wordcloud extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      words: []
    }
  }

  render() {
    const {words} = this.state

    return <div className='wordcloud'>
      <ReactWordcloud words={words} size={size} options={options} />
    </div>
  }

  async componentDidMount() {
    const {url} = this.props
    const words = await fetchCloud(url)
    this.setState({words})
  }
}

