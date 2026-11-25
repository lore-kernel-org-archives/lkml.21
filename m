Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603728;
	b=cXZPjTa49Qv0twgRUrzgISzvjqzgmxdFXxJK1YOmP5IFDJlcYZDxFdPJldNTo0wJ/57u
	 guhaj09OWiNWSJbfMFrf0x8fJz0otmpMom1uLxl6weIghUaG2uf2lq0XGZL0GPIc6nlFK
	 J8eLV28Wjaq7NvLq2660JuPBIVekiAIPr4XnoYfHDzQcS1mRr2XBqtbQE7o71dHyAQdD6
	 Oj8A20LJBz0O2W+B+OodKv1QU8lJ0UvnETeBro2XinUhUYZPW7CjUmEyEOGsgx2sANh1z
	 QWmbyAsxTkiRgIYlQsm88x1D0Va5DJUv8nTyxTFtYk8yJyRESpb8xUM5dVIBF0Spitg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scKDB+4ysDPeICYcN+FMLGOBAhCWSy9TC1S72F4YsSY=;
	b=edZ2KuMQm45n9j1KqMquNvhYp475an1bhxKmV7jlUz5OEYLocs1mtrdv4W7pO2agjmUs
	 Np9YX+HXisulb23LEX0TckFcFIrujzGBixrdAiXr4iTHC6Byzt5MSao5kgmI6rk9fuW7i
	 yMA8bJbbkWJx7/DDdrw9+BzMoY8ktjY8YQYeOpREQN6obE7ks4wJVHQkoIh/nVL24aMgy
	 sfioclA8dG76LqgZ+LmyiWiuXHbMH278ewfw9isdfEfyh65cdtB6Y3pK2vsSgu7PVFSil
	 xYeproQFxBoF7fNhICirHTIAqlzPc+iKRLFKCZmdC64deP/wXBnVsNPHF+QHSfgSvxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu0lFtkh;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gu0lFtkh
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38190551625so11161183eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603726; x=1796208526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=scKDB+4ysDPeICYcN+FMLGOBAhCWSy9TC1S72F4YsSY=;
        b=gu0lFtkhu5Me8yh11GeS5t7CVNZqk1siw+WQRLcu2RgWJjWH4KmrPBlvZAHQrcJjAz
         z3sZlRMkcbScebglbPWDq+EWSb/w/Za/oa5R5YD5zzkIaiH9Dg0hxO9598du17OHUryp
         ZiE2eXTP82U+TtP24d420PGk0vk8QBUl5LObR2e1Bm3ncaS4QzVqv2U9Z9yYKqco7qEn
         hQQ4d/430hECP5fnsLBnp6IHzaVeEZnlJZf5U+JWB9PuYz+Om+vrS5O83nh+ui6fW1ct
         gMbPeXAZ8fpJvvWcQTdqVT71vQqQhDBDlu9fzJUys3eIvP1QzRzO9/hdit3iSNxHSEG2
         /cvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603726; x=1796208526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scKDB+4ysDPeICYcN+FMLGOBAhCWSy9TC1S72F4YsSY=;
        b=bK6NmZH0vdxZzbrKWE0YMMnxknloAt0fzp/I4RZOClDuA6wghplueLpCtv+cGZdX3B
         F7c20MB1fpYLn2bCkKaN9ISvAp/RPB0pdKcxXZEyOBaEi+z4DKc+KKRq3Aq1gfgt8IsE
         hDpqDaZ3qSR+SzMzWvquCrNMo62jqgLY39A2Phic6pLV/q4eVzQm8la4NrnVcKh/flnk
         TSmqC/qv/p7FhLAwZu+PJszAZP6q0ohqeU13uTV3cIk/M9V92QV2bIGO1+sgCwFkAsKE
         97/xKwlNuw5hUA5RDSgnNDsvszuo7lOZ7JowwcuObFVq1Osbp/BMSdPOPNqYdrXvZASc
         5M/A==
X-Forwarded-Encrypted: i=1; AL+hErE+oAcpN2wMFbEse9c5t2osXQUMLqQjiXVmPHXwKLmuybWrK5jEQOh+CUn33qYMju7KFzUyqeKajq18BQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZqVhVfoe987UQTxdHfTRsmQSFzw0EsfCoQxm0eoZrCc/7+9N2
	8l749m8G5luyb7VIb8bN9wGfDju55dgNDmpC0bIeCdiK/XnngB/7aBry
X-Gm-Gg: AZFdTZf0FPWToNOpFwx0ew+rkYarHDXXOKDA6aK7nvmS0wlEptp8hPsIUEHcCdQXE8V
	ANgR7nqVhR2jgKwFQSzplNyqe8qyOxMWDo4uyIZqLsSKory1fkW5yzHPYht5/hlhPruKsxTnyCY
	KtVwsBv9CrNPcr2WlEeczWIw8C8dUOSP9DowkVs3nAuICvcNGiXzxI57XeSwPwBl/SGZLJuSxDX
	j6SIkp3tT93qV+cPk5oQZg2fXTRMoNLbsFlCDSXDzryAaXgVyDuQSvrmUHrW8stLW1H8zsM3wdt
	5h2ApwMJKp41PVGGUmyg7Fs6HzTc16+nIezgeK4+aup3yXT+Y7GqM/acycWh4IXNAanR2ShF7Cx
	z6IJjDFWyNExM4J6hDHvNUmiuQFQp4FEQQ27BRXpkmQT34+rbjGzXlFCXgGpluu4hScCgDjuCZc
	4htTwR/ACNVaBU8GBujVaHv0h7InbptKwWpPnwT5Wpv9fFAxkAJXdwVmZ3eWH2MAi+LM93y2QBU
	DvOrEtBMrReyoIoq5Cm5EgMl0Wg6WoiYq00tqZEMCXTmwsa4ADBFQZ3OH3fmB1qY1VUtdwBJdPI
	9UtBF8f+sX++8PKkywRbu1SQfKgl2BuF1uep5lZZbwCzq1ZEIS85wmm/IpH+rSwP/HWrI0HV90o
	VZmZgxOKlAhF84XlAwun6SyCM9+ir/0HAhnDEhwXLc++X7Av6FfjzUf0Irg1XDCXdgA==
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr26134992eec.1.1795603726239;
        Wed, 25 Nov 2026 02:48:46 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm45094758eec.19.2026.11.25.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:48:45 -0800 (PST)
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
Subject: [PATCH] ASoC: stm32: i2s: Use devm helpers and drop remove callback
Date: Wed, 25 Nov 2026 17:48:33 +0700
Message-ID: <20261125104833.514491-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit caff4ce8cc58 ("ASoC: stm32: i2s: manage rebind issue") switched
to explicit registration and unregistration to address a sound card
rebind issue.

Commit 58f30150ffd6 ("ASoC: core: Remove only the registered component
in devm functions") fixed the underlying issue in the ASoC core, so
devm helpers can now be used again.

Also use devm_pm_runtime_enable(), which fixes the unbalanced
pm_runtime_disable() in the probe error path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: Compile-tested only.

 sound/soc/stm/stm32_i2s.c | 42 +++++++++++++--------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 79465be82cb8..e6e861a957dc 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1255,13 +1255,6 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
-static void stm32_i2s_remove(struct platform_device *pdev)
-{
-	snd_dmaengine_pcm_unregister(&pdev->dev);
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-}
-
 static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
@@ -1301,56 +1294,50 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
-					 i2s->dai_drv, 1);
-	if (ret) {
-		snd_dmaengine_pcm_unregister(&pdev->dev);
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
+					      i2s->dai_drv, 1);
+	if (ret)
 		return ret;
-	}
 
 	/* Set SPI/I2S in i2s mode */
 	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
 				 I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
 	if (ret)
-		goto error;
+		return ret;
 
 	ret = regmap_read(i2s->regmap, STM32_I2S_IPIDR_REG, &val);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (val == I2S_IPIDR_NUMBER) {
 		ret = regmap_read(i2s->regmap, STM32_I2S_HWCFGR_REG, &val);
 		if (ret)
-			goto error;
+			return ret;
 
 		if (!FIELD_GET(I2S_HWCFGR_I2S_SUPPORT_MASK, val)) {
 			dev_err(&pdev->dev,
 				"Device does not support i2s mode\n");
-			ret = -EPERM;
-			goto error;
+			return -EPERM;
 		}
 
 		ret = regmap_read(i2s->regmap, STM32_I2S_VERR_REG, &val);
 		if (ret)
-			goto error;
+			return ret;
 
 		dev_dbg(&pdev->dev, "I2S version: %lu.%lu registered\n",
 			FIELD_GET(I2S_VERR_MAJ_MASK, val),
 			FIELD_GET(I2S_VERR_MIN_MASK, val));
 	}
 
-	pm_runtime_enable(&pdev->dev);
-
-	return ret;
-
-error:
-	stm32_i2s_remove(pdev);
-
-	return ret;
+	return 0;
 }
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
@@ -1384,7 +1371,6 @@ static struct platform_driver stm32_i2s_driver = {
 		.pm = pm_ptr(&stm32_i2s_pm_ops),
 	},
 	.probe = stm32_i2s_probe,
-	.remove = stm32_i2s_remove,
 };
 
 module_platform_driver(stm32_i2s_driver);
-- 
2.43.0

