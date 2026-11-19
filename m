Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107995;
	b=Rw4K7vpWpR8cxRZQ66XQluY5AjtuNOCXy9sNLs9ABZirV+6VrucEFOhM25po051tvECA
	 klNR7Wsd7vFJrjIFBZdk0N8+KZ3lCkO0eQOTn2n5h/+Fa4dN+np2GQLRVq5qU3pTuu+da
	 2zqsYYuRmJ7z/punQD123oE5tTrNLPdKzN5XDUVFRml/DL9JNlRy5krLwJhb2e1tAe2vn
	 55jNJgiHhKoijomDyn73ZqkOQoSkDiRJWYf9vgjCKOMuyPzDhKi9In3WQhEEZ+vMRj6fN
	 tyv9IRf8WmzliQInVifx6gn939F/SoGWx6WbtqUIDwiD5kcMFaD9SJLqLg9tmpAaIAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=Vi3sYKHX2QVb4mMLMwrvd+hlOAx69WBSD3NKTJsUNQg=;
	b=tnpgVew/OTaBGaE75Tb0HVe1yNrBphpKyZ1snVwhFc1JJaD3bZdkOw84T118guKTvPb/
	 gOvnfZ364LRJV9C+R07TByAv3M+y4uaeSkYY0t4AIS42DPPqN3SFFPuJ2H3qu/YjghEJ5
	 UiqI2px+7NIAPOEKdAebod1Rlg19lS1mwZXiYDj5J+uoGZM9Cfd6BmUEv1nUAY9jqEKFS
	 pBU7YJ4qdEC19IiMhukusbAU/01aC9gz6ACRiU49W8azSSKhiuhPFUVv/Kci93zeryI14
	 pdYx+V3pIjzx67s3f67IDsLKi2ZuRhYIQ/hMmQiRdF7xsBLauDv374nT6idnUvwJ9LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FeP4E2aq;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F8606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FeP4E2aq
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e937c5bd4fso28767b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107994; x=1795712794; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vi3sYKHX2QVb4mMLMwrvd+hlOAx69WBSD3NKTJsUNQg=;
        b=FeP4E2aqqae/2h4WDZzp4dxg2YEex6zz/cQ+hmSTdWM+Fmy0DJNm3oqW9SFGSdS1GS
         zSBgMRMsVqMYGweZ+3BYuVdBYVrQxOa3pFZiLu7mBQSZHnucKvC7h1F+TTVDNED28Nwa
         zjjA9zbCBSRhXhcHQqitTas0s40GVXwFJ4MV74zNBE6KoJM8kRMRji9s18oBvT0T6Obk
         dnz39V4ZzjXqDbobnxfkTRWpSa8zSDttd+hOltukd5fm0RFoxGH/NokMuw3B7AaNxrPN
         dp1cSPpeZmP9FIzI9enKEaYOUOPWkCbz7eMBxbPZdtqSjtEsyg+EZHgcCwXgtV8Egw0f
         2vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107994; x=1795712794;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi3sYKHX2QVb4mMLMwrvd+hlOAx69WBSD3NKTJsUNQg=;
        b=nE90NA7tSIm6hb3/ocqtkXONQ5ZmdwB6q9vMNYrzOyFeI3DR4i8T47gQhrDMJ9UqXQ
         bN+OvFFILl2e3qxHDC1YoWzRM7ZdZpqQ65aHRb4DBGLcxr4l4jeKkRqwgEpavxaLFkQf
         3giXP3acT7jTUY5YxqYSQ8p98qjjvKgje1rBeb5nfWdLHzyN+JW5KoTkwIJ36w02lO/C
         6rOcZZh1EvCwcrnbkKO/EWMqsVySR8UFqisAf9nB8oI9AJLgslOKlDGXpMp3tBBAGbqg
         y1RaU6isMOBxsUJCu2AVeBruamAdpBiNFsm9OGRFu2ofP1h6V/vKCfrmI/vXFhLNb+wY
         0Bxw==
X-Gm-Message-State: APuU4Z/Ey4+mluSexEUNUBzX032GY5/IeLBRqxUAsVfcF/zPgIY7ceud
	oTwDisJvXIgei4fabYurv9jqZoc2TAsK0ODI+BXlqTcHozsIIM2SCq0d/JUfbGSVOryiDn3fmVU
	ghRdstKJRuA==
X-Received: from ilbeu16-n1.prod.google.com ([2002:a05:6e02:2f10:10b0:53b:299:42c1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:17a1:b0:571:7f0f:924f
 with SMTP id 5614622812f47-57a0c6b7286mr589706b6e.63.1795107993418; Thu, 19
 Nov 2026 09:06:33 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:29 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170629.1520297-1-irogers@google.com>
Subject: [PATCH] clocksource/drivers/timer-mediatek: Check devm_clk_get_optional_enabled()
 for errors
From: Ian Rogers <irogers@google.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mtk_gpt_init() stores the return value of devm_clk_get_optional_enabled()
in 'clk_bus' without checking IS_ERR(clk_bus). If the optional "bus" clock
requires probe deferral (-EPROBE_DEFER) or fails to enable, mtk_gpt_init()
ignores the error and proceeds to access timer MMIO registers with the bus
clock disabled.

Return PTR_ERR(clk_bus) when IS_ERR(clk_bus) is true.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wunused-but-set-variable enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wunused-but-set-variable (CONFIG_MTK_TIMER=y via CONFIG_COMPILE_TEST);
not boot-tested on MediaTek SoC hardware.

Fixes: e234d4082380 ("clocksource/drivers/timer-mediatek: Request and enable the bus clock")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/clocksource/timer-mediatek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..860d4eb3f8f7 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -314,6 +314,8 @@ static int mtk_gpt_init(struct platform_device *pdev)
 	int ret;
 
 	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
+	if (IS_ERR(clk_bus))
+		return PTR_ERR(clk_bus);
 
 	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
-- 
2.56.1.708.g77570a6a1d-goog

