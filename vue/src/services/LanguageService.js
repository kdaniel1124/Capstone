import axios from 'axios';

export default {
    //Gets all languages from the language table in database 
    getAllLanguages() {
        return axios.get('languages');
    },
    //Turns the language On/Off for posting in the database
    updateLanguage(updatedLanguage){
        return axios.put('languages', updatedLanguage);
    }

}
