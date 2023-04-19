<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>

  <div id="app" class="container">
    <!-- If you start to get random styling you don't like, remove container from this div -->
    <nav id="nav">
      <div id="navCluster">
        <button class="nav-item" @click="refreshHomePage()">
          <router-link class="nav-item" v-bind:to="{ name: 'home' }">
            <img src="TomeTest.png" />
            <!-- This is a font awesome icon -->
            Home
          </router-link>
        </button>
        <router-link class="nav-item" :to="{ name: 'newExample' }">
          &nbsp; | &nbsp;Suggest New Example
        </router-link>
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'register' }"
          v-if="!$store.state.token"
          >&nbsp; | &nbsp;Register</router-link
        >
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'login' }"
          v-if="!$store.state.token"
        >
          &nbsp; | &nbsp;Login
        </router-link>
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token"
        >
          &nbsp; | &nbsp;Logout
        </router-link>
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'adminPanel' }"
          v-if="this.$store.state.user.role === 'admin'"
        >
          &nbsp; | &nbsp;Admin
        </router-link>
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'user' }"
          v-if="$store.state.token"
          >&nbsp; | &nbsp;User</router-link
        >
      </div>
      <form class="form-inline">
        <input
          class="form-control mr-sm-2"
          type="text"
          placeholder="Search"
          aria-label="Search"
          v-model="searchString"
        />

        <input
          class="btn btn-outline my-2 my-sm-0, scrollButton"
          type="submit"
          @click.prevent="setSearchString()"
        />
      </form>
    </nav>
    <router-view />

    <router-link
          class="nav-item"
          v-bind:to="{ name: 'doom' }"
          >&nbsp; | &nbsp;Doom</router-link
        >
  </div>
  
</template>

<script>
import ExamplesService from "@/services/ExamplesService.js";

export default {
  methods: {
    setSearchString() {
      this.$store.commit("SET_SEARCH_STRING", this.searchString);
      ExamplesService.getFilteredExamples(this.$store.state.searchString).then(
        (response) => this.$store.commit("SET_EXAMPLES_LIST", response.data)
      );
    },
    refreshHomePage() {
      this.$store.commit("SET_SEARCH_STRING", "");
      //ExamplesService.getFilteredExamples(this.$store.state.searchString).then(
      //  (response) => this.$store.commit("SET_EXAMPLES_LIST", response.data)
      //);
      window.location.reload();
    },
  },
  data() {
    return {
      searchString: "",
    };
  },
};
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">
@import "./styles/colors.scss";

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import "../node_modules/bootstrap/scss/bootstrap";

// Your custom styles go below this point
html,
body {
  background-color: $accentDark;
  color: $light;
}

.nav-item {
  color: $light;
  font-family: "DotGothic16", sans-serif;
  text-shadow: 4px 4px 4px black;
  text-decoration: none;
  background-color: transparent;
  border: none;
}
a:hover {
  color: $highlight;
  text-decoration: none;
}
img {
  height: 40px;
}
.scrollButton {
  background-image: url("../public/button.png");
  background-position: center;
  background-size: 100%;
  margin-left: 8px;
  font-family: "DotGothic16", sans-serif;
  font-weight: bold;
}

.scrollButton:disabled {
  opacity: 30%;
}
#nav {
  display: flex;
  justify-content: space-between;
  position: static;
}

.stone-button {
  background-image: url("../public/stone2.jpg");
  background-position: center;
  background-size: 100%;
  margin-left: 8px;
  font-family: "DotGothic16", sans-serif;
  color: #e54b4b;
  font-size: 30px;

  &:hover {
    // box-shadow: 0 0 20px 10px rgba(230, 30, 10, 0.6);
    animation: burn 1000ms ease-out forwards;

    &::before {
      content: "";
      position: absolute;
      left: 40px;
      width: 100px;
      height: 40px;
      border-radius: 100%;
      animation: flare 1000ms ease-out forwards;
    }

    &::after {
      content: "";
      position: absolute;
      right: 40px;
      width: 100px;
      height: 40px;
      border-radius: 100%;
      animation: flare 1000ms ease-out forwards;
    }
  }
}

@keyframes flare {
  100% {
    transform: translateY(-20px) scale(1.5);
    filter: blur(10px);
    opacity: 0;
  }
}

@keyframes burn {
  0% {
    color: rgba(255, 130, 110, 1);

    box-shadow: 0 0 5px 0 rgba(200, 0, 10, 1), 0 0 5px 0 rgba(230, 30, 10, 0.8),
      0 0 5px 0 rgba(230, 230, 10, 0.6);
  }

  100% {
    box-shadow: 0 -35px 40px 30px rgba(255, 130, 10, 0),
      0 -30px 30px 10px rgba(230, 30, 10, 0),
      0 -20px 10px 0 rgba(255, 255, 10, 0);
  }
}
</style>