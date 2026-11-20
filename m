Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171247;
	b=Tj2s0Qv5oNX9W4NvMetN773M0b7jDHt0LwOg6aQlpwMAsLRTHwhJiaADJKPdoStl28pR
	 3uXOHCGEcx2pglwAJAoX/YaeT3gKe4zA0AkTVX7ScuPsSvaJjY2eXFSfrrVZ6gkLi/2nL
	 hLHi7QU4dSWJ3BRBbo5V3dGvy/XFAgXpvpGw5l4cck+oHwJS5dYk+eIvivu6iRspZkEQJ
	 NVCR+7nBmY5otiddLVzgWqntja7GSOmy/g+IqLhv5MxA7yelTpVmKS5rDcfbBy8HE0poU
	 nKXP8Ub2b08lrcUm57gnZQ028wCcdZyKboT5GdDOWq+glJQUGjALR1t4YZNM052+wfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qBLG4t4oO3794vWhQM2jRWw+A/4Ymw3vg7/JQp5J2Cg=;
	b=a1928SnUXbVAqz6ieiWa60DqllhkuknA3eVXzqAlHCDHOK0JZN9tu/DgClI1ZsS8x49T
	 IUza8nDReJs7VQZDP7tUYdfO0IHRJqgWbXl1mAB5HBTojJqSfGK7lqEm14ZSRFkMYwqtp
	 vzSRlXDW+RzBk2RBh4nX85mOhORWXvzkWeLCQ9PME6Q1oXvwuwLN8EMUwScjCg5pr98e5
	 nTCDVl7hU0aueii1M4ZoYHm/tfyJJ6HFq7cOPZdBJHhD+NACmkNPWum5FJ3RHPSKbz8S3
	 umpNLxykD4d8o/2bolNEkRiT8kqKRADZwqPaqjqP56oLKnkAel3W6RT1Xu522zZ14Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TACz6cu3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2592560A261E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2592560A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TACz6cu3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so6017955e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171245; x=1795776045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBLG4t4oO3794vWhQM2jRWw+A/4Ymw3vg7/JQp5J2Cg=;
        b=TACz6cu3NrExvHXT6gzbkYNq00UegYIkT0y3De7dDedHxqRbwbTshcuW3mHrFDaNPX
         OKQrFkJkVPLnxVvzCGg1j5t6JB0Q+S5E/L9IWoFuxRCnYKijSskmcNspZ+htFUsD4sTD
         Mz9e6q8qxxwkXFSJXEeXS4TEoTHmknHICi8CNWCB2JUcfoy/k2xG5fMBePmzuZGcoRHd
         3YWVUA6CtL6B/KihIkYPPaz9brKg0Bd0eqSH73iyWl+LQcbGCZWCEC49gNsRvb+fapwu
         b0lksIjaFgYwGx0APN/mbnWgYr9PT9sH6aGAXceiTE6GMooUXqkAyWGGESUbnAt5Pl0U
         2SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171245; x=1795776045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBLG4t4oO3794vWhQM2jRWw+A/4Ymw3vg7/JQp5J2Cg=;
        b=xe1cBhptPDoGGaYGASHvQq3o/RfOg55WPdz3kDmBWl7+eYrsI0aWslf/Ublcu54rTL
         avIYWTvqqtNPbieFp2RdWYk1W7oACXW2O9rqkGnmknpQUidpM5tAqH/QmVhbjYYuGWdX
         a4Z/byk2aSVEQRMu+67b3hL5TuOsAMTjQQy7A5pfMyg75jL66IyQXGNteaY7T8kPbY/h
         VIh+lHaTB0DvjPBvlviOUSSLcYoifsMqjviUffI6l2lfBndDBW0Olwsna8nmcNJ0cNiH
         TVlCq/u7IU4kI3Zxd4qGt7PfQ9J2xHg1oneHbXWe2mt2iffhhHJTRZeS54/VsEILQtaW
         t3wQ==
X-Forwarded-Encrypted: i=1; AL+hErE1OAkbaMchiBuZNKqTnOniMYmPE5E2BZ8FCeBWbjkqaHhdItjg+VOziAtvhuaP3X5n+wkQo4k1NNhpTZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/h/0ckjR5suWNx+3q5lq1bo6+2MVB4ISEYrFvBFdeTrWeJnpZ
	MT6RDeX5WKkcFJQVRJ9TPJuehNalv2OzPxbuCr72fFtDCodfoc+dGN0i
X-Gm-Gg: AYBFou3bUESxTag7GmOlHiJzlPkNqRYFWyURKYg7FX702+HOTk5aaPvcrlSPFWI5qgV
	T3B5jEHk5zUzU83z0mp3tQGHRdXkIXqEPzkQQeMSvuaSIRSHDbClHQKS8RYKKGwg0A++U743OZw
	5Q2WX4YPO/ZG9f0XxZ7XTLwe1whqM/6JQdMnHbiFb2H5NMYqrjDSPN+/W/hxB5fksugkZrhFapj
	Bl4NlQseCR4zkZjsiWVU6ivkUV2hUwLxTGzTv/pRliw62p/lEtu8bvw1HcTKAqg7EzzVt8UAuh5
	lmtsistjCln8fwouPFSiIryRS7hxvzZz9h85YPHwq15RDr75d0L3G1wbXvXQdrwfg3KZnOKwtX3
	GgOzykFv5dQe81XgyyDFoipUALGYuaJmpJeGip+VK6H9ZlOAaxAar5VCRJEDAS5y4MOVxpUWNxV
	n4HkYsykUisfQa8gyKtuEzb292/P4INuzo904l7tKg+UC6tSAJQg4YdbX6YD3q6HkDm46E12OXP
	DunnOCOQWunk0IUcwd54kQmTu16twVxIsD/CwIQGagdbXbQdRjqW0yyp1giTS2H0HrYa2GLD5MX
	w0wLtds8E2z/Dp/j6LJtklvhEFPyz14QqyLaOEhFyoJxVbxJvG20O3VDl+YhQi5K7WDxhx2HBwx
	nAqs6oeQPhs3jj5KLEMeec373dkeNx1p21WUmsbX7MjtW8hSbJDRyIhM3Qyezr0rE+nTqsJoU
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr54391435e9.25.1795171245423;
        Fri, 20 Nov 2026 02:40:45 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm22297535e9.2.2026.11.20.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:40:44 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 20 Nov 2026 11:40:33 +0100
Subject: [PATCH 7/7] drm/etnaviv: Add an ioctl to read back GPU clock
 changes
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
Message-Id: <20261120-etnaviv-gpu-freq-trace-v1-7-445fc6eacddf@igalia.com>
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
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

Userspace that converts GPU cycle counts to time needs the core clock
rate a job ran at. The trace event has this information, but only a
privileged tracer can read it.

Keep the last 256 clock changes per GPU in a ring buffer, 10 KiB per
GPU. A record is written together with the trace event. It has the
same times and flags, the rate after the change and a sequence number.
The ring only fills as fast as the thermal governor changes the
cooling state.

Add an ioctl that returns the records newer than a given sequence
number. It also returns the newest sequence number the kernel has, so
a reader knows when to call again. A reader that has fallen behind
sees a gap in the sequence numbers. The caller passes the size of its
record struct, so the record can grow later without a new ioctl. The
first clock setup after bind is recorded too, so a new process can
read the current rate.

Bump the minor version so userspace can check for the ioctl.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 ++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 83 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  9 ++++
 include/uapi/drm/etnaviv_drm.h        | 43 +++++++++++++++++-
 4 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ec1352c1b09f..317362137e4a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -473,6 +473,23 @@ static int etnaviv_ioctl_pm_query_sig(struct drm_device *dev, void *data,
 	return etnaviv_pm_query_sig(gpu, args);
 }
 
+static int etnaviv_ioctl_clock_history(struct drm_device *dev, void *data,
+	struct drm_file *file)
+{
+	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct drm_etnaviv_clock_history *args = data;
+	struct etnaviv_gpu *gpu;
+
+	if (args->pipe >= ETNA_MAX_PIPES)
+		return -EINVAL;
+
+	gpu = priv->gpu[args->pipe];
+	if (!gpu)
+		return -ENXIO;
+
+	return etnaviv_gpu_clock_history(gpu, args);
+}
+
 static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 #define ETNA_IOCTL(n, func, flags) \
 	DRM_IOCTL_DEF_DRV(ETNAVIV_##n, etnaviv_ioctl_##func, flags)
@@ -487,6 +504,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(GEM_WAIT,     gem_wait,     DRM_RENDER_ALLOW),
 	ETNA_IOCTL(PM_QUERY_DOM, pm_query_dom, DRM_RENDER_ALLOW),
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
+	ETNA_IOCTL(CLOCK_HISTORY, clock_history, DRM_RENDER_ALLOW),
 };
 
 static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
@@ -515,7 +533,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.name               = "etnaviv",
 	.desc               = "etnaviv DRM",
 	.major              = 1,
-	.minor              = 4,
+	.minor              = 5,
 };
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 03075f289c69..2af1af33287a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -506,6 +506,80 @@ static void etnaviv_gpu_load_clock(struct etnaviv_gpu *gpu, u32 clock)
 	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
 }
 
+static void etnaviv_gpu_record_clock(struct etnaviv_gpu *gpu, u32 flags,
+				     u64 begin_ns, u64 end_ns,
+				     unsigned long rate)
+{
+	spin_lock(&gpu->clock_lock);
+	gpu->clock_seq++;
+	gpu->clock_records[gpu->clock_seq % ETNA_NR_CLOCK_RECORDS] =
+		(struct drm_etnaviv_clock_record){
+			.begin_ns = begin_ns,
+			.end_ns = end_ns,
+			.rate = rate,
+			.seq = gpu->clock_seq,
+			.flags = flags,
+		};
+	spin_unlock(&gpu->clock_lock);
+}
+
+static u64 etnaviv_gpu_clock_oldest(u64 last)
+{
+	if (last > ETNA_NR_CLOCK_RECORDS)
+		return last - ETNA_NR_CLOCK_RECORDS + 1;
+
+	return 1;
+}
+
+int etnaviv_gpu_clock_history(struct etnaviv_gpu *gpu,
+			      struct drm_etnaviv_clock_history *args)
+{
+	u64 last, start;
+	u32 size, n = 0, i;
+
+	if (args->flags)
+		return -EINVAL;
+
+	/* records can grow, a reader gets the part of each one it knows */
+	if (args->record_size <
+	    offsetofend(struct drm_etnaviv_clock_record, pad))
+		return -EINVAL;
+	size = min_t(u32, args->record_size,
+		     sizeof(struct drm_etnaviv_clock_record));
+
+	spin_lock(&gpu->clock_lock);
+	last = gpu->clock_seq;
+	spin_unlock(&gpu->clock_lock);
+
+	if (args->since_seq < last) {
+		start = max(args->since_seq + 1, etnaviv_gpu_clock_oldest(last));
+		n = min_t(u64, last - start + 1, args->count);
+	}
+
+	for (i = 0; i < n; i++) {
+		void __user *dst = u64_to_user_ptr(args->records +
+						   (u64)i * args->record_size);
+		struct drm_etnaviv_clock_record record;
+
+		spin_lock(&gpu->clock_lock);
+		record = gpu->clock_records[(start + i) % ETNA_NR_CLOCK_RECORDS];
+		spin_unlock(&gpu->clock_lock);
+
+		/* overwritten since clock_seq was read */
+		if (record.seq != start + i)
+			break;
+
+		if (copy_to_user(dst, &record, size))
+			return -EFAULT;
+	}
+
+	args->count = i;
+	args->record_size = size;
+	args->last_seq = last;
+
+	return 0;
+}
+
 /* begin_ns is when the switch, or the restart that includes it, began */
 static void etnaviv_gpu_update_clock(struct etnaviv_gpu *gpu, u32 flags,
 				     u64 begin_ns)
@@ -538,6 +612,8 @@ static void etnaviv_gpu_update_clock(struct etnaviv_gpu *gpu, u32 flags,
 
 	/* a resume or reset that keeps the rate is not worth a report */
 	if (scaled || rate_before != gpu->core_rate) {
+		etnaviv_gpu_record_clock(gpu, flags, begin_ns, end_ns,
+					 gpu->core_rate);
 		trace_etnaviv_gpu_clock_change(gpu->dev, flags, begin_ns,
 					       end_ns, rate_before,
 					       gpu->core_rate);
@@ -2008,8 +2084,15 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 	gpu->dev = dev;
 	mutex_init(&gpu->lock);
+	spin_lock_init(&gpu->clock_lock);
 	mutex_init(&gpu->sched_lock);
 
+	gpu->clock_records = devm_kcalloc(dev, ETNA_NR_CLOCK_RECORDS,
+					  sizeof(*gpu->clock_records),
+					  GFP_KERNEL);
+	if (!gpu->clock_records)
+		return -ENOMEM;
+
 	/* Map registers: */
 	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpu->mmio))
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index c8d537c3dee7..ac619f3020bb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -96,6 +96,7 @@ struct clk;
 struct reset_control;
 
 #define ETNA_NR_EVENTS 30
+#define ETNA_NR_CLOCK_RECORDS 256
 
 enum etnaviv_gpu_state {
 	ETNA_GPU_STATE_UNKNOWN = 0,
@@ -168,6 +169,11 @@ struct etnaviv_gpu {
 	unsigned long base_rate_core;
 	unsigned long core_rate;
 	unsigned long base_rate_shader;
+
+	/* protects clock_seq and clock_records */
+	spinlock_t clock_lock;
+	u64 clock_seq;
+	struct drm_etnaviv_clock_record *clock_records;
 };
 
 static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
@@ -237,4 +243,7 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
 
 extern struct platform_driver etnaviv_gpu_driver;
 
+int etnaviv_gpu_clock_history(struct etnaviv_gpu *gpu,
+			      struct drm_etnaviv_clock_history *args);
+
 #endif /* __ETNAVIV_GPU_H__ */
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index 83c58d94d36b..2f039836e7a9 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -284,6 +284,45 @@ struct drm_etnaviv_pm_signal {
 #define ETNA_CLOCK_RESET               0x0002
 #define ETNA_CLOCK_BUSY                0x0004
 
+/*
+ * The kernel also records the clock changes. The switch happens between
+ * begin_ns and end_ns. For RESUME and RESET the window covers the whole
+ * restart, from before the first reset attempt or the clock enable. That
+ * is wider than needed, but no job runs in it.
+ *
+ * The first record is written when the GPU is initialized after it is
+ * bound. So a GPU has at least one record, unless its core clock rate is
+ * unknown.
+ *
+ * DRM_IOCTL_ETNAVIV_CLOCK_HISTORY returns the records after since_seq, oldest
+ * first. It can return fewer than requested even if more exist, call it again
+ * until the last returned seq reaches last_seq. A reader that fell behind
+ * sees a gap between since_seq and the first seq returned.
+ *
+ * record_size is the stride of the records array and at least the size of
+ * the record below. So that the record can grow, the kernel writes the
+ * smaller of record_size and its own record size to each element and returns
+ * that size in record_size.
+ */
+struct drm_etnaviv_clock_record {
+	__u64 begin_ns;    /* CLOCK_MONOTONIC right before the switch */
+	__u64 end_ns;      /* CLOCK_MONOTONIC right after the switch */
+	__u64 rate;        /* core clock rate after the switch, in Hz */
+	__u64 seq;         /* increments by one per record, starts at 1 */
+	__u32 flags;       /* ETNA_CLOCK_x */
+	__u32 pad;         /* out, zero */
+};
+
+struct drm_etnaviv_clock_history {
+	__u32 pipe;        /* in */
+	__u32 count;       /* in, capacity of records, out, records returned */
+	__u32 record_size; /* in, stride of records, out, bytes written each */
+	__u32 flags;       /* in, must be zero */
+	__u64 since_seq;   /* in, return records with seq > since_seq */
+	__u64 last_seq;    /* out, newest record */
+	__u64 records;     /* in, pointer to struct drm_etnaviv_clock_record */
+};
+
 #define DRM_ETNAVIV_GET_PARAM          0x00
 /* placeholder:
 #define DRM_ETNAVIV_SET_PARAM          0x01
@@ -298,7 +337,8 @@ struct drm_etnaviv_pm_signal {
 #define DRM_ETNAVIV_GEM_WAIT           0x09
 #define DRM_ETNAVIV_PM_QUERY_DOM       0x0a
 #define DRM_ETNAVIV_PM_QUERY_SIG       0x0b
-#define DRM_ETNAVIV_NUM_IOCTLS         0x0c
+#define DRM_ETNAVIV_CLOCK_HISTORY      0x0c
+#define DRM_ETNAVIV_NUM_IOCTLS         0x0d
 
 #define DRM_IOCTL_ETNAVIV_GET_PARAM    DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_GET_PARAM, struct drm_etnaviv_param)
 #define DRM_IOCTL_ETNAVIV_GEM_NEW      DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_GEM_NEW, struct drm_etnaviv_gem_new)
@@ -311,6 +351,7 @@ struct drm_etnaviv_pm_signal {
 #define DRM_IOCTL_ETNAVIV_GEM_WAIT     DRM_IOW(DRM_COMMAND_BASE + DRM_ETNAVIV_GEM_WAIT, struct drm_etnaviv_gem_wait)
 #define DRM_IOCTL_ETNAVIV_PM_QUERY_DOM DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_PM_QUERY_DOM, struct drm_etnaviv_pm_domain)
 #define DRM_IOCTL_ETNAVIV_PM_QUERY_SIG DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_PM_QUERY_SIG, struct drm_etnaviv_pm_signal)
+#define DRM_IOCTL_ETNAVIV_CLOCK_HISTORY DRM_IOWR(DRM_COMMAND_BASE + DRM_ETNAVIV_CLOCK_HISTORY, struct drm_etnaviv_clock_history)
 
 #if defined(__cplusplus)
 }

-- 
2.56.0

