<template>
  <div class="home">
    <h1>.NetCronomicon</h1>
    <p>A Tome revealing all information in the coding world.</p>
    
    <example-card v-for="example in this.$store.state.examples" :key="example.exampleId" :example="example"/>

  </div>
</template>

<script>
import ExamplesService from '@/services/ExamplesService.js';
import ExampleCard from '@/components/ExampleCard.vue';
export default {
  name: "home",
  components: {
    ExampleCard,
  },

data() {
  return {
  }
},
  created() {
    ExamplesService.getFilteredExamples(this.$store.state.searchString).then( response => this.$store.commit("SET_EXAMPLES_LIST", response.data))
}
};

</script>
<style>
h1, p {
  display: flex;
  justify-content: center;
  font-family: 'Metal Mania', cursive;
  text-shadow: 2px 2px 2px black;
}
h1 {
    font-size: 50px;
}
p {
    font-size: 35px;
}
</style>
