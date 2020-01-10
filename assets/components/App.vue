<template>
  <div class="container">
      <div class="columns col-gapless">
        <div class="navy-col column aside-width col-1">
          <aside class="">
            <div class="icon-container">
              <span><img class="width-42" src="/images/folder.svg" alt=""></span>
              <span><img class="width-42" src="/images/dot.svg" alt=""></span>
              <span> <img class="width-42" src="/images/folder.svg" alt=""></span>
              <span><img class="width-42" src="/images/folder.svg" alt=""></span>
            </div>
          </aside>
        </div>
        
        <div class="the-otherside-width column col-11">

          <div class=" mTP white-col pt-2 info-tab flex-around">
            <h3 class="mL">Tickets</h3><span></span>
            <select name="" id="" class="mR">
              <option value="1">Viewing Most Recent</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </div>

          <div class="table-container white-col">
            <Details></Details>
            
          </div>
        </div>
      </div>
  </div>
</template>

<script>
import Details from "./Details.vue";
export default {
  name: "App",
  data(){
    return{
      tickets: []
    }
  },
  components: {
    Details
  }
}
</script>

<style scoped>
  .aside-width{
    width: 4.333333%;
    height: 100vh!important;
  }
  .the-otherside-width{
    width: 95.666667%;
  }
  .aside-width aside{
    width: 100%;
    height: 100%;
  }
  .navy-col{
    background-color: #021f35;
  }
  .table-container{
    margin: 20px 35px;
    padding: 20px;
  }
  .icon-container{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .width-42{
    width: 32px;
  }
  span img.width-42{
    margin-top: 45px;
  }
  .mL{
  margin-left: 32px;
  }
  .mR{
    margin-right: 32px;
  } 
  .imgspan{
    width: 100%;
    display: flex;
    justify-content: center;
  }
</style>