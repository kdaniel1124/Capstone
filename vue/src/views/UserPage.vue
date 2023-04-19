<template>
  <section>
    <h1>Tome of Origination</h1>
    <p>Your saved scriptures</p>
    <example-card
      v-for="example in this.privateExamples"
      :key="example.exampleId"
      :example="example"
    />
  </section>
</template>

<script>
import ExamplesService from "@/services/ExamplesService.js";
import ExampleCard from "@/components/ExampleCard.vue";
export default {
  name: "user",
  components: {
    ExampleCard,
  },
  created() {
    ExamplesService.getFilteredExamples(this.$store.state.searchString).then(
      (response) => this.$store.commit("SET_EXAMPLES_LIST", response.data)
    );
  },
  data() {
    return {};
  },
  computed: {
    privateExamples() {
      let examplesInitial = this.$store.state.examples;
      examplesInitial = examplesInitial.filter((x) => x.approved == 2 && x.attributionAuthor == this.$store.state.user.username);
      console.log(examplesInitial);
      return examplesInitial;
    },
    
  },
};
</script>

<style>
</style>