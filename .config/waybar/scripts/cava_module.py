#!/usr/bin/env python3
import json
import os
import struct
import subprocess
import sys
import tempfile

BARS_NUMBER = 40
OUTPUT_BIT_FORMAT = "16bit"
RAW_TARGET = "/dev/stdout"
SENSITIVITY = 200

# Updated config with proper input method
config_template = """
[general]
bars = %d
sensitivity = %d

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = %s
bit_format = %s
"""

config = config_template % (BARS_NUMBER, SENSITIVITY, RAW_TARGET, OUTPUT_BIT_FORMAT)

bytetype, bytesize, bytenorm = (
    ("H", 2, 65535) if OUTPUT_BIT_FORMAT == "16bit" else ("B", 1, 255)
)

bar_map = {0: "▁", 1: "▂", 2: "▃", 3: "▅", 4: "▇"}


def run():
    try:
        with tempfile.NamedTemporaryFile(
            mode="w", delete=False, suffix=".conf"
        ) as config_file:
            config_file.write(config)
            config_file.flush()
            config_path = config_file.name

        process = subprocess.Popen(
            ["cava", "-p", config_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )

        chunk = bytesize * BARS_NUMBER
        fmt = bytetype * BARS_NUMBER
        source = process.stdout

        while True:
            data = source.read(chunk)
            if len(data) < chunk:
                break

            sample = "".join(
                [
                    bar_map[min(4, int((i / bytenorm) * 5))]
                    for i in struct.unpack(fmt, data)
                ]
            )

            output = {"text": sample, "tooltip": "Audio Visualizer"}
            print(json.dumps(output), flush=True)

    except FileNotFoundError:
        error_output = {"text": "⚠", "tooltip": "cava not found"}
        print(json.dumps(error_output), flush=True)
        sys.exit(1)
    except Exception as e:
        error_output = {"text": "✗", "tooltip": f"Error: {str(e)}"}
        print(json.dumps(error_output), flush=True)
        sys.exit(1)
    finally:
        if "config_path" in locals():
            try:
                os.unlink(config_path)
            except:
                pass


if __name__ == "__main__":
    run()
