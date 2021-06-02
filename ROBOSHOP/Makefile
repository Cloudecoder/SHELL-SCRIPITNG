help:						##This is a HELPFILE to execute
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

frontend:					##enter "make frontend" to execute
	@sh components/frontend.sh

mongodb:					##enter "make mongodb" to execute
	@sh components/mongodb.sh

catalogue:					##enter "make catalogue" to execute
	@sh components/catalogue.sh

redis:						##enter "make redis" to execute
	@sh components/redis.sh

user:						##enter "make user" to execute
	@sh components/user.sh

cart:						##enter "make cart" to execute
	@sh components/cart.sh

mysql:						##enter "make mysql" to execute
	@sh components/mysql.sh

shipping:					##enter "make shipping" to execute
	@sh components/shipping.sh

payment:					##enter "make payment" to execute
	@sh components/payment.sh

rabbitmq:					##enter "make rabbitmq" to execute
	@sh components/rabbitmq.sh

