#!/bin/bash
# Made by Sam Wattoo
# Copyright WapKiz Ltd
# Version: 1.1 
echo "Lets start..."
# Let's install the CSF Vesta UI!  
function Vestawpinstaller() { 
echo "VestaCP Installing WordPress Installer...." 
mkdir /usr/local/vesta/web/list/wp 
chmod 777 /usr/local/vesta/web/list/wp
wget https://raw.githubusercontent.com/it-toppp/wp-installer/master/index.php -O /usr/local/vesta/web/list/wp/index.php 
wget https://raw.githubusercontent.com/it-toppp/wp-installer/master/api.php -O /usr/local/vesta/web/list/wp/api.php 
wget https://raw.githubusercontent.com/it-toppp/wp-installer/master/v-sam-create-wp -O /usr/local/vesta/bin/v-sam-create-wp 
chmod 755 /usr/local/vesta/bin/v-sam-create-wp 
# Chmod files 
chmod 755 /usr/local/vesta/web/list/wp  
chmod 644 /usr/local/vesta/web/list/wp/index.php
chmod 644 /usr/local/vesta/web/list/wp/api.php
# Add the link to the panel.html file 
if grep -q 'WP' /usr/local/vesta/web/templates/admin/panel.html; then
		echo 'Already there.'
	else 
sed -i '/<div class="l-menu clearfix noselect">/a <div class="l-menu__item <?php if($TAB == "WP" ) echo "l-menu__item--active"; ?>"><a href="/list/wp/" target="_blank"><?=__("WP Install")?></a></div>' /usr/local/vesta/web/templates/admin/panel.html;
fi
echo "Done! Check VestaCP!" 
}
Vestawpinstaller
