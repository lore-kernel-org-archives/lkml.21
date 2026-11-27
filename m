Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799189;
	b=dWSdU/6A596Z5WwcVzfzjf73kuGy4ekSBgIEh4bPcmMvCeAunFSCLSO/UdBviwKZfzdR
	 o7V0weg8P51V9KuRV3MozjLMz7dWJ1G+cpXhEpzedOBkUmbR4Aq+rSuP647O9uhwzi5IA
	 vLRsdzNqIG4G7+omr0Tsl8eOz+VvcMxHLc/StozoGhvMJJagIkvmrBV3Bjj7d61+HJ2yC
	 SqKBGwWvbhv8xoyVrqrP/JWDjohK7QdSmLRJfEyDQ7frz+y0ICgrjidhw/HDO8xe7vpQb
	 eo3xKkrDHBEEmJXiF3h8FVORlSLFgMhE2y7jh7ry8BgDfpgV4Nq5Jt5e9k56L0+O4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gvz5aUWafc0NS4kFOYpuamCKKhW8CpbeqSpgoy22VUg=;
	b=ehjdwdY2g4gd8oRq5bKL+ktHT7HXfC4DLkoJVywJGkn9RxzjJlvjLCE1bgPh5OORE86t
	 ptS6He63fnxMp4yqD6HGznJZxxGHW0OXNBPInpRrICjVaHkt23evykn4DGQNsbkN4vIdk
	 dMYTTBz2bLQAYenWDwICglZUkixAic/7+B9Yrt2Z+H5A5NoW3+3JbkZz1BX4RH0HlAMou
	 m/DdhJlVFAoUBF6Dtnv/ofkIkPell9/ipbFZahWimSgrwrp7tUFrcvxULp8wCT9lBPMFl
	 WPghwi+W0JBjBUB/8hx6OaoWDk/45CUOFONS/WCyYn5bv9ykOruHSOEWYfornjY7PyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxxqLANF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89024606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89024606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxxqLANF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so80183525e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799186; x=1796403986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gvz5aUWafc0NS4kFOYpuamCKKhW8CpbeqSpgoy22VUg=;
        b=jxxqLANFPpaH1+5y0/cFQT4hhrySxUswtKPuWqXiqDlS+OuyPEOszdX+4++lih1DPB
         clnPVDzTM3S3Y4bNBFk9Af7oOq19s1tpYUuFQaJ86PpLBCUwYymgGlcoxTUpTvUReI00
         gaLqbNAj5Syd1/sNE6tsgSAi24OjO0BzsQ9U3HSQbUHP1aQAujeN76xnw1U1wQQz/BLO
         rdqzjvodbmHIm/ijsQVgS+KEHrgDpX6b1vsr46x5Glyq8wq0E+JwXwAn4ZGnGmrcEQuM
         ggCUVJ7A2xrOOWnX4T2u+MHjHC8XAvprwfu2bSb7t8QK7GzTeap+7NrAIytQ5Z0j38Oo
         0rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799186; x=1796403986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gvz5aUWafc0NS4kFOYpuamCKKhW8CpbeqSpgoy22VUg=;
        b=QlwBJC8wv4JKwLD/vBfemSKeHDKZjfA7lWrElHT0qqZbRCGLTaGSYHdcKnMBS3rJHR
         LSEBKZhJZlW0N4V+E2cRtBCk++yMjr7rW5XEvsOA4O3b2fDjHQrSYzxRiqQN8rpTjXWF
         8rfiVNVH6Lul6DFVFILaaqbYeKWlNkXNcca2IMqyg6rPDqIsc2epFxxlH0QldYmbl4W0
         aXtBjyhwDRIW8L82nvxlQXYNyRgkbzq+Pz5Rm227b4LgyKxQGZ9thIRxIg76gSPzVSQI
         SN7TjJwJhLWSaYp7cvxlPNjcBzkOlwOvVcq/zW03o3sz/PGzQzVOWBgRFwkFxvg/j6PX
         LINw==
X-Forwarded-Encrypted: i=1; AL+hErFRQwPIc4DwDqXU0Z/GzbjDmW5KmH5MZiW8KjrWjZ2xRJEUTuP8H/dlmcjX8kerThCvLpd+dPqmZCa4y0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v5PGe29XHQAT2GmeqK584WsiTw23JkULvMp8Yo5BEIY/hMn+L
	9q6U4d9QDhZ/soawp8yygzypLdBlIc1xpdCPvaLbZlGvfO/ANXe1KmoB
X-Gm-Gg: AZFdTZeNWoevR3wh8Nh2b6iNZSpGX61XJxMShtHW+D9yGC3d8OwJMAT/NKogndSVpI4
	AtxFsWiZX37Xi4kb9YwglOLGj0G6cuWyBR+ojkVNyoHAxadF4qkbCQyjChEPG0oAJqtkYoGhW+4
	5lN4cGVm/p4XK/51fqXjzZVmkAVptRMpst0PPCYFaNFx8EySNe1Nzp3DnTwDIIUsrs2DE74wpn7
	GXsNpIxTHhI6xlpEyiYaumx50yLpyhMM3PoOCeslkCgU9xsOg52IWbuYFQJJrmWfvASv9kS8XLT
	xO1IErErreVp4M0BdgjTG7OG2B0LI93Pba0KUhK9wbcryjWoYHbgRzkTjLk4iW3JaVWGX0b/h0K
	bPmpDhHclJnYCl7Szcz+dkDcy19GgKBKaGPHIlil6BVu7szkzNqVL9o6XQuKj0VRlOiT1G7YbYs
	lAkyE9N02DMHkltDKJwRnLaVQlEJgV/ncyG8o2zcfRmAUUZa7KUoV5B0RoD+VLs7AukFgXRIdUI
	rBfMHBdHobeWcUrTgktDzntC3/Y2mprz8y0ZKj9mHOdXqy6nFWwCqHFxAlPzsuRpcTKCMuy0K0I
	rpeu5E55pjVchax5CWR2NTSlUbKwPBT055IF7E2+63nbXmL/3nqYJqqjYQ==
X-Received: by 2002:a05:600c:c0c6:b0:4bb:b0d8:333c with SMTP id 5b1f17b1804b1-4bbb0d8335emr65847945e9.31.1795799185876;
        Fri, 27 Nov 2026 09:06:25 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:25 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: wm8962: fix interrupt mis-firing during runtime_resume()
Date: Fri, 27 Nov 2026 19:00:39 +0200
Message-ID: <20261127170039.663-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

During testing, it has been observed that the runtime_resume() function
may cause the codec interrupt to become asserted. Interestingly enough,
for the MR-NAVQ95 platform, the logic HIGH signal would sometimes peak at
about 50% of DBVDD (1.8V), which seems to be enough to make the downstream
PCAL6416 chip (which is edge triggered) think an interrupt has occurred
and report it downstream.

A sample of the captured waveform is shown below (sample is taken around
the time wm8962_i2c_probe() is called). WM8962_GPIO2 is the GPIO2 pin of
the codec and is configured to generate interrupts for the downstream PCAL
chip. PCAL6416_INT_N is the PCAL's INT_N pin. The GPIO2 active HIGH signal
peaks at about 0.7V in this particular snippet.

              3.3V

WM8962_GPIO2
                             --------                  --------
                             |      |                  |      |
              0V ____________|      |__________________|      |_____

              3.3V
                _______________________________________
                                                      |
PCAL6416_INT_N                                        |
                                                      |
              0V                                      |_____________

The fix for this would be to mask interrupts during runtime_supend() and
unmask them during runtime_resume() only after all of the operations have
finished (i.e. before returning from the function). This requires the
IRQ_DISABLE_UNLAZY IRQ flag be set to handle interrupt controllers which
don't implement the .irq_disable() callback. This ought to make sure that
the interrupt is at least masked after disable_irq() is called.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/codecs/wm8962.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 3bbaacb08aaf..8c9523d60219 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -4021,7 +4021,7 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 
 		ret = devm_request_threaded_irq(&i2c->dev, wm8962->irq, NULL,
 						wm8962_irq,
-						trigger | IRQF_ONESHOT,
+						trigger | IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						"wm8962", &i2c->dev);
 		if (ret != 0) {
 			dev_err(&i2c->dev, "Failed to request IRQ %d: %d\n",
@@ -4039,6 +4039,15 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 			/* enable GPIO IRQs if need be */
 			wm8962_init_gpio_irq(wm8962);
 		}
+
+		/*
+		 * we are forced to keep interrupts disabled while doing runtime_resume().
+		 * Otherwise, we may end up with some unwanted transitions on the interrupt
+		 * line. Some interrupt controllers may not implement the .irq_disable()
+		 * callback. In such cases, the interrupts will only be masked if
+		 * IRQ_DISABLE_UNLAZY is set.
+		 */
+		irq_set_status_flags(wm8962->irq, IRQ_DISABLE_UNLAZY);
 	}
 
 	pm_runtime_enable(&i2c->dev);
@@ -4131,6 +4140,10 @@ static int wm8962_runtime_resume(struct device *dev)
 				   WM8962_MSTR, WM8962_MSTR);
 	msleep(5);
 
+	/* keep this last - keeps the interrupt line from mis-firing */
+	if (wm8962->irq)
+		enable_irq(wm8962->irq);
+
 	return 0;
 
 cache_sync_err:
@@ -4147,6 +4160,9 @@ static int wm8962_runtime_suspend(struct device *dev)
 {
 	struct wm8962_priv *wm8962 = dev_get_drvdata(dev);
 
+	if (wm8962->irq)
+		disable_irq(wm8962->irq);
+
 	if (wm8962->master_flag)
 		regmap_update_bits(wm8962->regmap, WM8962_AUDIO_INTERFACE_0,
 				   WM8962_MSTR, 0);
-- 
2.53.0

