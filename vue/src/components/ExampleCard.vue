<template>
  <div class="card example">
    <h2 class="card-header">{{ example.codeLanguage }}<button v-if="this.$store.state.user.role==='admin'" @click.prevent="editExample" class="btn btn-primary" id="edit-button">Edit</button></h2>
    
    <div class="card-body">
      <h2 class="card-title">{{ example.title }}</h2>
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
  border-radius: px;
  margin: 2%;
  display: flex;
  justify-content: center;
}

.card-header {
  display: flex;
  justify-content: space-between;
  color: $highlight;
  background-color: $accentLight;
}
.card-title {
  color: $dark;
}
.card-body {
  background-color: $light;
  color: $dark;
}
#edit-button {
    
 
}
</style>