<template>
  <router-view></router-view>
</template>

<script>

export default {
  name: 'App',
  components: {
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html,
body {
  height: 100%;
  width: 100%;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  height: 100%;
  width: 100%;
}

::-webkit-scrollbar {
  height: 12px;
  width: 14px;
  background: rgba(0, 0, 0, 0);
  z-index: 12;
  overflow: visible
}

::-webkit-scrollbar-thumb {
  width: 10px;
  background-color: #434953;
  border-radius: 10px;
  z-index: 12;
  border: 4px solid rgba(0, 0, 0, 0);
  background-clip: padding-box;
  transition: background-color .32s ease-in-out;
  margin: 4px;
  min-height: 32px;
  min-width: 32px
}

::-webkit-scrollbar-thumb:hover {
  background-color: #4e5157
}

::-webkit-scrollbar-corner {
  background: #202020
}

::selection {
  background: #54a5d4;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, .6666666667);
  color: #fff
}
</style>
