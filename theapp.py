import sys
import sqlite3
import yaml


def cli():
    """Simple command"""
    print('Hello, World!')

    conn = sqlite3.connect(':memory:')
    conn.execute('SELECT 1')

    config = sys.argv[1] if len(sys.argv) > 1 else None
    if config is not None:
        data = yaml.load(open(config), Loader=yaml.SafeLoader)


if __name__ == '__main__':
    cli()
