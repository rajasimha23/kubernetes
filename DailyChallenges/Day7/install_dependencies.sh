apt update
apt install python3-pip
apt install python3.11-venv

python3 -m venv .venv
. .venv/bin/activate

cd tutorial
pip install -e .

flask --app flaskr init-db
flask --app flaskr run --debug