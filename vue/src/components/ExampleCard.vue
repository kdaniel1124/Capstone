<template>
  <div class="card example">
    <h2 class="card-header">
      {{ example.codeLanguage }}
      <h3>{{ example.title }}</h3>
      <div>
        <button class="btn btn-primary, scrollButton" @click.prevent="copyCode">
          Copy
        </button>
        <button
          v-if="this.$store.state.user.role === 'admin'"
          @click.prevent="editExample"
          class="btn btn-primary, scrollButton"
          id="edit-button"
        >
          Edit
        </button>
      </div>
    </h2>
    <div class="card-body">
      <pre><code class="language autodetect">{{example.code}}</code></pre>
      <a v-if="isValidUrl" class="card-attribution" v-bind:href="testString">{{
        example.attributionUrl
      }}</a>
      <p v-if="!isValidUrl">- {{ example.attributionUrl }}</p>
      <p v-if="example.attributionAuthor">{{ example.attributionAuthor }}</p>
    </div>
  </div>
</template>

<script>
let hljs = require('highlight.js')
export default {
  props: ["example"],
  data() {
    return {
      testString: this.example.attributionUrl,
    };
  },
  methods: {
    editExample() {  
      this.$store.commit("SET_CURRENT_EXAMPLE", this.example);
      this.$router.push({ name: "updateExample" });
    },
    copyCode() {
      navigator.clipboard.writeText(this.example.code);
      alert('Copied to Clipboard');
    },
  },
  mounted() {
    hljs.highlightAll()
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
  background-image: url("../../public/stone2.jpg");
  margin-bottom: 5%;
}

.card-header {
  display: flex;
  justify-content: space-between;
  color: $highlight;
  background-color: $accentLight;
  background-image: url("../../public/stone2.jpg");
  text-shadow: 2px 2px 2px black;
}
.card-title {
  color: $dark;
}
.card-body {
  background-color: rgb(105, 105, 105);
  color: $dark;
  border: 4px solid black;
}
#editButton {
  background-size: cover;
}
</style>