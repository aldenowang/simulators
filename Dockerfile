# Physics simulators (ground-truth answer generators).
#
# These scripts use only the Python standard library, so there are no
# dependencies to install -- we just copy them onto a Python base image.
#
# Build (from inside the simulators/ folder):
#   docker build -t simulators .
# Run the default simulator:
#   docker run --rm simulators
# Run a specific one (override the default argument):
#   docker run --rm simulators RadioactiveDecay.py
#   docker run --rm simulators 1DHeatConduction.py

FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /sims

# No requirements.txt needed: every simulator imports only stdlib (e.g. math).
COPY . /sims

# ENTRYPOINT is the fixed program (python); CMD is the default, overridable arg.
# So `docker run simulators` runs idealGasLaw.py, and
# `docker run simulators RadioactiveDecay.py` runs a different script.
ENTRYPOINT ["python"]
CMD ["idealGasLaw.py"]
