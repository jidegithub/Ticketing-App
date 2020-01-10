<template>
  <div>
    <Show v-if="showTable"></Show>
    <Form v-if="showForm"></Form>
  </div>
  
</template>

<script>
import Show from "./Show.vue";
import Form from "./Form.vue";
export default {
  data(){
    return{
      showForm: false,
      showTable: true
    }
  },
  components:{
    Show,
    Form
  }
}
</script>

<style>

</style>
