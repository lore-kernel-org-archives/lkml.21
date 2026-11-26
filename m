Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729683;
	b=bDb9O8gy/n+V3y3eP0gVav8INA6Vs+WFM5q5JVEOsxPdFftbGTqXpIy8hp/znivupOKE
	 XK81xbp4SNtHotHvQyLHij2LZbR5NKfBIToHhdl19uQzRrqeu4NnpGsWHjKMMkZOmtswy
	 YZDFiPW+MuPHPs4OM6QYak0KBp0w58CfmgjfA8MezabSPcRLWUeWv0Fw7rAuNUOEsQMHh
	 KmK05pCP4T9DLaiuok932ceBAOW5/97LhmrVruvP9C9zlao0+HDyLvJWF70gNkWuQfdFG
	 3ktq0QKwYwZvLzp6mbZl84SrpFRdPYoc+oDia1m/tZb355U4QXoLEstERHVJBHxNacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ivjjARUrAieaHI+KUn/UgI1V7xqs4l7rxB7xnDyFdos=;
	b=IRAC4dFjVlXUI4gNWJi6kmNRu/gY7JiaOB/lCpMg7J8ndmJQB40Ts3d4oUoEnvLGuoIB
	 L+ggZMvRqHrPsA9TAnv4/Z7SCIZRAzYPsEoY4Sogg28C2MZB1/1skil2VeS2pDlMQ9wbn
	 ikqojEHxPUgFgdQ1cIMm4KOSLvI5h1+m6eHyGOKJvcr9Fq5NNO9Q46huSGlfQruJ67EfG
	 H3UrXCQlLUIo2Slq1CLeWlhNXeyd0pi+beJMiKl7aICFt2yBjTu3MW8im4vFLCnIXgl19
	 qQuIpcQNVwtAJmxXzd+jZZWaEcgWiETKslVGRfgc9r3Q/Py0A9to3NtkkkX+Y+GvzaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfYP0AxG;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6257606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6257606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LfYP0AxG
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so637954a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729682; x=1796334482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivjjARUrAieaHI+KUn/UgI1V7xqs4l7rxB7xnDyFdos=;
        b=LfYP0AxGJ9FIZj28kmPQJc/lnKWHwjtDxCLKD1K0ksZxaDdfUJlgSIlrAG4ZP5M1f6
         iQGyiG8377KKDD2VoiBSB4PbHbijdd0b3oe3FMdeyDxzORH1h0t5bHU0rbZAmHp+pjpr
         pTJVB/JRG3dvLdrIm6UD/4L93g6+2aso/tt9XSe5a1KitSmHsPHDY92XUJXnq534P9Lw
         pI0ulPWio8edo5BeLTKl/zrQ8v78lPVWLmw1vHCB2NUzoEW727+UW1OTabrM15DdAYDH
         P9hfMGeh/P5N9uqjat0E6t6j0+83oCk9wYCvB1LI7ahYxRF4WoPwB69IH9ykTYHgYC08
         dHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729682; x=1796334482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivjjARUrAieaHI+KUn/UgI1V7xqs4l7rxB7xnDyFdos=;
        b=L2YQQiltT2qXAUztWjoFN/hlUzvhFGGCEgyTAmz1xnULa96oiSrWRB9abaPfssXqk0
         BbJcJotlXADDwpRcyLZhD8p5Q3q2eUIk/NO3MvkZcR7TEU7PjFgDKA0HEQtzd8qiYPOn
         XWjQuHAPHiOVPqI9VB9zZina5RVGKSDHYEqTkR1llCIWIk9gkwqvvr6PpmFCJAvLZlmz
         zOiPUN3S6rIPi+VVsUdwAEAqxD3571BXlWxrRoUQ0s1Ohe3phohO8MJIRlto3ZuT0Bom
         CpinzVgN74OJE74C7JZ3ICRrbOkPxjscr+vARfAYGCEtTY/RLkfWYrSQzY4QRm085pFb
         44Lg==
X-Forwarded-Encrypted: i=1; AL+hErEzQjoRk+afR0bLa8lcI2HAuy5FudDI+Qi9UXbOaJ1QFRxm7KlVGHwERX8cBQxjSMIr/5Saam6d2ewb50A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qtF1N+ZaDkKrg6lEBj80iR1LwTBKcy4/LoEjTzpCsPq0+VJp+
	JPP5HQKsq7AOhz2oj4Xzzft/qDaGVgFd3hV8h9lbSt1cVomgs2alTujX
X-Gm-Gg: AZFdTZe/2WG/ntZYt25dkyjkWGWkb99Imxi6yqzzCWH0Y49fZVTesBsfSQa3JzIUzA1
	gZ+BPYHbXyE+AVliXFd54lJKgXPLOv7qLbKq+HQEN2q8vHcb+Kk0+kADFuetb/34mVV8hSXb36L
	rseaov0Alo/pMy8X5Pp+Oa0m1DdwVrtmfxIYaPLrj9aewUgSGu84BLh+dpfZdCcLi/ZK42nN4M/
	DnZRyXapirL3E1/7TCqOHjP6d+MnbfTYwvU+9jZXTUc/l9zKkXrncwjJK6ucItwtJVJ8EIydsm2
	xEGPilkSsQp/mW2ZTpvWubEHa0oYAnjysYl3LM7eKCUwuGCVK5q6NqKTrRfAP++QW2c9EQlPgQl
	UlN+09R40o7FUgtRMnbwimF1AV4LH/+1k16yrvh9pOjcG7B8FnaJc1dx7T2AlUXQdwgpaPvoa3u
	6bNVVKbhqrveRD6R8dVoHdp1gZCFp6mdOYJi+LtCHd+eSfZiHqPDOCbZsyBrTZt1wpQVs3g8qIT
	hWsbfuzDXxHLQwDgXyP42HicNRgKPGmVBQ2S6PQHgzKM+eBqrfCzsZo7orWN81/aMB+ctsCf47n
	VDNEYEP9rx9+kEsZ+YUWWIbD0IV1IbbPAbzWe2QRKcpTQ5LMoSsbcbG6JX0Pp2Sv3Fxu0mA=
X-Received: by 2002:a17:90b:4a88:b0:3b5:29e:11ac with SMTP id 98e67ed59e1d1-3b5029e1483mr5276379a91.37.1795729682252;
        Thu, 26 Nov 2026 13:48:02 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm34636414a91.8.2026.11.26.13.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:48:01 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 1/4] ata: pata_arasan_cf: add missing newline to warning
Date: Thu, 26 Nov 2026 15:47:53 -0600
Message-ID: <20261126214756.39027-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214756.39027-1-artem122novak@gmail.com>
References: <20261126214756.39027-1-artem122novak@gmail.com>
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

Terminate the clock-rate failure warning with a newline so that
subsequent kernel messages are properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/pata_arasan_cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 12f1324461d1..0b3e4e63b66d 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -318,7 +318,7 @@ static int cf_init(struct arasan_cf_dev *acdev)
 
 	ret = clk_set_rate(acdev->clk, 166000000);
 	if (ret) {
-		dev_warn(acdev->host->dev, "clock set rate failed");
+		dev_warn(acdev->host->dev, "clock set rate failed\n");
 		clk_disable_unprepare(acdev->clk);
 		return ret;
 	}
-- 
2.56.1

