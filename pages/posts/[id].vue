  <template>
    <v-main>
      <v-container class="main-container">
        <div>
          <div v-if="pending">Loading...</div>
          <div v-else-if="error">Error: {{ error.message || 'An error occurred' }}</div>
          <ContentRendererMarkdown v-else :value="post?.content" />
          <div v-else :value="post?.content" />
        </div>
      </v-container>
    </v-main>
  </template>

  <script setup lang="ts">
  const route = useRoute();
  const id = route.params.id;

  const { data, pending, error } = useFetch<WrappedPost>(`https://blog-admin.rocd.site/api/posts/${id}`);

  const post = ref<Post | null>(null);

  watchEffect(() => {
    if (data.value && data.value._value) {
      post.value = { ...data.value._value };
    }
  });
  </script>