import os
import re

# Specify the folder containing the files
folder_path = "./../__mdx/docs/guides"

# Regular expression to match Markdown image tags
image_tag_pattern = r'!\[.*?\]\((.*?)\)'

# List to store the extracted image links
image_links = []

# Loop through all files in the folder
for file_name in os.listdir(folder_path):
    file_path = os.path.join(folder_path, file_name)

    # Only process files (skip directories)
    if os.path.isfile(file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

            # Find all matches of the image tag pattern
            matches = re.findall(image_tag_pattern, content)
            for match in matches:
                # Extract the link part (before optional title in quotes)
                # Handles cases like `(/img/header_capital.jpg "Capital Warfare")`
                link = match.split(' ')[0]

                # Only include links containing '/img'
                if '/img' in link:
                    image_links.append(link)

# Print or save the extracted image links
print("Extracted Image Links):")
for link in image_links:
    print(link)
