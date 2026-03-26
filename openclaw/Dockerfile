# Base image
FROM ubuntu:resolute-20260108

ENV DEBIAN_FRONTEND=noninteractive

# Update + cài package
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
		net-tools \
		nano \
        openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Tạo thư mục cần thiết cho ssh
RUN mkdir -p /var/run/sshd

# Set password cho root (đổi lại nếu cần)
RUN echo 'root:root@123' | chpasswd

# Cho phép root login & password auth
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose 2 ports
EXPOSE 22 18789

# Chạy SSH server
CMD ["/usr/sbin/sshd", "-D"]
