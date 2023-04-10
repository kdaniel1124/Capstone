<template>
  <div class="card example">
      <h2 class="card-header">{{example.codeLanguage}}</h2>
      <div class="card-body">
          <h2 class="card-title">{{example.title}}</h2>
          <pre><code class="language-csharp">{{example.code}}</code></pre>
        </div>
  </div>
</template>

<script>
export default {
props: ['example']
}
</script>


<style lang="scss">

@import '@/styles/colors.scss';


 .card {
    border: 2px solid black;
    border-radius: 10px;
    width: 80%;
    height: 80%;
    margin: 2%;
}
.card-header{
    color: $highlight;
    background-color: $accentLight;
}
.card-title {
    color: $dark;
}
.card-body {
   background-color: $light;
   color: $dark;
}
</style>