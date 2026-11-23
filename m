Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424075;
	b=FpHbxF42Mp8RiSqUF2q5cDkmSo7K27QC2BHKTSuJip4OKzoqofNUb+FJA8Upl8Jut2jy
	 FiveQJ78Es+9yPUlANbT3U547a4Wf1ezfA2CzYLnmOhGEHdXABPaKeBAYPHJqagmGetcu
	 hTeZ/CP1D1OhLAcnBAyfMr9fiaI3ZjhZ+BodYR1uA+NepI4d3rhCrkq4LcSnfIBm92uaD
	 c06VyFItTF9x0j+W5ltzRHL8LU6GtTXr1W0Gc2tq2G9ze1ll+58gJyO4mUe+5rlunqSZa
	 HvlA/3/Ah2ls/NIGFwZLnmhfs1IBtfBY8ArqvDvN8uGVuicVe+D9tODACTamGQTFogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=;
	b=lRTSwx2LIqVNhKc5A/7QcyYop6GU2HNxdHOwdv1DxPbwElKupmzgAu4ipud2Xp0fBi/n
	 NyNUH6lGbUAGsEGuvoy+LQevsIJ3E4Lly0Qp9MalHWwlC23MUPVpA00PMesv3qiaFybGl
	 rn6dcDQ509i2UHhlgUO4EzOpFZg+tO5PJLww6CbsbaVID+JRqRQTp79r8VN4WwaiVNVz4
	 YKxp+3AlRdxYs/O/oR9nwPhM61Xn++bU6/F5fZRVKcXo7LG3S7FhCIokOuwwNXwC3qojS
	 xYVEwJYLhAJtCXAL7o020ptOIQ72x3DakgjpgPSJYcvs0PfxvtFT/IDCH6yjRQ0OpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocMqLHet;
	arc=none smtp.remote-ip=74.125.228.135
Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AD606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocMqLHet
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c505c4d8ba0so122524066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424074; x=1796028874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=;
        b=ocMqLHetxUUEUvPJlTmVpsJ6tVylhUi/vDrdR+NMBn/6Jx805uiETf0acB3VFi9qkN
         tMxIn1ccKUWOOR3NvLUglwwcOVO3mJ+BNzr21sl4jHerx++kT9OoRsy/T7f7NRjz8bdQ
         8wMBEaGc/H0smdUH1gpfg5asH2xdyY2v2r4u1FNxTtPPXiaHiklerTstDrCqbCdFezDp
         Y8eJDzf2VwOZ2SdIVWUmp1XvEHzty/Xlg0xK9EA/LBZSfGkgLTlxIXMRGQDy4qfu3gCR
         vBlsMQEob4hxG0na0C7nsk8zMCysJoQPEpj4acZ9U/q8rPxAuwkFIa0ZsieYbaN/BGxv
         QFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424074; x=1796028874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QamzTu173meryiVykuqXvUnX9iKBK1FbtEwYukzyOTc=;
        b=MSHgqdSV9yT4urW+eCDIzggYhJDejsy4bpVaFQUCVazjdF5C03qf0XBdfuBEqPv0KX
         NAopywvph9VN3Hzj6po0dC0kkcsTkHpNBPSvZ8aZpT7i3s5ku8HOeN6uksKIbjkUSs9y
         5zetQR++WUGUO6rpgjuim2uNlLatryQ8uWtxA7s2Um+P9WrbnIDcS3VA/aBGFwtZn6s9
         KYq2qOJyubCt4viCDXzPWMNYCoy8ww+4h0V6LUOXxhpO1pomoYjCqWQENlsOOidIAPF9
         7gi9tggUZKO68gDwGJa2LsJ4dQ9eRclksjTzvC6li52xrmQH1EWXFFFlccpE+lPwG5ao
         9cNQ==
X-Forwarded-Encrypted: i=1; AL+hErEJZd/yMR/s3+ufdnijiUFQlp5bK1NaJOOrqkb9dRln3JSEPnWwIC8tyqzwGkfh48cTpnVhI/3QG1Sa+p4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WV2jDQuw1Mwj0RJ16t3/wV+GYbbb3Avv4U2KQZ2BNmYbTroxI
	7SS5RHOMEYbWc23srVQy33P3+dhHqFcGtRIS5mf1dlbrH1YQVmuTPInj
X-Gm-Gg: AZFdTZfoABQlDNzv5u/o827YlFKyeNnRLS4SSbsuxotFED57FIXEal905u1R2QqKojf
	ZeCvZuP3gyUDrLi0NzezFo/5+rBmWSYUypEYXDafO2ijR05w0Q/fXQlPQuIlB/RpQYYsHE6hQfz
	OhwyHwJhjEoAcmI5hCG1AhyDRPRoIW5dzy1by2deyAExhQ1WXM0PKXZ6xIfQr6cAA8Oq5tVMr9B
	YX0+oJcUYkxl6ONnaF+IjWBzjDsx2vDSRm8Pn6Fjgmebsp44pKI8OcpGBv+OOdD11pnEd+fQUzk
	lZfrYL2srY2Bahm8f10h8xl/SDFnk9u3dNrqXd419j9wb9bqXZy+vNy1PCXS38kqx8HyafZr6wr
	b00Mr31xE7cKG9HJRoUwrz2pW6HkXOJmBzLPrRRToBilbIwHX8RGX8Kr0guKq4NE/9M+AZKV91d
	NL+OjOLYY0p2Al092cQEvd1i9wMrcsoJX61KlGJ+CdeBnjuKSB69P3xy1P9m2cKYQF8QJVMhxaT
	SERfPkBPCxVHLPF4xYN71ShpDR2wOq1MV91hmIP4Op+/MQUTZzWFvIjVkxwSBZDgQi8Nrl2Oakp
	LsJKhhF1nFv8t9NHAhI0MNwNW9a3XGbFRZT8GFtUiUr2IEYvEUrjC66QT0IUM2KikXs5mHU0aSV
	f2nAxBvrgTwhh9k2lBM1X8X/NZa2Ei2b6vzyiAYw2ErJqggz76sPPUhTEF9lqtZ9wKBHrtQIbQu
	qLLA==
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id a640c23a62f3a-c513bdec070mr821979266b.47.1795424073497;
        Mon, 23 Nov 2026 00:54:33 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-092-047.092.076.pools.vodafone-ip.de. [92.76.92.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm377880166b.67.2026.11.23.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:54:33 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v5 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Mon, 23 Nov 2026 09:53:52 +0100
Message-ID: <20261123085351.3415122-4-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
References: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
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

Use non jiffies based waiting functions,
if in atomic context.

Suggested-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c5693135d820..2f0aa341d89b 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -237,6 +237,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_BB_TIMEOUT_US	4
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
+/* timeout waiting for the controller to respond in micro seconds */
+#define XIIC_I2C_TIMEOUT_US	1000000
 /* timeout waiting for the controller finish transfers */
 #define XIIC_XFER_TIMEOUT	(msecs_to_jiffies(10000))
 /* timeout waiting for the controller finish transfers in micro seconds */
@@ -359,16 +361,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c *i2c, u32 mask)
 	xiic_irq_en(i2c, mask);
 }
 
+static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
+{
+	if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
+	    XIIC_SR_RX_FIFO_EMPTY_MASK)
+		return 1;
+
+	xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	return 0;
+}
+
 static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
 {
-	u8 sr;
+	int rx_empty;
 	unsigned long timeout;
 
+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_poll_rx_empty,
+				rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT_US,
+				0, i2c);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
-	for (sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
-		!(sr & XIIC_SR_RX_FIFO_EMPTY_MASK);
-		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET)) {
-		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
+	while (!xiic_poll_rx_empty(i2c)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(i2c->dev, "Failed to clear rx fifo\n");
 			return -ETIMEDOUT;
@@ -383,6 +397,12 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	u8 isr;
 	unsigned long timeout;
 
+	if (i2c->atomic)
+		return read_poll_timeout_atomic(xiic_getreg32, isr,
+				isr & XIIC_INTR_TX_EMPTY_MASK, 10,
+				XIIC_I2C_TIMEOUT_US, 0, i2c,
+				XIIC_IISR_OFFSET);
+
 	timeout = jiffies + XIIC_I2C_TIMEOUT;
 	for (isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
 		!(isr & XIIC_INTR_TX_EMPTY_MASK);
-- 
2.43.0

