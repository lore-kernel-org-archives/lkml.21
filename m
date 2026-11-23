Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452790;
	b=Hvmg5+VCU1sXuKw1paxNdtyNI2Rj3PEA4XmmG/Ba8372uOGNtloLMMxjO6npk7bLYuWT
	 Y3FcQqxYA1++Xf9VtkFHsK6TB3T+D3KL/RYkw50Edk9PLAqCSPvJjyIUwkHR1a4yyNv4w
	 /kHVU1DGJvvYQ5kFVX0hrgyVplbmfOgQ7SPsR/obGXgczSf+esQG5OSRbNnu0L1vJPtUg
	 8JRKxctn4c4A7GFiRv8w8K03GvwEVomnEYzWsUENjeorggkr9dMEDYAfdUQvAAbRKSfp1
	 ZykXWvuppMvfofgfMFbfkLQHz29Yoggfs7vXtmAoZwBrLO0yX2ftuktlfMbO7bmWclA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vlW+/uQXinlAIx3W5Fww0L0MiqVj5LTP/VuZyzEAKC0=;
	b=BsISUaSvOEoMFLZ2j3xBlfLcOxQUNy05KUxP3W9bl8g7Z68zF3KeiM1RC7IP5p/gPMvJ
	 OXTa0d4dM7WwFasDHtrnST7aSdfya1uHX4dxS83X0eKad/iziKM97XkVngSW7l5GJKD2a
	 zoRQRwm0UzUubzI8vCzjQpEq7jEa7tPg+fm8BLR3hVrX79KghrfhDM+JYtz1wjlsbcQlm
	 DWv7t4xDPsy3yTiI7eCeOpOJJAkBVBdZcc523AVmZxY6qbd77TKbwNW+1lnsM40RVVtX/
	 7AHSiLQQb/WxFLF108FF0KS5sN3KiH70Po0FgX4Glw6urojEriGTX9BlWMoZj+Xw5Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ehjifk;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022B606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7022B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9Ehjifk
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385c497bf94so2530800eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452789; x=1796057589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlW+/uQXinlAIx3W5Fww0L0MiqVj5LTP/VuZyzEAKC0=;
        b=C9EhjifkniwrduHkB0S/JJtqsRYUHS0DebOI+roJmCiKB5ILd2TJ28zkQjasZ4GEtG
         Lp8BQqqkmNdee/0ih/Gth+rnrIzH5K5vfr9Q19V2JIOuuPJawtswBJkpxH8NprTedL38
         QdEH08+08CYKLNsO6svpyER4ezY6oXSH341/eqf5kNdl1sldC+tToI1Sp7df9yWdXKz3
         bZP9flBAvsZRD2b90lSgw2ZA/Rx2+DGn+3/Cf0gfg3b7MiO4i6ub4cHhkkPZPnU7fVN0
         9uIqIsv0oOurI9dU+hjNJ3XwPaXpI6oAzAYf/VzdQjlAEQV4YCZ6viKGPrSFHIOBN5+x
         zDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452789; x=1796057589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlW+/uQXinlAIx3W5Fww0L0MiqVj5LTP/VuZyzEAKC0=;
        b=bWcgeftaZ2bZsy5R/ApZZyNTSk1lFDzBKQmPUYz62fmMvTsJMjRyxGT0XVk0RTkLe4
         LSV/xhBHMpKg6qo77pcxboRcA5wkf8AWHvfvwEFHGlTN5yMMtdpGi1uKaoumKGsL7UOf
         Ut1dNiaOiFzdk90hOYcbpxDAJUzFP8HSWR/HT4BrElVIBEhz1dOsJp/ym1qxi1v+a3CX
         pyNvE6un6gYzTCF+RBiLRYgbXGNq/ltT6reMMw4b098/zeKed31RsAI7/bhJS34JHApr
         fMpFOZqUxBO5bgkgQgQ+XMa3aRwhpDJHvI/ojofcIIISMLHxnt92XYcz9zG+zcfX9IIv
         Evzw==
X-Forwarded-Encrypted: i=1; AL+hErETrw8k8eO0KlVbywK/kRyfUR2cJicXZhzg48kjRJ3/Ggu3wK1f91iIRCLFykTOZLOjSh5KKvBygHeuqro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mQ0G3NcF0jAVqVLB3NqVjKrqG2BsZ9BCyeLhaiXWrWobU62nE
	hskaOXfKK/QVulfnXcgYWVJpsIZSqAZ+EiAHeAui7wUAUDS7Vt/WhLYk
X-Gm-Gg: AZFdTZeArWr8ROZPiiX7JBcGlrrzoy2gk8/8obQ/3D/lLzLVzF8LOQnmq/AdKMrh3XI
	+NxgR15zQjvkxYakjziCh6ZVQtseyucxybVLJrkkxb6oZ7S19z/Q7zfOHyO4r3LxC58x6YYQwQ5
	4opFFpnYed1ZmU55Ar7MGQMle547pL665o3rdZhLmfDEqOZlMdFFsWhHbbTEopnU8/alqVliqiK
	aeGGJgsj9RF0yZVdc5wenyJwoDRZUQej1epoJzMrIzH29Jj8N3hH4SQB5clBAS/NJPqJx4wsCA8
	xlTF0R1R15LpGpS8ecXOaGJcNRYS6i7y7UnXCuq2gGzYipTeczWt2OqUou7Irju5Biq2+imac2y
	jBKP5BixHl4bxIT5v1+3Diid6lJPGA3w8dtFjl3/pQ/bDwhqOh2Qow51Mgqiids+jxsY8N/rYdh
	DofC5NRy6orO82K+NVixotApk/m1KcksUAaBqqSYeNkhyJxIlVFMYkBf45TtuZyTFC4b84gvJDR
	v7RS+SNh4gJpzyJPYrVV6LUTRG/6oClw/LZ7eluzwj9tJm+KQL1UkAk+pLS+7tWdp0ePfgRgXKZ
	lnMaC2nVh2Zm2VKzxjNVjhhCF4tnfllDiJTIF1rdtlfLxpPbfNCIFNIRSwwNtzaJg7cQDOc4gXx
	aEyrBAv94TYtzHUjqPK4mQ6iilr9+T35+B++EB3/0ivd+yPvnF/VkS7/qNhK/peNfKiZ7/gQr7A
	HNy3z8xMw5ZEo8WcCZTKtcQTahQ+wTQCOgyNcSzt1PJA==
X-Received: by 2002:a05:7300:6d03:b0:375:b560:a323 with SMTP id 5a478bee46e88-3856c0ce045mr18190158eec.1.1795452788354;
        Mon, 23 Nov 2026 08:53:08 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47196668eec.5.2026.11.23.08.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:53:07 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 1/5] iio: proximity: hx9023s: fix division by zero in set_samp_freq
Date: Mon, 23 Nov 2026 22:22:47 +0530
Message-ID: <20261123165255.239490-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123165255.239490-1-kapoorarnav43@gmail.com>
References: <20261123165255.239490-1-kapoorarnav43@gmail.com>
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

hx9023s_set_samp_freq() passes val * MEGA + val2 to div_u64(), whose
divisor is a u32, so the sum is truncated to 32 bits. MEGA is an
unsigned long, so on 64-bit the product itself does not overflow, but
the truncation does, and on 32-bit the product already wraps. Either
way, any value for which val * MEGA + val2 is a multiple of 2^32 gives a
zero divisor, e.g.

  echo 67108864 > sampling_frequency

(67108864 * 10^6 = 15625 * 2^32) triggers a divide error, on both 32-bit
and 64-bit architectures. Negative values wrap the same way (-67108864
also gives 0), which the check added by commit a318cfc08537 ("iio:
proximity: hx9023s: Protect against division by zero in set_samp_freq")
does not catch, as it only rejects val == 0 && val2 == 0.

Reject negative values and do the division in 64 bits with div64_u64().

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 2a6da557f22e..eaf962c29256 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -718,10 +718,10 @@ static int hx9023s_set_samp_freq(struct hx9023s_data *data, int val, int val2)
 	struct device *dev = regmap_get_device(data->regmap);
 	unsigned int i, period_ms;
 
-	if (!val && !val2)
+	if (val < 0 || val2 < 0 || (!val && !val2))
 		return -EINVAL;
 
-	period_ms = div_u64(NANO, (val * MEGA + val2));
+	period_ms = div64_u64(NANO, (u64)val * MEGA + val2);
 
 	for (i = 0; i < ARRAY_SIZE(hx9023s_samp_freq_table); i++) {
 		if (period_ms == hx9023s_samp_freq_table[i])
-- 
2.53.0

