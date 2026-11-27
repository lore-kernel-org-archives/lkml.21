Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771450;
	b=E/mw94uZzv00oirWhpL0tdYSW0dgEiy/eL0TIsFRbYyagVB9Pis+8L+1lsUC0/e2sD6T
	 Oq3mimBvI/nSE63D7sZo5lA0a2DlwszksnVT04zPBSvgXuItxqmm1QyiEj9Uazwzl/G0H
	 /Yz782ajHl0xNKig+ROqP27PKyEhI+k9pP6+vOFrxnIuacA2YZca7odaCD4AAXUXRO9Iu
	 ULkhH2mGZ3TcEPesPi7Sd8iQx3NvCD1dxFiIUAjnkEb2h5IqbnQemW3lhO/v3vm7c+Mc2
	 9bpLwItFYd+8DwbXadV3qyB/G5XOzHy6zjj7m+lSe2bi7nKldMM8GbHQp4fyQORbMng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=;
	b=LXd/tCciF+21dMSy0w3nktkVutyXVZlfftOSgoT8NGTcoaxOFIC9wbPYalF3FLIofBjr
	 hOpjzVZxU/cHhHNH57yGc/MEvCHlTsczrpIRErte9Ge6kwWDKUBj0lAcwB6xMRx07atKZ
	 bvGFtZVI8dWrRNFWgnKeURgIZ8lqxjW+S5TJbiMBll9pTH4LdV0R0JVyhQLpaG65uPJzW
	 jJCcbPVTuIRBcEBMHpHzj/RyWPY2HxYWZKzEljG3eHlAR22jzUcHVzJmGJEzXvBumXzKE
	 yYEfp1KfonYY+VuvslYT1/Z1v46J3v2CmVrBIncjfUXfPYJvSJXVAFzxY38l+oA0Xjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X87N66CV;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C52606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X87N66CV
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso5252097a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771449; x=1796376249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=;
        b=X87N66CVUVzIoLQFLMC6gY1UA4UOMzXLwMxFCZdiPO7urXUmMm5PkqmOG+X0aGfgpr
         zTeGEvHHww0PiC2KLnNMUaNPko2HCXbeotmSMXjk8N8r73vVCd57ItHoz9xYHvdIJ77f
         Sz4glPrDi+gz6Z2JlrPZ6FO4GfJ3Waqet44QDM/8lFaoaSg2Q2qc6HJT/yufqBf+aXTM
         Y8rasGdsj7jVS8DOWaZCuttXxi4/PhweK6rB4QjLbizWObKuFoR/oeYNVJs0vikpFfOg
         fJWjByIE8rMXzAlmp7dYHULNs73Ou9uxGhdI0EZc08YEEjXg3/cEuVF4NhvUdHEDYqAZ
         wAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771449; x=1796376249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml69IgRKM7/7TN+34G3sEPU4t74jsAOvfTxlEPAKFTk=;
        b=z61DafuLWvemcZmAyPMiWKuEfrssff1f+mADa2UOsziKz6jvbremyRG1yiHNYYKJ7O
         rplgpph+qMLKd8jSrwLcBrOz09yoHpoPompprgy8U07Jpnio+cbH4uugZCdbKFJwdUeE
         cfkaK+HFw2cchFsMk0YPYSC+M1T3AQ+f6yAtJwTlqlhkbwh5K4KrtIxN5povH1gmOQa4
         HAkT8x/wXB9FyW0XhidQqAZx34WPesITh9zRHB4mWxunwi/g61ZQpH94im6i3VG8ntN1
         aBqUPoUxQsH011uWTag9qpHpDZonb0cNkZwQFT0PpY3l49sLg7GV8iWtVKYPv4GRX7JL
         Wl1Q==
X-Forwarded-Encrypted: i=1; AL+hErGO6szQoyxvcU9LY1/l3RaAV0X3GgJ/a40R8vYChwacUKxJcDpnY2zmk8xum8KT6gcYrhbZJdQeG2e8z+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FcNKlKJMGTneQO9WnRzDbJ3OwdW6NTsoUgLaSvb4E+hwsUfGG
	i7h6pYb7zqnYnXTuIVq652HrpazSZ13aE7LKhVoSTmdSTLReXTlSRa/I
X-Gm-Gg: AZFdTZfeA9sDVLaKE5FFsno4OJD8S+NGvu4UmSyQc54fvTYqrLVZNyToYTRkFq40Cmv
	feBseP87u8bdEdY/g0v+K739gzFYT13MbcNwXmkwK4Lhz1GOcbUwSSDpzruou8DyebWc7SFTT1J
	qBY0yLqMh2A1oR8emsRKGU8Wng3deYVPoY0fe77I9pHh9VTw49ME5fabbt04fmxX0cw6QHnIhxu
	hqvOmnJmiKg+mferZImxpHtj3D0u0VVVwShJU9l8T4h/V04zGwUkxhLBp+BUvQWtErFM8xiyQRa
	7Q4xzHK54Yhn5TDP9npev4xxY/7HbN9CsovMIl/ZHfmumiFHKnRvzXmKYMDyFLm/C3JokHq4Nxw
	55nbpcdeVZV7Ux10beaIKUi2KYLL3Qez0gRfTqgSEvCHST7VHveZe4BAlEQFnhMttqEWURqMKjj
	2trvqOCOzYdyXla+bb5AxXRmmSfLp3eJEpB8MXr6jNnTfdfjkmGFtjtUjbYgqYF7J9Hxf4+8QEm
	9qe75oXeg3ZWEBKhxOYjh3aDji8y3Z8ILI/y7qUfInCFjL7vt9kifJVcruOqT/JEnf97xDhN3l4
	2mCtGTIFWLFrlcnTBo16FtWWJEx1tJE8PABAyr0cWmh4fICw6k3aprAGXY61Dqj3rTyIT0AJuIr
	Icx/x6KnSVEo0jceJVvg2QiU9iUc5z58HMFegBj0eEjni
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr25424331a91.15.1795771449232;
        Fri, 27 Nov 2026 01:24:09 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:08 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: stm32: spdifrx: Use devm helpers and drop remove callback
Date: Fri, 27 Nov 2026 16:23:43 +0700
Message-ID: <20261127092345.12383-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
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

Use devm helpers to manage the DMA channel, DMA buffer, runtime PM,
PCM and component registration.

This allows removing the remove callback and simplifies error
handling in the probe function.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 67 +++++++++--------------------------
 1 file changed, 16 insertions(+), 51 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index f6f7d4aaa94d..467c3c583a00 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -396,24 +396,16 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 {
 	int ret;
 
-	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
+	spdifrx->ctrl_chan = devm_dma_request_chan(dev, "rx-ctrl");
 	if (IS_ERR(spdifrx->ctrl_chan))
 		return dev_err_probe(dev, PTR_ERR(spdifrx->ctrl_chan),
 				     "dma_request_chan error\n");
 
-	spdifrx->dmab = devm_kzalloc_obj(dev, struct snd_dma_buffer);
+	spdifrx->dmab = snd_devm_alloc_pages(dev, SNDRV_DMA_TYPE_DEV_IRAM,
+					     SPDIFRX_CSR_BUF_LENGTH);
 	if (!spdifrx->dmab)
 		return -ENOMEM;
 
-	spdifrx->dmab->dev.type = SNDRV_DMA_TYPE_DEV_IRAM;
-	spdifrx->dmab->dev.dev = dev;
-	ret = snd_dma_alloc_pages(spdifrx->dmab->dev.type, dev,
-				  SPDIFRX_CSR_BUF_LENGTH, spdifrx->dmab);
-	if (ret < 0) {
-		dev_err(dev, "snd_dma_alloc_pages returned error %d\n", ret);
-		return ret;
-	}
-
 	spdifrx->slave_config.direction = DMA_DEV_TO_MEM;
 	spdifrx->slave_config.src_addr = (dma_addr_t)(spdifrx->phys_addr +
 					 STM32_SPDIFRX_CSR);
@@ -919,26 +911,10 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	return 0;
 }
 
-static void stm32_spdifrx_remove(struct platform_device *pdev)
-{
-	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
-
-	if (!IS_ERR(spdifrx->ctrl_chan))
-		dma_release_channel(spdifrx->ctrl_chan);
-
-	if (spdifrx->dmab)
-		snd_dma_free_pages(spdifrx->dmab);
-
-	snd_dmaengine_pcm_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-}
-
 static int stm32_spdifrx_probe(struct platform_device *pdev)
 {
 	struct stm32_spdifrx_data *spdifrx;
 	struct reset_control *rst;
-	const struct snd_dmaengine_pcm_config *pcm_config = NULL;
 	u32 ver, idr;
 	int ret;
 
@@ -978,46 +954,36 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	udelay(2);
 	reset_control_deassert(rst);
 
-	pcm_config = &stm32_spdifrx_pcm_config;
-	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
-	if (ret)
-		return ret;
-
-	ret = snd_soc_register_component(&pdev->dev,
-					 &stm32_spdifrx_component,
-					 stm32_spdifrx_dai,
-					 ARRAY_SIZE(stm32_spdifrx_dai));
-	if (ret) {
-		snd_dmaengine_pcm_unregister(&pdev->dev);
-		return ret;
-	}
-
 	ret = stm32_spdifrx_dma_ctrl_register(&pdev->dev, spdifrx);
 	if (ret)
-		goto error;
+		return ret;
 
 	ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_IDR, &idr);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (idr == SPDIFRX_IPIDR_NUMBER) {
 		ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_VERR, &ver);
 		if (ret)
-			goto error;
+			return ret;
 
 		dev_dbg(&pdev->dev, "SPDIFRX version: %lu.%lu registered\n",
 			FIELD_GET(SPDIFRX_VERR_MAJ_MASK, ver),
 			FIELD_GET(SPDIFRX_VERR_MIN_MASK, ver));
 	}
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 
-	return ret;
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &stm32_spdifrx_pcm_config, 0);
+	if (ret)
+		return ret;
 
-error:
-	stm32_spdifrx_remove(pdev);
-
-	return ret;
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &stm32_spdifrx_component,
+					       stm32_spdifrx_dai,
+					       ARRAY_SIZE(stm32_spdifrx_dai));
 }
 
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
@@ -1052,7 +1018,6 @@ static struct platform_driver stm32_spdifrx_driver = {
 		.pm = pm_ptr(&stm32_spdifrx_pm_ops),
 	},
 	.probe = stm32_spdifrx_probe,
-	.remove = stm32_spdifrx_remove,
 };
 
 module_platform_driver(stm32_spdifrx_driver);
-- 
2.43.0

