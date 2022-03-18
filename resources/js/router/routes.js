// Main layouts
import LayoutBackend from "@/layouts/variations/Backend.vue";
import LayoutSimple from "@/layouts/variations/Simple.vue";
import LayoutFrontend from "@/layouts/variations/Frontend.vue";

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

const Results = () =>
  import(
    /* webpackChunkName: "auth-signup3" */ "@/views/pages/admin/Results.vue"
  );

const QuizManagement = () =>
  import(
    /* webpackChunkName: "auth-signup3" */ "@/views/pages/admin/QuizManagement.vue"
  );

const Test = () =>
  import(
    /* webpackChunkName: "auth-signup3" */ "@/views/pages/candidate/Test.vue"
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
    component: LayoutFrontend,
    meta: {
      activeOnly: true
    },
    children: [
      {
        path: "/welcome",
        name: "Home",
        component: Landing
      },
      {
        path: "/test",
        name: "Test",
        component: Test
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
        path: "admin/quizzes",
        name: "Quizzes",
        component: Quizzes,
        meta: {
          adminOnly: true
        }
      },
      {
        path: "admin/quiz_manage",
        name: "QuizManagement",
        component: QuizManagement,
        meta: {
          adminOnly: true
        }
      },
      {
        path: "admin/result",
        name: "Results",
        component: Results,
        meta: {
          adminOnly: true
        }
      }
    ]
  }
];
