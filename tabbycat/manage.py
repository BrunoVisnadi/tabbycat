#!/usr/bin/env python
import os, sys
from pathlib import Path

# garante que "tabbycat/" está no sys.path, para importar "actionlog", etc.
BASE_DIR = Path(__file__).resolve().parent  # .../tabbycat
if str(BASE_DIR) not in sys.path:
    sys.path.insert(0, str(BASE_DIR))

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "tabbycat.settings")

if __name__ == '__main__':
    from django.core.management import execute_from_command_line
    execute_from_command_line(sys.argv)
