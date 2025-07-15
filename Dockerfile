# SPDX-License-Identifier: LGPL-3.0-or-later
FROM eclipse-temurin:19

WORKDIR /app

# Download and extract latest stable LanguageTool
RUN apt update && apt install -y unzip curl && \
    curl -L -o languagetool.zip https://languagetool.org/download/LanguageTool-stable.zip && \
    unzip languagetool.zip && \
    mv LanguageTool-* LanguageTool && \
    rm languagetool.zip

WORKDIR /app/LanguageTool

EXPOSE 8010

CMD ["java", "-cp", "languagetool-server.jar", "org.languagetool.server.HTTPServer", "--port", "8010", "--public"]
