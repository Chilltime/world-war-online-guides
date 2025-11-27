#!/usr/bin/env bash

pip install mkdocs-material \
	mkdocs-minify-plugin mkdocs-redirects mkdocs-git-revision-date-localized-plugin mkdocs-git-committers-plugin-2

# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh -y

echo "Start project with: python3 -m mkdocs serve"