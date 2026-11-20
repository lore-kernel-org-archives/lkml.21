Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171244;
	b=PyLDd5DnMIsR9CMK1XPjYn2/ke2S9wBDI3BsCxKc+6tfo2HKo7/AqDyPJNf7tY/vdubq
	 pR4TKBtZ/9hLrKuDSN2UXlsK/SBt/5kVnr4USXk6Woh4+A5W7NV24atp4ghSiBINo/hv5
	 Ok9/fOy9XmWLVuX+KVZo48RvtIUrtkm1ldzrXGaGfpADXGHhaZnaTKJTj+3TPS0GMHfxl
	 Vd/ascW2awWz1O/Zm/fTDnNant/OvedrQr61fF6txLo3eCxFQsAd5yM6Pphyc4eZ+GU2v
	 XYgcfVJuxSWtm+cI3fAeoIB42JJp+dbux2wo9bvIpGCjmSJ5+ZEJT5D3XNOHETx96tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r3AE3zLxK428z7+9j+YfGisNu564r6/G6Af0bQmzPVk=;
	b=DrK+0MUQLcOwaIk7ag92fDDN2qPcw/9SeEn9rCtNp/i66RAItlCC79yjdFkoZQU8+u99
	 3T5shsPmi3sv7DbDU3aRbjxpR9hvHDLRTJsXarzxVEmD+zod8hlqVtjsWuC1bjSRVEJJd
	 VMR0C004UqRnHftxza397q79LZsAdQM3u7kvuyqT+A0BmQ+dnE/2tvqc9GQF7xkS8XQ2O
	 OerpGcBn1rh+6c+86DspEzFJyFLWhAECY81YI44y7AdthdSWFtRM8c2I5BXW8qqZV78Fu
	 mLzEs0fGdF+aKJ2UyMwG7F4jJ5KCWjR3wx6O36+qkbV2s6CW7v2h89IDL+5dwOmbShg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnroLXjE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4044C60A260F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4044C60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnroLXjE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6025105e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171242; x=1795776042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3AE3zLxK428z7+9j+YfGisNu564r6/G6Af0bQmzPVk=;
        b=DnroLXjE1j6hQroEqAwd5rsIdm7hjkiA5mI1X6cusYxa5KyzrHybu74B3gx7nPjboz
         EANaMn1pVh3wZv01Q9tnlE9VWRXvkRllZyNkjhv+GswT4DTzbA/kGnnw3to9WVXbYEK3
         4bVkXjc0FKc0UH0dIeLY2h4sajhAr8rJzeNbPZodS9Ne7tnhyyHhsK8d4/0axS537DA7
         TdLOi+r4YOH0pAxOV2XfbbaN0A7X/2gzhehwpZPn9jmZmJBBMhPRa5sZV9pl5y6s6CXl
         JQf4XjwEq1AADqvmYtqCK4i65avHr6zjoX+FZxX0J8iCS7Ak0oFDtPWZ3e/t9Z6liUup
         U+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171242; x=1795776042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3AE3zLxK428z7+9j+YfGisNu564r6/G6Af0bQmzPVk=;
        b=oZZ7gn58ACeMk2fXyndXiD3y0zjYTGhEpmSxFBA4Cp3LAmFi3I8xrcGNtHV7uwEhr+
         5mYsg85GUGRq0Vt59S8hWNQRSz9ry/6/9pzyw5rL91H1ephwq4acLufOniboPCC0RKGg
         zzrNmAfmcB0tLi/5syDHeBuKD0EDSugi4jo8vXww5U1ASi48W07IL8NylHPcxwZIVkzp
         k1dX4IriOszvp1V+2OyRxO86RQOVBU+xHcPgj0TN4GVswh8LMhFz1kHJV8OKPJ8zGlTN
         iC9qDKELwwDwuHGKvRwOlQ0NDXR3AqtGwljOO/hVdS/2yVwFcQJk61BGWAcLFdGdJ3qU
         ShtQ==
X-Forwarded-Encrypted: i=1; AL+hErH3p+/Ws19/0WEN7Pr9bh4E+WU6VSe+HJLUA9PQbeva1FOhZOv/LvjTbyCcB9hNSTDO1KBA1MCPREZQSec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FL3h3Mi/49OkvowmFfydZ/vMz7A8WdRKsFGfpaWHnYaSQQSOJ
	278Hd2f9dHIkOIGMnFroX1R0syiKt3y3qeT3wweh5sK3PhkQr+FIrxn/
X-Gm-Gg: AYBFou1gnWqrhuCGOqegtu/w1x3HZjnpA1qwKYk2Ufc8lJbrUsVvwuxToEyNmy7m8Hq
	PStlMiocFTW5C9HmK8U20ChrcwIWlQ0mWDJZjnkZaNT8keix/2AkzDIKsIFrnIV/X/B04ZRuVVV
	VP3GuT6qeQcWav9/cxIEAd0+9djHxPow1S/pcrTWGHtPxIyj/2PGz5K5lRvBBAxunLG2/gKJarc
	N1WyYe1ImwirPJolYNQ+Q747pD+yuZt6kv57dTpdxdPHiNQ4yo4rAT0WxrSOQkPXqG5Px9eiWMc
	1RLAop1fcK16fRhiUXcnH7CKU3ZZkcIU4fYrYMxPHAw9H4A5bbeiT2TiaGFqGGba0hclcWPvsfn
	bce9jrybFn+KUcq+jgs2jpv3RlUFHqN/mJKb5JEVjrdSlWISnS6vIR4aHvXRJflh5PkUonf6ueh
	fR3R3Wf/MMwigpvf4CN+7A/yXpmOibGPbibvOP3ondtDJoe8027yFBXiSysm380v5yAMceMboCl
	A2vviOkyCakpJo4RRMj9js55Osa4zkFHl4pk1PVj3J/i6PjJwVqYCvPKhr/e8v0Snz49jyGkl74
	tR6dImn6OZDtHkqSJdlC+G/hqyLtzRV2yH0APiQZJ7BENBmJ6iH3SC1Pu8kLD8ZK6nCQeHJZRRf
	cbY5218RUHMuTWPmcftNGPPmcvvwcSsbKibYahJYtRHtGeRtLOKw=
X-Received: by 2002:a05:600c:a08b:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb88922c52mr52970985e9.13.1795171242458;
        Fri, 20 Nov 2026 02:40:42 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:41 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 20 Nov 2026 11:40:31 +0100
Subject: [PATCH 5/7] drm/etnaviv: Change the GPU clock between jobs
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
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-5-445fc6eacddf@igalia.com>
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
 Christian Gmeiner <cgmeiner@igalia.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

Thermal throttling changes the core clock while a job is running. This
can hang the GPU. On a GC7000 rev 6009 I toggled the cooling state
every 200 ms during glmark2 runs and got 25 hang recoveries in 24 runs.
With this change I got none in 34 runs.

Hold back new jobs in etnaviv_gpu_submit(..) and wait for the queued
ones before changing the clock. A hang recovery counts the dropped
jobs as completed, so it ends the wait too. If the GPU suspends while
we wait, the resume applies the new scale.

The wait gives up after one job timeout. Then the clock changes while
a job is running, as it did before. The timeout is needed because a
hang recovery stops the scheduler, which waits for the run_job work,
and this work can be the job held back in etnaviv_gpu_submit(..).

drm_sched_wqueue_stop(..) is no alternative. The hang recovery uses
the same pause_submit flag and resubmits jobs without looking at it.

A cooling request now blocks until the GPU is drained, up to one job
timeout, and with it the thermal zone if a governor made the request.
The held back submit blocks the scheduler workqueue, which also cleans
up finished jobs. So the IRQ handler wakes the waiting clock change
itself.

Fixes: bcdfb5e56dc5 ("drm/etnaviv: add etnaviv cooling device")
Cc: <stable+noautosel@kernel.org> # needs store_release_wake_up(..)
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 51 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  1 +
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c819f5fc4418..9b112d053abd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1452,6 +1452,14 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 
 	mutex_lock(&gpu->lock);
 
+	/* a clock change waits for the queued jobs, don't add new ones */
+	while (gpu->clock_change_pending) {
+		mutex_unlock(&gpu->lock);
+		wait_var_event(&gpu->clock_change_pending,
+			       !READ_ONCE(gpu->clock_change_pending));
+		mutex_lock(&gpu->lock);
+	}
+
 	gpu_fence = etnaviv_gpu_fence_alloc(gpu);
 	if (!gpu_fence) {
 		for (i = 0; i < nr_events; i++)
@@ -1542,6 +1550,13 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
 		event_free(gpu, i);
 	spin_unlock(&gpu->event_spinlock);
 
+	/*
+	 * The dropped jobs never complete, count them as completed so a clock
+	 * change does not wait for them. Resubmitted jobs get new fences.
+	 */
+	WRITE_ONCE(gpu->completed_fence, gpu->next_fence);
+	wake_up_all(&gpu->fence_event);
+
 	etnaviv_gpu_hw_init(gpu);
 
 	mutex_unlock(&gpu->lock);
@@ -1652,12 +1667,20 @@ static irqreturn_t irq_handler(int irq, void *data)
 			 * we can end up processing event 0 first, then 1.
 			 */
 			if (fence_after(fence->seqno, gpu->completed_fence))
-				gpu->completed_fence = fence->seqno;
+				WRITE_ONCE(gpu->completed_fence, fence->seqno);
 			dma_fence_signal_timestamp(fence, now);
 
 			event_free(gpu, event);
 		}
 
+		/*
+		 * A clock change waits on fence_event for the queued jobs.
+		 * Job cleanup wakes it, but a submit held back for the clock
+		 * change blocks the ordered scheduler workqueue and with it
+		 * the cleanup. So wake it from here as well.
+		 */
+		wake_up_all(&gpu->fence_event);
+
 		ret = IRQ_HANDLED;
 	}
 
@@ -1789,6 +1812,7 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 				  unsigned long state)
 {
 	struct etnaviv_gpu *gpu = cdev->devdata;
+	u32 fence;
 
 	mutex_lock(&gpu->lock);
 	if (state == gpu->freq_scale) {
@@ -1798,8 +1822,33 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 
 	gpu->freq_scale = state;
 	/* a suspended or not yet reset GPU picks up freq_scale later */
+	if (gpu->state < ETNA_GPU_STATE_RESET) {
+		mutex_unlock(&gpu->lock);
+		return 0;
+	}
+
+	/*
+	 * Change the clock between jobs: hold back new jobs and wait for the
+	 * queued ones, as a job that runs across a clock change can hang the
+	 * GPU. The wait must be bounded: a hang recovery stops the scheduler,
+	 * which waits for the job held back in etnaviv_gpu_submit(), and that
+	 * job waits for the clock change. So give up after one job timeout and
+	 * change the clock anyway.
+	 */
+	WRITE_ONCE(gpu->clock_change_pending, true);
+	fence = gpu->next_fence;
+	mutex_unlock(&gpu->lock);
+
+	if (!wait_event_timeout(gpu->fence_event,
+				!fence_after(fence, READ_ONCE(gpu->completed_fence)),
+				gpu->sched.timeout))
+		dev_dbg(gpu->dev, "clock change while jobs are running\n");
+
+	mutex_lock(&gpu->lock);
+	/* the GPU may have suspended while waiting, the resume applies it */
 	if (gpu->state >= ETNA_GPU_STATE_RESET)
 		etnaviv_gpu_update_clock(gpu);
+	store_release_wake_up(&gpu->clock_change_pending, false);
 	mutex_unlock(&gpu->lock);
 
 	return 0;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index e89d591d7404..dddeabce6eb4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -136,6 +136,7 @@ struct etnaviv_gpu {
 	u32 next_fence;
 	u32 completed_fence;
 	wait_queue_head_t fence_event;
+	bool clock_change_pending;
 	u64 fence_context;
 	spinlock_t fence_spinlock;
 

-- 
2.56.0

