tarpy() {
    tar zcvf "$1" --exclude='__pycache__' --exclude='*.pyc' --exclude='*.pyo' --exclude='.git' --exclude='.ipynb_checkpoints' "$2"
}
