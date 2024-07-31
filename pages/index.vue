<template>
  <v-main>
    <!-- 상단 이미지 배경 영역 -->
    <section class="position-relative top-0 mb-10">
      <ImageSection :imageSrc="imageSrc" :imageWidth="imageWidth" :imageHeight="imageHeight"/>
    </section>

    <v-container>
      <v-row class="main-content mx-auto">
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <div class="text-h6 text-md-h5 text-center">최근 게시글</div>
            <v-timeline align="start" side="end">
              <TimelineItem ref="timelineItems" v-for="(post, index) in posts"
                :id="index"
                :dot-color="getDotColor(post.categoryName)"
                :key="index"
                :timeText="post.createdDate"
                :titleText="post.title"
                :categoryText="post.categoryName"/>
            </v-timeline>
          </v-sheet>
        </v-col>
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <div class="text-h6 text-md-h5 text-center">가장 많이 본 게시글</div>
            <v-list :items="items" lines="three" item-props>
              <template v-slot:subtitle="{ subtitle }">
                <div v-html="subtitle"></div>
              </template>
            </v-list>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
    <v-container>
      <v-row class="main-content mx-auto">
        <v-col>
          <v-sheet color="pa-5" rounded="lg">
            <section ref="section1" class="section">
              <h2>Latest Posts</h2>
              <p>This is the latest post section.</p>
            </section>
            <section ref="section2" class="section">
              <h2>About Me</h2>
              <p>This is the about me section.</p>
            </section>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script setup lang="ts">
import gsap from 'gsap'

import ImageSection from '~/components/ImageSection.vue';
import TimelineItem from '~/components/TimelineItem.vue';

interface Item {
  src: string;
}

const imageSrc = '/image.png';
const imageWidth = '100%';
const imageHeight = '500';

const section1 = ref(null);
const section2 = ref(null);
const timelineItems = ref<InstanceType<typeof TimelineItem>[]>([]);

const posts = ref<IPost[]>([]);
const { data, error } = useFetch<IPost[]>('http://localhost:8080 /api/posts');
const items = ref([
  {
    prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
    title: 'Brunch this weekend?',
    subtitle: `<span class="text-primary">Ali Connors</span> &mdash; I'll be in your neighborhood doing errands this weekend. Do you want to hang out?`,
  },
  { type: 'divider', inset: true },
  {
    prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
    title: 'Summer BBQ',
    subtitle: `<span class="text-primary">to Alex, Scott, Jennifer</span> &mdash; Wish I could come, but I'm out of town this weekend.`,
  },
  { type: 'divider', inset: true },
  {
    prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
    title: 'Oui oui',
    subtitle: '<span class="text-primary">Sandra Adams</span> &mdash; Do you have Paris recommendations? Have you ever been?',
  },
])

const getDotColor = (categoryName: string): string => {
  switch (categoryName) {
    case '개발':
      return '#82daff';
    case '노트':
      return '#aaff82';
    default:
      return 'gray';
  }
};

const convertUnixToDateFormat = (unixTime: number): string => {
  const date = new Date(unixTime);
  const year = date.getUTCFullYear();
  const month = (date.getUTCMonth() + 1).toString().padStart(2, '0');
  const day = date.getUTCDate().toString().padStart(2, '0');

  return `${year}년 ${month}월 ${day}일`;
}

const padZero = (num: number) => {
  return (num < 10 ? '0' : '') + num;
}

onMounted(() => {
  if (data.value) {
    posts.value = data.value.map((post) => {
      return {
        ...post,
        createdDate: convertUnixToDateFormat(parseInt(post.createdDate, 10)),
      };
    });
  }

  gsap.from(section1.value, { x: -100, opacity: 0, duration: 1 });
  gsap.from(section2.value, { x: 100, opacity: 0, duration: 1, delay: 0.5 });
});

watch(data, async (newData, oldData) => {
  if (!error.value) {
    const resolvedData = await newData;
    if (resolvedData) {
      posts.value = resolvedData.map((post: any) => {
        return {
          ...post,
          createdDate: convertUnixToDateFormat(parseInt(post.createdDate, 10)),
        };
      });
    }
  }
});
</script>

<style scoped>
.main-content {
  max-width: 1200px;
}

.section {
  margin-bottom: 40px;
  padding: 20px;
  background-color: #f4f4f4;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>