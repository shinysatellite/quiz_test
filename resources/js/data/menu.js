/*
 * Main and demo navigation arrays
 */

export default {
  main: [
    {
      name: "Dashboard",
      to: "/backend/dashboard",
      icon: "si si-speedometer"
    },

    {
      name: "Management",
      icon: "si si-magnet",
      subActivePaths: "/admin",
      sub: [
        {
          name: "Dashboard",
          to: "/admin/quizzes"
        },
        {
          name: "Search",
          to: "/backend-boxed/search"
        },
        {
          name: "Simple 1",
          to: "/backend-boxed/simple1"
        },
        {
          name: "Simple 2",
          to: "/backend-boxed/simple2"
        },
        {
          name: "Image 1",
          to: "/backend-boxed/image1"
        },
        {
          name: "Image 2",
          to: "/backend-boxed/image2"
        }
      ]
    }
  ]
};
