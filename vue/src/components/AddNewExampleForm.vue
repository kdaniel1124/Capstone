<template>
  <form>
     <div id="radio">
        <label for="radio">
          <input type="radio" id="radios" v-model.number="example.approved" value= 2 />
          Set private</label>
        
        <label for="radio"> 
          <input type="radio" id="radios" v-model.number="example.approved" value= 0 />
         Set public </label>
       
      </div>
    <div class="form-group">
      <label for="languageSelect">Programming Language</label>
      <!-- Programming Language Selector Logic -->
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
        <option
          v-for="language in ActiveLanguages"
          :key="language.languageName"
          :value="language.languageName"
        >
          {{ language.languageName }}
        </option>
        <!-- Old Search Method -->
        <!--<option value="C#">C#</option>
        <option value="Java">Java</option>
        <option value="JavaScript">JavaScript</option>
        <option value="SQL">SQL</option>-->
      </select>
      <!-- Post Title Logic -->
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label"
          >Post Title</label
        >
        <input
          type="text"
          maxlength="50"
          class="form-control"
          id="exampleFormControlInput1"
          placeholder="Example Title (Maximum character limit 50)"
          v-model="example.title"
        />
      </div>
      <!--  --> 
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
      <!--   Author will always be set to the user henceforth 4.19.23
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Author</label>
        <input
          type="text"
          class="form-control"
          id="exampleFormControlInput2"
          placeholder="(Optional)"
          v-model="example.attributionAuthor"
          
        />
        
      </div> -->

      <!-- URL Input, will provide URL under post for reference --> 

      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">URL</label>
        <input
          type="text"
          class="form-control"
          id="exampleFormControlInput2"
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
        @click.prevent="addNewExample()"
      />
    </div>
  </form>
</template>

<script>
import ExamplesService from "@/services/ExamplesService.js";

export default {
  data() {
    return {
      checked: 0,
      example: {
        exampleId: 0,
        codeLanguage: "",
        title: "",
        code: "",
        attributionAuthor: this.$store.state.user.username,
        attributionUrl: "",
        approved: 0,
      },
    };
  },
  computed: {
    isFormValid() {
      return (
        this.example.codeLanguage && this.example.title && this.example.code
      );
    },
    ActiveLanguages() {
      return this.$store.state.supportedLanguages.filter(
        (language) => language.active
      );
    },
  },
  methods: {
    addNewExample() {
      //let newExample = {id: this.id, language: this.language, title: this.title, codeBody: this.codeBody}

      ExamplesService.addExample(this.example)
        .then(() => {
          this.$router.push({ name: "home" });
        })
        .catch((err) => console.error("Could not add example :c", err));
    },
  },
};
</script>

<style>
.form-group {
  display: flex;
  flex-direction: column;
  margin: auto;
}
#submitButton {
  width: 150px;
  height: 40px;
  margin: auto;
}

#radio > label {
  margin-left: 15px;
  font-family: 'DotGothic16', sans-serif;
  background-image: url("../../public/button.png");
  background-position: 15px center, center center;
  background-repeat: no-repeat;
  background-size:90%;
  color:black;
  font-weight: bold;
  width: 115px;
  height: 32px; 
}

</style>