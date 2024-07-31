<template>
  <v-timeline-item :dot-color="dotColor" size="small">
      <div :id="`animatedDiv${props.id}`" class="d-flex">
      <strong class="me-4">{{ timeText }}</strong>
      <div>
          <strong>{{ titleText }}</strong>
          <div class="text-caption" :text="categoryText">{{ categoryText }}</div>
      </div>
      </div>
  </v-timeline-item>
</template>

<script setup lang="ts">
  import gsap from 'gsap'

  const props = defineProps<{
    id: number,
    timeText: string,
    titleText: string,
    categoryText: string,
    dotColor: string,
  }>();

  onMounted(() => {
    const timeline = gsap.timeline() 
  
    timeline.from(`#animatedDiv${props.id}`, {
      x: "-100%", 
      duration: 2,
    })
  })
</script>