Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575819;
	b=SXNrB4XZKBZKKDKLqxrOUZ/UD69dIhy+FNZa+yMWjd6e+UGFUuGMf41sqgP2V2vRJM4S
	 qV7JjZKEKu0NtImN9f/qzhDsH59KDtDdhbYSGvsS1cnUgt9G9uXCrkPfJjpj2OIiQmbPu
	 aerMOTEnut6ooFp/Ubpw4gSukZc6wSjTUxyrVZ3QvkgVZ7cbCyXvt5t9guRIeM90K9flm
	 TMHZZ4Iz0dQgzpCxNWULUuT77RzWUy5iCOHwmofxfaC5RnL9hWomTOD74uSil9JHfU1aP
	 hoEhq+ebsBtrhCB1keVonHQIckxhAB5CN3rA5lAhGQYByaVlXk5LSXmsbyrejzRtbmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtRLHOs8cntlnxdkgv4Kw+h5TM5UXfe7SQ7bFbXkzM4=;
	b=2G/PYWtRA2pL7D0+C0zjAFbEMnesFPxWEOGLHx2U14+ZdGAlK6za+RLzlfTCG3oWdALA
	 M48bd+tZTAdkdROzOS0dMMU966/0cDW5pGBWz5f4jNI6+0d9cvfgbyWpxZOIB1N1/9Hdt
	 DJfHy5moySiUMOa7+Rk/Z38NNFyevufZILx5U8wk/C0TOuLaD3Wc4Aqpo3yNBsJBRnoHt
	 2Y3XHVXRHkQfgQHiEufV1pWYBr0NMOraAXViU3ugC7QftHUpbAySjw+TNp2Ftu9cp5PTq
	 UdoF77tsWWRYDnysx0S8OnLq+xUH+nXuVIcT9ck2iBYugrXUatr13X9LYJWkm6ILYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKOVKSt2;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A5606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKOVKSt2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so13541342eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575819; x=1796180619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtRLHOs8cntlnxdkgv4Kw+h5TM5UXfe7SQ7bFbXkzM4=;
        b=TKOVKSt2MdXGJInMSKFALiaHDsdHQbhwKK9lg98AHMRSX3/spzwYNAo05kQ/wIrQ/5
         cs3kpotHqq3rqtGsIGOfEiHPMaBf3bEzRyB0GXtKDoUYYnL2O3sLdJQ6F4H3r5nT/mHi
         rsfQ2qnCw69gXaDMFSEeDS8N8kOILefhIGR3mVl6E5L4KF50kDgvjrdOqru/9GXw2y34
         pcvPDJmkRcXh+0FpZZPD71wz1Yd7UHrStUa7HDZ2oqJ3b33cXwJKijwMfR/DS/TkcXCp
         2zx1MzKEWgZirYZVkuWUDa/hdPsjsHtjnozOI9STanaIMcJ+gpVQYIOQjY6r10LE7HVu
         hxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575819; x=1796180619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtRLHOs8cntlnxdkgv4Kw+h5TM5UXfe7SQ7bFbXkzM4=;
        b=0kf6JWVis0nf9K1SUXK6Ayfp1I8Xb5fBr3Rn17Pf37gwRXq5v4ZYCW0ZwbpKK3xYuy
         YKWUR09yzCkJ36z2uY2xebgIBfX/DmD2kufOUyYDcULIjsodjtIF6WkuxxscexWyULWr
         RK5glcLP52rs9p2H7b+YEvjCyyGYtskMq1EYy4DYLQzARFRu+uwuKnOKtQAb4mFDhGsK
         YZzjkWHfA438P/cwBwe9Rwe/RJ60vEohaCf/d08he2azOvIKMvo6oMzFChNZZtqqKJP8
         vQREr5OSDER0I/k5xxQ690VFBFrVIiNAClKS2k1PjTRLfrVLPqq9bz/HtWx84wHb5pfY
         B8+Q==
X-Forwarded-Encrypted: i=1; AL+hErEctGiPl1f3vrL4qDpZVnvpqUA2xIvJODwTWfLubDDLDGmsv6TU0Tp6EdDF/WyqBDAICnQl825joWIGAL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ckGAurLX++hIDbKMcGiw3Cf9GiYppCCfbCsJyJ0plYKzoBKDS
	Fqn3i25OukdhlR9wL7gkRExNY7tn6wBjv+SgbdJmT6M4vSYoQ9RdcB20
X-Gm-Gg: AZFdTZcOlObDj98Kwl1g8hwVMeR4H4zUEeFhGawcaHNWa4+HFco+XRJCjkbgl2phRJJ
	5BKDhcWMkjUYlxpaYfg0X4wUgLlZvp/d4NwbJpW/k5Hpc2G0KT7c4RxKjMmxO+DDNPRqbCHee8i
	csMVctVeuVKclSHC5rSw6s8CfS32RbWbIx2h0FbGVyHayrE7I86bLhJ7EaaWtAqmXs9Vreo4Unc
	N7KG7lCGCz0Qq+QKeXmgU/DyY9k+/ATyLkq4u4gODCsEAiFGl+JJSGTM3zB51wvtgIhSl82cXRn
	7T+sD7daX3wjDVzPpDvphRAxsJI3R7t1rXTrfMpKzoDvx0WlECAkCs6SisG2su4p3hY+mSamM7f
	Y7tQIpTt7a2tl18k011POsw3PiBOqHBBYqzv4IBdyVVneMNlru6Cl6lWbYUdrNC1PtbjIkuZtb4
	CkWkhXE5nXoBGtTO83NU3PVTvYQngKnRPU86FYsTVoLyEJgwjVZQeD6iSen/B14aXMn6D0V7gn0
	Bjjro+nBfLQ7VXY1voaa/MXYXMKamlZ7xVBpQ9S0Hcpy8SbpsOQ3Vkyzx30o7eQmxgFhTwSw3Ih
	P+/JmFPbfMI8tAA7oal38m2E6VXxwfeo6Pw5dS/MpM9gZsZQXSAWmoOaKKd2s0Ul7N8SutPkmt0
	FlFJQwqJK34a508iRr63k7SHsfZBL6NA6pvwCbpXgceRFVAIyVdshT0I/XIZlfxalgqAl
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr7194731eec.1.1795575818364;
        Tue, 24 Nov 2026 19:03:38 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm52243475eec.14.2026.11.24.19.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:03:37 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] thermal: rcar_gen3: check for sensors before reading the fuses
Date: Wed, 25 Nov 2026 11:03:25 +0800
Message-Id: <20261125030327.953450-2-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125030327.953450-1-shunsheng1218@gmail.com>
References: <20261124095110.131258-1-shunsheng1218@gmail.com>
 <20261125030327.953450-1-shunsheng1218@gmail.com>
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

rcar_gen3_thermal_read_fuses() dereferences tscs[0], but the check that
rejects a device without sensor resources comes after the thermal zones
have been registered.  Move the check up, so that a device exposing no
memory resource is rejected before the fuse reader touches tscs[0].

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4,
CONFIG_ARCH_RENESAS and CONFIG_RCAR_GEN3_THERMAL.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee67..a96f02d4a8ad 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -557,6 +557,10 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	}
 
 	priv->num_tscs = i;
+	if (!priv->num_tscs) {
+		ret = -ENODEV;
+		goto error_unregister;
+	}
 
 	if (!rcar_gen3_thermal_read_fuses(priv))
 		dev_info(dev, "No calibration values fused, fallback to driver values\n");
@@ -588,11 +592,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		dev_info(dev, "Sensor %u: Loaded\n", i);
 	}
 
-	if (!priv->num_tscs) {
-		ret = -ENODEV;
-		goto error_unregister;
-	}
-
 	return 0;
 
 error_unregister:
-- 
2.34.1

