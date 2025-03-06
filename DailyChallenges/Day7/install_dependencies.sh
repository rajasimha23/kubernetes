python3 -m venv .venv
. .venv/bin/activate

cd tutorial
pip install -e .

flask --app flaskr init-db
flask --app flaskr run --debug