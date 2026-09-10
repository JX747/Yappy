FROM python:3.14
WORKDIR /yapp
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8050
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD python -c "import requests; requests.get('http://localhost:8050')" || exit 1
CMD ["python", "yapp.py"]
