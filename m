Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417328;
	b=xlRUzJaN7XOi2X2cP7NCtqYz5DrvxeDNdxR39ukyPjic6QWAWm5CMppnr3l3n+OLTqEf
	 oqvKgF9Us6Q90R+DEtLUuz3lTViqnOH2o4ARR4t09gw1T1paG2N3XIO2RA36AE49ui/iD
	 Y8N0+nnO/sEylt6QYl0ajrmQmdH2mY0MGElNepiSfl35LGdG65urxCNciHpZqUhjA6+Jm
	 TPsXJTcJRnyZraYS7qz5ygltzRDuJL5y0QldLbZL1i+NixcAzRXml5dTTHWO/n3KMnq8k
	 1vnndjZpyLRNoHp6I/Fs04LanTXhc0lm8LhE/bL9WPEPs1fh9vc00s/Cd6IaoL0UG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=;
	b=jkLr1C5MoBKiA7EyqcubfmiS4PdcNirqpTo0QYW2ev3SxsFFN6nGd2fw5/2RcWV1+Wi8
	 MCA4TzM1mV5JCjSMG7PbkV3yAR5szc5WmfTy5azr8dWomURo2wIQtrHcCQAzAsRKVgPsx
	 qidZ3ScbKUF5kPCd1Gpjcbn07RXCgT7YKL2hfNH23z6blUFxFMAhev/5Mmouvecz5qupL
	 18nZH0+BR7yce8m3lEkFdGkwywjtPsFaoiPHwOAr9u9Pu2yU3WUgZBt0VU3Yb3USBBAmA
	 AoBcfoCjh0WGvzx+6XMHe0O6qZvUx4tIlJBmq9UdRR++rx+0IzL4gY43YcqcnN/SDLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzc1wFmI;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48209606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48209606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzc1wFmI
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso2129857f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417327; x=1796022127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=;
        b=dzc1wFmI1XZtA7yg2m6U4ClN9IZcg9Pbnf3oGuL+7hNGVk00tPxXfLZbq20tPvSkHV
         3MXMsXays6FE0qkureqKR+lC7Okxc6ysU3gvQVHHtKc4UzJDXTKpUO8sN1AhZTKE498L
         YLePcQwT+6SB1VzhcSGGELTZwsMmP6VfPSOUw9YBdUg6a6OAY8PrhC/1cDli4F4Wh00O
         VsKSN4CgdUfkmzVlu4McjDF4uA6IWrmXffHCuucjdN8T9UL2OF9cIrgSRK1lUHt/ifjM
         Gmsp1kcROHrIpsGrERW6P23DFTbMF052DAMcS5pu6uB+N1r/kIJ6MG7Ik52h73cwJoWF
         EQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417327; x=1796022127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MJvqtEQ7KzkrkQd7jNXZvcPx36rVpHnL5D10mePtG8=;
        b=iDG/M1HdoDO222jSVUKoqFw+ntTbFgitikSP53avI+irryyuKp8YxIwkAPEyKxhKcH
         zFaN5n4vnqB0l/DDDGtveuQ7ZxYR934SluihEBMInQbnkpqVJwevNNxpYKH8GzUmlwUU
         VSCytwtOQZdJRx5JKgy00dvZXReMh+8pdJzTGpgp9jsBYIQIaLZyrRQnTkS9h5TUfQK+
         SIV8lafICJqJM6HIjQ6Ax0yFL72lWMfPgBAdGlVFvxJdlFCDYC00kjrUS+wfgudeQ7KB
         utTpWbXRO/aGThXYLJhnicq/kgAKRrPvhxUdbwYFw4jGODGhE52NtTQT4K2VZ3qtLPDB
         0Mwg==
X-Forwarded-Encrypted: i=1; AL+hErGuSOuGebnmN792Mpc2d4Ub/7JRMCexrYfeVJNvEAFVDRw/mcAgFm4aiZ9sQJ6gziCWj9ILo8A7YpiQs7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z91J8FwW5Ds/UJDXvtmTuXtDxj1dTa8PAvS+a9gYfsObGJoTBW+
	Lefyne70znkqWgYc/SViWHfbkXjmqzwStjgJ5CgdoFDdtMWPIUUXoi/0
X-Gm-Gg: AZFdTZf2JiVBDSaCN5IPrFAk+g3AWcGhYCSg6B/G6R3sGSMMjMjpC1sm9fOoGvQlXGy
	tfCEsDnPRXA7ZpmCaoso60kwddRPhhlYDrf6YY+30wqsl5ub4BRy0BbilaqjC9nDNT5lvpr0SYc
	/wpszePwy0739thl56K3sAyRIna+DDcv8fDte5xOS204KB5oCpdJdUZR7FTfEGxe1VgDC7GK+0S
	orArkNHtoBy5dUwJ9ygy2LS+8f0YvAGwDgk+dr+oSxVfZqZ33tIXRnNt+rDdURkIFo0O4rp+atp
	lGnc9vj4NyzTVuonUVaw4sD435EReOS6zmUnoqmsJD8oM4vA9/4Dn3lwNzo7O36xz5ekA3MkjQN
	jq9dXgdip9bPThouSK8YdGUxYGTEN4M+7clSY8pXc9Q4PY5uU5cZE0MI4OEWzWnkVgPwjNW5VMU
	DOyz2iWMs/sffmKUZ7JkdHuuaXLQiJ6D/6EvxUpWaJO55+C43brkNLxjEEx63tp+0fOMatk4KkL
	1+MKkPNgEU+zGSV0bwlQwN3SXLWfnN2WO6AUZXV6f34gIBHuMajUtYU1/L0DyTGTnr85aJmB4Ua
	m/BMEuaZN+oUQbMExdPhqS64DYdz180FwcdG
X-Received: by 2002:a5d:64c9:0:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4abb1baaaa5mr21008231f8f.15.1795417326388;
        Sun, 22 Nov 2026 23:02:06 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:06 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 7/8] iio: adc: at91_adc: use HZ_PER_KHZ instead of raw 1000
Date: Mon, 23 Nov 2026 09:01:00 +0200
Message-ID: <20261123070101.53868-8-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
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

Use the HZ_PER_KHZ constant from <linux/units.h> when converting the ADC
clock rate to kilohertz instead of open-coding the divisor.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 05e8b3deb043..62f8db630640 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -21,6 +21,7 @@
 #include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 #include <linux/wait.h>
 
 #include <linux/iio/iio.h>
@@ -1094,7 +1095,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	 */
 	mstrclk = clk_get_rate(st->clk);
 	adc_clk = clk_get_rate(st->adc_clk);
-	adc_clk_khz = adc_clk / 1000;
+	adc_clk_khz = adc_clk / HZ_PER_KHZ;
 
 	dev_dbg(dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
 		mstrclk, adc_clk);
-- 
2.56.0

