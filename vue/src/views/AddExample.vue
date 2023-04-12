<template>
<section>
      <h2>New Example Form</h2>
    <add-new-example-form />
</section>
</template>

<script>
import AddNewExampleForm from '@/components/AddNewExampleForm.vue';

export default {
    name: "newExample",
    components: {
        AddNewExampleForm,
    },
    
}
</script>

<style>
h2 {
    display: flex;
    justify-content: center;
    font-family: 'Metal Mania', cursive;
     text-shadow: 2px 2px 2px black;
}
</style>
