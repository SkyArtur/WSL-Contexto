from .functions import get_env_path


__all__ = ['COMPOSE_FILE', 'INPUT_FILE_XLSX', 'OUTPUT_FILE_CSV', 'API_ROOT']

API_ROOT = get_env_path('API_LOTOMANIA_PROJECT')
API_FILE_PATH = get_env_path('API_LOTOMANIA_FILE_PATH')
LOTOMANIA_XLSX_PATH = get_env_path('LOTOMANIA_XLSX_FILE_PATH')

COMPOSE_FILE = API_ROOT.joinpath('docker/docker-compose.yml').resolve()
if not COMPOSE_FILE.exists():
    raise FileNotFoundError(f"File {COMPOSE_FILE} not found")

INPUT_FILE_XLSX = LOTOMANIA_XLSX_PATH.joinpath('Lotomania.xlsx').resolve()
if not INPUT_FILE_XLSX.exists():
    raise FileNotFoundError(f"File {INPUT_FILE_XLSX} not found")

OUTPUT_FILE_CSV = API_FILE_PATH.joinpath('lotomania.csv').resolve()
