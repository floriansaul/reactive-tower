# full stack web app reference

## Setup

This project uses the [express](https://expressjs.com/) web framework, and deploys it to AWS using
[terraform](https://www.terraform.io/). In order to run commands locally and run the server locally,
you need to install dependencies:

```
yarn install
```

You can then run the server in localdev with:

```
yarn dev
```

You will also need to [install the terraform CLI](https://www.terraform.io/downloads.html). After
installing the CLI, you need to initialize terraform in the project:

```
terraform init
```

## Deploy to AWS

Before you can deploy to AWS, you need to configure your AWS credentials. **This only needs to be
done once per-project**. It's recommended to use [aws-vault](https://github.com/99designs/aws-vault)
to securely store AWS credentials.

To generate a new set of credentials:

1. go to the AWS console (https://console.aws.amazon.com)
2. in the top right, click on your name
3. click on My Security Credentials
4. click on Access keys
5. click Create New Access Key
6. copy your access key id and secret access key. if using aws-vault, follow the instructions there
   to store them. otherwise you'll need follow the instructions
   [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html#cli-configure-files-methods)
   to store your credentials locally

If using `aws-vault`, deploy with the following command:

```
aws-vault exec <your-profile> --no-session yarn deploy
```

Otherwise, if not using `aws-vault`, you can just deploy with:

```
yarn deploy
```

Terraform will prompt you to accept the proposed changes, enter "yes". After the deployment runs
successfully, it will output the endpoint that the server is reachable at, for example:

```bash
aws-vault exec ryangilbert --no-session -- yarn deploy

... stuff ...

Apply complete! Resources: 11 added, 0 changed, 0 destroyed.

Outputs:

api_function_name = "api"
base_url = "https://95j5v6zhok.execute-api.us-east-1.amazonaws.com/"
✨  Done in 26.47s.
```

## References

- terraform: https://www.terraform.io/
- terraform serverless guide: https://learn.hashicorp.com/tutorials/terraform/lambda-api-gateway
- aws-vault: https://github.com/99designs/aws-vault/
- aws cli: https://aws.amazon.com/cli/
- expressjs: https://expressjs.com/
