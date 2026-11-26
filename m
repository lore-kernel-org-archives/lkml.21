Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=VqwuFtQ639LJFbd9X588EX1UscSvPY+3Kg+NQN29pMsJKyyBKiFEzGLZaMDjwNTgmESq
	 YB5DFky+A3bu3HuaDKm3Do+9OV3jng15t+0/mdww2L+uM3OHqXobPTKsdrCudVa9HGoRb
	 SUFjZqjSxdOqVG+tPbdsvIBWpz87hg/swr7ZAAPHShaBqSm1hazn/NTHrXfCqzhXih45e
	 2WQ37aE0X1tVg/H0hlRWKIQ7glOZqli0xebs+DEVF4B8jgLFXl+jxbeEjQMwPywbUQLk0
	 Dk4IGfg7a7+roXTbq7cuned+q0cXDnPDeK3wj2NBoAesyo6cGYItlTTCZktBVNnpHiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aBxl91IFHxSp98BX9SH0COzdVVb1RDUdXups0y1oPJc=;
	b=TI5ijSF8hovjfXQZtPB/R6W8vw0T37c88eo4K3gdDJrU3z4E0ZHomULtPVlBPo3g0SuU
	 qQd5jh1SnIBX9ZI/rdQZzYsB+8MJ2QRPeS7EslhFVlOTbEMiQzoCS4082gL0HabcGV6Qc
	 29ViTwBmMDJI3iviL9pPthrJtYaUCIL1NyZhYITicGjb+/qAfkbssKz+yvYkr20YuoB4e
	 1kOIC6CH8JPCa09AVBJX7K/WLVYpzoDx4wDxEkYNiLyIbECvdLIpBFVjRUEQM5p/DGN23
	 A7Hu6MOH7LLlYdmEO68WFsFiOeYchb6yz37jmQYeF4EZArvpvWzcWHeUBwIr1K6dIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW6BPGYV;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39874606A6B7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39874606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW6BPGYV
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso3531927a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729482; x=1796334282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBxl91IFHxSp98BX9SH0COzdVVb1RDUdXups0y1oPJc=;
        b=IW6BPGYVOrol0f4wJZcjab8yATdY8piebeY5iaUxFJo1v9tlQOaY8ruNdgBoLdlHfB
         bzmoXiSHiG9u135X/CbTkWqp9Y/InWcVRcO9+7ZqH5VrTCbFQlL8CTj28UhGBvcpj3LW
         Ha6VdRLS9l7A0rlc/wTK4d5xmdaEv32XjOgstJkY5q6VwuthX5ygfZ3UFVT86couTDLE
         H33E8uyS9aHATUmHvQvlKPiCL01H6sJbmkTml4HYbMXkVkT4znO019VMEY4oTTG8M3JS
         DZM7SY5zLgGq9qeIx6ijRI4fEuuC6xRDvHbK9Urljii5KJzEs0Buw6hT5GFklzV0tvbd
         LlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729482; x=1796334282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBxl91IFHxSp98BX9SH0COzdVVb1RDUdXups0y1oPJc=;
        b=yFwGhZUmQ9BRlFzEad214OUGFoEqCkm/LpS0JMoH3ldfFeGUFUaHXkRWz7WI0gjDW+
         T5lCc/Rb54aquNIiP5oRdVBn7VODXS3BbgJ0PTAQpKAVI5cZHRMyEYnXt2O5ktqg4M4O
         X4Mo7vAUGJ8jE/rjzJyu5Vrn3ZDABhwwimcQrQBJp7nX0kwRTtYiz1hmZkSd5KtfrJ7Y
         pezFQNyxn6h0zMSvX8X5XebsQ0CSrOxaleuv+T/cnB4zQ+NqeOv1KTVuhoLN0LpZ9MqK
         /0Xzk/Tc1Kt6nvXwQ9n0P7mGqjJvXqfhCD/amn+cIv28Na7zVgzak1T8mraKxTc9HylC
         TNOw==
X-Forwarded-Encrypted: i=1; AL+hErGN3xvgt8p7Zc5KA7O6owvBpVyis5RNqTOowyMSbd1iW/JBQjE/d22ODwEHUXaHhymuACL3rF50ZnCDRpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o3nZr/NM7jrLpXNTK2uTUgSZTOcrLhGsy/PYwVur7IqyRkSvn
	BNcoaD1zbvYNElCqM7dD6/+oJB8f0Hmy2LKXS1k682IjCFzRhLawzZ0g
X-Gm-Gg: AZFdTZeDFQ9LFpFIaSy9PsGF804yd3LngML2oKmVUr3LTv7kx/HzxPqcmBfNkgxXQye
	0NxMdx6uB0lYSgCGgtTYYUZg67xHvquvrbd2i6/rIUuCm3wP9ZxwlbdmxeSM9lYCQ2Y6N6NptK1
	/l6Ek4/7aHitlpugWY+GOrp5EWW8oVuI7uSZzUd9cqOGeNXaz5zjUvNZfmWlUBh4pFjzNLPxXi4
	yiEc7gJgWeGt/wmYJwOZYVQzlX+LwnzBJPAky2TFj7cqqyrQBgzdSd9JOcK/BHxfE75gUnTKEUC
	lJ1Yx3gWhNe1XnBAour7fisaDMnnR0QcEsGpabpmIvEYRb0U7P6W+v6eRmgsP2Ad91yUDW7z78C
	nu0zGQ846z/IKNPuBqSHf4g7ksfH1v1RvSE7xajzioVFktXbTJy4axNJzUi+r8YYy+PTvoQ1lJ+
	0q0wyE0QllXE/1PhW8p7JBL2ovFoL0FOc2Lcw4S+z9stw1ur1+z1qe5Vn1MsbkU7X+nVevdmnjN
	ew4E5dBJrczNjYGWctPOjlA2mBU6NNxVwpTarucGB0kUPCOFOGEp0auRa6P95+NppuJhx18ovVw
	Bwcj+8sfJEi/NQGmuEA20Yms3YmZLBaPO0Zis0pAYjeED/7MBg==
X-Received: by 2002:a17:90b:4a4f:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3b41c93c3b7mr22564159a91.42.1795729481653;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm36176538a91.3.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 4/4] ata: sata_gemini: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:44:33 -0600
Message-ID: <20261126214433.38317-5-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.38317-1-artem122novak@gmail.com>
References: <20261126214433.38317-1-artem122novak@gmail.com>
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

Terminate the SATA clock lookup error messages with newlines
to keep kernel log messages properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/ata/sata_gemini.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index 9d87603ef531..b69db749b49d 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -227,12 +227,12 @@ static int gemini_sata_bridge_init(struct sata_gemini *sg)
 
 	sg->sata0_pclk = devm_clk_get(dev, "SATA0_PCLK");
 	if (IS_ERR(sg->sata0_pclk)) {
-		dev_err(dev, "no SATA0 PCLK");
+		dev_err(dev, "no SATA0 PCLK\n");
 		return -ENODEV;
 	}
 	sg->sata1_pclk = devm_clk_get(dev, "SATA1_PCLK");
 	if (IS_ERR(sg->sata1_pclk)) {
-		dev_err(dev, "no SATA1 PCLK");
+		dev_err(dev, "no SATA1 PCLK\n");
 		return -ENODEV;
 	}
 
-- 
2.56.1

