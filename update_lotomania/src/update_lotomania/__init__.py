from csv_converter import csv_converter
from .core import INPUT_FILE_XLSX, OUTPUT_FILE_CSV, handler_atualizar_sorteios
def main() -> None:
    csv_converter(INPUT_FILE_XLSX, OUTPUT_FILE_CSV)
    handler_atualizar_sorteios()