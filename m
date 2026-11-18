Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996738;
	b=mC10HAyBSciq3CgpZ9HYmLM+OHxJWTKS0yL2Ro9DyU9pVyzyjz6revr1xSA43/XQ7X05
	 5A3UX82uzZa4TU6EKReJ+tapESwVRjtuIgpbaYLqK9X4Su2cuj/EBgG4TTg7Rey5ZYNvE
	 /FstvfxSMPWo+xzYtjmFSHbR8tJvCsQioOX7IeYbMgLPz3OvgUTktzShhkuV3yxAcrAck
	 nQHkMJE+8Aqv8NwXx2CLrrtoTXedknqkbISWAHA3s7CIPw4Uv+3q3VYe0OhWW90eglP45
	 Ox+NKu/6WOpW1neZX7rVuYzGA4ioxGBKF8Q2zst6M7m5Y6VSBxx2hz87oRAb03Lyy/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
	b=RaWfzViFtAw0DvJ3spHid0KsOO7HaOLMUmKoBEjzJqc7C6Ov4CTZB8qr4WJBkDBsOK0V
	 QgVdDW15ibivgw3RzQeGWdA1IsnIghnIhoZy49/QOy/9g95ZXJdWBP8O8qt0BLs0m9EI8
	 GJ3SReJCWGwdPYC/9wFkYK9NVC1Ml1ESiLEFq8dAX+vMqZYc9dS6Npy/xGHrSNZFr5YrO
	 +lAD+/l8c+1r15i7NBbYCnh56hSZG2r83lhvBLpqxQaDZ/F/6jbiI48nTRODLg5D+0fdP
	 NH9IYRVKnZAiM7KnDOcrRHUJdT0BZIfCzxzwpOhK1IH+qs0rqK2pPmfBiRO29hWNRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAmvKmgc;
	arc=none smtp.remote-ip=74.125.228.71
Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5C606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA5C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAmvKmgc
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6b86889efa7so414882a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996736; x=1795601536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=wAmvKmgcySfA1/6DZJLDxhW3fn61N1O/dX1OSSFhxKQfcArXR7Fg7+74pdtKc8+tOH
         cGhzn5eqKIolmDUnaRbHZTC4jKq0NuYg6dBKujlrZYSsDcl91gMGcRlVDLrU+1Ahsu/5
         zaJzROR2qS31KdMQdohlECSGcH9GBkLjxaIpD3JBmvxY3MqNEG0TmieYc8rs11vNZaqW
         XgeU98Z5c2kVlOxvsFIb60KzKCtb9muNDFLLJ80p7IEIvmbFwkJqsLD+H+R2/lBAfcLQ
         icFOPhqWd7HiWuBmfgmAzIn/3siu5/889YRPC1su2uDn+Ib6mZPVf0VfVCcr4pYAoVPz
         A9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996736; x=1795601536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eX+gYgE+oCqAhhfCHZGXtaEXZcvdSf5VXn9A/wbFEZ0=;
        b=CY861VWod9L709JfAa9VjtAk1erPnt5UtIjsSM/MSfdxqHDPZPEWn8N5VlEMjXHZgC
         AOptFiRwgB0RJilNGYv2T1EpLb6cvdxlsz9p1KuRg8yLbn3G2Q/FWJ02yGxlqGJ7BlcW
         WGzbAgMVc/AKrIzDY0Qdd2O6HGbCN/T/5AlffzYpKFiq4/t9E8zog4dCzVKaaHKfWNpB
         Q/ovMwDOUUqBcBgc0dUJsE8mGUjCamrJsZcx4Hoo4pCZiRFQFSuJ0nKustIb1LPR5NSQ
         c+6/EVH/83fFrSKvP2d4RRkfS18oAT5SyfNQHLEub59yVk9qEbGj9TrxsBWO3ADWeC5J
         kYMA==
X-Forwarded-Encrypted: i=1; AL+hErHLffGOjCm506fwfdJEgOlE2oE4cCSIzTVpOVr42SOLBe1ZP37vZ52PGLIpp+QJIEptMEZx/TI09tqtbOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j8FHAeyYRHt4Se77nWiLLqUi6ZAcixi54muw63T+0VdZD50V0
	HJS5PMWtZrklLuBvCruY+0knj0pEXR2LSQ94zU3s7tYY40Rdo98hb0/o
X-Gm-Gg: AYBFou0mchVNN+HU/vWo1iXZv/xLvzHpnhdIzSCfvMhd+T0pFtiY4nG+sCJ7k4eSuGP
	hlyYOcpuJm9shcviQ8o0JAu856W6T1JbGYvaq5VAPXP5GXmZP5V1kmjZzDaZykwC4qPGkiJKjdi
	PAvFKkN79+khypzPU4augbglenUxrYF7FFbAU1IsXVQcQNd+QBMyIGYaQYMRaYvit1sCw6OgPuj
	OWoqoxjNsJjpA1sKzgNXwBJGwEp9oJWAhpoXy/avXhkY2tQ71SG6mXwVJrRVGoszd9URCQ5H4L8
	NLX4y4hzHuqZXoOa9zT0lLGqZifDNafafbI4RWfY7toiHFlHBGa2s/IlVdeD/AzQeKNJ1yuzOr/
	77jwcDTw0IHHgJVkrRvmjOfJt+OEtSTQW2Pj3xWHcKBekcRClzYY7jFqoMF76R15hATZxh6HIwg
	gsjRNebPangz8mf/wZRhGazZEU9RzY6gYwnbU8ZRmzxi5Nwor5yJDVusVXOxLyd8X/qpBdnYA2K
	eQn/3sRmU+AujR2L3XrF22rb6lqi0o5xqcKdxs/kBpFbEL0zqu9xxlAYramehCXwVO1hTJz+Bf4
	hWzCBwf8Hn4EztyO3oPknOgaWCcS/8P1G+xP1SNpwX4L5zLaihCgH2KJ9DOutDMa28VV2zMyTTS
	jTtZ5fdaUMc9jp69joCvrXUKZT8e8YDW1KcVhYc+KsAV6JDzbkb/bsgtU
X-Received: by 2002:a17:906:f5a5:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c510e5024c3mr167941566b.39.1794996736224;
        Wed, 18 Nov 2026 02:12:16 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f332sm78436366b.7.2026.11.18.02.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:15 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
Date: Wed, 18 Nov 2026 11:11:47 +0100
Message-ID: <20261118101147.3350796-3-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
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
index e68e17bdf0ba..6bb8d66e8969 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -237,6 +237,8 @@ static const struct timing_regs timing_reg_values[] = {
 #define XIIC_BB_TIMEOUT_US	1000
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

