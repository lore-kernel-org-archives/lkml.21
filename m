Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095751;
	b=samYhuPROmvPNDBP/dvazaCiuvCG38rNWKtmbzRUBMTNxY5bkdDhPaHhR64iWD2T8ZfU
	 h0oijx78TJ/1cDUFUDLjBewsF+l9U55WxDvHPj0QPhIWV7HV0kZ2ZgRiEwV+UVFXtHz/C
	 ZMWjuYcaqBLKwfEzqgjKd03lkOKST82upOf2Aw78rNSkMkxQv2sVR49daiGzLwK4LApMP
	 W/vjOx0/A/rIplQkfLSy5BosIzrANnlP1ZmuiH40LH89trzH2XngldrFvHLnU7LUUYbcL
	 VzOr8uxxZNg6JctNo8hHBlma9Vd+xZEoitjod6/o2vK2Fj+JotbgCD1kbCpYyRYKUZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
	b=zlRjkmF7YiubIIL2re4YHQ2fEYgnR8/3sHH7BUJ5jgpHOoC/bpRKFuouCUooJkOWPrcF
	 b6vJRYUQtTXfYifqTxOPQXyvZKnCFNAY+vFc1LAIhfeBuSsrNnJCUHxtSHOlZssNeF9gI
	 JQCUOFnGptARDUqqXvZqCXNjZlm5CLQch+JB/85JOEu1/ETAWR/W5HLJ2Pt+o4ddh7n5o
	 sXztIMobZAAgDtWUJfhDtp700BQo9AG4L/t2cdgg0t3adziFfOuGJ8p06jhXURJ4AmoSW
	 NoIOC8Ai/wXAm/MAd8tOQasKqjV45zPaZ4ew+QerK7OrXebWrbMatkgj5TEPgtTg4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRD6SJD4;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79E606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B79E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRD6SJD4
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a32576da88so1272518f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095749; x=1795700549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
        b=HRD6SJD49lvTZD9jHqV0rBo+BagdKvdzhEasCkmjov7nEjjErn6+SmaWiJ5i2F4bzy
         pdPNCYDgoKy1NhQ9BrmaSve1wFG24v6YFm5GZxABU2D3rsdxPzH86hRpu1w1+J2j6k1g
         7aoJ0Y/3Ij2XUOozXzRIjjJMUI0USHNrcF+ehKHFZQBB95NN4IKX0Rsk8C5IBwxxpsJn
         Vu9hT8C/J4w4RYkfGo1bYt29EiV7VebufUE5zPnfVRmYS9vb89uzcDWf1TwpFJmmdc9s
         rkkBX7dWgM6qyVJCX8ZarQYPo4mKHckymSzubGXT+hmU6VA7oJGY6fjtP7SKX7wRO63D
         93gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095749; x=1795700549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
        b=freOXI2CWUsOH4IQjtjULq5lbhmIIiN4Oex30l4xvuQp+lfnulKf/nrhqI94cEJMUU
         kuSZuOQ1rvs63gUZfhzBanp17fPbPZ2+4x2HjvGdft2Y4xx1VLzp5mgahYd1mMCsPX1c
         T+FauYca/Td+qCnpwh2gxna1cLZg3591pbCw81DcFZIo3xXiRh0p9zI9xx7GcSCjIZ7G
         LRVgygnuX/GdqwCNriEBuXOcIrw1AlR0TlBntwZtjSo0lx+fOLPsdSi8jXDPvRbo3Ce+
         nPpmBa6RSAdCvlqjsNzVv57ekD9ReDQGGVo6/nXIkNmZHNByBke0YQHPBgn76psXHN7n
         dvrA==
X-Forwarded-Encrypted: i=1; AL+hErFmQA5XPAqVZ9VdMejebD/Z2JbuAsW/TyNjUwNIMj0CAnjW5UQidJ5+gVY7yRbB/t0MfEbEgQh5jadQu4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6BeBcJRnEw7UGsb4uNq+f2OwG2dwahKgKchHq81d+lg4qCSK6
	gvK569Drgi3yEW0myhozfvltToSmYnQ2BOxk7qqsFRQiYXlDcatRa6F+
X-Gm-Gg: AZFdTZdCjTg3KHRyc37QyNQlhSAzvWn/GLyu8o2Xt0pC5mVaXOVFYZGJUwizdlYt4g8
	BhTjflNPvT7OplZcN/U30vpKk1fFny6y0vTi2eMcvfR3XdpVT7hG8iQhRBvW+L1Bu9PwZ4g1jrS
	wpORR6QU2Qll/utGBOhlY94zzW47B5YbDhfOFPPYeDJAtOptDUgxDjnC0NrvILvCol/Vje5I05D
	rbco+0a51vTuyUhVq996y5jVGwIEOKBYnWhLJUxNdwP/bblHCjLpwyvzDEE6T8U0JU1pXBCvlzC
	2aiK3cQf8KZStEA4LZSAwqg11o0cx1ahrcIz2+UAK2b8HIM7ofC2L1OvYHoV4zG+bFi6zEow3R2
	L5U+pwu+6mW2lMwLugfQ9RRgvsYJIh9aELFdLGvYCzj/V19AUqIP3QoQvG1uZBuUvQ00InwJd77
	w7JLlS77Bw6o6sAYxzJSlk2JaR9+z4lALkjoMTDEF0cen8ux24m3cfZ5LDZL6riuoABvyvNBCzM
	mImAWOJf4CZOOBws1ZubyBP2sE6/9jvYPO4NCHSh0eIPyGnZtSDHrwxm8Z44y8LdoOt4JNsDb+t
	cCNpAmkL4nMPhsIiQTqox5R+lUFqpNSkHrI=
X-Received: by 2002:a05:6000:4815:b0:4a6:bc53:247f with SMTP id ffacd0b85a97d-4a6bc6269c3mr11252717f8f.48.1795095748613;
        Thu, 19 Nov 2026 05:42:28 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 1/3] i2c: imx: do not carry the interrupt status over to the next transfer
Date: Thu, 19 Nov 2026 14:42:23 +0100
Message-ID: <20261119134225.265242-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

In DMA mode the interrupt handler stores I2SR in i2c_imx->i2csr and only
i2c_imx_trx_complete() clears it. A DMA transfer that fails returns
without doing so, for example a DMA write whose address is not
acknowledged.

The stale status stays until the next DMA read. There
i2c_imx_prepare_read() calls i2c_imx_trx_complete(), which finds IIF set
and returns before the address byte has been sent, so the read returns
0xff for every byte without an error:

  i2ctransfer -a -y 0 w20@0x03 0x00-     # unused address, -ETIMEDOUT
  i2ctransfer -y 0 w1@0x54 0x00 r32      # 32 times 0xff
  i2ctransfer -y 0 w1@0x54 0x00 r32      # correct data

Clear the status when a transfer starts.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 89f2b764bbc4..f20727ffb5ce 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1657,6 +1657,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	if (result)
 		return result;
 
+	i2c_imx->i2csr = 0;
+
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
 	if (result) {
-- 
2.56.0

