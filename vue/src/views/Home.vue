<template>
  <div class="home">
    <h1>.NetCronomicon</h1>
    <p>A Tome revealing all information in the coding world.</p>
    
    <example-card v-for="example in examples" :key="example.exampleId" :example="example"/>

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
    examples: []
  }
},
  created() {
    ExamplesService.getAllExamples()
              .then(response => {
                this.examples = response.data;
              })
}
};

</script>
<style>
h1, p {
  display: flex;
  justify-content: center;
}
</style>
