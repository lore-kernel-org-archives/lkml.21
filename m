Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417302;
	b=ryDaVBBGVAQ0WCencE+7EUocD5TjsjNTQNPvVgie9JMBi8aWw0htI0jMP+b893h4+jl8
	 qhr6sH+SJcd7VY/1R6ZvWuClAFR/M9CzK2lFTNRt8Dg7+8bxH34UOL6cguY7VvgNJwuiG
	 3S/ikI0cMfCrgaHMXcEHHp1br7BpuzyqZ0FaqCQCTqZ0iFRLfQFqHDFJ2LSes9Mm/Ztzk
	 hp77uBZk1E74bfrufAFrtoMHKNeH19FKxUKxki0aALkAm03p/vu+laNpRyVPtj2glPkvR
	 jydLRX7CoGgPYBTPdiIYw11SVyQedoXi+aqRHKsahqEX/wAF++WTYwjJwmzCFySuvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7+UTTu55kRQmUMdXJ+fvljsspj1Aytx1XWkYCAQNT5E=;
	b=wrCszSWdTpLAkB7lZDadjjK42BoFLn9G/cZaSDik9az71DA3YynyXhiNi5ViLT0pd2fC
	 kkM9kyH/3iZbte1EfKXyqx7UoajkPLt/yeOKGWCjKxn0QGRdNNAYCKb3s9rz5cCpPbsoT
	 JHMaY7rgFsZ2GjG4XCvDbVf30z35JWGaWJyq2sNJwOTTd01TzIKfdg33B42temZvZTKDf
	 NopC8lE26yR5LJ3PYddhLofSZf6rb1OrePEOFYOxDwSPm2FNx812KzuVfKRvTqY7w59f+
	 49lx40BvbsrbyJcVFYpeY8DWBF7ozgJTg0V/YSnkTjzIKy+Wg6uHLDad6Yoc0zMZyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMuYwgcu;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23666606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23666606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMuYwgcu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so2778636f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417300; x=1796022100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+UTTu55kRQmUMdXJ+fvljsspj1Aytx1XWkYCAQNT5E=;
        b=EMuYwgcu4aXZ1yW0w/zqheN21Qp2qjOnboDqh3MH9Zjnh+8HaFazGiz69xCzzHjkJ3
         HZHacHIrj5VcQ1gR/5vQbQrVL4d1MbGcFpWK42ORVo5o3MR9aPmBBjJYdxySNFcwYpOs
         RqAQGkwgtEl+4AG3jkUzVHjMBJjbgeonUICyUluhfVOlf/T5fkVKs/22di0ACYDZxf7G
         5Ae12OupStszu/fNlTZItgLZ/8zHOoxMsEmB+Dx6nlv9O6doCXFFPVknpK1SE/Z/WRQj
         QPMJQ/MBQpCRlddEKK1a6iHQSdNsoH3F77PGQ3yVYGN9IesRDTfa+q+tqYWzs50p6P6o
         kepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417300; x=1796022100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+UTTu55kRQmUMdXJ+fvljsspj1Aytx1XWkYCAQNT5E=;
        b=HpjM74SOE1ZgfRA07r19pEZhcSBkd5fbZCUfZHetkzOsOBO56tC5kzooZfQT+X7jOm
         b2w3R+07WE758JsmWHzXGmj9AnfFjEBdg7H5Zy/iUfUtaisttmfVPGzcZE6egT3NVGyV
         U1EZzOR7SJ3AsvLRJUnXzO7x2YPwBb8GGWRlCm8Q5+omCr1DcBbAAeHB5EzLJ7jeL4KK
         gG6b8w9ptKVCUXhF0rtN06HFIgHyjzfWQJ0pX4aKES3AYcF3lIM3KWC2yNcTmfOxwwyt
         uDEyazxPciy7n2WdOYRhJHIjwpyR8OjKs5AaClVXRAmNavRpcCst5h1SBI3MvcSZjOlB
         8K2A==
X-Forwarded-Encrypted: i=1; AL+hErEPXb/kYqBiAdjg/5eDVZD+6UBO65i6iflUElLpHYQ/UR9bva6/azB3Oi2YbYrwgbWU/qwQ7ZlF9HzZp4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EJfdhhvcyGMKj/G9JY75iMt295gwr70fx6AHWACt/y2o7hN6w
	vI4NAZYp9KyGEJrMjTAwWm0XUCAIpyflo6Ht8Gv+Qqaq7qArgKfaqqNU
X-Gm-Gg: AZFdTZdL9rp4ztTwFG/FUcT1/z7h3euPS4bdIwhhDbxbv51o0ecGte3l2rZzRaT7v/E
	FpaZw1cCIpvzMu+7rn2JD1jQ3DarpxfQ2A+Gx+V/KWugghprYGnNkM0ESPtzwdwfWeJu7nu40e3
	lxFMOIXIS+zr+g0/dMJTw7tR2tOOCUkCWiOpzrSMb4bBxzZw7brrJZ0YWttbtnfmsfktZUaUtfC
	0970+Ctxya0R25uVV0poaC7y7JLxebTQNSBVW9M6G7A+SelgfCkTrXIC5UPzMkSIGs4m7ekSkxP
	m/73Hd3rrCU5UVBaDr1NaWoIrjSX50htnlReVwcmjBZ3Oe3Evi12rNnyR/ADD2ggYh9ugtdVmO2
	DHQsN5lUD9FIfJikCBRPv+uI3viHV+ZU9dAIoLIIaLNi3IeeQ0jYuBLeyGAcnkr65DT96dcWsdp
	dPlD+09RNGsEwHHGYkv18t06tgzHz+8YKmWQV+Ssntje1qJ4Iq/fBT9/eDEcInncpnoRYl+/4a7
	9LtOBPtmD3RC8dXbev0wWLFxCX2HRFyVl36xwglKJ9lTbfySrAwxHofh/bpJKa313CBVn6cv1Rn
	lnDwnVhCDUzj+s1Y+/P8V/O4dl+3uGlC+GCg
X-Received: by 2002:a05:6000:1a86:b0:4ad:d65:aaf9 with SMTP id ffacd0b85a97d-4ad0d65afa1mr19754515f8f.56.1795417300486;
        Sun, 22 Nov 2026 23:01:40 -0800 (PST)
Received: from fedora ([154.182.66.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm20779007f8f.3.2026.11.22.23.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:01:40 -0800 (PST)
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
Subject: [PATCH v5 2/8] iio: adc: at91_adc: drop duplicate IRQ allocation error message
Date: Mon, 23 Nov 2026 09:00:55 +0200
Message-ID: <20261123070101.53868-3-abdelnasserhussein11@gmail.com>
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

devm_request_irq() already logs an error message when it fails.  Drop the
additional dev_err_probe() wrapper and simply return the error code to
avoid reporting the same failure twice.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/iio/adc/at91_adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 9ecf8ca362f5..76000486b17a 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -1074,8 +1074,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 				       at91_adc_rl_interrupt, 0,
 				       pdev->dev.driver->name, idev);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "Failed to allocate IRQ.\n");
+		return ret;
 
 	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
 	if (IS_ERR(st->clk))
-- 
2.56.0

