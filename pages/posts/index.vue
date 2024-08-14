<template>
  <v-main>
    <v-container class="main-container">
      <v-row class="mx-auto">
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <div class="text-h6 text-md-h5 text-center">명령어</div>
            <!-- 로딩 상태 표시 -->
            <v-progress-circular v-if="loading" indeterminate color="primary" class="mx-auto"></v-progress-circular>
            <!-- 에러 메시지 표시 -->
            <v-alert v-if="commandError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ commandError.message }}
            </v-alert>
            <!-- 데이터 표시 -->
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
            <!-- 로딩 상태 표시 -->
            <v-progress-circular v-if="loading" indeterminate color="primary" class="mx-auto"></v-progress-circular>
            <!-- 에러 메시지 표시 -->
            <v-alert v-if="syntaxError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ syntaxError.message }}
            </v-alert>
            <!-- 데이터 표시 -->
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
const url = `http://localhost:8080/api/posts`;
const encodedUrl = encodeURI(url);

const commandPosts = ref<IPost[]>([]);
const syntaxPosts = ref<IPost[]>([]);

const { data: commandData, error: commandError } = await useFetch<IPost[]>(encodedUrl, {
  query: { category: '명령어', limit: 5, sortType: 'latest' }
});

const { data: syntaxData, error: syntaxError } = await useFetch<IPost[]>(encodedUrl, {
  query: { category: '문법', limit: 5, sortType: 'latest' }
});

const loading = ref(true);
const router = useRouter(); // Vue Router 인스턴스 가져오기

const goToPost = (postId: number) => {
  router.push(`/posts/${postId}`); // 게시글의 상세 페이지로 이동
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