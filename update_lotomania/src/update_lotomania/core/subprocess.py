import subprocess

from .config import COMPOSE_FILE, API_ROOT

__all__ = ['handler_atualizar_sorteios']

def handler_atualizar_sorteios():

    subprocess.run(
        [
            "docker", "compose", "-f",
            str(COMPOSE_FILE),
            "exec", "-T",
            "api",
            "python", "manage.py", "atualizar_sorteios"
        ],
        cwd=API_ROOT,
        check=True
    )