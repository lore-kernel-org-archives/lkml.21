Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288930;
	b=Y7/iVxcOKMWmGLe4e+rWSYFSuE0Rho7B8+kMva8oAuUKVHcJ49I4tqdyZtWoj3uSLPBL
	 TjPcYo1qq9CgIoAZtuy7YrslUHzEbFmVBbzPfNczoCSw62pNx49cyPf0F6nTxpBjUSl0d
	 cyQIKt8vMko3NnKe7Dw7g9b95K1w4suhGlOwy2yg3z9zMtU9pKu23ykLZHAk8niitEG0L
	 kOilZ8/isVbQdQrH3Lz9CAAL7MiZcI199loQ7bYw0EUYThCJ+i8PlZls/6aJLSp+OvS+E
	 Yitk7SILs8oHIW9WgwwIJyyIoYW8bncKYzAdAyC7/PxscpjfbXMb8BE6sOvi45e0iug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
	b=RHbt4vAJFu8HGRizm+kVVy923+Mi8/9rhXB9QNlR4jRWcVa74brBcSQZYPvjaPd1eWD5
	 ckq0TUihlWGK6UquoHHHAOeAb3qIVrNyRqrhTJVPxSiPhXDVYKTOk6/ziTntopgQDjh6e
	 v2iRAk/YJKLY2hZHnNo/rZobs5SlIFNcNRe3nfpLTouirZDF4U4oeIYUDsfJzQfxAVS9u
	 07ikp2KkJandXy/cjVB4P8zadTJi0LkvZxbStRBHr/mR50IB6d6Aw+bnLO2fQ349hkVMD
	 s8SssfbfbmBQIOupdJ+ar6yPDNzCtKT2SYipzXHvLfnrs73foB57pjjLWUE92lywgmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFmhlEpj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD27606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD27606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFmhlEpj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so12437675e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288928; x=1795893728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
        b=cFmhlEpjichdD5zcqPxkfjvyzXHT+7r4rHt6uWycqHgYc/JS8IxnzVQJuU9w9gdGrp
         oBI7+8x7xexd946jZ/Y7Br3CnwmBCX+CX4TsSPRaprX/AFDBWNw0dYd46yr+MwIHRQJ7
         Z5R/JwlKSJl6YnWCmQUBp+wW6bwdjdzqbquDeQS9EKHHkTPXPFD6NC4k4lvL3yVmJjjT
         OLCl4OnxfnwiD4T8dcSzuDOebWSVh7/5VQHnZ0X2JWyiZSU88A9vVrBgrrFmuspLXSkh
         BQKTo3bsturdbEg0DlfPez5q6/QBVEt3bwFwaVKm3XUlrzWFlhhniL2hWTtX0nOlKzSq
         JK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288928; x=1795893728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
        b=rllcbAK6agXEAu5Sd6Jk/RvsZJD/ZodtnpW9nxQ6VOmM7LbMu/fNTHFYoj9xw9V9vP
         cP5mOvF6wCzss0YxaghBAssNq3nLMh6SSUKsBSTf3O+jpMZNl9vcEJGgl8gwezoGkCl+
         yUdSfZivTCHq+lR7+TP3aUxvJPSOzPQ+y8c5YZaQGwfAxPe/+pk7kPA5V2WNQmfomva5
         igS9Bpz6oDZz4LO8Msvfld/OUr+mnbPexpyO2TxNCg2vAfsze3k/qypuORbcsbjP/OlW
         4FobIQhn0LlCaMoVQ/ODgeMuou/n1ZzQKbk+VNTnGXzjkzEKW6lCLUx2ERgL3aL0CgzL
         X//w==
X-Forwarded-Encrypted: i=1; AL+hErE5AqLAohtCMfWXMXlRIIu/PAa2TgPkAJqOf+WyLGRNrLzLsVueu6z+GAM1cYxMQweNW/aJqxYUQHverwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fFV7WuPJY+q19ROR/uHNLoO0+yZy/4fTpJoAanTdfDcEujaAM
	Gmuhr7lKDc+EF1+mON6gOh0569tRQHgZfI8745phDiYStMYhwmuyKomF
X-Gm-Gg: AZFdTZdSylVVEi22snQfjguxxLLjh7YGHGm3mFJ3XdIXg2EmHz+FVSE+cL5C72bRljf
	mwAQQMkS93hUytmAaHRHAH/w2vhd6BVprqvkeABraJpDZvIeX4pGA5uHJbFXmFoK3/TazgJ/tcX
	7eNrdwp9CEZBQ7siltRKF2lU7af/NCdfojSvTkBFsTb/IzGmgFl4AQc1w/WoKvY9fWbfh6r+xuA
	23pcVtTJFK70UQIEcrhMFJQSAgSwvoBL3n4WTESuKGsFhqXUlUFc2jbrm/728mkp3n/03nF3kiH
	ZPaNq6xLYNl6BX4xEC7qWN39MDFSNxax+IOni8dnS97BvDFQq9vX4l+Ec03xtNfAiwVpEFh5gRh
	1Q0+EXZTNCbF4kxr+zR0U02woY5EcbD4jo89MH1HVrJShxpR4TOfRl2mgZxEVHmGMmHDGFRQC55
	K2Z1tLVlMCa9qk2O8DbdmZRnKOpe3MYwy0rqfjoD1wxJctvtBlW7rIkjq8bVIjyW9TUywWS6pKX
	5O7zvwsfCxXDBaDhxhAvdLnxni9aNosBvSvy+++auln1uiys5e+/ff8hRt/dYQvcEiZaW2KHvOY
	4PzndvWixVeSc9pbQV+4XODqD8EmhcOI9Mhqae3FsUdue/9RhDhBWy7kDbOfh7v3Ww==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr160908755e9.0.1795288927966;
        Sat, 21 Nov 2026 11:22:07 -0800 (PST)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm67560085e9.4.2026.11.21.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:22:07 -0800 (PST)
From: Bramuel Barack <bramwelbarack89@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bramuel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] tty: serial: samsung_tty: fix -Wformat-overflow warnings for clk_name
Date: Sat, 21 Nov 2026 22:21:58 +0300
Message-ID: <20261121192158.44872-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX_CLK_NAME_LENGTH is currently 15, which only leaves room for a
single-digit index after the 13-character "clk_uart_baud" prefix and
terminating NUL byte. Because the clock indices (cnt, clk_num, clk_sel)
are u8 values (0-255), building with W=1 triggers -Werror=format-overflow
warnings at the sprintf() call sites.

Increase MAX_CLK_NAME_LENGTH to 17 to accommodate the full u8 range and
replace the three sprintf() calls with snprintf().

Signed-off-by: Bramuel Barack <bramwelbarack89@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d636..40a21e6825b8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1336,7 +1336,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
  *
  */
 
-#define MAX_CLK_NAME_LENGTH 15
+#define MAX_CLK_NAME_LENGTH 17
 
 static inline u8 s3c24xx_serial_getsource(struct uart_port *port)
 {
@@ -1386,7 +1386,7 @@ static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
 			!(ourport->cfg->clk_sel & (1 << cnt)))
 			continue;
 
-		sprintf(clkname, "clk_uart_baud%d", cnt);
+		snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
 		clk = clk_get(ourport->port.dev, clkname);
 		if (IS_ERR(clk))
 			continue;
@@ -1778,7 +1778,7 @@ static int s3c24xx_serial_enable_baudclk(struct s3c24xx_uart_port *ourport)
 		if (!(clk_sel & (1 << clk_num)))
 			continue;
 
-		sprintf(clk_name, "clk_uart_baud%d", clk_num);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_num);
 		clk = clk_get(dev, clk_name);
 		if (IS_ERR(clk))
 			continue;
@@ -2326,7 +2326,7 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 		/* now calculate the baud rate */
 
 		clk_sel = s3c24xx_serial_getsource(port);
-		sprintf(clk_name, "clk_uart_baud%d", clk_sel);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_sel);
 
 		clk = clk_get(port->dev, clk_name);
 		if (!IS_ERR(clk))
-- 
2.56.1

