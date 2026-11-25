Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649502;
	b=Isg3lOt7d+FOvYQ5xUOURSnlMZ761Hs7Dzt2HLf+tYr/QQn8hYWXtPgxwk4GFOiWUkm6
	 7ws6dqkWihl4xhTmI1oaqDCnb27vwfgCBkWUsT+O1ZsAHPdW7lbmhqcMnWD90psAyapEg
	 zVLsLmje1MrqXaunfKHL6UxHvbHyYK7m03FG/l+GKx/4TqEYsEFPTxoqv2RLwo6aMPFT6
	 9+ocHJxdrZAsHebI5LHrL4i7sAuBJlZMuCRmM91I5ZJ4um2NXD1vVBeuabasHB8lRi6Ug
	 uQcHfMCXXXJJpG72AXZy7bF7n5P9CFgE1U0BEdmbAG2QOL8E92gm7Ge1apdMW48SWeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
	b=hgbReVL2c8MKh1VTZLgyC0ijIgYqCTkj7BhfQZTNrgJeu8RjlB7VUzIaiBkmGaMHoj9b
	 UB+FFj1DFBxaFQClRwYm9bT5BuKcQclbpjNlRFJQZhWtJkEFmFIS0Jw9Gf3AXw+pXNH/o
	 6dKEx8jClGFT350gJwnvxzU+sqXNdpBY1pGxZtHP9j4iSFgRr7WKW+x1q64PG/5SatfPl
	 cioYq43WeJ2EWHDMUKL+A2/QFWDV97GHHYtTKu/KSjqbwf4X0D3liDEoI2xiCiOQoLuSx
	 OK1Q9U+IChNEqN0DRXN5+numhOLm1bRlbvrN2LJC03M6gpq0Mlec0cyXQSz3LrpOtog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uic/IL3O";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12149606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12149606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uic/IL3O
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4459752f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649499; x=1796254299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
        b=Uic/IL3OYcJCF3ErHoq9kSyVfw0xGqQq4NuKPNIwtz/iisnqLAP3ebjNiV28ib1PKd
         Bt8MGWRBB2uNTXeWS6SPxuf7DHhqhaQ8hZZI+Kg/uuzkDC2UTDY6kX108rnGBf1Omiyx
         frhK5ZRCDQ64QeccyxSsIKs5GTFR1czynldvh1KTaKhtLG5k1DZCrSlBg6vAAD5XgaUG
         0bOGXc89zHMjs+T88OWCek/1k+AkleTCYELY3GY0KNcOnSCl+e5CuDsmBAhQ2DKY81th
         SKy3tfKICuqIbkSFODfgYs4B5gnpw/Jbpm07Ee9r/VpoazYXfXV5vF2AB4ohauK7nN5w
         029A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649499; x=1796254299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKnAC/v/PE5Id4vZjvScRbgOEIeYezkg5HQc5ebkHqc=;
        b=sTNYxmWcytnPzbptHuEwkXu1AReba0blGmf+w6CQNGoMw+xs7pn2+iGDycPguumwDG
         84d7e6T0Zb2sTbywuLoGoLNqip5f0lld1vN+rRDoAVGRQ7OmOggcWD1sHINCFR8uPhPq
         xQeFBHh2lh8B++P79XlMC1JZBy/9ImGAitvRqFAhdAiQsvn1F2kmX0Pgx96AFtgt3QNT
         SoQY5a+PQB+Vt1r8EQHN5WDh+oKadfukbn45dIBbZsHHUVIckF9Z3d1e0WZsTDWL21wH
         hYg57/QXMKiTlWakyZhbyTbE1ioXMYEj0Vrg3hZ7yQDHrIPIaMoQeUT8kiiUwfc3/GYD
         CXBQ==
X-Forwarded-Encrypted: i=1; AL+hErHFpKziIyTQtPFGR7fuk5vCMYD8/wzEJGRy7SVWTLLQdsOTIxif894Eo+XrxFoW0nhuGEG37GuDOEtDh08=@vger.kernel.org
X-Gm-Message-State: APuU4Z9McojdJ62Hjqsch+qBWrwex0ec5TVAu3QCbLrkByPda/jqKuPu
	SG2qCJk9tZWzCgea4g/MTOIVWNwX8nsdrViBdPPjr0r7tvq6GjN/QBfN
X-Gm-Gg: AZFdTZfHGtyRZ7uoLYZznxXhX9DzvtN7HqUPlTzlQSs4PmNmdb+EV1YQy3suJqUQaFM
	hxMASGTr5J/vR9c6HY6nXEVEsLABtmCr9ogLaOrRv3wwrUDF4yIWklIMfVwe89cULxAmxUerLdt
	NG4tOP4LQoWfTXg0e5CS0A5KMKrNk1clr0IBpLI0TgLWnbxirdRIyPJ53BA4RQw95xlyvL0SDVb
	zLXErDUoEus/7cjviJRaxqsmh466NwGnFroWk+UTzvWFMqEc33CDua4mwd/IqgYileMBM2iFEel
	Ke8jxO9BDqYVGhKzGavo+V3SQoDqRxTRX+m2doCh0rB3xdcbOFrSe2O2Qx9XsUpIK98UDetPGT0
	5vmw4fgOMQibCSQxB1zma2LkM2JD+LaMNudpBdt94lKI452yKDHl69ZNle7ahI5NU3oldC1mDQ5
	I2mSbkeqq6zYzdo9/hj1WKMWI2xM+v6czXa8GRvhSzkhQ/Bfu+lsd5bm018ahBWRtGqMx0oB4Rm
	N/8BZlq1xcVcRrO6pJu+MoDnMovoodnlpFr23b7pBfzb0eYrhRjWzp7bZAXtnk3gTeGdg+y22Ab
	+DXXcqqjqqKCSQHHCKSdWtdf1iMBbARm+7pFjCGS+jR1C02L5mSG4vNFEI9XGGwscBBTZdk2EBj
	rJUQAKxye3w==
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr27523078f8f.5.1795649499471;
        Wed, 25 Nov 2026 15:31:39 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm38590936f8f.8.2026.11.25.15.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:39 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 12/19] serial: esp32: Rearm TX interrupts when the FIFO is full
Date: Wed, 25 Nov 2026 23:30:13 +0000
Message-ID: <20261125233020.1380594-13-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When transmission starts with a full FIFO, the driver can leave
queued data waiting with the TX interrupt disabled. Rearm the
interrupt whenever there is data ready to send, including a pending
high-priority character.

Hold the port lock in the TX interrupt handler as required by
uart_port_tx_limited().

Tested on a Waveshare ESP32-P4-Module-DEV-KIT. Verified that serial
output completed during SDMMC reads.

AI assisted with driver development.

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 drivers/tty/serial/esp32_uart.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
index 304e1345518b..002d6fdbd875 100644
--- a/drivers/tty/serial/esp32_uart.c
+++ b/drivers/tty/serial/esp32_uart.c
@@ -354,14 +354,14 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
 	unsigned int pending;
 	u8 ch;
 
-	if (tx_fifo_used >= ESP32_UART_TX_FIFO_SIZE)
-		return;
-
+	tx_fifo_used = min_t(u32, tx_fifo_used, ESP32_UART_TX_FIFO_SIZE);
 	pending = uart_port_tx_limited(port, ch,
 				       ESP32_UART_TX_FIFO_SIZE - tx_fifo_used,
 				       true, esp32_uart_put_char(port, ch),
 				       ({}));
-	if (pending) {
+
+	/* Rearm TX even if the FIFO had no room for queued data. */
+	if (port->x_char || (pending && !uart_tx_stopped(port))) {
 		u32 int_ena;
 
 		int_ena = esp32_uart_read(port, UART_INT_ENA_REG);
@@ -372,7 +372,11 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
 
 static void esp32_uart_txint(struct uart_port *port)
 {
+	unsigned long flags;
+
+	uart_port_lock_irqsave(port, &flags);
 	esp32_uart_transmit_buffer(port);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static irqreturn_t esp32_uart_int(int irq, void *dev_id)
-- 
2.56.1

