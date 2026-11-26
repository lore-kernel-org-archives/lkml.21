Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665340;
	b=hzHs3tz3FpMpIM+FmyVhMNooklRvdVdCQsdqzOrxfq3qvSe9Vf/G1UJE3boVILIPReNJ
	 ZYwCttIdnjq0JzuLYE/Rbvi2NEuzoYGoNLoM93o2CadKSD5+xYuYBPWsXUDhZCY0q5vfG
	 xVPRNBpwzsoAZJKrtOmyQqiCz7OBK9l+ugyqKN3de4FQ2otVb1Ra0JqW94M6pnK0nHR5r
	 iac91Giy39IlpHmE/nBuZ57q3unZXnpH5QuLe3YaVz8B1gU9p9AnVycWebTrbfcMA183l
	 Qs6n48wH5y6dprapZA7BY65nFGT7ep1ShLe2mtNpjJiOY54mjeUYlesvS3/NnbSQt4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
	b=sQuB1wLaePLmjJYFCnhxq42ae//VIhvLxhd5D32VOBXf0pyh6I6sEHXbaJkkV8HQjaWt
	 AGFVD6gbKbWAOQDp5V2ALqptIS+NSBlFJ9JQGZ3nsUMW4vMjHQc1pojijRdnutzusCUxc
	 QNEHRmJ16C3Ukv1yn87hyo/CMsHk94JEx9e12ytV2TqDUFK8ryPfUy4dlj7j6B+hnkUzg
	 41DgNuexX1bS8JOHUIjgk6KNXJ9BqSNoTsmBOblOuTC5UCWT2awNCDUg4re1gYwcaWjUk
	 XPsTdPZP+JtaJHsc3IGc1x9jedNm5F6w7TR1HQ+g9GnuGs1SQEqNGpGzAvaUMY/SorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPismLtF;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EC606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11EC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WPismLtF
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2747023a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665339; x=1796270139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
        b=WPismLtFq5Vzdw8Nn3x6+EU4wIRclxtaK1grWHOPmfnwoDAUZzfXUDY4nq9NAKCLMj
         GANIvj9Y+FG28A4kXgbmKtWCNMIpcvYZaienVronBs5N3qZ4bo1tguMF7frVTREuTtyv
         fb5fzAuumNzc3XJwPZjidpRPRYH78Av7k7lkgw9d8WYkpYqrI/TJTmZb63Qne4izOLYO
         pgNmZByACdJHj5GMwEwH/FZIx4fZlnAiJGnzisoJvAcP8kZwXBXSTGtJrC55kFFdx1a6
         YwNpePuveMVYnzZ5mQbz9t2LsQOD/clS1vuZIOrz/ZqZvTE1kahiiSnis3MG2byNyVMW
         qJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665339; x=1796270139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjCe/C21ycUvCHGAx37nFv572V9SXkb5hmDpSktqSgU=;
        b=tF3SEg48Cto85lcow45k3tjaOGcUo6s9t3Vw+w0BR30+i0/tdSElBYeEGJ1fJ0AdO/
         V/DFgkGkGSfo8hQjQAaww6LAz4m2KwInZTWugFiR5GXRP6jTJDAoKD+N+0nF1y0GF1AO
         0XcVYL17al7Zy7rJwLZ8bLJSXYwXpbYzWERnUI4VzwFZr09fRo8vyw5UIT3DPUhhU0P8
         DY3xSzT/UwYMfLKjPy3YYCtKofFX8keFI4MRittFHauetF1DMGnOB3ww77/M0rODvvzC
         CGRFB70N28quC1JSi5DNzv979w2Iv8UkWib3nSOyS45cVpdEa0g7kF5t30xBH3zLTtcT
         e04Q==
X-Forwarded-Encrypted: i=1; AL+hErGgX6wy/tsKF5UrmXcUilXu9Xwh+BlfommCvb3lXJ6FXEDCoXXSIEzxueSfqKNDS8VhZScjY8hudbAgyEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/qRNt5jpQ0305uXpnSeJX7l68iEYF6z9ygi7rLAvqcCfx14j7
	i+/P8qC4qYqiTSuS7JOpuDfHXlSH9ejYsHAdAG2g9qAneL75OCJScSEK
X-Gm-Gg: AZFdTZfuA4vP5tGIOpLRxC7phI/8XAuPra1H8kBtobRh9ZBNIRD6C/kmCrghqdXG3fH
	CATuNBURsxYECBmpNVnoRG6oSRnyKoCwthZsTsyQu5vDwmip+JTlJdi9idFvTFwlbXSmLNwzaKi
	z23+km7smOGs7FjDysbHOjiYCela7xGgloChFfxjzv9298bTASPimDIaGzeZnOyxYu/eonn7xXN
	5dvixRG7ufxF7qkKcjrx9kLOMcrqu734um5PQoe6gBJvXb2tMoiCK3ntM5xuFmTcXWnWYL8DSbc
	5bxs49HhI8cei4iVPbh5L9nDV/Z5VLrRug9aGDTyAc1zKVi0IjcTEJ4Jl5JxK0yZN3YbrVdVrKT
	Hes6Jkb5lBSiYCCWi3D6CzlcwvQwF3/Hu43M5Zv22An7JcOJRBRLcINtIar38xjkoWUMXFHfpL0
	6kTmphHlltf1zv1QApqZ7n26Xhrj7nMLXvMMBt5Ri85A7p02SmzW2o09q2+blgg8QW7iaay3wdq
	W7ba5SmEhKDbN34Ba+yzceXBneToslqSxNzvT6j4jc0HdbCpTUGDpVPzlS6fMNW3aKjkxMqUZuz
	yzAWXGchQqD1dnF7L9W2pRqi8FWIehFkv4x8CNBi377O1zFQzmrfNMIqYYx6MkIxdS78/D/Y5tY
	adcnfhpQDg1h2nJieV/GhxmqqAaXVy0og+DA7Wv0wFyTXCEgMkvHlTbHLJpFzFA==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr17622224a91.38.1795665339096;
        Wed, 25 Nov 2026 19:55:39 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:38 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 1/2] selftests/alsa: Add a config file for the test-only options
Date: Thu, 26 Nov 2026 12:55:24 +0900
Message-ID: <20261126035526.1779288-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

Some of the ALSA selftests need kernel options that a normal config does
not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
aloop-test needs snd-aloop. Without them these tests skip.

CI systems build their kselftest kernels with make kselftest-merge, which
merges the config file of each selftest directory, and alsa has none. On
the KernelCI arm64 kselftest kernel all four options are off, and every
test-pcmtest-driver case skips.

Add a config file with only these options. mixer-test and pcm-test check
whatever sound drivers a system has, so no drivers are listed.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/config | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..67fa26a87217
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,6 @@
+CONFIG_DEBUG_FS=y
+CONFIG_SND_ALOOP=m
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_UMP=y
+CONFIG_SND_UTIMER=y
-- 
2.43.0

