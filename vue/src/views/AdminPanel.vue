<template>
  <section>
    <h1>Grand Necromancer's View</h1>
    <h2>Are These Scriptures... Worthy?</h2>
    <ul id="languages" class="nav justify-content-center">
      <li class="language-item"
      v-for="language in this.$store.state.supportedLanguages"
      :key="language.Name"
      >
        <button
          :class="{ inactiveLanguage: !language.Active }"
          class="stone-button"
          @click="swapLanguageActivity(language.Name)"
        >
          {{language.Name}}
        </button>
      </li>
    </ul>

    <example-card
      v-for="example in this.examplesToApprove"
      :key="example.exampleId"
      :example="example"
    />
  </section>
</template>

<script>
import ExamplesService from "@/services/ExamplesService.js";
import ExampleCard from "@/components/ExampleCard.vue";
export default {
  name: "adminPanel",
  components: {
    ExampleCard,
  },
  created() {
    ExamplesService.getFilteredExamples(this.$store.state.searchString).then(
      (response) => this.$store.commit("SET_EXAMPLES_LIST", response.data)
    );
  },
<<<<<<< HEAD
  data() {
    return {};
=======
  methods: {
    swapLanguageActivity(name) {
      this.$store.commit("SWAP_LANGUAGE_ACTIVITY", name);
    }
>>>>>>> 8a50a53e1596cc521d004bd72820c10df59b0ab3
  },
  computed: {
    examplesToApprove() {
      let examplesInitial = this.$store.state.examples;
      examplesInitial = examplesInitial.filter((x) => x.approved == "0");
<<<<<<< HEAD
=======
      console.log(examplesInitial);
>>>>>>> 8a50a53e1596cc521d004bd72820c10df59b0ab3
      return examplesInitial;
    },
  },
};
</script>

<style>
<<<<<<< HEAD
=======
.inactiveLanguage {
  color: black
}
>>>>>>> 8a50a53e1596cc521d004bd72820c10df59b0ab3
</style>