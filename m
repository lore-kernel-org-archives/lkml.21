Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171627;
	b=waEeh4TD9r07t1GMIlJiXri6OXhvR9Lzarh//KmvQxDE1VvgFfPc8T/yBKYJ2G14KPNG
	 8jgNJ0jv3r16vnqxZ3B+MfACuap3o3l54SNeax26U7sll9REdAsSU+p1DpOjHo4G3RuMy
	 v/tvkZjRcnAlqLZQxRRSkYWRlpuzo+Nv9QciMGvFqVvwzQjR9z8P2S40AJ0y/7/eK5+LG
	 Q25gBC0kWeI4wsMVmR+Y+Zy/p38yQH9Vpsfu/hH/pOE37KfZhi8oXELgKG/EzNNy5CC6a
	 Ox+Rr3VNABg+RfBm28tjPXZUYdnWYRmzSYwq93Lv+CRVMvQHG2iuNTcpOAVedJ/Kvpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
	b=IBGhA+t4oZzPBrAg8IXhADPxquEcieovr1iLZRPcgooDYcidVeIoQfyxZV4qM0W+A1cJ
	 Hw/gCS9gCwREkUEu68ZJJChRjYvR0mpzGuOibvsiWkJDh2/PQ56t3WIFf3mFrkUcNkTPX
	 3bmciCIru4rRneBY0nfZ9JZJNKO5/Qx/0xej3abrXIVqvR3dVqPrWy1vb/hviMHqvXUSE
	 P2gMZO9HerCdJSyZ4KAFVtE4rvrJyZQolyvTWnv7WJ8LTSX/tok8lO44N1J4yWHAmXfpc
	 pB1tMl0XruU/uo0UYmi9KWoflYDAV6zboq2EU6kjUuRdy/8H56CygiUEp0Cy8QTUGYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAaTM93L;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A02B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAaTM93L
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1009018c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171625; x=1795776425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
        b=WAaTM93LIjUA71ONRKjoA/sY2kKxRETtNvEO2RJgpgBVUJJfxnOe/nXm589tHKf/iZ
         sQny/8ilsaemTqS7Q9FYv5HtFfuFfx4e23tJPJmrF1pM1ewxWhM07376kdcBK63AY2aW
         /X43B6FFCRVONiMG8mq0VnKfGSnGrj8LZykLRhDo/7NFMZIcHj65QtKe1g25tEy6a0mJ
         v+k57TuwGscZkMiHpI+l1nwrwol1mDdD3T+xeHNpK6Gb348sjjBonG1kBju8ERGZZzEo
         iHeoXxd1d1f9qFQsVa5Vo1l5InD6vQUKSclK9Ne4Fmj0ZkOha/QvKc/COGSzYH5jz9vI
         +6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171625; x=1795776425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVq+Bf68vj40+v5fjKq8DdfR4Rbv8nFPIdhJ9XaAqDM=;
        b=2hOxvFOS0S3tO3o0H3rBp7G6DHrrGe5V8JJjaZ21YGR7lknhct/lmSYfVufBxZdhic
         xWBzuVvJOn85h1msYpVwDF9eLhs2JVfPomGyvS4a6Kg/5PeoCLQ1HfiM3+9HQN65cWd8
         dLiU3/VqQ3UVbY15iEZdCdhLpeQtjIex+/Qyqlto6PC/dVL9lPaq7hIOlZfzetkhv5RW
         zINTF7YdAi+GByoJ6GRqEuubcMw+SdFTkEt7IeGkiLGsaDY5Wc5IWMXXI0YbZbjBPm55
         uuIzHU0U5EvvZ6izm+shBEzt0hwTUfeNbrcXIAAlm0NswbltJZWE8cLHM3ujjxusuUlT
         HC7w==
X-Forwarded-Encrypted: i=1; AL+hErHOXzWzVSPOtvuqg7w9hwtv8vUqC27I2GYfaOoj4aw5ALXg6xNovWdcv9yUB2WtjsGR0NtInGz1l4+sN6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SIHGXI36Eqo7+TmBtGnNix32DLhuuAWA2zLouS869uBp0AHJ0
	SAq6iaNASWku8IoVkV829/JZzgzXrtABQokn97bDZsIalmwS/LxANMN1
X-Gm-Gg: AZFdTZeS+wzlOSKFQVwT5Ln/JkoZolyyScc8yCW2RHVo8ZL5yQkgjpR0n/tJG3ijt7G
	bnB8T5aBgYMZRpUTRz9eZbBm0lBgD7g1Ed1QbHPC68Sh5QNlgFICgwPP7JheJZo+7Qs+Bs/j8Jw
	M+vG+OH+bQet+jds0EexEq8wneaCsEnzT9gM4lSioc8FLX8dgnDfvrl1TliXuYlK9fxOiTxXVHU
	Kd/6KLn8IESsJ12xvZN35vYqNd9mpLyohb0Kr3knyWj1gHiRr3fWSW15RYFOeo+qdrzjGTwJJWR
	Awk0dJl2wpnNZn7UVuRqlpBvaJXplqrMxm1XhcpsDWvu7GAB0bhxqUPMsPaTzFUFA63CelMz8/y
	nKW6N+1qQZfhZweWEi8DV/BRQGKJj7dFqMYZzGnYRjTNbIAkcCJk6YUJ/rZ0q36cjUy1fkIBLCb
	FK0YNTeWG+TB2/WrPzNThvULenN2QcmTJMx/5e9KHub5LxZLl+G74MTMBJg9HlGxWgStIBCB80S
	RKPLFY2SWZytaOOQ9U72teI/Z8mHmXMNBK6pFxQ94DMTSbNsqRiVGAws8P4EmhyRtq+FgQhTcmM
	Vo9b3QSeP7ydzAGAALez41BnBuftEbCWenSZFc5i7XzL5IP38EBJhYoFw0Hts5oHuxef8KuCEtd
	1GP4shEw5eY+rBmyqVN+UHzRDHyF1ugcC7C2iTl55yGTq
X-Received: by 2002:a05:7300:ff48:b0:385:3595:5e87 with SMTP id 5a478bee46e88-3856fd5b5damr2179350eec.16.1795171625369;
        Fri, 20 Nov 2026 02:47:05 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:47:05 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Date: Fri, 20 Nov 2026 17:46:29 +0700
Message-ID: <20261120104630.10240-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120104630.10240-1-phucduc.bui@gmail.com>
References: <20261120104630.10240-1-phucduc.bui@gmail.com>
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

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. While ISR is marked as volatile, IMR is not, causing
regmap to return its cached value instead of reading the hardware.

Add IMR to the volatile registers.

Fixes: c5682e2ba132 ("ASoC: mchp-pdmc: fix poc noise at capture startup")
Fixes: e8c8e9de4ee3 ("ASoC: mchp-pdmc: use runtime pm for clock power saving")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 8b55d864f3d5..4b380dc8b6cf 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -842,6 +842,7 @@ static bool mchp_pdmc_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_RHR:
 		return true;
 	default:
-- 
2.43.0

