import axios from "axios"

const metaToken = document.querySelector("meta[name=csrf-token]")

if (metaToken) {
  const token = metaToken.content
  axios.defaults.headers.common["X-CSRF-Token"] = token
}

export default axios