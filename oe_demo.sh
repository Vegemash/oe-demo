backup_dir= pwd
echo "$backup_dir"
if [ ! -f ./openeyes_backup.sql ]; then
	mysqldump --routines --triggers --ignore-table=openeyes.event_image -u openeyes -popeneyes openeyes > ./"openeyes_backup.sql"
fi

while (true) do
	pushd /var/www/openeyes
	./vendor/behat/behat/bin/behat ./features/bootstrap/Features/v3-ui
	./vendor/behat/behat/bin/behat ./features/bootstrap/Features/CERA
	popd
	mysql -u openeyes -popeneyes openeyes < ./scrub_behat_effects.sql
	sleep 1
done

