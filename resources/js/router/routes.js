// Main layouts
import LayoutBackend from "@/layouts/variations/Backend.vue";
import LayoutSimple from "@/layouts/variations/Simple.vue";

// Frontend: Landing
const Landing = () => import("@/views/Landing.vue");

// Backend: General
const Dashboard = () =>
  import(
    /* webpackChunkName: "pages-dashboard", webpackPrefetch: true */ "@/views/Dashboard.vue"
  );

// Pages: Auth
const AuthSignIn = () =>
  import(
    /* webpackChunkName: "auth-signin3" */ "@/views/pages/auth/SignIn.vue"
  );
const AuthSignUp = () =>
  import(
    /* webpackChunkName: "auth-signup3" */ "@/views/pages/auth/SignUp.vue"
  );

const Quizzes = () =>
  import(
    /* webpackChunkName: "auth-signup3" */ "@/views/pages/admin/Quizzes.vue"
  );

export default [
  {
    path: "/",
    component: LayoutSimple,
    meta: {
      guestOnly: true
    },
    children: [
      {
        path: "/",
        name: "Home",
        component: Landing
      },
      {
        path: "login",
        name: "login",
        component: AuthSignIn
      },
      {
        path: "register",
        name: "register",
        component: AuthSignUp
      }
    ]
  },
  {
    path: "/",
    component: LayoutBackend,
    meta: {
      activeOnly: true
    },
    children: [
      {
        path: "admin",
        name: "Dashboard",
        component: Dashboard
      },
      {
        path: "admin/quizzes",
        name: "Quizzes",
        component: Quizzes,
        meta: {
          adminOnly: true
        }
      }
    ]
  }
];
