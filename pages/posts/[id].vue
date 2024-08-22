<template>
  <v-main>
    <v-container class="main-container">
      <div v-if="pending">Loading...</div>
      <div v-else-if="error">Error: {{ error.message || 'An error occurred' }}</div>
      <v-card class="pa-6" v-else-if="postData"
        title={{ postData.title }}
        v-html="renderedContent"
      ></v-card>
    </v-container>
  </v-main>
</template>

<script setup lang="ts">
import MarkdownIt from 'markdown-it';

const route = useRoute();
const id = route.params.id;

const { data: postData, pending, error } = await useFetch<Post>(`https://blog-admin.rocd.site/api/posts/${id}`);

const md = new MarkdownIt();

const renderedContent = computed(() => {
  if (postData.value && postData.value.content) {
    return md.render(postData.value.content);
  }
  return '';
});
</script>