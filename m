Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771461;
	b=PuLU92rpEamsPocDN7gexokf4w72zcF8Etp/VWq3tAAFTwJJsmPXvCT8oGPGSOS46R7k
	 lbCCCo0RtLr+uobx4UZ2aUPlIbJDdLTwKds95Xn3F2Q96cBsFGDQSCa7Utpf/KBbSm5iF
	 be8ztETYt21YshPNDcJigKccOW5/m4g6SxdC7YphzTFns8QU1nerdSCTWjgivo/ltg9pn
	 s2arJ2RtMn3QM92RMkxBUBKMn3bIju22U88gnKKkXe5tSRI3RRj1STAczZUbcFWIqY9xf
	 V+/T4Uh0KuG1l15D2cKqnaIKqZUUkAnH1e3gpR7bzl/kjC/fesymAxHsgnuYB+2Pf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
	b=Gg0kjM582HueLi9KjDui8K/R9IBYA0yzayyujlrLnY6BQVLTxU5TFxza0LPMNmq0j8GA
	 YhtJSeIqQVGPUKPcLh8/19wgf4/pTGj3cKsKr64SGGbBzWJ1x+kQdV8BoUFKTT0ljpe7N
	 2W4vuGpOWV3BfAV0Oya62yt75sKmww9IjYtZjYqvRLTO++hbc5WYuwW29Jj+5lHwFnLaH
	 T3/CT0YVZOoyd0p0e6NKZu1+MLx+1qo2gxIJiRkexsGlJNRIljhCEDc9OB6Nmwj7sd3DE
	 c7oXvm9F5YcPWFkfOJjq3MDpX9I+chRFJQ9ragEqnWeiXH0EB08L8F7FVVuZt/nv0Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDgQCC5e;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FBD606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64FBD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDgQCC5e
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so4392896a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771460; x=1796376260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
        b=tDgQCC5eO/Jw4U04QZZTgXghQ1FMpydPtxmFZUV3G8ZbHVTDSZ9XGVnjSwHG93q1DP
         YIT9CVb9xKaW2lxsTexy0ck4/QTnT8156kUNsfyDrSWBGb+ax/FM8d2CYkdCjl+QkYCO
         S3prNXumUdqtq3uFTnu2ocOi3jZzHv6IPz0yqktK3GESWtgxn5rn0dTTg6Wg8qtvZDGq
         EGvVdW0WhBL+UUkqJFLQLds4xW0arK55qsVx92W1VEGKe/hR9WgD4fPrXmHBcwvWskBj
         cGUwUsvt9eI6y0Tb7rsu8LxF+Y7dU/HkNARbItYl5/JTTRMN2lSJoDQQMeD+66kFLrrO
         EK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771460; x=1796376260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
        b=RY8qfZ+lIFUgB/NLVNRGnLT6NlYCjiIoyMgEOaVMJbl5zofJIqKtAK/qShzNMEXr0k
         ml+JJQNG5JqFcLMeZxBb8M0FNDoqslxJIxJ71YrdaipW4s7hLD9zmlAIlj4cmvFIn463
         nrhsi0XZerW/MgZ+ASTJ5CVj/7HyppjlXlqB/T4mXWztHvZYbI8f75zTBO6wY7vTiUZD
         1B/8wgA3PmzWdXdpKeCG5JcGcy++HlzG9EN7t2XL3tmRkgPqjCemhzxaqPFnSy9htRpF
         mhR4CjBin7ye2ZOCzJLnYoxKsdwpCPMQKEKDBHrjDj0sZOh59GSByrRJfgj7a9wE7WeB
         THHw==
X-Forwarded-Encrypted: i=1; AL+hErHAu0Eug0V2YGs4Hxj9Bp8uFAwe811E+cDn6oeQ58Z0Syv1ZSkiIKSMSrCSHDJxlNrLienhOJAFM72BR2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lEuCAS0FPF3u4IxwDrO07L9b7U8GU/yR7dA293w6K79si/aU0
	3JnUYxLNAo+OygQ/31KPjv1OCjL6+N0YUIpZPXEt8fhOvVfGsb6gSIHg
X-Gm-Gg: AZFdTZfKfHTXvFbz05NF5aCqqW8j0ER4IqbIm3kephRf2Lo2neWRKKH0p4kVKTKZrvG
	0X9C3yTLsDvoALKL46QknSd4UKHHot8isjlU2cSRBz6M8mKqycBTnlfUML0lf1Ok5E9ZN+i2Ab8
	OUDcdnUEe0FfCaDBPih75eH49xOJ4K5xaU1O3rqCBpH8GMdNOYDo4kq6AguBHWUJzBmTX7VlW2r
	MT7hlzIHfJ+a8M0k42pxQoemkEWs+Xth4C1sryQzG0vV9FznhlWfBE7js5tako6rHMOuEZ0EfdU
	ZJLtI0+jLIpJKEKxWb+mGssLQCX6KhzpvxOLb3dkxCjKF0otS9kMw/m74YFJVsGP0oVH9sVE+G4
	1UHm37dZm7HbgkKd4R3R80D85eiGjFk5j8IgZ20qxPWeWohJPcmjSusC6DK8kCsBhPNtDQ6iq8n
	aFuxQzubGbeY91XGDLrgogE9l7JUV4zqU9o6Hn8WlUrU1F2WqPP6YLx9bRd27O06lw6zABOMcdF
	e3MeZSejGI5qsw/ka/rl7yLgxtwZpmlkN+J6BBmpFm804Jl5lrtjKI+NT7kW68ee5pQvsN/SowN
	B/PYPwyJlbtIlDcy8t+KmpNqISYyjhiV6A0ZSmfZw55tw9hcjMpf4FFdJ5pSYeyxEpX6CizSuLN
	wQMZNtgZVcMZjs7Yn2VN04Nh3FZuyksOaiHtWGG9oec7Z
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr16825117a91.37.1795771459702;
        Fri, 27 Nov 2026 01:24:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:19 -0800 (PST)
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
Subject: [PATCH 3/3] ASoC: stm32: spdifrx: Enable clock before setting substream
Date: Fri, 27 Nov 2026 16:23:45 +0700
Message-ID: <20261127092345.12383-4-phucduc.bui@gmail.com>
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

Enable the clock before assigning the substream to avoid leaving
a stale substream pointer if clock enabling fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index ba6c715750aa..1d62a6fdc472 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -753,14 +753,16 @@ static int stm32_spdifrx_startup(struct snd_pcm_substream *substream,
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
+	ret = clk_prepare_enable(spdifrx->kclk);
+	if (ret) {
+		dev_err(&spdifrx->pdev->dev, "Enable kclk failed: %d\n", ret);
+		return ret;
+	}
+
 	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
 		spdifrx->substream = substream;
 
-	ret = clk_prepare_enable(spdifrx->kclk);
-	if (ret)
-		dev_err(&spdifrx->pdev->dev, "Enable kclk failed: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int stm32_spdifrx_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

