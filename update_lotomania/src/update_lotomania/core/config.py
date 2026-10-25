import os
from pathlib import Path
from dotenv import load_dotenv


__all__ = ['COMPOSE_FILE', 'INPUT_FILE_XLSX', 'OUTPUT_FILE_CSV', 'API_ROOT']

ROOT = Path(__file__).parent.parent.parent.parent

load_dotenv(ROOT.joinpath('.env'))

API_ROOT = os.getenv('API_LOTOMANIA_ROOT')
LOTOMANIA_XLSX_PATH = os.getenv('LOTOMANIA_XLSX_PATH')
LOTOMANIA_CSV_PATH = os.getenv('LOTOMANIA_CSV_PATH')

if not API_ROOT:
    raise ValueError("API_LOTOMANIA_ROOT is not defined in the environment variables")

if not LOTOMANIA_XLSX_PATH:
    raise ValueError("LOTOMANIA_XLSX_PATH is not defined in the environment variables")

if not LOTOMANIA_CSV_PATH:
    raise ValueError("LOTOMANIA_CSV_PATH is not defined in the environment variables")

API_ROOT = Path(API_ROOT).resolve()
COMPOSE_FILE = API_ROOT.joinpath('docker/docker-compose.yml').resolve()
INPUT_FILE_XLSX = Path(LOTOMANIA_XLSX_PATH).joinpath('Lotomania.xlsx').resolve()
OUTPUT_FILE_CSV = Path(LOTOMANIA_CSV_PATH).joinpath('lotomania.csv').resolve()


if not COMPOSE_FILE.exists():
    raise FileNotFoundError(f"File {COMPOSE_FILE} not found")

if not INPUT_FILE_XLSX.exists():
    raise FileNotFoundError(f"File {INPUT_FILE_XLSX} not found")

if not OUTPUT_FILE_CSV.parent.exists():
    raise FileExistsError(f"Directory {OUTPUT_FILE_CSV.parent} not found")
