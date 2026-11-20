Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171238;
	b=3RUhpzF/vv+u5nQPqe20KlfwB6loD65YYTLqRhJg9VPxrTUhas896vQ8sUw6Elhb9TVr
	 +wrXnK8h16Sr3yCrMbAkSlDp6W+c0jcahlm7FPmHuQ5Q4y92MqWWsF1GEcrz4gk0HVB66
	 eFsGNQN5deZyMc13La9BTZNlyllENScVYq1JOjA0qH5J6i0DHLK5VANWRsozeTd1MFqll
	 v79KAurbS/1a3QkF5a8ZxsE2BFro8NDGlxcnpKbVejnkthGVH3S7x2LZxUO+uboEO6nVC
	 EpQMH0ozwnqD9/2hkxRU77Es5M+OiNDd3qIMKU377rFT0Jn+EZ6tlBqkQ/WZkVaafFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wWjEO3N90Ag9CCKCLSbaqSxSbDsFMtzLcLHXCqLa5hY=;
	b=LzwG8Jl3EoF95IArj84AwZ0W0CoTZYrJfk/ND6VKe/DqwIuI6qGuiF2I2zFb7ElQsl2Y
	 P+EdbBiuQhWleMmsNTdODo6tvNdQLOq0GeJIP7nLFtYEiBHyqAI07ihouFmLlROO0q6LA
	 rtI2vN9zpMwyqkBxPI5XLmhaN126rg2gnSqh8aGJZeiTxSKKXk9qgM5Js7BR/i2nL/puD
	 DDCVmpTe1UdV9SeV4ULdaY5iY9QUWZ3mtqpIZdKxbh3HUx7zLgK4Z5lsjtVEaeITvAXmF
	 kZ0yrRQzqBe/GRsq8oo76o+wBG908bLr7tljdb2qYeJ3IjTYaWThjOLbEbjWQVG/JIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLLqvFjT;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA8606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CA8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLLqvFjT
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so410072f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171236; x=1795776036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWjEO3N90Ag9CCKCLSbaqSxSbDsFMtzLcLHXCqLa5hY=;
        b=VLLqvFjTEGLEuGf1KgYPthxjvOGPS++cPjWxcgiEdKC5A4yVI7SB7vmmXlXIT//lV4
         yrMvsSv3U3aPEA98N6fxjniuOunmcApDd3r4F9FMOsu5gDiapE7ZVhO6/cj8Pfdf1CjU
         M2NrcI9Z8heP4VVbmAE1QUbhaMoH6XKTYeInnozH3ntXMPESwxEXbyzkYQ/0/WxPrH1E
         0b2Q546I+MPggwmQA/UsiW7Ye0DPHtR+4uBVANWIRfWYitcqFaK+5Ch2AlSEZDrMoFy/
         kfDQ9Lk86mqe5lsF2ZjspAcS7BR0W5/QF573ABAMynFjwFM8O/4mOoR8YiZI/FC9flWp
         NChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171236; x=1795776036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWjEO3N90Ag9CCKCLSbaqSxSbDsFMtzLcLHXCqLa5hY=;
        b=Bt8ZkjumBRkwQAdANw5ZqEyXJlAUQQu4JiO5HSBYJPFTFZ/i+dYKmF4VUGDu+Kn/CY
         LpBhkbJ7a+khhnyZD0kAUuhM/UKlFtAW4VK8s2l46C5IGbRD/hPcGVq8F7BL8TkPc/Z1
         aumCl9rMDIM0kQ+JfaJo7okeCqx9tFSr9HBC728Ew22+lfd8RVVnfKBUbMU9EVQegBxg
         rnjHiDqpH9A2LeO2KCVsguc42cVOXhijkTSWxzSl8GbEYFHBZnsyoAMWRFYULZvaUMqp
         UvjU5bvNOVv5hSequjvKxKUvaeTMnPsZTOdhB6rwmGErZamrHrfZV3H/4r9H1KndXrdO
         NHkA==
X-Forwarded-Encrypted: i=1; AL+hErEOUGRTjrN2YzWhrLKlxpodbzgnPaqo1IdfPVi+jKOp3xdGpNeZyAotZBraN+Rx3I5EDw1OJH+otsL2kzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mG0d8XtlUO2sCCpSX0HZmyFtdDNyZN0gxfJCZIWJZaTyNLrIY
	u5ZkGFuA8CrNbOcUpb7j0PYCilhuOr3nio7sv9DrQJxAgS5HOX07LkB6
X-Gm-Gg: AYBFou340XGJwcU/5+zRmB0S7hUtn3dmKnqPAF89LV0f0JzCXwhCTBTeF75xV/+ch41
	MsM7iyJF0M+n420Pisvujh4UQq3XCKif9sKpXNoWNllDPgujFEYwYR4KQeZhvKYVG1t15HTShUf
	ObUs0QzE2tX5hcuTShwz9a954rFyyfacQl6G6HNLsB017jXu3oLIfZqLNykH9xonPpQIphQ8CJH
	O7cHdGXkJO78GMnXn9zvgZqRdrs/nbAWiIsnwP54ML+pPDyY/JXsEZ/DC+cbSWjNCbKLqo+LfY9
	V4sU/lWKWhAQaKwrm2VH4oDVrTJCbiNBvxiFwtgtscvd++OGDlrsaNz1ERPuCyC2FyCCTdC8oES
	xq5DgGdPuFLZ707ePCsglBvzOP/OEYLUlFBSVVSg/NbdvschN/E1lWBla4zm+SAkUYbsICu3A0K
	NzRdBccvAtAZ3sC0yyOd5onq2bmDdMk4UZHY5jDF3q6T4PhsGY6iMZ+xqZjd7S5LUCyaVpV5t8S
	79rUUBLTWkSWvCEInlFqYSz4TZc1jQbqxzIqq1szAVn50sna476BDz4O/+rYR5eGdkRxA31jNpH
	EJFoSDL2eFCe2+B7vh+lPUekIkvV3VAj5LpWI1NKWimMUz4p5rq/15u7eki6LNTAplbtqBSJaVx
	m60ggzt8peUC16qLdjbJMg3oBq+k+SlO0fveiucAtuwUXY/a84wg=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr62257765e9.27.1795171235703;
        Fri, 20 Nov 2026 02:40:35 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:35 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 20 Nov 2026 11:40:27 +0100
Subject: [PATCH 1/7] drm/etnaviv: Don't set up a GPU on resume that is not
 initialized
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-1-445fc6eacddf@igalia.com>
References: <20261120-etnaviv-gpu-freq-trace-v1-0-445fc6eacddf@igalia.com>
In-Reply-To: <20261120-etnaviv-gpu-freq-trace-v1-0-445fc6eacddf@igalia.com>
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel-dev@igalia.com, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

etnaviv_gpu_init(..) can fail, for example for a VG core with FE2.0,
which is ignored on purpose. The device stays bound and is runtime
suspended and resumed later.

etnaviv_gpu_rpm_suspend(..) sets the state to identified without
looking at the old state. So the next resume programs the clock and
runs etnaviv_gpu_hw_init(..) on a GPU that is not initialized. An
unbound GPU keeps the identified state as well, so the next bind sets
it up before it is reset.

Go back to the unknown state when etnaviv_gpu_init(..) fails and in
etnaviv_gpu_unbind(..), and keep it in etnaviv_gpu_rpm_suspend(..).

Seen on an i.MX6Q with its ignored GC355, and with its GC320 on every
bind after the first.

Fixes: 647d817d8071 ("drm/etnaviv: better track GPU state")
Cc: stable@vger.kernel.org # 6.6+
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 6a4aab75ebba..2a15ae6135f5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -951,6 +951,8 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	return 0;
 
 fail:
+	/* the GPU is not used, a resume must not set it up */
+	gpu->state = ETNA_GPU_STATE_UNKNOWN;
 	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
@@ -1874,6 +1876,9 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 		etnaviv_gpu_clk_disable(gpu);
 	}
 
+	/* the GPU is not initialized any more, a resume must not set it up */
+	gpu->state = ETNA_GPU_STATE_UNKNOWN;
+
 	if (gpu->mmu_context)
 		etnaviv_iommu_context_put(gpu->mmu_context);
 
@@ -2019,7 +2024,8 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
 
 	etnaviv_gpu_hw_suspend(gpu);
 
-	gpu->state = ETNA_GPU_STATE_IDENTIFIED;
+	if (gpu->state != ETNA_GPU_STATE_UNKNOWN)
+		gpu->state = ETNA_GPU_STATE_IDENTIFIED;
 
 	return etnaviv_gpu_clk_disable(gpu);
 }

-- 
2.56.0

