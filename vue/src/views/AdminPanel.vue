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
  methods: {
    swapLanguageActivity(name) {
      this.$store.commit("SWAP_LANGUAGE_ACTIVITY", name);
    }
  },
  computed: {
    examplesToApprove() {
      let examplesInitial = this.$store.state.examples;
      examplesInitial = examplesInitial.filter((x) => x.approved == 0);
      console.log(examplesInitial);
      return examplesInitial;
    },
  },
};
</script>

<style>
.inactiveLanguage {
  color: black
}
</style>