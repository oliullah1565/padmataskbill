<template>
   <app-header></app-header>
   <router-view></router-view>
   <app-footer></app-footer>
</template>

<script>
import AppHeader from './components/AppHeader.vue'
import AppFooter from './components/AppFooter.vue'


  export default {
    components: { AppFooter, AppHeader },
  }
</script>
