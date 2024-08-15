<template>
    <v-main>
        <v-container class="main-container">
            <p>{{ id }}</p>
        </v-container>
    </v-main>
</template>

<script setup lang="ts">
// `id`는 페이지의 URL 파라미터로부터 받아옵니다.
const route = useRoute();
const id = route.params.id;
</script>