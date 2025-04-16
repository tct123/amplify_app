import { execSync } from "node:child_process";
import * as path from "node:path";
import { fileURLToPath } from "node:url";
import { defineFunction } from "@aws-amplify/backend";
import { DockerImage, Duration } from "aws-cdk-lib";
import { Code, Function, Runtime } from "aws-cdk-lib/aws-lambda";
import { PolicyStatement } from "aws-cdk-lib/aws-iam";

const functionDir = path.dirname(fileURLToPath(import.meta.url));

export const matchUsers = defineFunction(
  (scope) => {
    const fn = new Function(scope, "matchUsers", {
      handler: "index.handler",
      runtime: Runtime.PYTHON_3_9,
      timeout: Duration.seconds(20),
      code: Code.fromAsset(functionDir, {
        bundling: {
          image: DockerImage.fromRegistry("public.ecr.aws/sam/build-python3.9"),
          local: {
            tryBundle(outputDir: string) {
              execSync(
                `python3 -m pip install -r ${path.join(
                  functionDir,
                  "requirements.txt"
                )} -t ${outputDir} --platform manylinux2014_x86_64 --only-binary=:all:`
              );
              execSync(`cp -r ${functionDir}/* ${outputDir}`);
              return true;
            },
          },
        },
      }),
      environment: {
        TABLE_NAME: 'User-wzrxyxdpvjfbvd57ueidm4kch4-NONE',
      },
    });

    fn.addToRolePolicy(
      new PolicyStatement({
        actions: [
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
        ],
        resources: [
          "arn:aws:dynamodb:eu-north-1:221082173109:table/User-wzrxyxdpvjfbvd57ueidm4kch4-NONE",
          "arn:aws:dynamodb:eu-north-1:221082173109:table/User-wzrxyxdpvjfbvd57ueidm4kch4-NONE/index/*",
        ],
      })
    );

    return fn;
  },
  {
    resourceGroupName: "custom",
  }
);
