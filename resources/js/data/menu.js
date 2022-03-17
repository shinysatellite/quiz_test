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
          name: "Questions & Answers",
          to: "/admin/quizzes"
        },
        {
          name: "Active Quiz Management",
          to: "/admin/quiz_manage"
        },
        {
          name: "Test Result",
          to: "/admin/result"
        }
      ]
    }
  ]
};
