<template>
    <v-toolbar class="navigation-bar position-sticky" color="transparent" width="100%">
        <v-toolbar-title>
            <NuxtLink to="/" class="navigation-title">저장소</NuxtLink>
        </v-toolbar-title>
        <v-toolbar-items>
            <v-btn><NuxtLink to="/development" class="navigation-title">development</NuxtLink></v-btn>
            <v-btn><NuxtLink to="/game" class="navigation-title">game</NuxtLink></v-btn>
            <v-btn><NuxtLink to="/design" class="navigation-title">design</NuxtLink></v-btn>
        </v-toolbar-items>
        <v-spacer></v-spacer>
        <v-toolbar-items>
            <v-btn><NuxtLink to="/contact" class="navigation-title">contact</NuxtLink></v-btn>
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