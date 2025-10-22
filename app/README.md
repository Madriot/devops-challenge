
#### Prerequisites
- node >= 22
- yarn 4.9.4
- vim (or any other editor)

#### How to run locally (Linux)

1. Create the environment file
```
cd app/
touch .env.dev

# Add the environment variables
echo LOG_LEVEL=DEBUG >> .env.dev
```

2. Install all packages
``` 
yarn install
```

3. Run app locally
``` 
yarn dev
```

