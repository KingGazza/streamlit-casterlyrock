# Use a standard Python image (pre-installed with common tools)
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
# We use --user to avoid permission issues and skip the system updates
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Expose Streamlit port
EXPOSE 8501

# Run the app
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
