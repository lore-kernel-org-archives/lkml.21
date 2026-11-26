Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716690;
	b=SyxCyUkX+oGSyJaKRFdWDpUSnpNczG1H5fb7bCcgMUb2wKlek+m54dEsvveTpdZ9aXVr
	 c0uog4ebxE8HakZULK96IlYMEl5mouLrKSbI1LTrppJl5+iFvHM1fF9///Aoh8+6Xk1UG
	 2TSTN2jbBUHtSFIEfWiA8cTxJ0eoqdP6IgubN02TTh5cAJeqQFp+nOP8K5cf/hxKOScyy
	 rN/Pq7wbE6A/m4706HgUgn5/KoJdmTIGgZkJPPjpPkPKEFqzJA4/tNVjGj7UPU1hflu/a
	 vddG1OMURqCVtJliIrlyANmj5D8sd79a2Xf4D35k2IF7Wwd9RnObho8FW703ulRwFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
	b=GDqaKk0gstb8fDaeVFYgOjTnuvXmvheAs2tiiDgJDTaBAV10wcZ3TZ6pkd1cPTJghkWV
	 neeCYqs0lKBllF0FPVZ66KpnJqFqPmkFXtaDTCiVXE0HI0I9U6Qxxw4iA2BmgzE/AYSl4
	 EZ6sZ4UeBl7i1Jn3x2gAHxHqSo82eyD4/63AdiwijvkfeEWY0m0i/293NqkQGqn1DFLKq
	 TOB3IFnxhf7GTY8y6eNROSyVIYNhlXohM5BMwCfC6qFCt1rSkeJexELqMvgKEeoc32uGi
	 wzBZ2+mHz46BDJdBiXJfLUk6cxJkDejC4T8k6tbacnmnNKuen3SgZNv5g0ZmjDYdfdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDcqJAU5;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C58606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDcqJAU5
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b546061d58so16748186c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716689; x=1796321489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
        b=WDcqJAU5CsSUrBGvkqEhtQ6MvKsjaDHdkBIa1sPT+/lis0SJwywcIFaQB5SAsut+dm
         gGSoNNHXfsaRvFSp8PwDtRHp4DSGUN5NyeYx33lK7iqqg4CTUmeGPhlV/CBB46FnE9s2
         H2fXysbNoQksyMEAzR0cjW7/XOFSjvotxQxMGHMExTVoaF2Hsvz/v5VNXbNVw+r4zODH
         /hwQNs2uCvo/yCtIQiZDNVzLedJPgT8hRwp8jWOGLnsBQdB7e9CZrLTRbcDF4Mb4QlWH
         rX1HbNTzNQWfji6Jta0EJNpWuIGLYAklxiZ05JP3qiyoawG83Eu/N1SKMR/1IyyzduSs
         4WkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716689; x=1796321489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
        b=1ywgwBUMd+/aVRVhBAnoWmY7JPruwceMkrQT49eDL1RdWfYjX3KqEdvDT+9ErTs5Gw
         2cMtqN8v68X2+bl46uKqZ3PAnZqxeCea0o3werxZsFOrAXCMmln2NYXdKS8odaSNibYY
         U4/PQqGqhz9xSBWSN4u5MFvMYwWd7HnzNJiU/SVB9+tDiqtXkNWkv/Wafs1hSHzeGmd2
         r5mNYpdrcMSNudJiIMlGLGJ3RpDAL9TXhF/VqmyEuhFuOW94+5YS7KMptwbfq0SDrDWV
         xLk7sxASXYDi30uGBvpqJUcBGaO9pWbY4IT07yGCIyW9Ay6bq73JC81ubg7067wFDXYX
         UzbQ==
X-Forwarded-Encrypted: i=1; AL+hErGOlUdGTpz0WrMVZSHn37VZQG6Pkfq3ih4peQ0OvQz4NnIjeoiPfjl1+3VeYY8P5dIf2zPu2XGE9lr2z/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X2/7n3mbx07OqQWEubJVl3IL59Q3nyCXAXOtlEh+oOBMpCiR5
	UxXrUbwqf9yWv9y01wwJzdOF7PkoFc5ZYOLGYGaop/Q9nVEEVD9XyWC4
X-Gm-Gg: AZFdTZe8EgxplSPsjTjhmOYSffvGXSVZQvrn/xMt89fPSgSx0DUKg7y1GdD9siDuePq
	v5VMk5ccnDR2unx4VhJDwtvUVOP0CoV9fFqu321KLtE4hMAQWY3w5/inP5mQKMZuK7rap6pNqk7
	GHVMBwELKcGVGNRmC0ot9OhPv3rq9Sm2aA6jCUZuELBlqXtN0kXHUl6OkwbDFRCOBBuOoZoMDVf
	cB/AbKWPnC4pTwR9T1j9sb+yt4w9iggVLJfcOSXe9kEt6Oj+RJV3Tbfz8Ef9JHnRSz4SNJ9/XCK
	TYmxCw3xcHs3lfpdXIzehLXur5lONUkiI8SBjBNPkhsxdFKbRNsTTRsTbpQW8HhMJiwosQrNgdi
	rSccSf2UGGBvfldGFiZqdlCEgVdGItqF0kBt18xyg8y46eTRUeS5HoIhTVZnPl+7S96bYsG3QZJ
	wBmGQewu5sb097jaquCTQ3RbKHHVnLTQRc8nYS1YhwLN6iSjnFT01VMpH5g6BQbq/SEvfcW2gGy
	Dn/IDvzU9HmbN1L1yq+FxAw25aH1UClSUgO9U+f6T+5OxppBQlmpmIh7+g3ou3t4uCuwPDajFaH
	4uhKvVzFE+Uoe0PcChjEtcWXoENCbnWHzyGf/xjXqe0KNNr5HspHIjgnnfOYym+vwh14BMjWEl/
	7l/XllzozKjpsAEPxOmCIRIE=
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr14492602c88.22.1795716688687;
        Thu, 26 Nov 2026 10:11:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:28 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 2/9] clocksource/drivers/timer-goldfish: Fix oneshot mode spurious interrupt
Date: Thu, 26 Nov 2026 18:10:54 +0000
Message-ID: <20261126181101.3715754-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
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

goldfish_timer_set_oneshot() writes 0 to TIMER_ALARM_HIGH and
TIMER_ALARM_LOW. Writing TIMER_ALARM_LOW arms the alarm for timestamp 0,
which immediately triggers a spurious interrupt when TIMER_IRQ_ENABLED
is set. Meanwhile, goldfish_timer_shutdown() disables interrupts without
disarming the alarm.

Use TIMER_CLEAR_ALARM to disarm the alarm in both functions.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index cc02b012ff76..b1dc8b388470 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -55,8 +55,7 @@ static int goldfish_timer_set_oneshot(struct clock_event_device *evt)
 	struct goldfish_timer *timerdrv = ced_to_gf(evt);
 	void __iomem *base = timerdrv->base;
 
-	gf_iowrite32(0, base + TIMER_ALARM_HIGH);
-	gf_iowrite32(0, base + TIMER_ALARM_LOW);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 	gf_iowrite32(1, base + TIMER_IRQ_ENABLED);
 
 	return 0;
@@ -68,6 +67,7 @@ static int goldfish_timer_shutdown(struct clock_event_device *evt)
 	void __iomem *base = timerdrv->base;
 
 	gf_iowrite32(0, base + TIMER_IRQ_ENABLED);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 
 	return 0;
 }
-- 
2.56.1.839.g22a8290db9-goog

