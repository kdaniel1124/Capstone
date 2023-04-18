<template>
  <div class="home">
    <h1>.NetCronomicon</h1>
    <p>A Tome revealing all information in the coding world.</p>
    <p>Filter by language</p>
    <ul id="languages" class="nav justify-content-center">
      <li class="nav-item">
        <button :class="{ active: (this.$store.state.selectedLanguage == 'C#')}" class="stone-button" @click="setSelectedLanguage('C#')">
          C#
        </button>
      </li>
      <li class="nav-item">
        <button :class="{ active: (this.$store.state.selectedLanguage == 'Java')}" class="stone-button" @click="setSelectedLanguage('Java')">
          Java
        </button>
      </li>
      <li class="nav-item">
        <button :class="{ active: (this.$store.state.selectedLanguage == 'SQL')}" class="stone-button" @click="setSelectedLanguage('SQL')">
          SQL
        </button>
      </li>
      <li class="nav-item">
        <button :class="{ active: (this.$store.state.selectedLanguage == 'JavaScript')}" class="stone-button" @click="setSelectedLanguage('JavaScript')">
          JavaScript
        </button>
      </li>
    </ul>

    <example-card
      v-for="example in languageFilteredExamples"
      :key="example.exampleId"
      :example="example"

    />
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
        return this.$store.state.examples.filter( a => a.approved == '1');
      } else {
        return this.$store.state.examples.filter(
          (e) => e.codeLanguage == this.$store.state.selectedLanguage
        ).filter( a => a.approved == '1');
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
  },
  data() {
    return {};
  },
  created() {
    ExamplesService.getFilteredExamples(this.$store.state.searchString).then(
      (response) => this.$store.commit("SET_EXAMPLES_LIST", response.data)
    );
    LanguageService.getAllLanguages().then(
      (response) => this.$store.commit("SET_LANGUAGES_LIST", response.data)
    );
      this.$store.commit("SET_SEARCH_STRING", "");
  },
};
</script>
<style>
h1,
p {
  display: flex;
  justify-content: center;
  font-family: "Metal Mania", cursive;
  text-shadow: 2px 2px 2px black;
}
h1 {
  font-size: 50px;
}
p {
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
  color:white;
}

</style>
