import React from 'react'
import * as ReactDOM from 'react-dom'

import {Wordcloud} from './Wordcloud'

function renderWordcloud(element) {
  ReactDOM.render(
      <Wordcloud url={element.dataset.url} />,
      element.appendChild(document.createElement('div'))
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const elements = document.querySelectorAll('.react-wordcloud')
  for (let i = 0; i < elements.length; ++i) {
    renderWordcloud(elements[i])
  }
})



