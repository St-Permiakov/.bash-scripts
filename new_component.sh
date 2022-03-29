#!/bin/bash

for name in $@
do
	path=${PWD}/$name

	# Set the color variable
	green='\033[0;32m'
	# Clear the color after that
	clear='\033[0m'

	mkdir $path

	# Create index file for export
	echo "export * from './$name';" > $path/index.ts
	# Create Component file with default template
	echo "import React from 'react';

	import styles from './$name.scss';

	export const $name = () => {
		return (
			<div className={styles.root}>Component $name</div>
		);
	};" > $path/$name.tsx
	# Create styles module
	echo ".root {}" > $path/$name.scss
done

# Done!
echo -e "${green}Done!${clear}"
