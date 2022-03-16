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

// Pages: Various
const PagesVariousMaintenance = () =>
  import("@/views/pages/various/Maintenance.vue");
const PagesVariousStatus = () => import("@/views/pages/various/Status.vue");
const PagesVariousComingSoon = () =>
  import(
    /* webpackChunkName: "various-coming-soon" */ "@/views/pages/various/ComingSoon.vue"
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
const AuthReminder = () =>
  import(
    /* webpackChunkName: "auth-reminder3" */ "@/views/pages/auth/Reminder.vue"
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
      },
      {
        path: "maintenance",
        name: "Pages Various Maintenance",
        component: PagesVariousMaintenance
      },
      {
        path: "status",
        name: "Pages Various Statuc",
        component: PagesVariousStatus
      },
      {
        path: "coming-soon",
        name: "Pages Various Coming Soon",
        component: PagesVariousComingSoon
      },
      {
        path: "forgotten-password",
        name: "AuthReminder",
        component: AuthReminder
      }
    ]
  },
  {
    path: "/",
    component: LayoutBackend,
    meta: {
      authOnly: true
    },
    children: [
      {
        path: "dashboard",
        name: "Dashboard",
        component: Dashboard,
        meta: {
          activeOnly: true
        }
      }
    ]
  }
];
