Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169072;
	b=ScSm437kxk80LYRV0zJKkvwDip+JcBscJggTOo8XG6DDEAF9OwF8dt0R56x9lAtk20eT
	 pC74iY7FLLUjLB4U72ERNKYtIOyyhGp7LqqjAXL0GjIxVDC974ZRfUXYZxID17VMC0Brv
	 g3xh7l38mOm2KgpRpQXQHIunEds5tsE9w0bM0bW37GJtMipvp3UgnZC3n/ehluZhwqCWm
	 xSU8eVVOboEsRC7F/SQpClEpKRSfpUqYMN6njUWymKe69i44Tg8lVlkecqOFMrJGFxLk7
	 yGVr5Tp9Znfmwr/CG5fSKI24rEvakTdBPdDLLoMVP6Xf0v8xJcdNs4ZlRmb7frWr3iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
	b=YYbUze9t8JX5rjgW3eV6zCg4T21iQqwttIjjT6eBWdQqyQArHpi0QLEjsmwIA31MtGzm
	 79q/LjJbYqmleubQHQHIqZ6Oguw86pFkoFYk5xXvh4at8ZVuzVE8AnWbaDGAbO0RjYVcG
	 osMWDhctC0HRLSSa/7TChwreQE2aQ0Y6VLWut6uPAX4dtDPl7SIJu1h5c/yrNzi0B6OHB
	 6e3VZyh1o+2XGDJRNWkY2x4ChgG3JErfdgF+Nt1SOtWsK734PvkgnV/R/xSdt9r2tY0gL
	 LSSRMoSMXaH2iteE4S4oHOnyRs4ZZGA3xqaHz/xIjKj7WL018uzEII+Ni9osjGJfCgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rv26arhW;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC56606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC56606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rv26arhW
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eff92780daso5129405ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169071; x=1795773871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
        b=rv26arhWCmPTw+sGPLYU0uZRUZySILft18MOw1dsJV6s2ZB7fEQ/7c9oU2q4avOJRQ
         P6ywwpyVAnYf4JZslqApm6RUgfklMx7fj3V0QJGETa1rHrisIBBoR+fAxb0HsX9oMER5
         JxUqF5dZZv4QancIRpxevm3WC+OMkOQz4MiACoFaw/JFYUBUQqqzLdqBDtJL1yDEKRdE
         H8rtHN2aYSfC/AUVxhND/8L/vluzACFGo3rY+v8vamFaE6dX7yTE/YllWOFjj82E4qbv
         tzXONUndkRC/YFDECF87vUak2sghtrx/zPuOFdVNXFGXIHfJWSYaEP0MMT9bD706pQNK
         pzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169071; x=1795773871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
        b=TCeXsWuG+UhEPGz6np85WTb+UUcbrHzez5aZddnRH7h+VW1DX8OqPghRDkw2WikOpg
         jLcJ65JOpTJzRdbqA8a06T2RcLfWIcpDl1yk6RQkrN8fX5sqoCQXMTroK+/yNVri3vbi
         VsVROD36vYWqdhyEHCl6WaiSi8G9obOhjUYW8WsiT/8ixnMPVauj3TSMM+m0AsNG5J63
         akZXoth43sRk8+so9V96p1gh57d6fRS2htJl2OftetgQ7hyemVpl43gYN+g/IchuaqEl
         B6JFnMJim05L6PwDCOiz/da8H4nCNoCS4kxSGqv2o6aBy8vyWKhAacjt70X1ZA+IqmwE
         b2lQ==
X-Forwarded-Encrypted: i=1; AL+hErFL9f9SwNNVjlZ2+tTYP7L5Daip4dk+pBHNyDF66AK2mwoo8hp8vmGcO5Nal+g6Ncqg8YGqLB/e5LWxnts=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zugGMeXklHGPBDIkzPt+tOh6FFQkBBMeRPMCpa2u5hoq+YHY4
	Q+OTIGHob4UiKg5KPWPw31CK/pS7UgMuAjNHP/LWRt4IysO+1/zvE9lK
X-Gm-Gg: AZFdTZfWT8fwfXHrwrkSu5J4wYYwQIMETs0BTzrr3WH3YIj7SVyWAMvmPmffBgxHwPl
	rD/4AlDAFlc34MzkZ1oZV9z3sRBDvsnwQ5gna9fyoWdp/8glJXC1l2ODrhupYMJClLbqgetHos1
	gSxIIxRdeNTRWYKutCN4/63JQdTWKZwHd6WHiyKGDNnUUXlOEwLJgujiic24xNJgtPpXIjoK6aD
	mRoxtxY0yt+/HAhEIyhyNRHjM77cFbqqB5zdpWUP6Wp3MFMdQ16EGPuDGVTbs05xxOq4ki/uho9
	29XzooU9xJM4ZvIUcLtfOKaiCqa6XZWNdaPduIyfu9Xg8ryMW3Cd88FfOVw+s3x6Z/rIlhYOkAi
	shV9BprZSArBUf1rUkUAibasIm5Xe2GKirw0DtWqe5R2R1QaRZijqP3X2tnhuJt4ja/s2lrhC3s
	ZdPtC40PwwINYvqHBlCcfgQUwqr+jzE4IcSUm2972uiEnfbd36SkRIT027Xi/4iGsfph0ecS1UI
	4rVui97kGQ5aVHmB2ygKQ//29BnVGEP65FJly+6OIC3QfJes5WlEkGBeWdWOg9tWMyJuX1a4pts
	2oORc4r89XEga79H4cd4O9cYUDYKG1Fc0jOOP/OiS1fo0fthTMBx2G8feAb1njYXpT8pquEPk43
	tRijcAjS7467qkFaazUTOEDZjXcOgzLQbnSPh9+Kx3mCk
X-Received: by 2002:a17:903:2391:b0:2dd:c0ff:e72c with SMTP id d9443c01a7336-2f03f263555mr26063905ad.62.1795169071541;
        Fri, 20 Nov 2026 02:04:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:31 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Date: Fri, 20 Nov 2026 17:04:07 +0700
Message-ID: <20261120100408.8053-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120100408.8053-1-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
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
Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

