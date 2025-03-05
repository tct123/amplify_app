import { execSync } from "node:child_process";
import * as path from "node:path";
import { fileURLToPath } from "node:url";
import { defineFunction } from "@aws-amplify/backend";
import { DockerImage, Duration } from "aws-cdk-lib";
import { Code, Function, Runtime } from "aws-cdk-lib/aws-lambda";

const functionDir = path.dirname(fileURLToPath(import.meta.url));

export const filterUsersFunctionHandler = defineFunction(
  (scope) =>
    new Function(scope, "filter-users", {
      handler: "index.handler",
      runtime: Runtime.PYTHON_3_9, // or another supported Python version
      timeout: Duration.seconds(20),
      code: Code.fromAsset(functionDir, {
        bundling: {
          image: DockerImage.fromRegistry("dummy"), // Replace with your desired image if needed
          local: {
            tryBundle(outputDir: string) {
              // Install dependencies from requirements.txt
              execSync(
                `python3 -m pip install -r ${path.join(
                  functionDir,
                  "requirements.txt"
                )} -t ${path.join(outputDir)} --platform manylinux2014_x86_64 --only-binary=:all:`
              );
              // Copy the rest of the code
              execSync(`cp -r ${functionDir}/* ${path.join(outputDir)}`);
              return true;
            },
          },
        },
      }),
    }),
    {
      resourceGroupName: "custom", // Optionally group related resources
    }
);

