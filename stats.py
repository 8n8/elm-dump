import os

paths = []
for root, dirs, files in os.walk("."):
    for file in files:
        if file.endswith(".elm"):
            paths.append(os.path.join(root, file))

average_path_length = sum(len(path.encode('utf-8')) for path in paths) / len(paths)
print(f'number of Elm files: {len(paths)}')
print(f'average path size: {round(average_path_length)} B')
print(f"total path size: {sum(len(path.encode('utf-8')) for path in paths)} B")

data = ""
for path in paths:
    with (open(path, "r")) as file:
        data += file.read()

print(f"total Elm data size: {len(data.encode('utf-8'))} B")

with open("catted", "w") as file:
    file.write(data)

# remove catted.gzip if it exists
if os.path.exists("catted.gz"):
    os.remove("catted.gz")
# gzip catted
os.system("gzip catted")
# get the size of the gzipped file
gzipped_size = os.path.getsize("catted.gz")
print(f"gzipped Elm data size: {gzipped_size} B")
print(f"compression ratio: {round(gzipped_size / len(data.encode('utf-8')) * 100)}%")


print(f"average Elm file size: {round(len(data.encode('utf-8')) / len(paths))} B")

single_char_counts = {}

for char in data:
    if char in single_char_counts:
        single_char_counts[char] += 1
    else:
        single_char_counts[char] = 1

# lines of code
lines_of_code = data.count("\n")
print(f'lines of code: {lines_of_code}')

# average lines of code per file
average_lines_of_code = lines_of_code / len(paths)
print(f'average lines of code per file: {round(average_lines_of_code)}')

# average line length
lines = data.split("\n")
average_line_length = sum(len(line.encode('utf-8')) for line in lines) / len(lines)
print(f'average line length: {round(average_line_length)} B')

print("Most common characters:")
for char, count in sorted(single_char_counts.items(), key=lambda item: item[1], reverse=True):
    if count > len(data) / 100:
        ch = char
        if char == "\n":
            ch = "\\n"
        print(f"    '{ch}'   {round(count/len(data)*100)}%")
