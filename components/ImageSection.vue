<template>
    <v-img :src=imageSrc :width=imageWidth :height=imageHeight></v-img>
</template>
  
  <script setup lang="ts">
  const props = defineProps<{
    imageSrc?: string,
    imageWidth?: string,
    imageHeight?: string,
  }>();
</script>