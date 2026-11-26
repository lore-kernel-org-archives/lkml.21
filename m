Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656993;
	b=qhYutM1wQOGv9Euq6EvN7Pq3SBsL8+qozmCeFqDERJ7nJ2pK/2/wFCfuDlTg4dgUkppl
	 s6/wSTW85bDzbYgim1x1H43T+fZGQoD4P49iXGIjhwcD3KeHbysVFz8R3pMnsJ/OU6KyZ
	 Jd5zEoHs+lcPQk6gBJjxxz7tteOMb8thsp0hfYYB9HiBGP704lPoY0s4GMeVMM4A6Eesy
	 KrlZbNdygF3ZkvAHIjYX6uetVhkqj4NR/+3RGjwlTS2QbRPW0FUTfls9R42omV1qjRwLj
	 89iw7EoXA8kQwPeRk/CL65RBQ8UFENqBVXeODhdgexFhGw93yH7SI3RDvRNAEchXokQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SP15XaZUbGtlp60P327+ssWhkCWUemMIccsR99IzlyI=;
	b=NHZG+NwcIx2VVdJ5++V18+ALETRaIgWbXB4GPETVph8zCoS6hHokfgmBJUMrHVHV4wcb
	 y6uZG+Kb8zFnQnttANPwXcDBpd9hR5pl3BsJ7HEqYgcE6E99PUkSbLCre/Q2/x2hHCPqa
	 G+yvPrD2tzBKyH9IyUUfxr17yXJioqnxXNCX+GYe65b67MU+0xvH0YxFXXQxWETtgQU1D
	 OiXqHnaGmamRNsTIOsoA8CzVF1dY2MGphZ3Y6yG1T1YkTubG73CxyqSDPBGP5qzS4EzV4
	 7Xxq5wUT2Mw4xStIwqHEmGSg34vcI0Ozwfiu90EaQwsPTYd1AjMZ9yJucrLMR/Ch3Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkOtKQEs;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AF606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9AF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IkOtKQEs
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2327318b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795656992; x=1796261792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SP15XaZUbGtlp60P327+ssWhkCWUemMIccsR99IzlyI=;
        b=IkOtKQEsw1P6Qem2Ym5jSb3VAZZX8TmwwUNgxT9DOWowClgIO3DlHf2mSKx2B1wjbP
         0AuxWFLGf2lq1RyFgUQmH0XHDv5gGI6zu00dAbb1L3ezjWpjf/dHnE3u6ZDt6C3W2TXm
         wCtQo4bG4EUmvmT+u7tNN8sQpQAUygbvQN71LN3myFzJpYq9OOmdyDDHqWv1MW2fSCXa
         KG4PzYEqRyb/zxyv6KU3eJyGm4QF82Yn4VGnsmLb9lcqpNh59TNXFGjGac6mTkymDYLn
         suV+97W7fCn7Go40/Ef6MQaiyG5Wd0MQjt2aCFYx7uWUaJLuEqukfQZd9cq0TmzDfUCo
         nksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656992; x=1796261792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP15XaZUbGtlp60P327+ssWhkCWUemMIccsR99IzlyI=;
        b=TPh72aMJtTqgdUnVQGsPXwnIZr2Z2a81v/ggvueRqqndonZfp2toNc6l57lvl3nDIA
         9WWSHGWDGpNBfscJPc8aTuIdmLLYDkJsizdG1nhEODt3NLQP7ZfGyE0n4PAOFMz8xJ7z
         JIugh/ofIDZqWPw0jf7UPIVRVVJ3sJ86/KHLCvw1YLRQm7Sw1gaX2YRkFNgQZojvZe9A
         sNejuUHwUNiye/rXdUoErqitmD/vr/zx3dykIkoQJpcUCfxQzmY2EZeEIH5l7EmYO3/V
         q2kUbyhQyvQrKTyvpuHLtSZyce3kpc9UxdVMUoVJIKR+R2M09LcGgFxrskppx9A2CtxA
         z5eA==
X-Forwarded-Encrypted: i=1; AL+hErF0NAt1KrAsKjsB7CXxZiwsre0x2Ehbb9DgY9BUsRjM7XOmvAd6YtUiedmGvcJeOqRvQlOTFKWpgp2txTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z86W9hR3tsLoTn3CuUNQQffGO/6aIYRiujkgwrpF5ksIz27vYtm
	oU2+hJoQ+bQuM0s5FslJgzMdqAlB7dYMiD7JjiVPWUfyvam+jDJWZkFp
X-Gm-Gg: AZFdTZfXrQqsCbIroMub0Ird5tL+O41I1JpAWKsJNDWTN+Py8Npfp3Fa+5KEy9amInJ
	R0eB1Nsr5rOeViOSiQqsi9DOQwooTFU7y6TVTzHdUvBKvGnFd641kDRWeaXb8UO7fhPYOrV7rvW
	MayzVpy1q1+O+S+VSqrmi1LPo4U+vIh0Y1WIsjJDgsFvt4OCVfJraBF4+0Pwse6bLggHogSS90M
	bbAEF8r/vr6b8wUL8aXqH1FbixIyiQROA3SBMQNQl/CM+Ln3gnM8DMgW3PuL2f6QJVnvuQvuKMe
	Jwo4jxG0ZvRNHHtrfqGJVqOZ9kyxrd6wAacSjo3M2BMuNN1+wrAR6dxM8csWycdj5zD/fewBPSC
	a2lqJ8VeluAMc+epy0gR5uyUwCI1c1BVmPenjjlv8cJ5QZskpDL1OIeQZ5G6oUd5Q9XDdb2K3gK
	zm0TZkgDkXjmQ1a1wOK3GhwGXAK7wDGOJwuZUr9Lki9ENLeBxInu0mSx9Yfp81Ial1P/LePtFZK
	S7BsEUPCCDdl2wxrRFFZfIFUw52SMffQ/Gal2NymTqG+EFQ7LfG2M/+Gjd7zwGWbC2vs35XjxoC
	G/Cukl1pLs1M37487dNCwmqprQ//7AuR/5rvis8NGOX3T2s4doC0vxNklsELVfQ9/XalRj2XsZW
	Bde97BepgbyeoNEkN1Kg9st7cOG21gUikQCnKdXuGekT7HFw=
X-Received: by 2002:a05:6a00:8015:b0:89e:92e:4211 with SMTP id d2e1a72fcca58-8c87bcbcecdmr16856465b3a.16.1795656992438;
        Wed, 25 Nov 2026 17:36:32 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm9748633b3a.14.2026.11.25.17.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:36:31 -0800 (PST)
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
Subject: [PATCH v5] thermal: rcar_gen3: check for sensors before reading the fuses
Date: Thu, 26 Nov 2026 09:36:26 +0800
Message-Id: <20261126013626.2168810-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125060429.GK3898744@ragnatech.se>
References: <20261125060429.GK3898744@ragnatech.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rcar_gen3_thermal_read_fuses() reads the THSCP register through the
first TSC. If the device has no TSC resources, priv->tscs[0] is NULL,
and the read causes a NULL pointer dereference.

Before hardware calibration support was added, leaving the
!priv->num_tscs check at the end of probe was safe because TSCs were
only accessed inside loops over the discovered sensors.
rcar_gen3_thermal_read_fuses() introduced an unconditional access to
priv->tscs[0] before that check.

Move the existing zero-TSC check right after discovering the sensors,
before reading the calibration fuses.

Fixes: c3131bd5586d ("thermal: rcar_gen3_thermal: Read calibration from hardware")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes since v4 (split out from the withdrawn 3-patch series):
  - Split out as a standalone single patch per Niklas Söderlund's feedback
    (<20261125060429.GK3898744@ragnatech.se>,
     <20261125113106.GM3898744@ragnatech.se>).
  - Rewrote the commit message and added the Fixes tag per Niklas's review.
  - No functional code change relative to v4 patch 1/3.

Testing:
  Compile tested only (no Renesas R-Car Gen3 hardware): arm64
  (aarch64-linux-gnu-gcc, CONFIG_ARCH_RENESAS=y, CONFIG_RCAR_GEN3_THERMAL=y,
  W=1, 0 warnings) against 666539eecdf4.

AI assistance:
  AI tools assisted with initial static analysis and commit/patch drafting;
  the author manually reviewed the probe/remove paths, verified commit
  c3131bd5586d, ran the arm64 compile check, and takes full responsibility
  for the patch.

 drivers/thermal/renesas/rcar_gen3_thermal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee670..a96f02d4a8adf 100644
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

