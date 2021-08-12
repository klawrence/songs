import {server} from '../react-to-rails/server'

export function fetchCloud(url) {
  return server.get(url)
}
