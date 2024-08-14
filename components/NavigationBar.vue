<template>
    <v-toolbar class="navigation-bar position-sticky" color="transparent" width="100%">
        <v-toolbar-title>
            <v-btn :to="{ path: '/' }" class="navigation-title">저장소</v-btn>
        </v-toolbar-title>
        <v-toolbar-items>
            <v-btn :to="{ path: '/posts' }" class="navigation-title">블로그</v-btn>
        </v-toolbar-items>
        <v-spacer></v-spacer>
        <v-toolbar-items>
            <v-btn :to="{ path: '/contact' }" class="navigation-title">소개</v-btn>
        </v-toolbar-items>
    </v-toolbar>
</template>

<script setup lang="ts">
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