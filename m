Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500731;
	b=YT+tf50gR1rJSXf3Y8GbX/jAEL2n0s1ZOQexfx2xZw/M8bQP+5eUEYfzZjsqQBUw4irj
	 74pYKqZ4wwBGFEoqiz7/u/fa0OaVIulFr6GZSkxUAqBeyUlkDac3213K0zs4YF/3Ewlwk
	 w9kMARit1UaQNvRWy2T3850o80JAjtWvaXGm13bZA2WWGTdTTk0RF790MFF4TJjqXp/dM
	 XwBHHcRA8Ec5n3pmPsC72QXk7tbZll+ikhUBmQc2rG0NOFXFxqtPFBXprBQyjj3aS8XVV
	 qlQ0eOJyUn+Krshi7+uJcwh3t8jKy5Tw0DKmQuquS+9+WZBCEBqGjOKdNr3Xskp3MLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=mWyKPl3fYTX21Xcks1P19Wig3EEm3zJMXAWb3yv9l3A=;
	b=PdyfSIHvqZV4zCAJGrXZPxNIdLn+D+GzHjEceJkQv2n5dVDI14YFygjn+OmH1uWLvkm7
	 UIU2/QOHhnrjWK7R3+7Px82fhz1YCg5RGG81YRbH3E41UinPPgSQEo7cqVQKeA5z+gBq+
	 5+S908L4ZqrNRpakuEVutT5LhKqku3/oq16GQ2mHzuuscKhND+mGD2vF18wiPveR19rI/
	 0ie5Vo9KvK3KkwTicIlkSs9pxE40H3rUpZ8uCbuZ5FbjbmiQvgitSodQOaqDmaR/7AI1f
	 p3UP3jyJEmc7BsnnncWVztM1kcOKWGXKkPsP5ClKDWQL2ddWFwCF6H/yy4eZd+y6pzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f9Ys9Wpq;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98991606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98991606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f9Ys9Wpq
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5133831027so587703866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795500729; x=1796105529; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mWyKPl3fYTX21Xcks1P19Wig3EEm3zJMXAWb3yv9l3A=;
        b=f9Ys9WpqUBNwofnMXws6H7c1ikEeVn0TLgye1StxloHsFI4+xJsEx1ie0h1AEeX+PP
         86DxzyjeCdH+SWbbe0XLkYzgzNOhwV/1lfv/12RJdAlsuxAZg+dIl4jVUVZ5bz5mjzou
         bS9O72YKKePqcyrG9BRJlWuKB8JVLQGNXtLz3/dQwEFAt+zfr7ir65z7lMOHxamQEqgD
         x19AP3m6dXqjHgxx2xDiw+7bxyOWtWhi1h9KB4n3ZMqngHLCzvESSrj0pYSN7HFtZvhH
         i1II82tYVLWU1ldIMXTGZJ3wPs75trbbXh0kTL/eYdkJ5U3l8xwbaV/4GWHdOrdSQMtF
         q9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500729; x=1796105529;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mWyKPl3fYTX21Xcks1P19Wig3EEm3zJMXAWb3yv9l3A=;
        b=MSaM59XDUh9SKhtmMKgUxgfVv/jK6iDHzxUC/vCjB/tpfyoQZHhq9F4/rizGtqn/hi
         EoPAP0PoR9Av1cShPHxeRSVzVokYvnQEZPMP2gAReGwNl351rijjQUP64BwV1eox1R2U
         fXDoQ1BDFtmb6b99+eNqWEdtyLtuSGPo7W5n4PXKvgb7ekczZPkFP/nwyqNLhIUR3D7e
         SBsqK05iAR5X6Od18okJ7UT4+2kS/JK+RWMZKoSZSGVUHjXWUck4Ww3Q93gHoZWBIfv/
         /thZJ+YOMeH0ZZyQXCSPpKJyfOsCKqLUapyySBxTw0TN6OTP1AJ7GgZVnCbjHBKpeURf
         hvpg==
X-Forwarded-Encrypted: i=1; AL+hErH4fwS3oQElhjPrNnLElSkHHANuQ7TKwSfxyjAZXI4ZEiQgTutGsc880QodPONFAbyhLWhc76yz6uwCCz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pzEnt+Rvn/wfOSN8SER/hRbEkQgToK0jlkZxZ7RvdmyKaHJ1v
	9MS4+9Eu0JnDgmNTif9CdCmdfTmkNHz6VbPZXFFiU5hFXY644bqNj8w1KxrI3k5Zas8=
X-Gm-Gg: AZFdTZeuOvqbpUxOBS6KyJLYnFeTWNZTALFLT0WDZW0IrR1vbZ/djDTqL1m7ZjplfOS
	QHh1UQkKEAoDAnwLDZJNH7cuD5KCUgFwQmNlAlwSVCeCFXKiD6hL4vR+rIL8wdk3Fwr4W2srA0C
	4nlmRARhlaidTKbTN+tqGsv1X+9NyxebEJvXjtwMBiZVP2SueXBaaohjT8Nf6TdJsZjfgHLWF8W
	v3lSFtdlq0ThZFInvP3mCMKExjTWyoSJBTETeoPhYjAr6ISMlBm/RQBOBglzYzlAZ4zv4KqSUCA
	Dza1LPhQIGwKJoy+nDp+0WYNn9DPFBI5d37t+CSA4MEqEfZgDmeF3EN7DcQgvY0xczyrmRirpBn
	ly3FiUs1LG3bn1af0SSZ5DckJEMZCfRThRYiP4Mduk8DXxGjXj3s9oniYkJK+yrz1tnFd/xyzZF
	Cv27RdN+rCPAVrSYSJNGxvJsH33A9V2aIDnCfTN93JAvs3B+eRufaZbOEgP4lcqe3pIVNtf92MV
	ENx1JhXhPsjcQaBl7kbYMNWX9LSTqdjEnZez1oizbWH+kIfs5PNtgu7Hi05aFQ9nj2vpFfyKh2w
	mD9Fds9Kg7qe4z70cWD8jU0dfXXBgLs3lPL7q8uQ9Gj2zSoxYJ/S64ZFLdMunWKALOD5v3nTNMw
	I5J/BhOMJKtBV6UzT/g==
X-Received: by 2002:a17:907:c08:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c513a433bf6mr1210066666b.1.1795500729052;
        Mon, 23 Nov 2026 22:12:09 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm464681866b.65.2026.11.23.22.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:12:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 24 Nov 2026 06:12:06 +0000
Subject: [PATCH v2] mfd: max77759: Set zero DMA mask
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
X-B4-Tracking: v=1; b=H4sIALUqBWsC/33NQQ6DIBQE0KuYvy6NHwW0q96jcUEV9KcVGmiIj
 eHupR6gyzfJzOwQTSAT4VLtEEyiSN4V8FMF46LdbBhNxcBrLhF5w1a9KaVEz6ZVF8QHk6JFde8
 katFA6b2CsbQdm7eheKH49uFzXCT8pf/WEjJk0oqxmwTv69Zen+R08GcfZhhyzl9Bl0qMswAAA
 A==
X-Change-ID: 20261123-max77759-dma-mask-65417b861a53
To: Lee Jones <lee@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

During probe of the DT-backed MFD child devices,
platform_dma_configure() calls of_dma_configure() with force_dma=true.
Since the parent I2C client device leaves dma_mask as NULL, both
DT-backed children trigger warnings in the kernel log:

    platform max77759-gpio.0.auto: DMA mask not set
    platform max77759-nvmem.2.auto: DMA mask not set

MAX77759 and its child devices only communicate via I2C/regmap and do
not perform DMA themselves (any I2C DMA uses the host controller
device). Clear coherent_dma_mask and point dma_mask at it before
registering the MFD children, so mfd_add_device() propagates a non-NULL
zero DMA mask to all sub-devices.

Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- capitalize commit subject
- Link to v1: https://lore.kernel.org/r/20261123-max77759-dma-mask-v1-1-6f5c8d52904f@linaro.org
---
 drivers/mfd/max77759.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 5818ee2811d1..e31af2c0d25a 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -693,6 +693,9 @@ static int max77759_probe(struct i2c_client *client)
 				     "failed to add IRQ chip '%s'\n",
 				     max77759_pmic_irq_chip.name);
 
+	client->dev.coherent_dma_mask = 0;
+	client->dev.dma_mask = &client->dev.coherent_dma_mask;
+
 	ret = max77759_add_chained_maxq(client, max77759, irq_chip_data_pmic);
 	if (ret)
 		return ret;

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-max77759-dma-mask-65417b861a53

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

