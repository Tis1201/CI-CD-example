FROM ubuntu:latest

# Thiết lập thông tin người quản lý
MAINTAINER Hoai Vu "vuvuihoc123@gmail.com"

# Cập nhật và cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Tạo môi trường ảo
RUN python3 -m venv /venv

# Đặt biến môi trường cho môi trường ảo
ENV PATH="/venv/bin:$PATH"

# Sao chép mã nguồn vào container
COPY . /flask_app

# Thiết lập thư mục làm việc
WORKDIR /flask_app

# Cài đặt các gói Python từ requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Thiết lập lệnh chạy
ENTRYPOINT ["python"]
CMD ["flask_docker.py"]
