Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417313;
	b=tcMGxkucm4VirDRhPsdXl2HeCS1Dd+1eSYs+9H2pw6YU6njYYRGya8LVPgMGbGSK2pur
	 xYKI/v22/cAwQBjbrV3cq9tLFmNCfo48PyVpftt9Is79cYxevXpZQ1530hN8kJekoyDqb
	 zpaEjSr68ZAk+hm+G9cJ7Td/Tn/EzRFTOS/cSjL7r/TKC04lpLYB5+hSY6ocpjodCxU+o
	 VSH4zJSBaOWfgbI027ooctljFWPfqFU7awJhcIwz87IDIYzTzOkfko9OYuWLXjYWLbgns
	 u5dizf5pki6dihWdq+ajaUFdkzhrDzmD2SS55QD6MMpQejeAaQEbJMOYGy7NpJcFdIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BaHVj1vymyANMIuaDlnAd/LpWMipmRDfZVKqcVMgeBQ=;
	b=AfeYIwJTrkMBOv2A8Uf21KAY/VeBq1fpfc7lionLhXb8jBQGf1VHiv/nzLdTx8mdBG/P
	 zcx5f0xouob2zzp/YSrplgayj9g6FOcOTPDcjrB5jWVGeAgZSLVijOqUUpm6w1xLm/9ZS
	 CiHpMqCRXxX98HECNR8asPfNSVMEu/qyVHMvXNa735K6k5dFT8dCiWEBSXJFnAJMHjMRe
	 zge2X+x7GFvpF+Fv8Xmv6GDKGakUQWMARvCAqpklYrSTh7WqIZxaBEWL/H2c7+dXUBsEZ
	 jwFi9MMxDP57xIQiA2g/Daenipkj8SNtnbSAcK1NjulVBjNwKaD6W005+1DG4aY/blw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVkYng4x;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F83606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F83606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVkYng4x
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb606491faso15775355e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417311; x=1796022111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaHVj1vymyANMIuaDlnAd/LpWMipmRDfZVKqcVMgeBQ=;
        b=CVkYng4x4mEQ5lXZmAniDlM9/OoBk5AFW1ldYs+5E0C7TfuPXvtewxUDzoTf0izWu+
         58k4A39TAfQjaLr70kjJZ8qe/cbVT2MSxDycuJXoIRSaMVidCxJr+wzwDiZdAE5vHesJ
         6M48Oh8012gQY6kklaGIcPYcecJA9TBR5r46206WzyzGuguCUMBdKEQhc6Mq2Nkxcr9o
         CN1mW62lU+xuSjrTTLfGmcTNFQr52e5qqLn9+s3aPLOOiZ46DMBpSEg1h0DUPGYUcMFq
         0pDJRPrcXQ2Z4yjbMDJqTZxYotfD43HWkZob1Ls5PU+u2fP7E/s8UUsaPNCrsl0vusjv
         5zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417311; x=1796022111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BaHVj1vymyANMIuaDlnAd/LpWMipmRDfZVKqcVMgeBQ=;
        b=OuRc/QCUejk1qh6Mm+YZyXvkk0vyY3cCGQUPQaLqrIXzPxDB4O9/RbIrzeaKriKFf5
         JEOO7+5FlM7qsL8Bnm5fWhfcmHKlPaoxEioB2hfioEb6bFzaL/MEKbbNqs9/+IRPh6Lx
         W6pWMdZlIzl3/p+uBo8bMWnNRYZeDLp0/cpvzTSEw5FPZp4Bw8FQFh+WAFxJ//ep/c4R
         RGPlYnVxsimCox9xGUEw0s+6lERZmuOb1MTlP3XJBD2dOvMeG1XqCNa7OObw9JmVzI6h
         2hELSQ2DpKJrIdmAZD7Cc8pKKG7fA7+0pQlTL6zm6w1b7fb66hLhKq1Lw9NeetCp39dL
         hX3g==
X-Forwarded-Encrypted: i=1; AL+hErHe4C/fZoPk6t6wgJRPRcsslXXevK1EYkfYRBKkjSxTwdqizNbe4E1Jj+ALPIxvV3MjAuIcl9pNrrSY/bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CDxDtRvlazhHc/xmn/fPOfdMEOpE63w1M2EnF8u/C4tpiahhV
	9w/+zusoK8kX9U73D8CJboCRCJFN4r+zZPzJS6cksNY0vRO64RJvPYmo
X-Gm-Gg: AZFdTZdNiFTjxeUWQ6VxPkYfMOJOZdfWx+pYN5GkG5ehTmD8syTWo53xjr57KdCBfCT
	N7kqCcK23iDZ471tWb/BnoXG+Wakqqx4uS9dQtLOsa4hqDlUkeMHVFP8Q/0qpStqnuUOI+gGdYj
	RK/pSG4N9nsWMSmdKIQte6WDYRmWVV9TFwydQOhx8yKOLSNw4l2ogRp+c+jX8IexoEiljv5r7ZS
	QFX7ibFfvJHJJmau63gdt+JTcNKlz/PNabhrv3nnyjD7Q6hgP6kIRKY2FiDqsD235qYVbBrgZDY
	dhdb/EBCkdXYI65c7sbo/SdXKGDiROozmRbtphwT5NUVLNgLTMEDD+8ryk5ggFvplhaRTzoykhy
	54S+WFazCLqNCgLotgKj+vjgj8FtAY5tZpMinQ8OvVzEIv8sr63V2s26X0/MHDacXuH1eRal8kJ
	8IGv19h7E7drsp3nJck2DqD/wocxPh9d6dal0vO+uGB3KNBeKfwqGETsAPAGvrHjJQhhqcgDi3P
	/OHlev2BCLkVYKqn9yQSQgWej80QHJi9ucrVavEe/Xd1hKEjaRR21P/cj7kQbHCtYbgCzSSE5aF
	DaFrP8X/zlLWYgU02yxWBKBCZDwek1qnWiRw
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr213919275e9.31.1795417310939;
        Sun, 22 Nov 2026 23:01:50 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:50 -0800 (PST)
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
Subject: [PATCH v5 4/8] iio: adc: at91_adc: convert to device_property_*() APIs
Date: Mon, 23 Nov 2026 09:00:57 +0200
Message-ID: <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
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

Use the firmware-agnostic device_property_*() helpers instead of the
OF-specific property readers, so the driver does not depend on a device
node being available in probe.

Update at91_adc_probe_dt_ts() to take a struct device and read its
properties through device_property_read_u32() as well.  Since the helper
no longer uses DT-specific APIs, rename it from at91_adc_probe_dt_ts() to
at91_adc_probe_ts().  This removes the need for a struct device_node
pointer in at91_adc_probe(); as a result, at91_adc_probe_ts() now logs
against dev (&pdev->dev) instead of &idev->dev.

Drop the " in the DT" suffix from the missing property messages to match
the firmware-agnostic property APIs.

With no OF APIs or struct device_node left in the file, drop the
<linux/of.h> include and add <linux/mod_devicetable.h> for struct
of_device_id.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 2a378540837d..b6e6fa77c782 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -15,8 +15,8 @@
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
@@ -790,13 +790,12 @@ static u32 calc_startup_ticks_9x5(u32 startup_time, u32 adc_clk_khz)
 	return ticks;
 }
 
-static int at91_adc_probe_dt_ts(struct device_node *node,
-	struct at91_adc_state *st, struct device *dev)
+static int at91_adc_probe_ts(struct device *dev, struct at91_adc_state *st)
 {
 	int ret;
 	u32 prop;
 
-	ret = of_property_read_u32(node, "atmel,adc-ts-wires", &prop);
+	ret = device_property_read_u32(dev, "atmel,adc-ts-wires", &prop);
 	if (ret) {
 		dev_info(dev, "ADC Touch screen is disabled.\n");
 		return 0;
@@ -815,7 +814,7 @@ static int at91_adc_probe_dt_ts(struct device_node *node,
 	if (!st->caps->has_tsmr)
 		return 0;
 	prop = 0;
-	of_property_read_u32(node, "atmel,adc-ts-pressure-threshold", &prop);
+	device_property_read_u32(dev, "atmel,adc-ts-pressure-threshold", &prop);
 	st->ts_pressure_threshold = prop;
 	if (st->ts_pressure_threshold) {
 		return 0;
@@ -990,7 +989,6 @@ static void at91_ts_unregister(struct at91_adc_state *st)
 static int at91_adc_probe(struct platform_device *pdev)
 {
 	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
-	struct device_node *node = pdev->dev.of_node;
 	int ret;
 	struct iio_dev *idev;
 	struct at91_adc_state *st;
@@ -1007,32 +1005,34 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->caps)
 		return -ENODEV;
 
-	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
+	st->use_external = device_property_read_bool(&pdev->dev,
+						     "atmel,adc-use-external-triggers");
 
-	if (of_property_read_u32(node, "atmel,adc-channels-used", &prop))
+	if (device_property_read_u32(&pdev->dev, "atmel,adc-channels-used", &prop))
 		return dev_err_probe(&idev->dev, -EINVAL,
-				     "Missing adc-channels-used property in the DT.\n");
+				     "Missing adc-channels-used property.\n");
 	st->channels_mask = prop;
 
-	st->sleep_mode = of_property_read_bool(node, "atmel,adc-sleep-mode");
+	st->sleep_mode = device_property_read_bool(&pdev->dev,
+						   "atmel,adc-sleep-mode");
 
-	if (of_property_read_u32(node, "atmel,adc-startup-time", &prop))
+	if (device_property_read_u32(&pdev->dev, "atmel,adc-startup-time", &prop))
 		return dev_err_probe(&idev->dev, -EINVAL,
-				     "Missing adc-startup-time property in the DT.\n");
+				     "Missing adc-startup-time property.\n");
 	st->startup_time = prop;
 
 	prop = 0;
-	of_property_read_u32(node, "atmel,adc-sample-hold-time", &prop);
+	device_property_read_u32(&pdev->dev, "atmel,adc-sample-hold-time", &prop);
 	st->sample_hold_time = prop;
 
-	if (of_property_read_u32(node, "atmel,adc-vref", &prop))
+	if (device_property_read_u32(&pdev->dev, "atmel,adc-vref", &prop))
 		return dev_err_probe(&idev->dev, -EINVAL,
-				     "Missing adc-vref property in the DT.\n");
+				     "Missing adc-vref property.\n");
 	st->vref_mv = prop;
 
 	st->res = st->caps->high_res_bits;
 	if (st->caps->low_res_bits &&
-	    !of_property_read_string(node, "atmel,adc-use-res", &s)
+	    !device_property_read_string(&pdev->dev, "atmel,adc-use-res", &s)
 	    && !strcmp(s, "lowres"))
 		st->res = st->caps->low_res_bits;
 
@@ -1043,7 +1043,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 
 	/* Check if touchscreen is supported. */
 	if (st->caps->has_ts) {
-		ret = at91_adc_probe_dt_ts(node, st, &idev->dev);
+		ret = at91_adc_probe_ts(&pdev->dev, st);
 		if (ret)
 			return ret;
 	}
-- 
2.56.0

