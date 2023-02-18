<template>
  <div class='mb-2 font-semibold text-gray-400'>額外贊助</div>
  <div class='flex items-center mb-4'>
    <div class='mr-3'><em>NT$</em></div>
    <input id="additional_donate_price" type="number" v-model="additional_donate_price" class='flex-1 p-2 border-2 border-gray-300 border-solid rounded-lg input-focus'>
  </div>
  <div class='grid grid-cols-4 gap-2 pb-6 border-b border-gray-200 border-solid'>
    <button class='donate-button'>最低額度</button>
    <button class='donate-button'>100</button>
    <button class='donate-button'>1000</button>
    <button class='donate-button'>補整數</button>
  </div>
  <h2 class='mt-3 font-semibold text-gray-400'>總金額〈含商品總價與額外贊助〉：</h2>
  <div class='flex justify-end mx-2 text-3xl'>
    <em><span>NT$ </span><span id="sum">{{ additional_donate_price }}</span></em>
  </div>
  <div class='mt-3'>
    <button class='w-full px-6 py-2 text-white bg-purple-400 hover:bg-purple-300 rounded-3xl'>直接贊助</button>
  </div>
</template>

<script>
  export default {
    data(){
      const additional_donate_price = 0

      return {
        additional_donate_price
      }
    }
  }
</script>