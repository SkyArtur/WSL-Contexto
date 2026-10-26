import os
from pathlib import Path


__all__ = ['get_env_path']

def get_env_path(var_name: str) -> Path:
    var_value = os.getenv(var_name)
    if not var_value:
        raise ValueError(f"{var_name} is not defined in the environment variables")

    file_path = Path(var_value).resolve()
    if not file_path.exists():
        raise FileNotFoundError(f"Caminho '{file_path}' não encontrado")

    return file_path
