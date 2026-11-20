Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202646;
	b=K4IJUTShYWwvp7B/bH43P+fYa+yjrZNBib8WAmL4NHAI4eSc30iLtfQrifttsVopvrzI
	 3ZaExP916VTYY28wPaNc+u8dePPFA2gL4v26e5zxuN2tRlbM4l6lx78h3OYPvjkrw6Kmc
	 ebDbyNnmbbGakwA0omRzoYr2FTunWuXrQRcPsYjG7+h/rdYQEAI7yD+HM/7+4rvdYwsKr
	 lTOvnyeyHJboX1zXYReAcK/fXl9rgJqyNmJl55XXnV9lGGY/KORsVvJE6VO0BB5G4+7WB
	 iNus7I8X9jN7sD7rf8vlKDXAFpews7dyKw0N9wUbTfZm53rsqkvZ0hCn8TKo6XW5wpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
	b=qxOxyJ1MNuxSjNBhU6GLVmmlLxfOVuj5IjH3nxtW3B89nWfpKYZriaIfxTqLcwPdL9cC
	 hETiDYfKNKSZYgA7M4eUG0iDfqgDmszCrP+zmZ0YDulmxVoa5htYzzlFNK1TPayl8c3Ok
	 QSqlGQf/puzzbn7tZJcv71Zdki1bzCLUNbU6OpXKctKSNoQxOJ2DL/mU7NV6o8Rdahlm6
	 BdrafPCNyyX7P2X5jMiiQe98nf/97Ead7dDJqTvXBQLnT0F/I0aWevRK5UtY9QsEH+aAi
	 JOZDb0KNtE7N/cbVg0Nt0PqE3sl9xV84uSS/Ly+GG5m/QFQQ5OUO6SGmauZU3mrS5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ckmxVrcT;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F34606A6E9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F34606A6E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ckmxVrcT
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2279507c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202643; x=1795807443; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=ckmxVrcTbitKNtemuk5b8GC2WFoXRVOUdF3WVHB9AbPh2EZs86ZXFZ50srAN/P1lP7
         I4XtxldXGq92BakhgHJ9yvkBEy9ID0EaRDbInhLp+bvp3sQ8DRCam5oVgsrDND1aYWiw
         JOkjUIDQcAAu0IPr6HbeFTqpBgEBTc1tmesGQmql883I4As4PV6ID7ECPjDVMaynZyB9
         hpOE9XPb7G6YFV8Fs8on0I9jVrylQARZvrWsEzNbY3IxBsM2NzQXYOJMPQMKjRHvuYKt
         S9j+HCKbPmA0muJvZDnPLf50wDrEsy1bgSFyIOqZ7br3KzCLO8hsWR4OFd290GPc1yrd
         GvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202643; x=1795807443;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=etuR8KMUyr58JwgCWcVNYFHXdeJBIHKBUtM54ezG5BIgU58Z6jduHu5UnVM7NU0dtA
         YUCMpxOgtfDlDAGExb3nNFsRbQ1QD2lcVOx+tVd86G5dfynKpjIVBVOitq1U0NcZhS/V
         Ud1Sp1pFJjevbrLg9GV0oddDSHMDulgFL53WfPC95WwaThBwJ9Z+jLto0oB8Wa5hWFAb
         1t5Zd0bHDq3okt+vP86leuE7q6eEzr7c9iwbT7zfx95kMLuELKie4+1yXJYxTfM24e6F
         CvcHeRJufmePEjFj5digpeuZWyWHY3PyNwZu/HIr+ksRRfniqmvDekDYgw7prDUkPE1R
         hh5g==
X-Forwarded-Encrypted: i=1; AL+hErEz3STR8uM33V7OXZfEkzVW+zhjYOW6HKMzTb0D9NBthknNXF3CGzUOZxHZEfoBwk59k9fPBcCuUEXwZ0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z82Yz6dQt+8IXNSNLXSV0irwfndOZl0EI6ZCGu1i6MsUKiB4u4S
	6G4UUDDjJxCyHwu/39ZMnlPXcbpfp0nfifc1SESj9pz3uYYsC91s/bUrii09cvWkhiGrgI7EgeZ
	nwg==
X-Received: from dybmh16.prod.google.com ([2002:a05:7301:f10:b0:386:33c7:a7cb])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1715:b0:144:f089:b189
 with SMTP id a92af1059eb24-1b55691a623mr3662644c88.36.1795202642255; Fri, 20
 Nov 2026 11:24:02 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:36 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-2-elkin@google.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt8196: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When devm_regmap_init_mmio() fails in mt8196_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8196_afe_runtime_suspend().
Because mt8196_afe_runtime_suspend() only guards if (!afe->regmap), it
passes the error pointer into regcache_cache_only() and crashes.

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: e38353138a09 ("ASoC: mediatek: mt8196: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 82b5ae91751a..3028aa82c4a8 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2450,6 +2450,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8196_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

