Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171242;
	b=S9qZ/U2J6zCuc5wW198Z5ZkqgyBnbBvn1ZJZVwo3im2GY6v5BmmtoivyzkNDW0ZP5SYX
	 QtqFWezVDpFDA4zqGnA19PbXG/xaM8ElaYLG+fMm6HU3E7B1A/1RplZbJHGIBOB/0hw3J
	 3HgH+8luuRv5ywHPwTUZL/B9fHRwGWcLxuf2SkGxKF8Wn+Gx8MWtYJcL+X5PHD6aiHxC0
	 nGmJM8kzeda8b1feyaQwtrEpm3YHd7d5pRefknonEeb+NabggXbVB1vMyvFMhBdoFDXfi
	 KCDCMTxML6ZqaSYXgkWBB337vIf0NfhQJVy7y0euQ8IhjxflcKEUULM2fcVyg0fqSyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b/qJoLFhb7whNR1fmKsxBm/CKb6ds1LT3YrumeDpyEA=;
	b=HIx1EOUgtB2ddCoH1YscJcKqWZ3lHVW9VEaDmuOSPJwJHf/GjhdmTCDNGFyyD2FnG0oE
	 iK7nLrHuL6ikASSOqGKROHODhtpM3m8orYSPgOmRLZrPBVjGMzOq9CEi7Gi4r3IguBc6v
	 YQ9fPleGtgyFXSbUENwiwImlZPXQ8kCX3ZnFi45oMmgX89Sk3uWlq1n8ygxCtQuEU7tuU
	 I3QFJbO9MgYZU6ewbPPr8KoA+gZMILAPaZTwpPD84tcYXlJaE5n1/7ypQ4ZPzpuz9iIBD
	 VVGaXTnUo4OQJFUYJvU5FhBSC5wLkwq+r9ExnJkmsXKOg9Yll0V0XTU7Jl603nzabgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKgUim0r;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5F60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F5F60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKgUim0r
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3993105e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171241; x=1795776041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/qJoLFhb7whNR1fmKsxBm/CKb6ds1LT3YrumeDpyEA=;
        b=ZKgUim0rUZuHfYVFIJQdTBiAgXhJzoCrWHB93DvsBZdBGKDfBfGl3kpelBjiXan22S
         CBrUIDAZc9B2LwKIhcuuyQHbnAeCquZ/xN/8hHRdtO94QpeOaWxAe4fiAzUuapfR8RRK
         aFSyiUoW/FzDJkXf7LO05NkuhS2dlKA67Y+y6jhy3UauBn3vFshCukALpJnJa++fHj3Z
         oE29efZczgW5k5ECINREzUo/Fkk1X9S0dcMVGz5VGsYzJ4Yfd9HkkFjxf9G6JkFy0bey
         wRREtDymPWNlUNOCyKP/7p7chf7QCo7AgBFv6OpE8MmiFblDWFiQa2orWUqDbb8Qg3Uy
         +ZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171241; x=1795776041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/qJoLFhb7whNR1fmKsxBm/CKb6ds1LT3YrumeDpyEA=;
        b=TTUKAK5jwpJpjXcDGajor0QWfYYLAhUxKOqZJSUYf1WAw/nYCx6xSQkOUsd/AbzfKa
         aVAMozn2boWxqyHpS0tIMfLJQZ7VXkKfoDf/5G+L4JS2Bu97R6ucb5PnKkSJDhVKjc6a
         Xb+Z+cuk4KX2vxHDJe2LuZUdgDXWOfZUa5y89WMC7PjkwGBU8O+ZrnxUYiCmn76l30bK
         HQA63kgKpt2WXpTfdkljG/Ii5L/q69YbU7KR2bxHOR+Qk5YOEz569ubjQ8WV4n5wg78x
         4nxDaEwYgPoNz0Uanlod+B8mqwCpYAcCPGe1Y+iC1zvZ/HCEhmCv+Ji8wjFEsBjQ5yln
         Lsdg==
X-Forwarded-Encrypted: i=1; AL+hErFjjKSj93qnX5vao46H5LI63G4Tr7g6LttJkdFgZ6s9c9p5pj3YoQRdoQivc2BgYwZvdzZixuZpeKQZql4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2wxo5cLYKaL6tTtTYAyaYQmz5jKYlGZg2CIN8xyRIJNCVg+ga
	QFj6JqhW5bkrfVQcGMpbPrT5+2UzdWnT1BaICwWEiSR51jU0Edw1Dbgo
X-Gm-Gg: AYBFou3hM0u9d9Vg7soFWyzCrjPxav6tv5L/od9xo/m4ArTO/GfHoAedToEzPyhxZZl
	0m2dMkH7Ve9tq7UiUyoVRkYAtBK3K1uQuVMcZ02MpZfKrmhd/K1ARKA03UrXQGushleuC7AINtw
	V9TUJKWwWdub+/RVlovzYFkh6pmASbR4hj5LRhbYRlA+x9cxCAP5rlSGXIXA18sxn9cKQCMJEXb
	0Yro5peiS/oWilHCUz9ABDUHXxkOAy3LFaR3yMQ6OwZCpLWXaPwnYg1piau/6zhIw3a3PVHRRq4
	ZogsaKA7+xXg88YCsxLphdIz4wCmIWDMyjKXghmKk+87jMQCWXDBcGNrAwgI+C/znejvuESqEQF
	V07jQbR2TvhgtxzOVdviE9K7hvVLuQYSC3clfADF0+6piaIS4QVulmQtBQbyExREcv+oMimsE5S
	IY5Let0w8O6HIwSvF5V+3IbsRR2kpqCipDPq4e/vmYeO785wS2cp/2wMKyZUNqSjdTCsH19/Mi9
	1UW/ZKeuSLAjTKXEqMHqF1otzeannNt7moJ48R/zd5KfKCUzY5D+EUwmtYgpb7P1Bh6dLQeqVf7
	3R+EzMHw6WNc9NSRHA9cD9nvtsGaUak0/d3X2ITeHtjXTiexM2uShpR6qhtiIqVGZP6z397+yn/
	f3npMEfHNtS6b/QHlCH1sGRDrXONrOKHjDtS4Z61XY6SYbMy2jQI=
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr58497555e9.0.1795171240966;
        Fri, 20 Nov 2026 02:40:40 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:40 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 20 Nov 2026 11:40:30 +0100
Subject: [PATCH 4/7] drm/etnaviv: Don't change the clock of a suspended GPU
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
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-4-445fc6eacddf@igalia.com>
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

pm_runtime_suspended(..) only looks at the runtime PM status and takes
no reference. It returns false while a suspend or resume is in flight,
and nothing stops a suspend from starting right after the check. So the
cooling device can write the clock while the GPU turns its clocks off.

Check gpu->state under gpu->lock instead. The state is RESET or higher
only after the runtime resume or the init reset has programmed the
clock. A GPU that is suspended or not reset yet only stores the new
scale, and the next resume or the init reset applies it.

Take gpu->lock in every place that sets the state below RESET:
etnaviv_gpu_rpm_suspend(..), etnaviv_gpu_unbind(..) and the failure
path of etnaviv_gpu_init(..). etnaviv_gpu_init(..) also keeps
the lock from its state change until the init reset is done. Otherwise
a cooling request during the reset is not applied until the next
resume.

Fixes: bcdfb5e56dc5 ("drm/etnaviv: add etnaviv cooling device")
Cc: stable@vger.kernel.org # 6.6+
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 0a28e21feb8b..c819f5fc4418 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -886,9 +886,12 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	    (gpu->identity.minor_features10 & chipMinorFeatures10_SECURITY_AHB))
 		gpu->sec_mode = ETNA_SEC_KERNEL;
 
+	/* the cooling device may change the clock from here on */
+	mutex_lock(&gpu->lock);
 	gpu->state = ETNA_GPU_STATE_IDENTIFIED;
-
 	ret = etnaviv_hw_reset(gpu);
+	mutex_unlock(&gpu->lock);
+
 	if (ret) {
 		dev_err(gpu->dev, "GPU reset failed\n");
 		goto fail;
@@ -952,7 +955,9 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 
 fail:
 	/* the GPU is not used, a resume must not set it up */
+	mutex_lock(&gpu->lock);
 	gpu->state = ETNA_GPU_STATE_UNKNOWN;
+	mutex_unlock(&gpu->lock);
 	pm_runtime_mark_last_busy(gpu->dev);
 pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
@@ -1792,7 +1797,8 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	}
 
 	gpu->freq_scale = state;
-	if (!pm_runtime_suspended(gpu->dev))
+	/* a suspended or not yet reset GPU picks up freq_scale later */
+	if (gpu->state >= ETNA_GPU_STATE_RESET)
 		etnaviv_gpu_update_clock(gpu);
 	mutex_unlock(&gpu->lock);
 
@@ -1888,7 +1894,9 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 	}
 
 	/* the GPU is not initialized any more, a resume must not set it up */
+	mutex_lock(&gpu->lock);
 	gpu->state = ETNA_GPU_STATE_UNKNOWN;
+	mutex_unlock(&gpu->lock);
 
 	if (gpu->mmu_context)
 		etnaviv_iommu_context_put(gpu->mmu_context);
@@ -2031,8 +2039,10 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
 
 	etnaviv_gpu_hw_suspend(gpu);
 
+	mutex_lock(&gpu->lock);
 	if (gpu->state != ETNA_GPU_STATE_UNKNOWN)
 		gpu->state = ETNA_GPU_STATE_IDENTIFIED;
+	mutex_unlock(&gpu->lock);
 
 	return etnaviv_gpu_clk_disable(gpu);
 }

-- 
2.56.0

