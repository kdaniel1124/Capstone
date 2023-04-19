import axios from 'axios';

export default {
    //Unused at the moment, returns all from database (DB)
    getAllExamples() {
        return axios.get('examples');
    },
    //Adds example to DB
    addExample(example) {
        return axios.post('examples', example);
    },
    //Updates example in DB with payload
    updateExample(example) {
        return axios.put('examples', example);
    },
    //Gets example list from DB based on filtered criteria (see home for logic)
    getFilteredExamples(searchString) {
        return axios.get('examples/filtered?searchstring=' + searchString)
    },
    //Deletes an example from the DB
    deleteExample(example) {
        return axios.get('examples', example)
    }
}