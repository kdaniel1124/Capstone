<template>
  <section>
      <h1>Grand Necromancer's View</h1>
      <h2>Are These Scriptures... Worthy?</h2>

      <example-card v-for="example in this.examplesToApprove" :key="example.exampleId" :example="example"/>


  </section>
</template>

<script>
import ExamplesService from '@/services/ExamplesService.js';
import ExampleCard from '@/components/ExampleCard.vue';
export default {
  name: "adminPanel",
  components: {
    ExampleCard,
  },
  created () {
        ExamplesService.getFilteredExamples(this.$store.state.searchString).then( response => this.$store.commit("SET_EXAMPLES_LIST", response.data))
  },
  data () {
    return {
    }
  },
  computed: {
          examplesToApprove () {
              let examplesInitial = this.$store.state.examples
              examplesInitial = examplesInitial.filter(x => x.approved == '0')
              console.log(examplesInitial)
              return examplesInitial
          },
       }
  }

</script>

<style>

</style>