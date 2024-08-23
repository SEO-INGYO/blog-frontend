<template>
    <!-- 앱 바 (헤더) -->
    <v-app-bar app>
      <!-- 모바일에서 햄버거 메뉴 -->
      <v-app-bar-nav-icon @click="drawer = !drawer" class="d-sm-none"></v-app-bar-nav-icon>
      
      <!-- 로고 -->
      <v-toolbar-title>Blog</v-toolbar-title>

      <!-- 네비게이션 링크 (큰 화면) -->
      <v-spacer></v-spacer>
      <v-btn :to="{ path: '/' }" class="d-none d-sm-flex">Home</v-btn>
      <v-btn :to="{ path: '/posts' }" class="d-none d-sm-flex">Post</v-btn>
      <v-btn :to="{ path: '/contact' }" class="d-none d-sm-flex">Contact</v-btn>
    </v-app-bar>

    <!-- 네비게이션 드로어 (모바일) -->
    <v-navigation-drawer v-model="drawer" app temporary class="d-sm-none">
      <v-list>
        <v-list-item :to="{ path: '/' }" link>
          <v-list-item-title>Home</v-list-item-title>
        </v-list-item>
        <v-list-item :to="{ path: '/posts' }" link>
          <v-list-item-title>Post</v-list-item-title>
        </v-list-item>
        <v-list-item :to="{ path: '/contact' }" link>
          <v-list-item-title>Contact</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
</template>

<script setup lang="ts">
const drawer = ref(false)
</script>

<style scoped>
.navigation-bar {
    z-index: 1;
}

.navigation-title {
    color: inherit;
    text-decoration: none;
}
</style>