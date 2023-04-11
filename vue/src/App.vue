<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>

  <div id="app" class="container"> <!-- If you start to get random styling you don't like, remove container from this div -->
    <div id="nav">
      <router-link class="nav-item" v-bind:to="{ name: 'home' }">
        <img src=TomeTest.png> <!-- This is a font awesome icon -->
        Home 
      </router-link>
      <router-link class="nav-item" :to="{name: 'newExample'}">
        &nbsp; | &nbsp;Suggest New Example
      </router-link>
      <router-link
        class="nav-item"
        v-bind:to="{ name: 'register' }"
        v-if="!$store.state.token">&nbsp; | &nbsp;Register</router-link>
      <router-link
        class="nav-item"
        v-bind:to="{ name: 'login' }"
        v-if="!$store.state.token">
        &nbsp; | &nbsp;Login
      </router-link>
      <router-link
        class="nav-item"
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token">
        &nbsp; | &nbsp;Logout
      </router-link>
    </div>
    
    <router-view />
  </div>
</template>

<script>
export default {
  
}
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">



@import './styles/colors.scss';

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import '../node_modules/bootstrap/scss/bootstrap';

// Your custom styles go below this point
html,
body {
  background-color: $accentDark;
  color: $light;
}

.nav-item {
  color: $light;
}
img {
  height: 40px;
}

</style>