#!/bin/bash
cat <<'EOF'
<!DOCTYPE html>
<html>
	<head>
		<style>
			body {
				background-color: black;
				color: white;
				padding: 0;
				margin: 5px;
			}
			p { margin: 5px; }
			a {
				color: #88f;
			}
			a:hover { text-decoration: none; }
			.cell {
				display: inline-block;
				width: 320px;
				height: 320px;
				text-align: center;
				padding: 0;
			}
			.cell a img {
				vertical-align: middle;
			}
		</style>
		<meta charset="UTF-8">
	</head>
	<body
EOF

for zipfile in *.zip
do
	test "X$zipfile" = '*.zip' && break;
	zipfilesize="$(perl -e 'printf "%.1f", (-s $ARGV[0]) / 1024 / 1024' "$zipfile")"
	cat <<-EOF
		><p
		>Download <a href="$zipfile">&#x21E9; $zipfile</a
		> ($zipfilesize MB)</p
	EOF
done

for file in imgs/*.JPG
do
	thumbfile="$(echo $file | sed -e 's/.JPG$/.320.jpg/')"
	echo "><span class=cell><a href='$file'><img src='$thumbfile'></a></span"
done

cat <<'EOF'
></body>
</html>
EOF
