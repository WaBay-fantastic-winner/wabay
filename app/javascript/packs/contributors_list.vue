<template>
  <ul class='abc flex justify-center max-w-3xl mx-auto text-lg footer-items'>
    <li class='mr-5' v-for="name in contributors">{{ name }}</li>
  </ul>
</template>

<script>
  export default {
    data(){
      return {
        contributors: ['賴逸群', '李宇傑', '郭宇庠', '吳彥達']
      }
    }
  };
</script>