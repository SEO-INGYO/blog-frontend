<template>
  <v-main>
    <v-container class="main-container">
      <v-row class="mx-auto">
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <div class="text-h6 text-md-h5 text-center">명령어</div>
            <v-progress-circular v-if="loading" indeterminate color="primary" class="mx-auto"></v-progress-circular>
            <v-alert v-if="commandError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ commandError.message }}
            </v-alert>
            <v-data-iterator v-if="!loading && !commandError" :items="commandPosts">
              <template v-slot:default="{ items }">
                <v-list-item
                  v-for="(post, index) in commandPosts"
                  :key="index"
                  :title="post.title"
                  @click="goToPost(post.id)"
                ></v-list-item>
              </template>
            </v-data-iterator>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <div class="text-h6 text-md-h5 text-center">문법</div>
            <v-progress-circular v-if="loading" indeterminate color="primary" class="mx-auto"></v-progress-circular>
            <v-alert v-if="syntaxError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ syntaxError.message }}
            </v-alert>
            <v-data-iterator v-if="!loading && !syntaxError" :items="syntaxPosts">
              <template v-slot:default="{ items }">
                <v-list-item
                  v-for="(post, index) in syntaxPosts"
                  :key="index"
                  :title="post.title"
                  @click="goToPost(post.id)"
                ></v-list-item>
              </template>
            </v-data-iterator>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup lang="ts">
const url = `https://blog-admin.rocd.site/api/posts`;
const encodedUrl = encodeURI(url);

const commandPosts = ref<Post[]>([]);
const syntaxPosts = ref<Post[]>([]);

const { data: commandData, error: commandError } = await useFetch<Post[]>(encodedUrl, {
  query: { category: '명령어', limit: 100, sortType: 'latest' }
});

const { data: syntaxData, error: syntaxError } = await useFetch<Post[]>(encodedUrl, {
  query: { category: '문법', limit: 100, sortType: 'latest' }
});

const loading = ref(true);
const router = useRouter();

const goToPost = (postId: number) => {
  router.push(`/posts/${postId}`);
};

onMounted(() => {
  if (commandData.value) {
    commandPosts.value = commandData.value.map((post) => {
      return {
        ...post
      };
    });
  }

  if (syntaxData.value) {
    syntaxPosts.value = syntaxData.value.map((post) => {
      return {
        ...post
      };
    });
  }

  loading.value = false;
});
</script>