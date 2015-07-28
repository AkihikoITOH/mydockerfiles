# [AWS Command Line Interface ](http://aws.amazon.com/cli/)

## Build

```
cp config.sample config.production
```

and fill in `output`, `region`, `aws_access_key_id`, `aws_secret_access_key` with your own.

```
docker build -t awscli .
# OR
sh ./build.sh
```

## Run
```
./aws [options] <command> <subcommand> [parameters]
```
