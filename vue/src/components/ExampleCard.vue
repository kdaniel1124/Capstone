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
        
        <button
          v-if="this.$store.state.user.role === 'admin' && this.example.approved == '0'"
          @click.prevent="approveExample"
          class="btn btn-primary, scrollButton"
          id="edit-button"
        >
          Post
        </button>
        <button
          v-if="this.$store.state.user.role === 'admin' && this.example.approved == '0'"
          @click.prevent="denyExample"
          class="btn btn-primary, scrollButton"
          id="edit-button"
        >
          Deny
        </button>
        
      </div>
    </h2>
    <div class="card-body">
      <pre><code v-bind:class="addClassLogic">{{example.code}}</code></pre>
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
import ExamplesService from "@/services/ExamplesService.js";
export default {
  props: ["example"],
  data() {
    return {
      testString: this.example.attributionUrl,
    };
  },
  methods: {
    //Enters edit example page
    editExample() {  
      this.$store.commit("SET_CURRENT_EXAMPLE", this.example);
      this.$router.push({ name: "updateExample" });
    },
    //Copies code to clipboard
    copyCode() {
      navigator.clipboard.writeText(this.example.code);
      alert('Copied to Clipboard');
    },
    //Approve updates the current examples approved status to "1", public and approved
    //Can only be seen by an admin and if the post is pending approval "0"
    approveExample() {  
      console.log(this.example)
      this.example.approved = 1
      ExamplesService.updateExample(this.example)
        .then(() => {
  
        })
        .catch((err) => console.error("Could not add example :c", err));
    },
    //Deny updates the current examples approved status to "2", private and unapproved
    //Can only be seen by an admin and if the post is pending approval "0"
    denyExample() {  
      console.log(this.example)
      this.example.approved = 2
      ExamplesService.updateExample(this.example)
        .then(() => {
          
        })
        .catch((err) => console.error("Could not add example :c", err));
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
    addClassLogic() {
        switch(this.example.codeLanguage){
          case "C#":
            return "language cs"
          case "Java":
            return "language java";
          case "SQL":
            return "language sql";
          case "JavaScript":
            return "language js";
        }
        return "language autodetect";
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