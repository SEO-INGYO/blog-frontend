<template>
  <v-main>
  <!-- pc 화면 -->
  <v-container class="d-none d-sm-flex main-content">
    <v-row>
      <!-- 개발 관련 게시글 -->
      <v-col>
        <v-card class="pa-6">
          <v-card-title class="text-h5 font-weight-bold text-center">
            Development
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text>
            <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
            <v-alert v-if="developmentError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ developmentError.message }}
            </v-alert>
            <v-data-iterator v-if="!loading && !developmentError" :items="developmentPosts">
              <template v-slot:default="{ items }">
                <v-list-item
                  v-for="(post, index) in developmentPosts"
                  :key="index"
                  :title="post.title"
                  @click="goToPost(post.id)"
                  class="text-start"
                ></v-list-item>
              </template>
            </v-data-iterator>
          </v-card-text>
        </v-card>
      </v-col>
      <!-- 게임 관련 게시글 -->
      <v-col>
        <v-card class="pa-6">
          <v-card-title class="text-h5 font-weight-bold text-center">
            Game
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text>
            <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
            <v-alert v-if="gameError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ gameError.message }}
            </v-alert>
            <v-data-iterator v-if="!loading && !gameError" :items="gamePosts">
              <template v-slot:default="{ items }">
                <v-list-item
                  v-for="(post, index) in gamePosts"
                  :key="index"
                  :title="post.title"
                  @click="goToPost(post.id)"
                  class="text-start"
                ></v-list-item>
              </template>
            </v-data-iterator>
          </v-card-text>
        </v-card>
      </v-col>
      <v-responsive width="100%"></v-responsive>
      <!-- 개발 관련 게시글 -->
      <v-col>
        <v-card class="pa-6">
          <v-card-title class="text-h5 font-weight-bold text-center">
            Design
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text>
            <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
            <v-alert v-if="designError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ designError.message }}
            </v-alert>
            <v-data-iterator v-if="!loading && !designError" :items="designPosts">
              <template v-slot:default="{ items }">
                <v-list-item
                  v-for="(post, index) in designPosts"
                  :key="index"
                  :title="post.title"
                  @click="goToPost(post.id)"
                  class="text-start"
                ></v-list-item>
              </template>
            </v-data-iterator>
          </v-card-text>
        </v-card>
      </v-col>
      <!-- 게임 관련 게시글 -->
      <v-col>
        <v-card class="pa-6">
          <v-card-title class="text-h5 font-weight-bold text-center">
            Cooking
          </v-card-title>
          <v-divider></v-divider>
          <v-card-text>
            <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
            <v-alert v-if="cookingError" type="error" dismissible>
              데이터 로딩 중 오류가 발생했습니다: {{ cookingError.message }}
            </v-alert>
            <v-data-iterator v-if="!loading && !cookingError" :items="cookingPosts">
              <template v-slot:default="{ items }">
                <v-list-item
                  v-for="(post, index) in cookingPosts"
                  :key="index"
                  :title="post.title"
                  @click="goToPost(post.id)"
                  class="text-start"
                ></v-list-item>
              </template>
            </v-data-iterator>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>

    <!-- 모바일 화면 -->
    <v-container fluid class="d-sm-none">
      <v-row>
        <v-col>
          <v-card class="pa-6" >
            <v-card-title class="text-h5 font-weight-bold">
              Development
            </v-card-title>
            <v-divider></v-divider>
            <v-card-text>
              <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
              <v-alert v-if="developmentError" type="error" dismissible>
                데이터 로딩 중 오류가 발생했습니다: {{ developmentError.message }}
              </v-alert>
              <v-data-iterator v-if="!loading && !developmentError" :items="developmentPosts">
                <template v-slot:default="{ items }">
                  <v-list-item
                    v-for="(post, index) in developmentPosts"
                    :key="index"
                    :title="post.title"
                    @click="goToPost(post.id)"
                    class="text-center"
                  ></v-list-item>
                </template>
              </v-data-iterator>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card class="pa-6" >
            <v-card-title class="text-h5 font-weight-bold">
              Game
            </v-card-title>
            <v-divider></v-divider>
            <v-card-text>
              <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
              <v-alert v-if="gameError" type="error" dismissible>
                데이터 로딩 중 오류가 발생했습니다: {{ gameError.message }}
              </v-alert>
              <v-data-iterator v-if="!loading && !gameError" :items="gamePosts">
                <template v-slot:default="{ items }">
                  <v-list-item
                    v-for="(post, index) in gamePosts"
                    :key="index"
                    :title="post.title"
                    @click="goToPost(post.id)"
                    class="text-center"
                  ></v-list-item>
                </template>
              </v-data-iterator>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card class="pa-6" >
            <v-card-title class="text-h5 font-weight-bold">
              Design
            </v-card-title>
            <v-divider></v-divider>
            <v-card-text>
              <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
              <v-alert v-if="designError" type="error" dismissible>
                데이터 로딩 중 오류가 발생했습니다: {{ designError.message }}
              </v-alert>
              <v-data-iterator v-if="!loading && !designError" :items="designPosts">
                <template v-slot:default="{ items }">
                  <v-list-item
                    v-for="(post, index) in designPosts"
                    :key="index"
                    :title="post.title"
                    @click="goToPost(post.id)"
                    class="text-center"
                  ></v-list-item>
                </template>
              </v-data-iterator>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card class="pa-6" >
            <v-card-title class="text-h5 font-weight-bold">
              Cooking
            </v-card-title>
            <v-divider></v-divider>
            <v-card-text>
              <v-progress-circular v-if="loading" indeterminate color="primary"></v-progress-circular>
              <v-alert v-if="cookingError" type="error" dismissible>
                데이터 로딩 중 오류가 발생했습니다: {{ cookingError.message }}
              </v-alert>
              <v-data-iterator v-if="!loading && !cookingError" :items="cookingPosts">
                <template v-slot:default="{ items }">
                  <v-list-item
                    v-for="(post, index) in cookingPosts"
                    :key="index"
                    :title="post.title"
                    @click="goToPost(post.id)"
                    class="text-center"
                  ></v-list-item>
                </template>
              </v-data-iterator>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup lang="ts">
const url = `https://blog-admin.rocd.site/api/posts`;
const encodedUrl = encodeURI(url);

const developmentPosts = ref<Post[]>([]);
const gamePosts = ref<Post[]>([]);
const designPosts = ref<Post[]>([]);
const cookingPosts = ref<Post[]>([]);

const { data: developmentData, error: developmentError } = await useFetch<Post[]>(encodedUrl, {
  query: { category: 'development', limit: 10, sortType: 'latest' }
});

const { data: gametData, error: gameError } = await useFetch<Post[]>(encodedUrl, {
  query: { category: 'game', limit: 10, sortType: 'latest' }
});

const { data: designData, error: designError } = await useFetch<Post[]>(encodedUrl, {
  query: { category: 'design', limit: 10, sortType: 'latest' }
});

const { data: cookingData, error: cookingError } = await useFetch<Post[]>(encodedUrl, {
  query: { category: 'cooking', limit: 10, sortType: 'latest' }
});

const loading = ref(true);
const router = useRouter();

const goToPost = (postId: number) => {
  router.push(`/posts/${postId}`);
};

onMounted(() => {
  if (developmentData.value) {
    developmentPosts.value = developmentData.value.map((post) => {
      return {
        ...post
      };
    });
  }

  if (gametData.value) {
    gamePosts.value = gametData.value.map((post) => {
      return {
        ...post
      };
    });
  }

  if (designData.value) {
    designPosts.value = designData.value.map((post) => {
      return {
        ...post
      };
    });
  }

  if (cookingData.value) {
    cookingPosts.value = cookingData.value.map((post) => {
      return {
        ...post
      };
    });
  }

  loading.value = false;
});
</script>