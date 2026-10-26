import os
from pathlib import Path


__all__ = ['get_env_var', 'get_file_path']

def get_env_var(var_name: str) -> str:
    var_value = os.getenv(var_name)
    if not var_value:
        raise ValueError(f"{var_name} is not defined in the environment variables")
    return var_value

def get_file_path(var_name: str) -> Path:
    file_path = Path(var_name).resolve()
    if not file_path.exists():
        raise FileNotFoundError(f"Caminho '{file_path}' não encontrado")
    return file_path
