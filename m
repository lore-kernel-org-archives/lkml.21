Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000536;
	b=njRlHcTsPgJOXVxYXRbkqyT5RD0IfoS0iPauvsSmEb62m3gmczJD3lvTz1CZG+zv6E++
	 nOgtiUZDLID5fHFgORLNTNi2wT40rO+JOXQmee3m7SzbdVrHpeL8DYb/fOkJJ/rTIp89K
	 Sa3avqiZKHxgwMNlwUfbsOoIaw5rpFayllHuDgdsMWZsTTkQ6nqwU5sYmKkSHp0r8lDCO
	 aLQUhAEFUuSHV2/xL8M63VvG7v2z2rOy7jWoxDrpd6tn/1czqVfkTPEQqunMNlKMysjoI
	 U0gDoklEQwt5MCVUp/b+OukWgB59XOYjrAAizlCRx8y9wXMmDaGH2zJgX3gonq3WkvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SXeroM2jCfcBKXV1NOSG1sFarrMqehRN66QskO8HWNg=;
	b=KYtoVGc++puCSVqkTniKuAf71r0JmphH+oFptXomdk3c+flKPe6aH3FafzSYplc2v9+4
	 j+lwlBTJiTbOyam2PZRFOztFei3p8f1lt7Vo+5l72BHEFMsDt7tM/5IMSBlUGKrNNPZkk
	 lCK/+l2fO08p4c0gYmFly9odi2x66mHl9OXojGTFnF7Luq/Tzq9Gtk33zXY2KdmOKuzuG
	 VUj81kfQUaP/RLi1YuhDZxHPofHuE5N/qgE3foGsDSTHn3iuHeAedYRZhLBm1fJiY9Lnt
	 ekZ5K+82YNQFuXXT/ZY5kORKGwvdmK9mubBp9StqzOEHM1qGnc4X6eTWOlHccQQ50IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bHdFKU/4";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D660A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2D660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHdFKU/4
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b179528d56so413989a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000535; x=1795605335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXeroM2jCfcBKXV1NOSG1sFarrMqehRN66QskO8HWNg=;
        b=bHdFKU/4t+asVDt9njDBPNmVxH74MFAD4wsINbAc3XgW5M2Fv7OJDVzO3vtyztUnoQ
         mcxDv7NtU3WYasfNf4dk0z5bnPThVh+BfKP/wO6jgOyndTDeqNKdFhVtubTrRWN4pkqb
         J4vteOADSYMAGg11dr3R0zuaHd723iRHYSCI1YpBi3Fz+Y11hzi4HWc0LjB1MOHkbOMA
         zoWrtzVqfwlMnv4lYQRDjUlFN+XFBp2vUyodeKo/IZC0Qr6dT/2gP9C7UnPJ/o9YSBq4
         isvbbwrs4K/WEN5Rk+roENzMi0YS1j5GDXnLThkMUOLP0Eh9ZL2fUpDmHyHilCkDn/Gq
         mxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000535; x=1795605335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXeroM2jCfcBKXV1NOSG1sFarrMqehRN66QskO8HWNg=;
        b=lwhALvRlORNhlrtfAW+rUHSthhQjRDTdE6VK2KhYNTltrgmAKq2UtgJFcp2twpa4FJ
         tFHyIhnyqWRBnBz7QLBD/TfekxAp/n40MI4pgrv4HGM+6MmOJ16TsKC7YBWPcQrqWQF6
         pwSXMFbK1dpcbfEB8/Iy+T1FrSIdqyYku8pL5t1a6yFoUK/Db+vh0nfM1JNmzlIuNFmc
         KqaMUipMekXt8oqdDLrBdW64BA8G7DP11zO804xpTsL6s038ziX5Tm8pvaC4q4mhNI0v
         Ycyw1anljm+fCc7cbOu8pzx1xCORwc875vzdQm2gP3ViyHBf5naDj3l5581Jy+UMnFPK
         iLYA==
X-Forwarded-Encrypted: i=1; AL+hErFo+0HhE93nxCdS/nH+868tHCL4ijaJReFevN9jncyOeAmpm6QOWp4zFvhcfR/e7YeWmar6Ryz3fF5WXy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nxa5cKzhslVE8299qKhhUF+YkJ4LTL46NB7w2jRpJxB9uYSbN
	Dtar4dMeh7iG3g/V9qEvpvQ0uL1ntWo3VclRKJbknHyR0AhQgfp8h6SC
X-Gm-Gg: AZFdTZdUDo02Vc9OzOUfCqo5StrfKPT0omqRs9+has/XzBUGdqJEq+PDXqWRtgi+V2Z
	OppVfBZ0alR5DpYhToTcN+3ikdCOapIeW8XIeipoKVDP9eAUJnYEbQzaVkD67sHWk2jr4ehDuTE
	qkDHAPo9lcXJgyRJNl/fUE2UArb2z19HlxXt20llGe8UvWrGRUCXi8ebS3qx/1LJZt511XJsBbN
	nxzT22uJiDqOSFQHSpZRAktDhDUKq/T8KTGndMpDme4vQ2jNfraFFPMR+wnVyTuPIIOW2CipuLp
	gTso5tFyjlzNNYc4phnAW5nl3iL1B0U79Yy2iPGxJJaRs81d7/PaMLVKiJBIG+VW42r+aG9REad
	KaIr74ILYh1lMlZXyO3APSaPaLNEpl0d2WMzUdlvJziAQ65/G0xP6VNdpuUhW5IKe5adsDb+NYA
	Y4g2JImUhW1Iwq0vUVOJ+aobIQ2OaTOwKznvMVMQ27jBBRG5gBgANyXFycaX7gDDWxfyUB5wIo3
	zsMNp8KLeUxuHMmvw/1U3tne0kbhII7la9JYFvbQTtqGmROB2b2D2Pg/hVAsT2FM6+L7ubvVpl9
	JWxQRLFdMQN9wTxkeLrUGEbW9wzd/cUjblyXbUPsZ73+AFPj
X-Received: by 2002:a17:90b:3c05:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3b3d07b8f81mr2204159a91.23.1795000535203;
        Wed, 18 Nov 2026 03:15:35 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm8796941a91.5.2026.11.18.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:15:34 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] serial: pic32_uart: don't enable clock with interrupts disabled
Date: Wed, 18 Nov 2026 20:15:21 +0900
Message-ID: <20261118111521.1003717-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

pic32_uart_startup() calls clk_prepare_enable() with interrupts disabled
via local_irq_save(). clk_prepare() calls might_sleep() unconditionally,
so this can sleep in atomic context.

Interrupts are only disabled to serialize the UART register
initialization that follows; the clock must be enabled before those
registers can be accessed anyway. Enable the clock before disabling
interrupts.

Fixes: 157b9394709e ("serial: pic32_uart: Add PIC32 UART driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/tty/serial/pic32_uart.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
index 8407f85776c0..a8010d6b65ba 100644
--- a/drivers/tty/serial/pic32_uart.c
+++ b/drivers/tty/serial/pic32_uart.c
@@ -455,13 +455,11 @@ static int pic32_uart_startup(struct uart_port *port)
 	unsigned long flags;
 	int ret;
 
-	local_irq_save(flags);
-
 	ret = clk_prepare_enable(sport->clk);
-	if (ret) {
-		local_irq_restore(flags);
+	if (ret)
 		goto out_done;
-	}
+
+	local_irq_save(flags);
 
 	/* clear status and mode registers */
 	pic32_uart_writel(sport, PIC32_UART_MODE, 0);
-- 
2.43.0

