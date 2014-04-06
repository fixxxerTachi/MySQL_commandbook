<?php
try{
	$dbh=new PDO('mysql:host=localhost;dbname=prac_mysql','tachi','tachi',array(
		PDO::ATTR_PERSISTENT=>true
	));
}catch(PDOException $e){
	echo 'error: ' . $e->getMessage();
	die();
}
try{
	$dbh->beginTransaction();
	$sth=$dbh->prepare('insert into zoo set animal_c= ? , age_c = ?');
	//$sth->execute(array('monkey','hoge'));
	$animal='Monkwy';
	$age='Mano_age';
	$sth->bindParam(1,$animal,PDO::PARAM_STR,12);
	$sth->bindParam(2,$age,PDO::PARAM_INT);
	$sth->execute();
	$dbh->commit();
	echo 'succeed!!!';
}catch(PDOException $e){
	$dbh->rollBack();
	echo "failed: $e->getMessage";
}

