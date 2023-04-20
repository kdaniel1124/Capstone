<template>
  <div class="home">
<<<<<<< HEAD
    <div class="wrapper">
      <h1 class="neon-text" data-text=".netCronomicon">.NetCronomicon</h1>

      <p
        class="neon-text"
        data-text="A Tome revealing all information in the coding world."
      >
        A Tome revealing all information in the coding world.
      </p>
    </div>

    <p>Filter by language</p>
=======
    <div class='wrapper'>
    <h1 class="neon-text" data-text=".netCronomicon" id="title">.NetCronomicon</h1>
    
    <p class="neon-text" data-text="A Tome revealing all information in the coding world." id="subtitle">A Tome revealing all information in the coding world.</p>
    </div>
    
    <p id="filter">Filter by language</p>
>>>>>>> ce280d3483f41ac01ed3ef40218c70d15ec59dfa
    <ul id="languages" class="nav justify-content-center">
      <li class="nav-item">
        <button
          :class="{ active: this.$store.state.selectedLanguage == 'C#' }"
          class="stone-button"
          @click="setSelectedLanguage('C#')"
        >
          C#
        </button>
      </li>
      <li class="nav-item">
        <button
          :class="{ active: this.$store.state.selectedLanguage == 'Java' }"
          class="stone-button"
          @click="setSelectedLanguage('Java')"
        >
          Java
        </button>
      </li>
      <li class="nav-item">
        <button
          :class="{ active: this.$store.state.selectedLanguage == 'SQL' }"
          class="stone-button"
          @click="setSelectedLanguage('SQL')"
        >
          SQL
        </button>
      </li>
      <li class="nav-item">
        <button
          :class="{
            active: this.$store.state.selectedLanguage == 'JavaScript',
          }"
          class="stone-button"
          @click="setSelectedLanguage('JavaScript')"
        >
          JavaScript
        </button>
      </li>
    </ul>

    <example-card
      v-for="example in languageFilteredExamples"
      :key="example.exampleId"
      :example="example"
    />

    <div id="candle-box">
      <img
        id="left-candle"
        src="../../public/doomskull.png"
        :class="{ isLit: leftLit }"
        @click="swapLeft()"
      />
      <button
          v-if="isDoom"
          class="stone-button"
          @click="doomTime()"
        >
          Meet your DOOM
        </button>
      <img
        id="right-candle"
        src="../../public/doomskull.png"
        :class="{ isLit: rightLit }"
        @click="swapRight()"
      />
    </div>
  </div>
</template>

<script>
import ExamplesService from "@/services/ExamplesService.js";
import LanguageService from "@/services/LanguageService.js";
import ExampleCard from "@/components/ExampleCard.vue";
export default {
  name: "home",
  components: {
    ExampleCard,
  },
  computed: {
    //Added .filter to language filter to ONLY filter display public approved examples where approved == '1'
    languageFilteredExamples() {
      if (!this.$store.state.selectedLanguage) {
        return this.$store.state.examples.filter((a) => a.approved == "1");
      } else {
        return this.$store.state.examples
          .filter((e) => e.codeLanguage == this.$store.state.selectedLanguage)
          .filter((a) => a.approved == "1");
      }
    },
    isDoom() {
      if (
        this.leftLit &&
        this.rightLit &&
        this.$store.state.searchString.toLowerCase() == "doom"
      ) {
        return true;
      } else {
        return false;
      }
    },
  },
  methods: {
    setSelectedLanguage(selectedLanguage) {
      if (this.$store.state.selectedLanguage == selectedLanguage) {
        this.$store.commit("SET_SELECTED_LANGUAGE", "");
      } else {
        this.$store.commit("SET_SELECTED_LANGUAGE", selectedLanguage);
      }
    },
    swapLeft() {
      this.leftLit = !this.leftLit;
    },
    swapRight() {
      this.rightLit = !this.rightLit;
    },
    doomTime() {
      this.$router.push({ name: "doom" });
    },
  },
  data() {
    return {
      leftLit: false,
      rightLit: false,
    };
  },
  created() {
    ExamplesService.getFilteredExamples(this.$store.state.searchString).then(
      (response) => this.$store.commit("SET_EXAMPLES_LIST", response.data)
    );
    LanguageService.getAllLanguages().then((response) =>
      this.$store.commit("SET_LANGUAGES_LIST", response.data)
    );
    this.$store.commit("SET_SEARCH_STRING", "");
  },
};
</script>
<style lang="scss">
.isLit {
  width: 100px;
  height: 90px;
  border-radius: 50%;
  background-color: #0a0a0a;
  box-shadow: 0 0 60px 30px #fff, 0 0 100px 60px #c28b16, 0 0 140px 90px #e63b52;
}
#candle-box > img {
  width: 100px;
  height: 100px;
}
#candle-box {
  display: flex;
  justify-content: space-between;
  margin-top: 8px;
}
h1,
p {
  display: flex;
  justify-content: center;
  font-family: "DotGothic16", sans-serif;
  text-shadow: 4px 4px 4px black;
}
h3 {
  font-size: 20px;
}
p.neon-text {
  font-size: 100%;
  &::before {
    position: absolute;
    bottom: 4px;
    right: 4px;
    font-size: 100%;
  }
}
#filter {
  font-size: 35px;
}
#languages > li > a {
  font-size: 30px;
  color: #e54b4b;
}
.stone-button:active,
.active {
  top: 2px;
  left: 1px;
  border-color: white;
  color: white;
}
#title, #subtitle {
  display: flex;
  justify-content: center;
  
}
</style>
