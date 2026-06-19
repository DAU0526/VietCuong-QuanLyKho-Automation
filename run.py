import os
import sys
import argparse
import subprocess
import yaml

DRIVER_DIR = os.path.dirname(os.path.abspath(__file__))


def load_config(config_path):
    if not os.path.isfile(config_path):
        print(f'[WARN] Config file "{config_path}" not found, using defaults')
        return {}
    with open(config_path, encoding='utf-8') as f:
        return yaml.safe_load(f)


def main():
    parser = argparse.ArgumentParser(description='Run Robot Framework POM tests')
    parser.add_argument('-c', '--config', default='config/staging.yml',
                        help='Config file (default: config/staging.yml)')
    parser.add_argument('-t', '--tag', default='',
                        help='Run only tests with this tag')
    parser.add_argument('-d', '--output-dir', default='results',
                        help='Output directory (default: results)')
    parser.add_argument('--headless', action='store_true',
                        help='Run browser in headless mode')
    parser.add_argument('test_path', nargs='?', default='tests/',
                        help='Test file or directory (default: tests/)')
    args = parser.parse_args()

    config = load_config(args.config)

    os.makedirs(args.output_dir, exist_ok=True)

    env = os.environ.copy()
    env['BASE_URL'] = config.get('base_url', 'https://quanlykho-g40b.onrender.com')
    env['BROWSER'] = config.get('browser', 'Edge')
    env['ADMIN_USER'] = config.get('admin_username', 'adminweb')
    env['ADMIN_PASS'] = str(config.get('admin_password', '12345678.'))
    env['DRIVER_PATH'] = os.path.join(DRIVER_DIR, 'msedgedriver.exe')
    env['HEADLESS'] = str(args.headless).lower()

    cmd = [
        'robot',
        '--outputdir', args.output_dir,
        '--variable', f'BASE_URL:{env["BASE_URL"]}',
        '--variable', f'BROWSER:{env["BROWSER"]}',
        '--variable', f'ADMIN_USER:{env["ADMIN_USER"]}',
        '--variable', f'ADMIN_PASS:{env["ADMIN_PASS"]}',
        '--variable', f'DRIVER_PATH:{env["DRIVER_PATH"]}',
        '--variable', f'HEADLESS:{env["HEADLESS"]}',
    ]

    if args.tag:
        cmd.extend(['--include', args.tag])
        print(f'Running tests with tag: {args.tag}')

    print(f'Config: {args.config}')
    print(f'URL: {env["BASE_URL"]}')
    print(f'Browser: {env["BROWSER"]}')
    print()

    if args.test_path and os.path.isfile(args.test_path):
        parent_dir = os.path.dirname(os.path.abspath(args.test_path))
        init_file = os.path.join(parent_dir, '__init__.robot')
        if os.path.isfile(init_file):
            rel_path = os.path.relpath(args.test_path, start=parent_dir)
            rel_name = os.path.splitext(rel_path)[0]
            parts = [os.path.basename(parent_dir)] + rel_name.split(os.sep)
            suite_name = '.'.join(parts)
            cmd.extend(['--suite', suite_name])
            cmd.append(parent_dir)
        else:
            cmd.append(args.test_path)
    else:
        cmd.append(args.test_path)

    result = subprocess.run(cmd, env=env)
    sys.exit(result.returncode)


if __name__ == '__main__':
    main()
