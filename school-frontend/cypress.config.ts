import { defineConfig } from "cypress";
import createBundler from "@bahmutov/cypress-esbuild-preprocessor";
import * as addCucumberPreprocessorPlugin from "@badeball/cypress-cucumber-preprocessor";
import createEsbuildPlugin from "@badeball/cypress-cucumber-preprocessor/esbuild";

export default defineConfig({
  e2e: {
    // hem .cy.js hem .feature dosyalarını tanıyalım
    specPattern: [
      "cypress/e2e/**/*.cy.{js,ts}",
    ],

    // TypeScript tip uyarısı çıkarsa ignore edebilirsin (aşağıya ekledik)
    // @ts-ignore
    stepDefinitions: "cypress/e2e/features/step_definitions/**/*.js",

    async setupNodeEvents(on, config) {

      await addCucumberPreprocessorPlugin.addCucumberPreprocessorPlugin(on, config);


      on(
        "file:preprocessor",
        createBundler({
          plugins: [createEsbuildPlugin(config)],
        })
      );

      return config;
    },
  },
});
