import React from 'react'
import ReactWordcloud from 'react-wordcloud'
import {fetchCloud} from './api'

export class Wordcloud extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      words: []
    }
  }

  render() {
    const {words} = this.state

    const options = {
      // rotations: 2,
      // rotationAngles: [-90, 0],
    }
    return <div className='wordcloud'>
      <ReactWordcloud words={words} size={[800, 400]} options={options}/>
    </div>
  }

  async componentDidMount() {
    const {url} = this.props
    const words = await fetchCloud(url)
    this.setState({words})
  }
}

