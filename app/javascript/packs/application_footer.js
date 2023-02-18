import * as Vue from 'vue'
import wubay_team from './wubay_team.vue'
import contributors from './contributors_list.vue'

document.addEventListener('DOMContentLoaded', () => {
  Vue.createApp(wubay_team).mount('#title');
  Vue.createApp(contributors).mount('#contributors');
})