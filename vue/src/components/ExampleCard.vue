<template>
  <div class="card example">
    <h2 class="card-header">{{ example.codeLanguage }} <h3>{{ example.title }}</h3><button v-if="this.$store.state.user.role==='admin'" @click.prevent="editExample" class="btn btn-primary, scrollButton" id="edit-button">Edit</button></h2>
    <div class="card-body">
      <pre><code class="language-csharp">{{example.code}}</code></pre>
      <a v-if="isValidUrl" class="card-attribution" v-bind:href="testString">{{ example.attribution }}</a>
      <p v-if="!isValidUrl">- {{example.attribution}}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: ["example"],
  data() {
    return {
      testString: this.example.attribution,
    };
  },
  methods: {
    editExample() {
      this.$store.commit('SET_CURRENT_EXAMPLE', this.example);
        this.$router.push({name: 'updateExample'});
    }
  },
  computed: {
    isValidUrl() {
      var inputElement = document.createElement("input");
      inputElement.type = "url";
      inputElement.value = this.testString;

      if (!inputElement.checkValidity()) {
        return false;
      } else {
        return true;
      }
    },
  },
};
</script>


<style lang="scss">
@import "@/styles/colors.scss";

.card {
 border: 4px solid black;
  border-radius: 5%;
  padding: 15px;
  margin-top: 5%;
  background-image: url("c:/Users/Student/source/repos/capstone-team-bravo/vue/public/stone.png");
  
}


.card-header {
  display: flex;
  justify-content: space-between;
  color: $highlight;
  background-color: $accentLight;
  background-image: url("c:/Users/Student/source/repos/capstone-team-bravo/vue/public/stone.png");
  text-shadow: 2px 2px 2px black;
}
.card-title {
  color: $dark;
}
.card-body {
  background-color: $light;
  color: $dark;
  border: 4px solid black;
}

</style>