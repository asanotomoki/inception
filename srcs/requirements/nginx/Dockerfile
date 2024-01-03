# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tasano <tasano@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/06 23:34:58 by tasano            #+#    #+#              #
#    Updated: 2023/07/16 15:28:59 by tasano           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest


RUN apt-get update && apt-get upgrade

RUN apt-get install -y nginx

EXPOSE 80 

# Nginxを起動するコマンドを指定します
CMD ["nginx", "-g", "daemon off;"]

