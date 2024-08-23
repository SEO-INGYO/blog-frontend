<template>
  <v-main>
    <v-container class="main-container">
      <v-row class="mx-auto">
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <section ref="section1">
            </section>
            <section ref="section2" class="section">
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

const url = `https://blog-admin.rocd.site/api/posts`;
const encodedUrl = encodeURI(url);

const posts = ref<Post[]>([]);
const { data, error } = await useFetch<Post[]>(encodedUrl, {
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