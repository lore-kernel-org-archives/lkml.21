Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202708;
	b=E+OL9D8LRnY7ov6ahQfcIgjtjSBBaiSC6IePkNWG0wl26s1srsykBiIApV+GLYZl2JC/
	 YXhNyHH04kgggkckG6x0Qu/evY1zm9JzDqY4tjM9qs2SF2NFB7ZAo2gL3nnYbpiJtnqpS
	 oPPb5YKc88qFWxO6LjjF15t19JH+kkwfLvAINTiWpTudyUQdmR5aJcd16r6rm/JJaVeBe
	 VvF9pXyOx7Eemttio5AOhf+yBJkdWAnn2DXVDUMAVv9z1U3kEoamC1WMhiOTFDnDTdevv
	 /ogPsnHlre6LISiK56r2oxjhgjRAeNPMwOsINEsiLBzZeZZC8yLM41Rfoc+L6OWQWmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
	b=1ULzs6cXWgY07Rg66IfrCfWJRVWFc1I1momAywdaVwKUdxh4I6II77oT1i2rOLYGOpMc
	 ir7VqtVj4qHFYRaUQP1Z5hWQ/5qNY6hQ/C2vp+XSskaPycsPAqMcfhgBJPDTmrgWeedgG
	 EbvW5XMZ8xYGHXcouqrHdfGEQfizt76IxMX1J3QwbHM/EjWGOOa+uLyp1aEcNB7Sdc1WW
	 j83+hBOxbeuEATqeWJnfXmFK7pFaqDsBXWLKVqSXv8GhvQsxE8QuJnO8nDq+peGgBxue2
	 v1/d5BirxhWLlPAD5iC/rRWCl/C6btmcCcw45gGmXBE/AjbHpWN9KzEFVZ47XRTEMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c45vwFgo;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D5606A6D2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4D5606A6D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c45vwFgo
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so1393522c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202702; x=1795807502; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
        b=c45vwFgoDksr5mTd+mDOLniVOU2upBOW/mtK1tOzkrAEmY0LvGJ0kz++/iZj3Y9hE1
         EAqRwR1cbzZjsk+1JBgWXkzhk2Mr3HbYsIly9wWceZtJRs7c8wPdbsXdf53O5Sx/3lhY
         x0RfazScfvrJBGgql+/+9ka1Y2SU4O7gqvoHkA3oT6ee99u173FkTiZOZx3rlZJsOEC4
         imAteu55I2b2+kM1w75Wml6BDepkNFiYAcPWuk+t+hvtSfHmi17vmJyzM5n+mi0wa6qR
         N6+JrzNvq3uTtFVaOmG4aUEFN8+RKzR3pjXGdS+2xBMesnhSk5KU7uvdyaaBszdA/qvZ
         D/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202702; x=1795807502;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
        b=GncHyLyl0NiqwWOmdN8ngK4uyUZy0Bz29+8zMuubaEk5aS3zjvTpmvLLUCL2iTvyCR
         rv9XGgmQ5lzSF3XLkm+U+H972N5G2I1uT7z2YhO7Y0lIk8dksDShUiBAypUVX2J4CViH
         g7gzbBwlmMAtWjKV6Xdqq7oubsfJAsxlmGuhDx0CAV5Uqq4QlSmQ2WWyWNfnyX0gpZ4Z
         8C9PgAUvRqS6f3Qb0we7Tdchd46Eut2rowdzQPXQ7xmV/vN674YtLSpDzYLtXtRlJdiI
         dQ4rlnItDUHAS+VBqnNzMjlLP6ouDFxXGp3UKAmwH8rHLsRJTFvNaASXd1ZtP0FgnHF+
         ERRg==
X-Forwarded-Encrypted: i=1; AL+hErG3mYiY2Htx8HT0eeDh+PracTf+fv9D5ackZRe5enuPzso9iJ0Bt9jia0MR9mQIIGh2jc3Eih91X2QSCgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KBQWf/bB4wivUyA1fDXq/q9I61SzadYHkIUnUZNgM1hsxL6cy
	ZhVHX6l9wvPDiLTTqXuqNxLVlZ2y240phEFitFqSoZA0Z/DHpdJeu27of0Qqas1hXabjbgycsJX
	KYw==
X-Received: from dlx4.prod.google.com ([2002:a05:7022:84:b0:1b2:63d2:5906])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2608:b0:15b:afce:62c2
 with SMTP id a92af1059eb24-1b55691337bmr3351862c88.41.1795202701742; Fri, 20
 Nov 2026 11:25:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:46 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192446.2874087-1-elkin@google.com>
Subject: [PATCH] drm/msm/a6xx: fix error unwind in a6xx_gmu_wrapper_init()
From: Elkin Cruz <elkin@google.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

a6xx_gmu_wrapper_init() has three error-unwind bugs when initialization
fails before gmu->initialized = true:
1) When a6xx_gmu_get_mmio() returns an ERR_PTR, goto err_mmio passes
the error pointer directly to iounmap(gmu->mmio). Jump to err_clk
instead.
2) When dev_pm_domain_attach_by_name(gmu->dev, "gx") returns an ERR_PTR
(such as -EPROBE_DEFER), goto err_mmio skips detach_cxpd, leaking the
attached gmu->cxpd domain and its runtime PM device link. Jump to
detach_cxpd instead.
3) err_clk: drops the gmu->dev reference without calling
pm_runtime_disable(gmu->dev) to balance pm_runtime_enable(gmu->dev),
causing an unbalanced pm_runtime_enable() warning on the surviving
GMU platform device across -EPROBE_DEFER retries. Call
pm_runtime_disable(gmu->dev) at err_clk: before put_device(gmu->dev).

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Fixes: 15cc59ac954e ("drm/msm/a6xx: Add support for Adreno 612")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a1561ca41a5b..7f6932d7200a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2290,7 +2290,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
+		goto err_clk;
 	}
 
 	res = platform_get_resource_byname(gpu->pdev, IORESOURCE_MEM, "kgsl_3d0_reg_memory");
@@ -2321,7 +2321,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
+		goto detach_cxpd;
 	}
 
 	gmu->initialized = true;
@@ -2335,6 +2335,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	iounmap(gmu->mmio);
 
 err_clk:
+	pm_runtime_disable(gmu->dev);
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
-- 
2.56.1.750.gf70dc682cf-goog

