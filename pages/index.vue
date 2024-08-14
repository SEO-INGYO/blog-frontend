<template>
  <v-main>
    <!-- 상단 이미지 배경 영역 -->
    <section class="position-relative top-0 mb-10">
      <ImageSection :imageSrc="imageSrc" :imageWidth="imageWidth" :imageHeight="imageHeight"/>
    </section>
    
    <v-container class="main-container">
      <v-row class="mx-auto">
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <section ref="section1">
              <h2>Latest Posts</h2>
              <p>This is the latest post section.</p>
            </section>
            <section ref="section2" class="section">
              <h2>About Me</h2>
              <p>This is the about me section.</p>
            </section>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup lang="ts">
import gsap from 'gsap'

import ImageSection from '~/components/ImageSection.vue';

const imageSrc = '/image.png';
const imageWidth = '100%';
const imageHeight = '500';

const section1 = ref(null);
const section2 = ref(null);

const url = `http://localhost:8080/api/posts`;
const encodedUrl = encodeURI(url);

const posts = ref<IPost[]>([]);
const { data, error } = await useFetch<IPost[]>(encodedUrl, {
  query: { limit: 5, sortType: 'latest' }
});


onMounted(() => {
  if (data.value) {
    posts.value = data.value.map((post) => {
      return {
        ...post,
      };
    }); 
  }

  gsap.from(section1.value, { x: -100, opacity: 0, duration: 1 });
  gsap.from(section2.value, { x: 100, opacity: 0, duration: 1, delay: 0.5 });
});
</script>