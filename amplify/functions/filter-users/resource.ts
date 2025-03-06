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
      runtime: Runtime.PYTHON_3_9,
      timeout: Duration.seconds(20),
      code: Code.fromAsset(functionDir, {
        bundling: {
          // Use a public SAM build image for Python 3.9 for compatibility.
          image: DockerImage.fromRegistry("public.ecr.aws/sam/build-python3.9"),
          local: {
            tryBundle(outputDir: string) {
              // Install dependencies from requirements.txt into the output directory.
              execSync(
                `python3 -m pip install -r ${path.join(
                  functionDir,
                  "requirements.txt"
                )} -t ${outputDir} --platform manylinux2014_x86_64 --only-binary=:all:`
              );
              // Copy all files from the function directory into the output directory.
              execSync(`cp -r ${functionDir}/* ${outputDir}`);
              return true;
            },
          },
        },
      }),
    }),
    {
      resourceGroupName: "custom",
    }
);

