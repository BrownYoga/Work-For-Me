FROM node:20-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --legacy-peer-deps
ENV HUSKY=0
COPY package.json package-lock.json* ./
RUN npm install --legacy-peer-deps --ignore-scripts
COPY . .
RUN npm run build --if-present

FROM nginx:1.25-alpine
COPY --from=build /app/dist/wfm-frontend /usr/share/nginx/html
COPY --from=build /app/dist/wfm-frontend/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
