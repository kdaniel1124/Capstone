<template>
  <form>
    <div class="form-group">
      <label for="languageSelect">Programming Language</label>
      <select
        id="languageSelect"
        class="form-select"
        aria-label="Default select example"
        v-model="example.codeLanguage"
      >
        <option selected>Select your programming language</option>
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
        <input class="btn btn-secondary" type="submit" value="Submit" @click.prevent="addNewExample()">
      </div>
    </div>
  </form>
</template>

<script>
import ExamplesService from '@/services/ExamplesService.js'

export default {
    data() {
        return {
            example: {
                exampleId: 0,
                codeLanguage: "",
                title: "",
                code: ""
            }
        }
    },
    methods: {
        addNewExample() {
            //let newExample = {id: this.id, language: this.language, title: this.title, codeBody: this.codeBody}

            ExamplesService.addExample(this.example)
                            .then(response => {
                                console.log('Added Post!', response.data)
                            })
                            .catch(err => console.error('Could not add example :c', err))
        }
    }
};
</script>

<style>
</style>