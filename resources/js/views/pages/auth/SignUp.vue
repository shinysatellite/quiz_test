<template>
  <base-background image="/img/photos/photo28@2x.jpg">
    <b-row no-gutters class="bg-primary-dark-op">
      <!-- Meta Info Section -->
      <b-col
        lg="4"
        class="hero-static d-none d-lg-flex flex-column justify-content-center"
      >
        <div class="p-4 p-xl-5 flex-grow-1 d-flex align-items-center">
          <div class="w-100">
            <router-link
              to="/"
              class="link-fx font-w600 font-size-h2 text-white"
            >
              QUIZ TEST
            </router-link>
            <p class="text-white-75 mr-xl-8 mt-2">
              FAST CORRECT TEST
            </p>
          </div>
        </div>
      </b-col>
      <!-- END Meta Info Section -->

      <!-- Main Section -->
      <b-col
        lg="8"
        class="hero-static d-flex flex-column align-items-center bg-white"
      >
        <div class="p-3 w-100 d-lg-none text-center">
          <router-link to="/" class="link-fx font-w600 font-size-h3 text-dark">
            One<span class="font-w400">UI</span>
          </router-link>
        </div>
        <div class="p-4 w-100 flex-grow-1 d-flex align-items-center">
          <div class="w-100">
            <!-- Header -->
            <div class="text-center mb-5">
              <p class="mb-3">
                <i class="fa fa-2x fa-circle-notch text-primary-light"></i>
              </p>
              <h1 class="font-w700 mb-2">
                Create Account
              </h1>
              <h2 class="font-size-base text-muted mb-3">
                Get your access today in one easy step
              </h2>
            </div>
            <!-- END Header -->

            <!-- Sign Up Form -->
            <b-row no-gutters class="justify-content-center">
              <b-col sm="8" xl="4">
                <b-form @submit.stop.prevent="onSubmit">
                  <div class="form-group">
                    <b-form-input
                      size="lg"
                      class="form-control-alt py-4"
                      id="name"
                      name="name"
                      placeholder="Username"
                      v-model="$v.form.name.$model"
                      :state="!$v.form.name.$error && null"
                      aria-describedby="username-feedback"
                    ></b-form-input>
                  </div>
                  <div class="form-group">
                    <b-form-input
                      type="email"
                      size="lg"
                      class="form-control-alt py-4"
                      id="email"
                      name="email"
                      placeholder="Email"
                      v-model="$v.form.email.$model"
                      :state="!$v.form.email.$error && null"
                      aria-describedby="email-feedback"
                    ></b-form-input>
                  </div>
                  <div class="form-group">
                    <b-form-input
                      type="password"
                      size="lg"
                      class="form-control-alt py-4"
                      id="password"
                      name="password"
                      placeholder="Password"
                      v-model="$v.form.password.$model"
                      :state="!$v.form.password.$error && null"
                      aria-describedby="password-feedback"
                    ></b-form-input>
                  </div>
                  <div class="form-group">
                    <b-form-input
                      type="password"
                      size="lg"
                      class="form-control-alt py-4"
                      id="password_confirmation"
                      name="password_confirmation"
                      placeholder="Confirm Password"
                      v-model="$v.form.password_confirmation.$model"
                      :state="!$v.form.password_confirmation.$error && null"
                      aria-describedby="password2-feedback"
                    ></b-form-input>
                  </div>
                  <div class="form-group">
                    <div
                      class="d-md-flex align-items-md-center justify-content-md-between"
                    >
                      <div>
                        <b-form-checkbox
                          id="terms"
                          name="terms"
                          v-model="$v.form.terms.$model"
                          :state="!$v.form.terms.$error && null"
                          aria-describedby="terms-feedback"
                          >I agree to Terms &amp; Conditions</b-form-checkbox
                        >
                      </div>
                    </div>
                  </div>
                  <div class="form-group text-center mb-0">
                    <b-button type="submit" size="lg" variant="alt-success">
                      <i class="fa fa-fw fa-plus mr-1 opacity-50"></i> Sign Up
                    </b-button>
                  </div>
                </b-form>
              </b-col>
            </b-row>
            <!-- END Sign Up Form -->
          </div>
        </div>
        <div
          class="px-4 py-3 w-100 d-lg-none d-flex flex-column flex-sm-row justify-content-between font-size-sm text-center text-sm-left"
        >
          <p class="font-w500 text-black-50 py-2 mb-0">
            <strong>{{
              $store.getters.appName + " " + $store.getters.appVersion
            }}</strong>
            &copy; {{ $store.getters.appCopyright }}
          </p>
          <ul class="list list-inline py-2 mb-0">
            <li class="list-inline-item">
              <a class="text-muted font-w500" href="javascript:void(0)"
                >Legal</a
              >
            </li>
            <li class="list-inline-item">
              <a class="text-muted font-w500" href="javascript:void(0)"
                >Contact</a
              >
            </li>
            <li class="list-inline-item">
              <a class="text-muted font-w500" href="javascript:void(0)"
                >Terms</a
              >
            </li>
          </ul>
        </div>
      </b-col>
      <!-- END Main Section -->
    </b-row>
  </base-background>
</template>

<script>
// Vuelidate, for more info and examples you can check out https://github.com/vuelidate/vuelidate
import { validationMixin } from "vuelidate";
import { required, minLength, email, sameAs } from "vuelidate/lib/validators";

export default {
  middleware: "guest",
  mixins: [validationMixin],
  data() {
    return {
      form: {
        name: null,
        email: null,
        password: null,
        password_confirmation: null,
        terms: null
      }
    };
  },
  validations: {
    form: {
      name: {
        required,
        minLength: minLength(3)
      },
      email: {
        required,
        email
      },
      password: {
        required,
        minLength: minLength(5)
      },
      password_confirmation: {
        required,
        sameAsPassword: sameAs("password")
      },
      terms: {
        sameAs: sameAs(() => true)
      }
    }
  },
  methods: {
    onSubmit() {
      this.$v.form.$touch();

      if (this.$v.form.$anyError) {
        return;
      }
      this.$store.dispatch("auth/signup", this.form).then(res => {
        this.$router.push({ name: "Dashboard" });
      });
    }
  }
};
</script>
