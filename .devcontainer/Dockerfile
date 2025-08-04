FROM node:22-bookworm AS node-stage

FROM mcr.microsoft.com/devcontainers/go:1-1.24-bookworm

# Copy Node.js binaries and libraries
COPY --from=node-stage /usr/local/bin/node /usr/local/bin/
COPY --from=node-stage /usr/local/bin/npm /usr/local/bin/
COPY --from=node-stage /usr/local/bin/npx /usr/local/bin/
COPY --from=node-stage /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node-stage /usr/local/include/node /usr/local/include/node

# Create symbolic links for npm
RUN ln -sf /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -sf /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

# Update npm and install claude-code
RUN npm install -g npm@11.5.1 @anthropic-ai/claude-code
