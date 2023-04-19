<template>
<section>
    <h2>Edit Example Form</h2>
  <update-example-form />
</section>
</template>

<script>
import UpdateExampleForm from '@/components/UpdateExampleForm.vue'
export default {
    name: "updateExample",
    components: { 
        UpdateExampleForm,
    },
}
</script>

<style>
h2 {
    display: flex;
    justify-content: center;
    font-family: 'DotGothic16', sans-serif;
}
</style>