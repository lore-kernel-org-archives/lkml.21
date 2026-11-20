Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167871;
	b=U2E4BbZxhiTd1iKkxVi/Qoy0gRRkl4KG6SDaa79jTOXH1+Fl4Qb4XM3JrluR4q+m5q5H
	 ZD3wI1x5JDKZhTvfC6r1c0MIc2KiAsvj7Uu9Gk+VvX0YkshHPLeO6Hkprb46qByBdNJy/
	 Cy4/Ci12KpQTZY8EpcpzjDvvryQNy31CKf2cj27LcW9n/oTChdBEjqCuEVOgsy7cNRsf9
	 Vb8mIbayrKwLCQYxfAwuDAQIJn3IW1w4WoyJ2DH3TADCuqroo2JqKJymYBGZwiV3XMOW8
	 NEWfwhYCh//vP/YmUn41GaFpUsgwNttFl6p+czA6H9UYCCHhCnTwK8Ys/ALXgVTR/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
	b=WNrjLK/3HJcN7N2V5xB4ugQ0Ft+UU89hCk8QisUK20CuAPUqRgqvQoixrFkHxLpczInN
	 XsyzelkV5Z8HSB1Rcdt6fHxl6kN4/HKLMG+1dclCEzS+wwDVu7gfoCqI6xHJA1fvme/fi
	 7oBgwNRbAHL3TX7Di+DaHZL0EWKkaV3gUvULod84AivQ/LjRtoF0QF/+k1VhrryOO9C2z
	 r+GfvxO3TV/mCgatWseqYsJyzKePNz91yPpCdBd0Q3672na9BZ4EhU6/H29fUOEgrGMpb
	 Pqtn9tpS4cuQQGeoajp1xm3lfq87sabwICCCfflfdwYH87FfbMasdBqfv2kTM9Y+Dtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kWVqnyUO;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51D606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F51D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kWVqnyUO
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3712b6d9843so598125eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167870; x=1795772670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
        b=kWVqnyUOu6Ja5aE/SymBF8yS0E/gQYa9DgVh+hqp2KYCZ3IDoemXQTlXTHCueN5Bm7
         fexNC26c7m/5UXChtp95ApxxTwA0ujv6BArRjhPVp2yJRxC8x3D+SH7hJuAXzkKt1npk
         HcZIEmpuDoR/l15EAim+pUYKCnI7837W0nwh7BRxgp6mT/EYBOL3YD6DWCAB9RR1e+Bi
         hkaJW9kKUiyRbq5BW5Y6JHBdUcrzyAICrYTLB6Ufb1+j16mO+zqZYkuqrUh9wNzIHYjz
         zpXJ3uB4encl9pfMIie1FYS+qR+5czJHzsntv0ALI2yJOkxXCLoF6w99lAallkZVS51l
         828w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167870; x=1795772670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gc0YH7tul+j0foN+otRZFbZgrVsjLkGsvyOuJz0JIG8=;
        b=RojhnSb4wNGR1Ev2da7P+bdv4l4v53riNjJGNwyk/WX7oM0kCZXMG4llh4TtCScap3
         +D9QN5+JTzTgPFnFq3oOSPbGimBbhgXkxqmgDO46Vc9IIHZnyE1YKuoFoUhiR3oU/6BU
         NhTyyk1HMrbCf/uPSVJ4OT9I2ApvesPRnHSBDDHIfTH1l7FiXgDw0IVJZl5rT9OqpuMa
         I0puiqtjrpBLvqL5xiH6iqMw+6gyuwWsaXQ7pZRveGgX66IQax/z6gfWhkIXhboPULsb
         NVpR+Fd2U5v0heqgDMCmRXNC/Zuuxzca84T/UQRGdExR0Ou5n1uhf6dCwRy23l7+iDHO
         ZUMQ==
X-Forwarded-Encrypted: i=1; AL+hErFMitfzESF5HTtsL/+hCoROMG+Zhy6lzZjWLzH11Xf+iphhq3xew3IRQR+SGU7GsZ+9PNxlRuzuXRc/pec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R7aX6VzGvSAYV1yJtyKndLFBj69kf7BTCMyobCL6/Wr+NSSeq
	CifEBhVkiGhxHA7s/4uXEWip+xwFyPZ6ag14IH/2q2TSPGodYhOqVSrn
X-Gm-Gg: AYBFou2CQ37UdZEG57CxW0wolz+8tEEZIxfCPoMVQAYiAVxIUa7Er10IpLZiwQBrNrF
	bM8qNl0hMwBT9wLMcdu253l5pnuqt+IUtcrf52QnEjzejLfgr8NmPTHpJIVanWlb30VnpdeSExz
	Mwh0542WWtdNVygurYcaezqQ2GrMMbNEzQdN77RmRB4g5na+pd5fRAOWVYCEDrQgvwXcpciAn+X
	tn33ZUrS8DARag8ZfyyLXpcG+Gme7Id71ctg7zFBeVRk8kw1mhe+Lzsg40pPGf2ncorfzDehkZK
	JW84pwTGJMDAqTdA3v27nvtpp+eBHNFJMS333oBJowlGB64JfnzjXs+gQIZMxF4QrEJFE6VSysj
	Uo2a0AgDlwj8j2xNx3NbumJ+tQH+yuqVUW4sDRUmTrqsYLZraMO2MqOr/p2aSdLhxOIZXG+6fYT
	VZGca3IMErhtJp1w6H2knLkNpsoH5R8dBNeuR20huBIUrhw9/t2RSC3YKtkUZye1Tc7Pk8LkWJa
	3HFGwLSQTTLP7w++QQG5cPpEGvp5MbTCCFsJeh77iBU8Kf8FdTzsEGQH4hN+OUpiYuMZCMAH2EI
	VL+cFQhv4xcGq6zkMooUZ1g34f5ezvFH/ReBGNZ0RCSLHjTaNaU1M/mZm9oooAK8VW7G1yhyHFj
	oAZdsdmYJtDHNMQEsj1j9vyDN1Bkz8dOMfIdwN1D3CEHa
X-Received: by 2002:a05:693c:4091:b0:379:4197:5eef with SMTP id 5a478bee46e88-3856f65b3cfmr2456499eec.8.1795167870262;
        Fri, 20 Nov 2026 01:44:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:29 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: atmel: mchp-spdiftx: Move IRQ request after runtime PM setup
Date: Fri, 20 Nov 2026 16:43:54 +0700
Message-ID: <20261120094354.6814-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Move devm_request_irq() after runtime PM setup to ensure the IRQ is
released before the runtime suspend action runs during cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index b034bd46cd5a..658ff667439c 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -812,16 +812,11 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	/* Request IRQ */
+	/* Get IRQ */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	/* Get the peripheral clock */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
@@ -863,6 +858,12 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Request IRQ */
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
 	dev->playback.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
-- 
2.43.0

