from pathlib import Path
from dotenv import load_dotenv

from .functions import get_env_var, get_file_path


__all__ = ['COMPOSE_FILE', 'INPUT_FILE_XLSX', 'OUTPUT_FILE_CSV', 'API_ROOT']

ROOT = Path(__file__).parent.parent.parent.parent

load_dotenv(ROOT.joinpath('.env'))

API_ROOT = get_env_var('API_LOTOMANIA_PROJECT')
API_FILE_PATH = get_env_var('API_LOTOMANIA_FILE_PATH')
LOTOMANIA_XLSX_PATH = get_env_var('LOTOMANIA_XLSX_FILE_PATH')

API_ROOT = get_file_path(API_ROOT)
API_FILE_PATH = get_file_path(API_FILE_PATH)
LOTOMANIA_XLSX_PATH = get_file_path(LOTOMANIA_XLSX_PATH)

COMPOSE_FILE = API_ROOT.joinpath('docker/docker-compose.yml').resolve()
if not COMPOSE_FILE.exists():
    raise FileNotFoundError(f"File {COMPOSE_FILE} not found")

INPUT_FILE_XLSX = LOTOMANIA_XLSX_PATH.joinpath('Lotomania.xlsx').resolve()
if not INPUT_FILE_XLSX.exists():
    raise FileNotFoundError(f"File {INPUT_FILE_XLSX} not found")

OUTPUT_FILE_CSV = API_FILE_PATH.joinpath('lotomania.csv').resolve()
