<template>
  <v-main>
    <v-container class="main-container">
      <div v-if="pending">Loading...</div>
      <div v-else-if="error">Error: {{ error.message || 'An error occurred' }}</div>
      <v-card
        v-else
        class="pa-6 markdown-content"
        outlined
        elevation="2"
      >
        <v-card-title class="text-h5 font-weight-bold">{{ postData?.title }}</v-card-title>
        <v-divider></v-divider>
        <v-card-text v-html="renderedContent" class="mt-4"></v-card-text>
      </v-card>
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