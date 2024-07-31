<template>
    <v-app>
        <NavigationBar />
        <slot />
    </v-app>
</template>

<script setup lang="ts">
import NavigationBar from '~/components/NavigationBar.vue';
</script>