count=$1
cat global.cfg frontend.cfg backend.cfg > haproxy.cfg 
for foo in `seq 1 $count`;
do 
	cp haproxy.cfg haproxy-$foo.cfg;
	sed -i "s/haproxy_admin1.sock/ha$foo\/admin.sock/" haproxy-$foo.cfg; 
	sed -i "s/bind \*:81/bind \*:8$foo/" haproxy-$foo.cfg; 
	mkdir -p /var/run/ha$foo
	touch /var/run/ha$foo/pid
	haproxy -f /etc/haproxy/haproxy-$foo.cfg -p /var/run/ha$foo/pid -sf `cat /var/run/ha$foo/pid`
done
