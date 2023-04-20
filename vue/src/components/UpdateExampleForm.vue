<template>
  <form>
    <div class="form-group">
      <label for="languageSelect">Programming Language</label>
      <select
        id="languageSelect"
        class="form-select"
        aria-label="Default select example"
        v-model="example.codeLanguage"
        name="languageSelect"
      >
        <option select disabled value="">
          Please select your programming language
        </option>
        <option value="C#">C#</option>
        <option value="Java">Java</option>
        <option value="JavaScript">JavaScript</option>
        <option value="SQL">SQL</option>
      </select>
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label"
          >Post Title</label
        >
        <input
          type="text"
          class="form-control"
          id="exampleFormControlInput1"
          maxlength="50"
          placeholder="Example Title"
          v-model="example.title"
        />
      </div>
      <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label"
          >Code Body</label
        >
        <textarea
          class="form-control"
          id="exampleFormControlTextarea1"
          rows="3"
          placeholder="Your code goes here!"
          v-model="example.code"
        ></textarea>
      </div>
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label"
          >Author</label
        >
        <input
          type="text"
          class="form-control"
          id="exampleFormControlInput2"
          placeholder="(Optional)"
          v-model="example.attributionAuthor"
        />
      </div>
      <div class="mb-4">
        <label for="exampleFormControlInput1" class="form-label"
          >URL</label
        >
        <input
          type="text"
          class="form-control"
          id="exampleFormControlInput3"
          placeholder="(Optional)"
          v-model="example.attributionUrl"
        />
      </div>

      <input
        id="submitButton"
        class="btn btn-secondary, scrollButton"
        type="submit"
        :disabled="!isFormValid"
        value="Submit"
        @click.prevent="updateExample()"
      />
    </div>
  </form>
</template>

<script>
import ExamplesService from "@/services/ExamplesService.js";

export default {
  data() {
    return {
      example: {
        exampleId: 0,
        codeLanguage: "",
        title: "",
        code: "",
        attributionAuthor: "",
        attributionUrl: "",
      },
    };
  },
  computed: {
    isFormValid() {
      return (
        this.example.codeLanguage && this.example.title && this.example.code
      );
    },
  },
  methods: {
   updateExample() {
      //let newExample = {id: this.id, language: this.language, title: this.title, codeBody: this.codeBody}
      console.log(this.example)
      ExamplesService.updateExample(this.example)
        .then(() => {
          this.$router.push({ name: "home" });
        })
        .catch((err) => console.error("Could not add example :c", err));
    },
  },
  created() {
    this.example = this.$store.state.currentExample
  }
};
</script>

<style>
#submitButton {
  width: 150px;
  height: 40px;
  margin: auto;
}
</style>