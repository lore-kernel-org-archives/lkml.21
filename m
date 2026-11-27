Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786786;
	b=dIacFRtQTABtSWQ739qx304M8ABpnsfpHR+O1Gb1QfQFFidaN4iTeZVIj5Wuiss+2AE8
	 xIioiPYUbl9Nh0P119lAptvuP9TMtZMy0Khvo4jtoV7Ryuz+Uv2FyqQRykuMTTtiqJo0l
	 JU2YoL+TUgdX14ntmylEgtx9DhOxPN5C2xKvtBBbseeeQ9c+y5wZj+ZN1tc4inxbJO3yY
	 1hyrJ6PqK0HJKzP1eM8YJ+V7FJfeGj9XzY+47QqWG9JMZvowdFyH4WJaRyvs/iZxkKrfC
	 Ms/jqvFXCNcehtN/Db+B380D4Cc+Yq8rYGedS3iJf8dkpj3ZgFIp1B/sL/rsiIL4Seg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jsEuJpvlZZyQMdgxCFdQUwfLifMTW9CXYX26w+Rx/vg=;
	b=ds6RVmtccMt0bGnucgbgR21zBQI6k9+Sjq63+9G8RGOCtDwjFufh4+TTM6UH52Sp34hi
	 8Y7RMl4YgtpSuU+LipGrMEqS2oYn9UohMQLdXH/iIoqd6CbCL+SbORZBbPvu0l+AiDaci
	 DJRi1/Jn82KmeeKSfEy1tKhDxgCS7c11AdgYwEZarErbnCKoXm7FLA5H8XrBMa/oRu5Nd
	 D/AnIAI49BBNkYEyWmAMD9JxnB3siv+d50F3TXiwHsFlptMn8MbyUDqBZEbjbfPI2j9AJ
	 H6qoNgjpzSEutJTWBjIBGOAwUQmU4S18IIxZ70kdesF1x12ZV9GupULpiNg4srLC5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtDrdH39;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF94606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtDrdH39
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3786927a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786785; x=1796391585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsEuJpvlZZyQMdgxCFdQUwfLifMTW9CXYX26w+Rx/vg=;
        b=TtDrdH39O1pPPiwkRiD29/W5CjaFNK3kzUR52MqgJN2AQagEIuj8q2DhQvnIfebsAH
         SppJBe7H5ThRnaClOottPvOQS2AtwIoXkd6OENN2KvXWO11znmq90SalAY6Ju48mC30n
         EQcfzaQancjiTV+4oFOgDV9CZR1JzwauL3eklF0qXRnc/22dYlTsSguoZ7cKXh7QCU36
         55y5iUYojfeJ9yTwJH5zxDskPi7/TvfCopQbe8kWEE94c8LYlqd0uo1/PE/K0jXQoT7e
         NrezTcYD6f4xx2eLLG6Lv12fJCyGuVuCf7rbnZZ6tRYQWp7uqQhIWs3z2KSA3rxAI1fw
         k3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786785; x=1796391585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsEuJpvlZZyQMdgxCFdQUwfLifMTW9CXYX26w+Rx/vg=;
        b=HUuYjLTF6lQRxWtZER3SuRCCN2BpaBWlJEGrjmCFaBVWkzDkXubfy/l2xCG2b15RbV
         7kPqvGzorJo4Yz4wbZlHiAHaSXiUiX/QZhksmHeVATr/Mu1l0S4zioCiKE+HZZbf84Hf
         juPjvl5LlkBIYrUwG6OBluuEsg0XmSZLKsqR1KMRWs7Jk7c257jYuD3gCpshklbEknXH
         tztk1g1JSoPAVRfgn0L81g8UXQP4fYOuROT0UO4+VrMBm4FBG6chzhxDHhPnz7acDdzY
         EXQpCDSuEs8nme1i7C+0Oiqwaf+FOG2O3D4u4SlJSmRi9f9FYYpi7NIYwSRQ6xkWzp07
         2Ccg==
X-Forwarded-Encrypted: i=1; AL+hErHPxFUIdunXtRYhtZD5cqXOA97bbyJZ5TaGKq3xgQRNMOmxKnGG/5nQd8e72OQEDXsKTcI2Ydv7HqvvX+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z84yqvphEQzWiB7DZPIeNlIHPemisH87dyQ5vxTjGedZiQAf/Z4
	BiEkRyeOjx5iPTFjmlKJJJ0phP4qkBfZZHqRORwAGW9lgnFfCdQ5lzJL
X-Gm-Gg: AZFdTZdKgcDDnOGIgrVIdIYjGbKYrIDn6GAOwkpErxkL9K9jfu+ts08TIDs9yj6g4YL
	n6pkgv3KA7ZIaiiV4zj8FjeeZlSblyA1W0++MJmhpNfRvX/EGrY0Gxo1QG7qjGnH9X1OP858jVw
	4sij3bG+SHvyJs8fOCuuw8kmz/nuA8KQ4fIgn28ucYSMU9dfIdHTUZKjYN0CJWEGauyvpCgymgU
	zfSAhAOPpYmHZM96G91jnh2DLqk9rWETxwVP6W/ki/oK3lJG6OeMHCQdnB6aavwJqD8BztHcW3n
	2XLdZv0wG6VFQaq4RvUi8xfr8Uc8NU08O7JThB7VVT+z6gyBrzwyAEvSN56McbcA7i76tEI6p8K
	2QvHSg5PYdEh6qYSaGlVBBGm4dXIhFOWRQERtxMC7q39/keTCiCAmoSCer7emIPcAP5+Ecb8vVZ
	xhGiaZBvHwhWOD2svDm9F04pExyVHDmds1UeDjqMnb6yxrA2vbEZXWuMCo9GWHbwOlYwEgT8Sie
	pDvb7871Tv94pEZOF5kATsVZN08NAK1OJy5+Fla+n+OqwFkg7iRyUd1S5S3BHYTm9wEeSdScIro
	+jU/72OB0lmAdLv6upQV6ysfsewWqJw1hjvRUD2uVlTh1JjguSNzTR/N7cl/48UlepXtJu96i5h
	DJAONjEmJvOlPEwLvSZcReFdCBgUVkjELydbjYE9i+JJcJJ/UhV58wy10x/oGWLA/PFmtFyCjtS
	psMyrsYdyTsFZiA1lOjbLep3yCmOlBr4RRaLlR/H8=
X-Received: by 2002:a17:90b:3f0f:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b41c9006d4mr33788171a91.23.1795786785058;
        Fri, 27 Nov 2026 05:39:45 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm37846270a91.0.2026.11.27.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:44 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/display: hold frontbuffer ref across dirtyfb fence callback
Date: Fri, 27 Nov 2026 21:39:35 +0800
Message-ID: <20261127133935.1461-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

intel_user_framebuffer_dirty() stores the raw intel_frontbuffer pointer
in frontbuffer_fence_cb without taking a frontbuffer reference. If the
framebuffer is destroyed and its owner frontbuffer reference is dropped
before the reservation dma_fence signals,
intel_user_framebuffer_fence_wake() passes a freed intel_frontbuffer
pointer to intel_frontbuffer_queue_flush(), causing a use-after-free.

Take a frontbuffer reference via intel_parent_frontbuffer_ref() before
registering the fence callback, and embed a work_struct in
frontbuffer_fence_cb so intel_user_framebuffer_fence_wake() only
schedules the work item and drops the fence reference in atomic
dma_fence signaling context. Perform intel_frontbuffer_flush(), release
the frontbuffer reference with intel_parent_frontbuffer_put(), and free
cb from process context in intel_user_framebuffer_fence_work(). This
avoids calling intel_parent_frontbuffer_put() in atomic context, where
dropping the final reference can sleep on xe or deadlock on non-irqsafe
locks in i915.

Found by static code audit.

Fixes: 1bb2af547a4b ("drm/i915: Handle dma fences in dirtyfb callback")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Changes in v2:
- Embed struct work_struct in frontbuffer_fence_cb and move
  intel_frontbuffer_flush(), intel_parent_frontbuffer_put(), and kfree(cb)
  into intel_user_framebuffer_fence_work() so intel_parent_frontbuffer_put()
  is never invoked from atomic dma_fence signaling context (fixing the
  sleeping-in-atomic/deadlock issue flagged on v1).

Testing note:
Compile-tested on x86_64 with W=1 and KASAN for both i915
(drivers/gpu/drm/i915/display/intel_fb.o) and xe
(drivers/gpu/drm/xe/i915-display/intel_fb.o); not runtime-tested on
Intel display hardware.

 drivers/gpu/drm/i915/display/intel_fb.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 9d71f59..ee0665c 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -5,6 +5,7 @@
 
 #include <linux/dma-fence.h>
 #include <linux/dma-resv.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_blend.h>
 #include <drm/drm_gem.h>
@@ -2141,16 +2142,26 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 
 struct frontbuffer_fence_cb {
 	struct dma_fence_cb base;
+	struct work_struct work;
 	struct intel_frontbuffer *front;
 };
 
+static void intel_user_framebuffer_fence_work(struct work_struct *work)
+{
+	struct frontbuffer_fence_cb *cb = container_of(work, typeof(*cb), work);
+	struct intel_frontbuffer *front = cb->front;
+
+	intel_frontbuffer_flush(front, ORIGIN_DIRTYFB);
+	intel_parent_frontbuffer_put(front->display, front);
+	kfree(cb);
+}
+
 static void intel_user_framebuffer_fence_wake(struct dma_fence *dma,
 					      struct dma_fence_cb *data)
 {
 	struct frontbuffer_fence_cb *cb = container_of(data, typeof(*cb), base);
 
-	intel_frontbuffer_queue_flush(cb->front);
-	kfree(cb);
+	schedule_work(&cb->work);
 	dma_fence_put(dma);
 }
 
@@ -2160,6 +2171,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 					struct drm_clip_rect *clips,
 					unsigned int num_clips)
 {
+	struct intel_display *display = to_intel_display(fb->dev);
 	struct drm_gem_object *obj = intel_fb_bo(fb);
 	struct intel_frontbuffer *front = to_intel_frontbuffer(fb);
 	struct dma_fence *fence;
@@ -2185,6 +2197,8 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	}
 
 	cb->front = front;
+	INIT_WORK(&cb->work, intel_user_framebuffer_fence_work);
+	intel_parent_frontbuffer_ref(display, front);
 
 	intel_frontbuffer_invalidate(front, ORIGIN_DIRTYFB);
 
-- 
2.51.0.windows.1

