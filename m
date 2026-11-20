Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171239;
	b=WVYn6gN2y1B4iMBBPYdUhJgONu+v5AB6ekbL/pzyqb7n4FNxhSK0NZDGBGs7o2LamaoD
	 bka6zBaMm8kGTV64X/aCFdqgX3UHSFGCYGDBOAess+n9027LdDYvEkoFH3HLqFG5xemjC
	 IWUhds5W9x6h8J22QpZnbpBIoDgs8QwR5OW28wYB+RnETLKBgVTCK/MrMmZwa57tEwviv
	 cDHo0P3rlFMnVorx9ahMPU+3BRwrL59pA2s3ocDe9+3wVZTMSjGtqatejfDy9Wnq/vf2k
	 dTpTBcLpzvZfRgdwgT8Z8PnTCYJDMXmvbyp6s+lPjNkso9TlbYrPTnKpvYYblofDg4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=el1LyCfnrClGpym+h6i1skzP/uh1fnaEtmw/z/26iV4=;
	b=VVkMgQw27rd8PmXSi6ZPvupg5/WdzMJ1UhtINj0D226XjHZXEAVE4+yTy935ZjVQ3Vv5
	 PHTwN26im3RHy1+xmnov5SZ+ieEnOWRPfClRmy1w/V9se845KgkqYXHbeD/W2BoP6rhGh
	 XhsZ+R183+HgUqVQN1sAA4WW2EszFpnUBR8J9Jr+PHb1yEWJAULIa0wVlTWwcSRegJiNL
	 nOS6CPSq4kusHt5T3swN5xxq3Kdur4VCP3RB7U25upECKHDFCFvTrTpPYVQmrI4nQeHCW
	 4O07sXLoR1T47KUlKrUmOv6QA04j1PB9RvAj3UVxNLxCSn28xWtiLcCTKY9QV0ALZKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHsjyxG7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC359606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC359606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rHsjyxG7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so2701025e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171237; x=1795776037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el1LyCfnrClGpym+h6i1skzP/uh1fnaEtmw/z/26iV4=;
        b=rHsjyxG7oaD4wWpiGPVmip0n9lwJylvWs2W4M19ixmByUJbyM4+Vi5quLZg0cLIiMm
         pYYP+BPfnGZOBhdnQXyyhMuEn+jxhb96M9/jWEd3lrzkUWWyWIP0d32nZq5YKc4vPu5O
         RAddcl067G8DS02bC3kLVrMkr2jd04twLuo9z0lH8OqwN/qSuzhyQliCSwD7VPO0ML84
         utRF92KBiYhKyapwHP4e4ncov2voP6a91U0CF1K3K82dS+MSbcaj2nVyQ0zubTeefuT5
         HNxzCYU0ZXSfDWlUh8S0gAALoKcc45KLf//D2QUR2zVbtKFHbryyYqIhrtBsV8AvaJIG
         w7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171237; x=1795776037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el1LyCfnrClGpym+h6i1skzP/uh1fnaEtmw/z/26iV4=;
        b=JHs2f/p5CJgDmrYYjW2dYFWLcEnnl6XeqjWTySgfUFeUvA8QgffDghYrQjv5oukoYH
         7ASgRU8arQgZIVl3qhCsCTXKF3d48AUHHwyfZRy30u2coID/wyPUBhpght8vomDSmOGU
         D6M78P03P982wn8RD4W0mdR6f6DV+qaauMwkDdEUdILEQaosLqVg5GOW8OHgX+cCehhO
         W2DbNdUKcNnYvcPbTwMZh8RT3hB6nKmKpLEmAaXtoEePMrDAdR8Sz7WGXIYfx9HutU+f
         ou74lbtgJaB+JvXEXZNbz6hvQ0CztEYd4mM4RijduN3/1HYNwq/rJame9Y79Y/jaxhmj
         dwxw==
X-Forwarded-Encrypted: i=1; AL+hErGVwqvKi7hLN12JIPEUlukp2hGg6DaOYr5LZV6TdDkrkztHXhLkXKrWc0su8lN5bShyzVlhDy0WK9IoEIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d0JKh1r+x1BokhbaPNneclMYILCYoGwR+5brm82xpB/CnmcOk
	UE9STRr2dYJoqJU9ua2T4UErkNOR4M4UgIdvi4b7jppa3p48EnnJheL2
X-Gm-Gg: AYBFou0BFgbsjGk8anHudursL+Vl5EptQR/PaO7WkxWCxXEDh5iBDBXr/5AbQMHlI3u
	ijBBtI57YRT064hYbbvaH4PcZRlcDIncWK2RWIHQOletzUh5AIM5zsgxV5JS03JWq5JMhNI89Zn
	1xuR8TPtFLd8QEKdYwfKpUHfTOsKz8RR+E3A99d5mrYx5uoIbBgEnHnGIKnwFXVzBMMeOGXgdXc
	73RnW20TittPpc728RxJGJ6ARzKR2w0LWvjppeNgQi9F4duAtUTXY5yq7wNivFjj7As+7bF+89U
	W66gRnjwoUtNnv+pjn4UdlDC481ac0LwJ23THZ5XyBM0Eo/FRHH26EzGpF34dr60iMfyhlqmzeX
	4zFF5fNYR7FPFES6LFywNYYczbFP+p+fjmpw7NLsec8j8nNP266zKHErp6JQcsIs+fml+N5USPE
	wfnOo9BmKzviydC9bk9vs5HTEkICthQlGXUbDrv3l4zrMKc4ALUj9nAC/V+Z7CNjtuZLgV3622v
	uKboa8ID6+udSzAN0S1rhkUaDXWlRv5pg+uBKDc3K3tpmGshWO8rVEVCeO1iwQoaBtEd2X1CxN1
	0nOJ0T8PaZTvwkXnA4y3+AxIlL0F7AYIYb9FyFazp3S70fwEvaqsDPFD3hfblMtg0eVqPT5LR1D
	UIlhD0qClXggvRcPtIDvC0wgNFhkpsW9afyvFkOzjGIS5LAj8w0E=
X-Received: by 2002:a05:600c:848d:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb8880fd0amr55521205e9.16.1795171237076;
        Fri, 20 Nov 2026 02:40:37 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:36 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 20 Nov 2026 11:40:28 +0100
Subject: [PATCH 2/7] drm/etnaviv: Register the cooling device last and
 unregister it first
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
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-2-445fc6eacddf@igalia.com>
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

etnaviv_gpu_bind(..) registers the cooling device before the workqueue,
the scheduler and the clocks are set up, and etnaviv_gpu_unbind(..)
unregisters it after they are gone. So a cooling request can come in
while the GPU is not set up yet or already torn down.

With CONFIG_PM the GPU is runtime suspended at these points and the
request only stores the new state. Without CONFIG_PM
pm_runtime_suspended(..) always returns false and the request accesses
a GPU whose clocks are off.

Register the cooling device as the last step of bind and unregister it
as the first step of unbind. A following patch makes cooling requests
wait for the queued jobs and needs this order too.

Fixes: bcdfb5e56dc5 ("drm/etnaviv: add etnaviv cooling device")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 42 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 2a15ae6135f5..2a56bdf2510a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1808,19 +1808,9 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
 	int ret;
 
-	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
-		gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
-								  dev_name(dev),
-								  gpu, &cooling_ops);
-		if (IS_ERR(gpu->cooling))
-			return PTR_ERR(gpu->cooling);
-	}
-
 	gpu->wq = alloc_ordered_workqueue(dev_name(dev), 0);
-	if (!gpu->wq) {
-		ret = -ENOMEM;
-		goto out_thermal;
-	}
+	if (!gpu->wq)
+		return -ENOMEM;
 
 	ret = etnaviv_sched_init(gpu);
 	if (ret)
@@ -1840,20 +1830,32 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	INIT_WORK(&gpu->sync_point_work, sync_point_worker);
 	init_waitqueue_head(&gpu->fence_event);
 
+	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
+		gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
+								  dev_name(dev),
+								  gpu, &cooling_ops);
+		if (IS_ERR(gpu->cooling)) {
+			ret = PTR_ERR(gpu->cooling);
+			gpu->cooling = NULL;
+			goto out_clk;
+		}
+	}
+
 	priv->gpu[priv->num_gpus++] = gpu;
 
 	return 0;
 
+out_clk:
+	gpu->drm = NULL;
+	if (!IS_ENABLED(CONFIG_PM))
+		etnaviv_gpu_clk_disable(gpu);
+
 out_sched:
 	etnaviv_sched_fini(gpu);
 
 out_workqueue:
 	destroy_workqueue(gpu->wq);
 
-out_thermal:
-	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL))
-		thermal_cooling_device_unregister(gpu->cooling);
-
 	return ret;
 }
 
@@ -1864,6 +1866,10 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 
 	DBG("%s", dev_name(gpu->dev));
 
+	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL))
+		thermal_cooling_device_unregister(gpu->cooling);
+	gpu->cooling = NULL;
+
 	destroy_workqueue(gpu->wq);
 
 	etnaviv_sched_fini(gpu);
@@ -1887,10 +1893,6 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 
 	gpu->drm = NULL;
 	xa_destroy(&gpu->user_fences);
-
-	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL))
-		thermal_cooling_device_unregister(gpu->cooling);
-	gpu->cooling = NULL;
 }
 
 static const struct component_ops gpu_ops = {

-- 
2.56.0

