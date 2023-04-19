import axios from 'axios';

export default {
    getAllLanguages() {
        return axios.get('languages');
    },

    updateLanguage(updatedLanguage){
        return axios.put('languages', updatedLanguage);
    }

}
