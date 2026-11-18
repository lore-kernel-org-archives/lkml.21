Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967669;
	b=OE6mpp6XrRxlsJwGjH1/1Vg6uWbveJoqHBkYxBJzpUmNJfghvlXTllz0QeMMpDd28nw+
	 iAsf1CikWssEa9JZRo/bAYBUcknxmYIL16FCGeh3F7ZsdUGL6bshGpQBb5NSmppWk+wDy
	 YneVtls6xzuqiGuyT3w1iIoY0rIpp9cEbnYakZIX3MRI7NALcg1l0IQ+A7HL7YFtxS3hv
	 N6mWkp5sGSUze94Gx+JN79e0mOayzjhaX2iRhXHNQLKj+pVKhqUg4OIqD9dWMjb8nUlJ3
	 gJjFmbr8HixfBk8CMGLf5HxtxatO/UdQXX6f+wO3DI4PBoVuELsd7K8ewndmUaF0wCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=auMQLMVZW1hAksySChJapjBYGje9k4SG0oMAPhT3Wp0=;
	b=QmwKDSvAEzMoYVtDqPH4P5+JmKJLVnikedyUZq3CpgzNETmLLrUtpUCtXrsKutK4SpXm
	 ISTuUDD7TJhvgM9gqVJgSDHuf1mnz4i0H1sh2IKXnqtxczm7LDMjNXcHaARcNF61F2Qb7
	 +bQvp/TXgw7r+IfzkyFzcb0XjUbh+UXWr49CqP7kL5ZCB0R8e5BUT1gyUkE1gL+1uGcI5
	 n87pQp3Am/QFEjOA0uMz/BB5N4169Q9meJVxGFctXfB0rVdyGMLd/xnrn6EWk11YhWfHV
	 uzTZb83eFCVP1D8s7wI3Rzd+LpEa6tJNpMmX9/XaflJAUrrCAg/TZnCr+dj+uLKgHSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7pIqwp0;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD6606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAD6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7pIqwp0
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1af971cd9f9so12996c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967667; x=1795572467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auMQLMVZW1hAksySChJapjBYGje9k4SG0oMAPhT3Wp0=;
        b=W7pIqwp0hEGpKT3F8W2NYoYiWNtYFkiF0zMfymvfLPDgmcIAv2+Nf//9PJA8xe3UG6
         i5tPnxWsCvdN8etJyebK1J2BPrjUeradCGQETYP0eyuHG6lkgr1YwLRkcEzQHLErSdmP
         fPKV7QyGCeV7BP1FWyuXgbVzV9wYxSs43SbwO/+W+Zs1+ziZuEMNl45JCyI+h4/WZWG3
         4oojOKLiSm7+ze7R+jT+i2RpnMh8tBGAHU34FpACzVp8btWke9aUcvNA5rmgT3pJH+/r
         vfJvkfMXoQ2amTZ9rO9yKtvv1XS30Khu35tnQznlwUND3Jn++ecLVjKOr+nwK9X9GNKf
         w9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967667; x=1795572467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auMQLMVZW1hAksySChJapjBYGje9k4SG0oMAPhT3Wp0=;
        b=y+iEwuJKmNNsptDEUwYUnQrzh1SY+GR9Vrjjsmovw3YIOy39WGfMHwlql8XPvCex4f
         qhoKgYDhvl9MGdq7RSgMPG8r30J2OuwexF/hjmFKJoSETrL4LCSmXurDLBpjxeX2sjIc
         qnbFESzJP+Wv1ACrFJRyGAQIJ6u0+el2+M/9AIhDtax+ek5UPk7j/DevU6B36+P9lDLZ
         KEx1xhXEleMg1GX5mpMBDgm/G8NNEApSOb/qkBQ0Rd3EM6UEdVit2x1JU+M6mnWKiloZ
         Ji8nbFF3I5uhpM+mO2Mws+r9KLrUHfc16wJTUsuUv7WBiPBhxi3HcYarxubP7Inlt5K+
         01Zg==
X-Forwarded-Encrypted: i=1; AL+hErGwhkPP06lVrJN4UCk4jYdxkijxGqWm/BbC7UddJPcZwM5T+cUL9fLAQaYgffc4dGXlp2yLXMzJOwHtRKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MrPrrVYeBtqqy23VD/WKzfRXmmc82rv6Zr3R1w6/i0EWMWcFu
	r3r41OZfjq0attcAiYwp6DY2Kqnt9FVPwm5g49qct6HSjhnTJNSBtfRZ
X-Gm-Gg: AYBFou1BUh0bSGaGrNf28JDl5Fu8BTTk3C0BWGVy35puUxHwKIE6H7fssxpdlKu+D4E
	Hpgbpr21uwlFz9V6ulj1iYFdDBDV2sAJ/PO92XCHuFEJSVoLP9HeFMy9yCmqssXtt/HpE9fgjMl
	ra9LlzyVYP1E/gk0XF+3sSt4MTi/JW3QqzNP7+TH2L1qptbf2N5Y+vpEL5ZpzeIQMXjwpNluTvE
	DK3TzfvV4rtTWAK5QXdZ3fECk3jMK6d4wTXiZ4hYewaFPbe/vLWM+csYpLZplN20GPKvRqSfUmn
	Ic02JhhWxdUoHm9CrIGuWbbgYpfq/NhDMPMkAheyvSdDefOZqKuiU+5rQ9iw/7+o8dCgT536ciQ
	xu2FN6fGGRDqjGmSqGu2t2oUzMkB9p8wih+62Fs7Y/LvjKigWlnCoi1PyzOD4lgNmwhJANw09PL
	TVUwg26WvOtJX2e5soKSPm0M+SXK4ZxIMiQdaoC34gpT06fCR4uLKzVhNLdUVekNOuWLLY5Gu8l
	LVJTwm9ceC0tuxBQXscfygmugcGHPhlNbgKK2vgbDSxNWQcjyVaq3yMswFvwuWRCAmDncFjrOja
	C+5nwEWPttumPBMMQIEwz8VgRIc27NZTpozc/e9ZmLFYd8EXnhZ+uvbOrcDQM/7w8KiG3u5k4oN
	VOSSrjpA=
X-Received: by 2002:a05:701a:cc8f:20b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b54596847cmr618875c88.0.1794967667440;
        Tue, 17 Nov 2026 18:07:47 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:47 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 4/5] drm/msm: Destroy the VM_BIND entity when its queue is closed
Date: Wed, 18 Nov 2026 11:07:15 +0900
Message-ID: <20261118020716.1698-5-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118020716.1698-1-arpe1618@gmail.com>
References: <20261118020716.1698-1-arpe1618@gmail.com>
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

The entity of a VM_BIND submitqueue is attached to the per-VM scheduler,
and msm_gem_vm_close() calls drm_sched_fini() on that scheduler when the
file is closed, which frees its run queues. The submitqueue, and with it
the entity, is only destroyed on its final put, though, and every
VM_BIND job holds a reference to it.

msm_gem_vm_close() waits for the fences of VM_BIND jobs first, but when
a job is killed, e.g. on SIGKILL while the process exits, the scheduler
signals the fence of the job before it frees the job. The free can then
drop the last reference to the queue after drm_sched_fini() has run, and
the final put calls drm_sched_entity_destroy(), which reads the freed
run queue in drm_sched_entity_flush().

Destroy the VM_BIND entity when userspace closes the queue, on file
close or with DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, instead of on the final
put, and refuse new VM_BIND jobs on a closed queue. In the
DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE path, do it after dropping ctxlock, as
destroying the entity waits for the jobs queued on it.

As a result, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE on a VM_BIND queue now
waits (killably) for the jobs already queued on it, and a fatal signal
during that wait cancels the remaining ones, where they used to still
run. On file close, the jobs still queued when the wait gives up are now
always cancelled, as they already were when the exiting process had
been killed by SIGKILL, instead of being left on the entity. Cancelled
jobs apply their unmaps, release their pins and references, and mark
the VM unusable.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
The scoped_guard() in msm_submitqueue_remove() relies on commit
ea69d489d3a6 ("drm/msm: Rework queuelock"), so trees older than v7.3
need a manual backport.

If DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE should rather not block, the destroy
of closed VM_BIND queues could instead be deferred to file close, e.g.
with a per-context list of them. That would also keep the ioctl out of
a killable wait for the queued jobs, which the freezer cannot interrupt.

 drivers/gpu/drm/msm/msm_gem_vma.c     |  5 +++
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 +++++++++++++++++++--------
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index fd104e2cee35..c526409f451d 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1668,6 +1668,11 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_post_unlock;
 
+	if (queue->vm_bind_closed) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
 	if (args->flags & MSM_VM_BIND_FENCE_FD_IN) {
 		struct dma_fence *in_fence;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index bc5b31eb1eca..561f2d998e99 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -596,6 +596,12 @@ struct msm_gpu_submitqueue {
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
+	/**
+	 * @vm_bind_closed: the queue was closed by userspace, and its VM_BIND
+	 * entity is being or has been destroyed.  Protected by @lock.
+	 */
+	bool vm_bind_closed;
+
 	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
 	struct drm_sched_entity _vm_bind_entity[0];
 };
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8d550d281704..2dbe42551bd8 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -79,9 +79,6 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	if (queue->entity == &queue->_vm_bind_entity[0])
-		drm_sched_entity_destroy(queue->entity);
-
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -107,6 +104,25 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 	return NULL;
 }
 
+/*
+ * The VM_BIND scheduler is torn down by msm_gem_vm_close() when the file is
+ * closed, but a VM_BIND queue can outlive that, as long as a job still holds
+ * a reference to it.  So destroy the VM_BIND entity here, when userspace
+ * closes the queue, rather than on the final put.  Both ways a queue is taken
+ * off ctx->submitqueues come through here.
+ */
+static void msm_submitqueue_close_vm_bind(struct msm_gpu_submitqueue *queue)
+{
+	if (queue->entity != &queue->_vm_bind_entity[0])
+		return;
+
+	mutex_lock(&queue->lock);
+	queue->vm_bind_closed = true;
+	mutex_unlock(&queue->lock);
+
+	drm_sched_entity_destroy(queue->entity);
+}
+
 void msm_submitqueue_close(struct msm_context *ctx)
 {
 	struct msm_gpu_submitqueue *queue, *tmp;
@@ -119,8 +135,7 @@ void msm_submitqueue_close(struct msm_context *ctx)
 	 * be any more user ioctls coming our way
 	 */
 	list_for_each_entry_safe(queue, tmp, &ctx->submitqueues, node) {
-		if (queue->entity == &queue->_vm_bind_entity[0])
-			drm_sched_entity_flush(queue->entity, MAX_WAIT_SCHED_ENTITY_Q_EMPTY);
+		msm_submitqueue_close_vm_bind(queue);
 		list_del(&queue->node);
 		msm_submitqueue_put(queue);
 	}
@@ -326,7 +341,7 @@ int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 
 int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 {
-	struct msm_gpu_submitqueue *entry;
+	struct msm_gpu_submitqueue *entry, *queue = NULL;
 
 	if (!ctx)
 		return 0;
@@ -338,16 +353,23 @@ int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 	if (!id)
 		return -ENOENT;
 
-	guard(rwsem_write)(&ctx->ctxlock);
-
-	list_for_each_entry(entry, &ctx->submitqueues, node) {
-		if (entry->id == id) {
-			list_del(&entry->node);
-			msm_submitqueue_put(entry);
-			return 0;
+	scoped_guard(rwsem_write, &ctx->ctxlock) {
+		list_for_each_entry(entry, &ctx->submitqueues, node) {
+			if (entry->id == id) {
+				list_del(&entry->node);
+				queue = entry;
+				break;
+			}
 		}
 	}
 
-	return -ENOENT;
+	if (!queue)
+		return -ENOENT;
+
+	/* Not under ctxlock: destroying the entity can wait for its jobs */
+	msm_submitqueue_close_vm_bind(queue);
+	msm_submitqueue_put(queue);
+
+	return 0;
 }
 
-- 
2.43.0

