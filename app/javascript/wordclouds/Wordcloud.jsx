import React from 'react'
import ReactWordcloud from 'react-wordcloud'

const words = [
  {
    text: 'told',
    value: 20,
  },
  {
    text: 'mistake',
    value: 22,
  },
  {
    text: 'thought',
    value: 16,
  },
  {
    text: 'bad',
    value: 17,
  },
]

export function Wordcloud({url}) {
  return <div className='wordcloud'>
    <ReactWordcloud words={words} />
  </div>
}
