FROM node:20-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps || true
COPY . .
RUN npm run build --if-present || true
RUN if [ -d dist/wfm-frontend/browser ]; then \
    mv dist/wfm-frontend/browser dist/output; \
  else \
    mv dist/wfm-frontend dist/output; \
  fi

FROM nginx:1.25-alpine
COPY --from=build /app/dist/output /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
