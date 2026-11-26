Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699896;
	b=LmRv/VlESIVQ0bsMIa84B6RdqPTnBtRaFdHv5ZF4jhp2Z2kEeoo7EqnfFyiG7mqicHIK
	 uyXrQsP9++kwjrWlwSsbJuj3Euz8IZRLjGtfrWRNk/k0ASb+d6matEaUqh96vqoDV1Tkf
	 xuGJZphncM1woi89GjywvNl77AjElrpuP5e0O74jBt3Q04uCgU01ycmhvXJQCtUa9iLBn
	 C5ZEiSowP/atGxUuxPHeDi7PSXv1jy6jsdXj1qWtQ5evtlZviVKsD/IIBJpQ4xW6SsOzd
	 3gnGWAHuQtHrnAC/8lY3Y6LNqrNHFQAnj+h700lC62aq7wF33mLQqR72w3obi6fLK2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IAeC63bgykE0xt6s4A43s8QYyD7VslIJJ5aC5IOcv9E=;
	b=B6myEVZ6b7OQrugqgMfCUkd//luHNlh9aoK5F2y/uDlOkxyjh0OiMpkFjKJQHb66lFPM
	 nkJVL8WmrO3uOzyVGQ0q8pFN1/QPRB8DD5o+7wJdjFuywewlsIZNH0QOa4C7xMT0vQjTW
	 3ymDGCD3ye4Uy5N+Ig8ULlKU0zJBpYBZsI16Jo752nECfmrqVaabofliynx0CIcx/YQQL
	 XAwzPC0t83PbOqbyLcRTB8O0NTIIdaC5ZWn4LRZASCU3lWe0m44I+vlzqX5jLXhB1tMwn
	 SCNoUWsyb7xM9jxJo9WJDue2j2zlIIo42Dv52GfKbZWlKNfxD4vwT3SlNETl3nL2wsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRg8E9BU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRg8E9BU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso15877245e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699894; x=1796304694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAeC63bgykE0xt6s4A43s8QYyD7VslIJJ5aC5IOcv9E=;
        b=XRg8E9BUb7GNIo4eTEFILjGUDEsNk54tT2xooxwXFPOmwPZepRMT0xHWhIb3FhJL7R
         7mGOAtgWSF1GhDougn8QAqW87OepDDJPQnQQejJmeiN31AKktUa8bTY50fZ6rCyYTdTH
         YWKOFJcJd5my3HZcXuMHuj+fIG/dB2YjUO+JYfgpbicukrwR8cSf/gccCKUoBEiwhyii
         0bcp6HSpETjNTcPdUMCUI8PWfQPeC+hdn7Y2L8sTR9rci4NorCN9AOThximjRWHLBEY/
         pPAm4zLZSvtUcNsgGbt+rjqLYn+Ex1jrXxTfIs2OKvQFweavoXT9rRT6+wa4WgjQi29D
         pUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699894; x=1796304694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAeC63bgykE0xt6s4A43s8QYyD7VslIJJ5aC5IOcv9E=;
        b=Lpw/DkWU6AKCO751lI0I0+wOFN3HjDjMlH5IgtQLxuEdDobtVO1vWYwgRq9hAZIaWb
         4MLBkSSunRl0HxNScaVMUeqB/cRPSeFl+LmeIc6nkRZDDZ0dTTlbWxTTJe95vb0MUtjO
         RkxyfSd2x/PtnZeFsFB6R4eZ220mTB93GIb7a4a2+mED9CZ786YuqVzAQCUdkePmrxkw
         2xQH2Z9Na6/fK1e69rJ6sW9HfOKSpExpNyL5SQZDgVyEtRnjdz0v4vmKHQ4+eB36WhaT
         aRl6hPti7JBfBEkRh8FQHDnATKkM3vWE5r4KL5GldrLXFmdzXVGZBqlrB1ahUqFj3dex
         Ylww==
X-Forwarded-Encrypted: i=1; AL+hErH4nmXdQkHMNHGKYC+EkKFTRef9jAFxfVEG/Rw7nvEIEkvi8yuzo5Lq8W+QBJ5v9tG/hdEtTeNpZiNSiIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BmpUcaaHJz2V6dd8U3UGVREGm8Ir9CrFJPSVGWsYWPMlyKgMH
	wX7spm0GljJ5eLFX9zP6ICdy+4QuSBM7InLMVx8aEeqlB98Fjdo1e6l+
X-Gm-Gg: AZFdTZdmxSMJ4e6+zike/R/I8LGOo4it2DhHPC4wR4ghjg/KKMZf3Kzkz4COd+s14GI
	IpZ292XThojX6biALr3I7bnPwx1NjYvZ1PVXl6WKbxqaO6dKcL2ABrIhNA1MiYwENrnt5vVIAKe
	uJjfKkECq+rCxGseZ5doXE8H5ADD8Vm0rZICl04/cOLm1+EgdHFVhjcq7EQSIwZF2HN4NPNWRIJ
	/L6+A/c6neUxEycbupMG+wDAa67mxEuW+UxJ1y0uoL7EMxZjaUggkb4jnow5geYcBuWElFCgRVa
	+kdqI6XvBXN26kKaN8jpYWIibUzSTFNqewqPWUwYWSWLjyNFnAft27OZS4OmDLq00wawmTH8fEh
	WM3zVIGrLYyBAsdPa1fQsBQYgKCdSznZU/CYZAwPADXMgpTjPDFOb9PgI3WoqUrXL+wUmGiMZq8
	9iZ7V+oJhd4KvYPEuBe6suo88OSSx2sM/7JxazbweFSjMSCVXWIdc+rq2WCQ2VcT8FZx8UKgM51
	GU7MEGOuIHwIa7NmYO/yqn0243HsEg/rV+AysWIu2o5hm6rdhulR8s1C4PFY0Jdwvqve4UVoZ1r
	NokNcBWMNFvKyBni7U/jsgsNtzd6PLDSMM+38IZ+ZGaHEG42QGUeVHgqFlDgIkPtBzUOFQpQvvv
	bhdPqRWc0BzeuQgoQ6p7qMeGr9jMJN+l2EaoXBU2x
X-Received: by 2002:a05:600c:1088:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4bb887f43cdmr331557315e9.2.1795699894271;
        Thu, 26 Nov 2026 05:31:34 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm794464325e9.0.2026.11.26.05.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:31:33 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-kernel@vger.kernel.org (open list:EXTERNAL CONNECTOR SUBSYSTEM (EXTCON))
Subject: [PATCH] extcon: rtk-type-c: fix IRQ request and release
Date: Thu, 26 Nov 2026 14:29:24 +0100
Message-ID: <20261126132927.39809-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

extcon_rtk_type_c_probe() requests the shared type-C IRQ with
devm_request_irq() and ignores the result, but
extcon_rtk_type_c_remove() releases it with plain free_irq(). The devres
entry is kept, so on unbind devres frees the IRQ a second time. The IRQ
is also requested before the spinlock and the delayed work used by
type_c_detect_irq() are initialized, so an early interrupt can use them
uninitialized.

Request the IRQ once the handler's data is initialized, check the
result, and release it with devm_free_irq().

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 8a590d7371f0 ("extcon: add Realtek DHC RTD SoC Type-C driver")
---
 drivers/extcon/extcon-rtk-type-c.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-rtk-type-c.c b/drivers/extcon/extcon-rtk-type-c.c
index da0b3fd3676e..a421ce1c4361 100644
--- a/drivers/extcon/extcon-rtk-type-c.c
+++ b/drivers/extcon/extcon-rtk-type-c.c
@@ -1339,9 +1339,6 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = devm_request_irq(dev, type_c->irq, type_c_detect_irq,
-			       IRQF_SHARED, "type_c_detect", type_c);
-
 	spin_lock_init(&type_c->lock);
 
 	type_c->rd_ctrl_gpio_desc = NULL;
@@ -1383,6 +1380,13 @@ static int extcon_rtk_type_c_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&type_c->delayed_work, host_device_switch);
 
+	ret = devm_request_irq(dev, type_c->irq, type_c_detect_irq,
+			       IRQF_SHARED, "type_c_detect", type_c);
+	if (ret) {
+		dev_err(dev, "Failed to request IRQ %d: %d\n", type_c->irq, ret);
+		goto err;
+	}
+
 	ret = extcon_rtk_type_c_init(type_c);
 	if (ret) {
 		dev_err(dev, "%s failed to init type_c\n", __func__);
@@ -1437,7 +1441,7 @@ static void extcon_rtk_type_c_remove(struct platform_device *pdev)
 		gpiod_put(type_c->rd_ctrl_gpio_desc);
 	type_c->rd_ctrl_gpio_desc = NULL;
 
-	free_irq(type_c->irq, type_c);
+	devm_free_irq(dev, type_c->irq, type_c);
 }
 
 static const struct type_c_cfg rtd1295_type_c_cfg = {
-- 
2.53.0

