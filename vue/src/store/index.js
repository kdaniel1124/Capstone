import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'


Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')

let currentUser = null;
if ((localStorage.getItem('user') && localStorage.getItem('user') != 'undefined')) {
  currentUser = JSON.parse(localStorage.getItem('user'));
}

if(currentToken && currentToken != 'undefined') {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {}, // If a user is an admin, their user.role will be 'admin'
    currentExample: {},
    searchString: '',
    examples: [],
    selectedLanguage: "",
    supportedLanguages: [
      {
        Name: 'C#',
        HighlightJs: 'cs',
        Active: true,
      },
      {
        Name: 'Java',
        HighlightJs: 'java',
        Active: true,
      },
      {
        Name: 'SQL',
        HighlightJs: 'sql',
        Active: true,
      },
      {
        Name: 'JavaScript',
        HighlightJs: 'js',
        Active: true,
      },
    ]
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_CURRENT_EXAMPLE(state, example) {
      state.currentExample = example;
    },
    SET_SEARCH_STRING(state, searchString) {
      state.searchString = searchString;
    },
    SET_EXAMPLES_LIST(state, examples) {
      state.examples = examples;
    },
    SET_SELECTED_LANGUAGE(state, language) {
      state.selectedLanguage = language;
    },
    SWAP_LANGUAGE_ACTIVITY(state, name) {
      for (let language of state.supportedLanguages)
      {
        if (language.Name == name) {
          language.Active = !language.Active;
          if(language.Active){
            alert(language.Name + ' has been activated')
          }
          if(!language.Active){
            alert(language.Name + ' has been deactivated')
          }
        }
        
      }
    }
  }
})
