import Vue from "vue";
import Router from "vue-router";
import Home from "../views/Home.vue";
import Login from "../views/Login.vue";
import Logout from "../views/Logout.vue";
import Register from "../views/Register.vue";
import store from "../store/index";
import NewExample from "../views/AddExample.vue";
import UpdateExample from "../views/UpdateExample.vue";
import AdminPanel from "../views/AdminPanel.vue"
import UserPage from "../views/UserPage.vue"
import DoomTime from "../views/DoomTime.vue"

Vue.use(Router);

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "home",
      component: Home,
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false,
      },
    },
    {
      path: "/new",
      name: "newExample",
      component: NewExample,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "*",
      redirect: "/",
    },
    {
      path: "/update",
      name: "updateExample",
      component: UpdateExample,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: "/admin",
      name: "adminPanel",
      component: AdminPanel,
      meta: {
        requiresAuth: true,
      },
    },
    {
    path: "/user",
    name: "user",
    component: UserPage,
    meta: {
      requiresAuth: true,
    },
  },
    {
      path: "/doom",
      name: "doom",
      component: DoomTime,
      meta: {
        requiresAuth: false,
      },
  },
  ],
});

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some((x) => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === "") {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
