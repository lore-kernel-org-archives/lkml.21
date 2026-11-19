Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055773;
	b=it/ftyvvcXKRA4QKp+do9KCI2NVTNzcnt7rH4m4NsGQepXx/HbC1jvQ+CtxDHKdpupCf
	 ifUNjO8yT4NO88FnTj9m9Gi3hy+vgWCyMKbweQumCQVpXbxvfKPFJ9EWJnZyIiRNcdVIM
	 wZ4SWTtF70phWEeHjJiWDkZ/r1yGH3UuDQaT+bix5nXLXXIkBbAfzqmwbE+1Uk0ag2ScQ
	 r9OWAHKQoU5VH6m0vpMx5wVCEMrDWyKG740TyD+0AY0gy0JVM0e+3veVF1jO53yiMdau3
	 ALt0GTSwcSS2xlzr28Rd+MVpk974HvjndQS6NNoxx7oFTnt/3iT2lb27/zutXKwREFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r5vcTKCKH8w1c2blCWgaYBVv/4WCN3dPU6fSMD6S8fk=;
	b=jtNEwspLVnj5praBkpIQy08PhvC6HvOJwHa89TtY/1stmUOmA5X+nbYgLC+vhwwAAiLM
	 ImYB/K0n/5usuI8Gu7VFDxjFUcV322zYoYbbpvcOITP3ADgD7XIy+fRIoyjs2Rx+DZRSx
	 Eec6ElEB0u8XK/Rb27ti0MLP8ELV+kEabRc/xAuagdSgQ2DhRy2vwFPJgfGBCGWoTXu6f
	 /EdLIKwQqfGAsz9umHmkpAT9xZB6Ope/7eV6fvO75zKawa6WkSNk+VpApcJcTgulaUrWK
	 TVQgfyRiqGq9uoh+1M5j52+dztdfitpadr07V6FqYLZDJimX4jZu0DmVhiU+h5vsxsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rc53iUWc;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082F8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082F8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rc53iUWc
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so2954348c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055772; x=1795660572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5vcTKCKH8w1c2blCWgaYBVv/4WCN3dPU6fSMD6S8fk=;
        b=Rc53iUWcdTZp5i6m330thZB6WFIqkINPF62zRs1ZpBC5WRJUpsa0TIOPkumX0MGh3c
         g8Rb7fwDeozAOT4BP5IAA1m9KG5YwEdoxsddeu1CzXzDdWaJfPZWMunvxKjt2kESX/rV
         h50OZfVcHP3lX1+AIUaX3/9rJzxql7o8iDn+5D+5esu+A4gpLIOwlclebDUBlevGttdx
         FmLLxa85Rm9MAzUXG26uL+Z3RsrSjuxIZVhF4DJkXJ1OLygnjsBXCLZGyHv6KMlSZtXf
         5Di7elJ6kGJanYg4NmS9lNNuTjUQm+kHfy3X7iyEz56Z+2Kwh9mxFqavU2+Q2Asyhwea
         1JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055772; x=1795660572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5vcTKCKH8w1c2blCWgaYBVv/4WCN3dPU6fSMD6S8fk=;
        b=INCAMn5jmKpvXrvNHVjMLiLm8lnHZx64UDrexuu0SyGGvdRcfRXhMIPtjBY4BfGcu3
         dbYBU/8goXiqoseF1Hc4QiEeO9KRujXn8xW3GPJCi8bt4+tj7KGAT+fzkrm/gArPLxJd
         bFIp+bl5iyw+4sI355aUJO6WRkPytrl29x4D4s6fDhx+enAzcc+s5/mi1Qyq9E5hZxJT
         h41OmWVy0xny5n0eYCKTizqtx+g8MEq8qYsuW3w2HSHa71FHzlNrzxclA0q3y/h7/sZT
         R1Qe8hYAVnt6uc8coH2Ry2WjODhVgak5vkpkqfMQq/b7Sl9CDSORuvxn5jx3f9XMbVIE
         rUpA==
X-Forwarded-Encrypted: i=1; AL+hErFbJXqdL/OQqvUYn/5sRZa2lMPQX9W/l7pzQQd/7xj385i6KN7QyefxQp0VLn0Aii/Rmn1cVKxypPmBkt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CaugRf6VU/wIpLD8JyEgqiZH0fQOjTZ0vsk/aOIKqSnElDCIG
	HxDE0igxzs0gHb+3i7wjd+Re/2Yy9AcWDmZxtPp+iRMLpCKY3pbxGKxM
X-Gm-Gg: AZFdTZf/EkiYPZYhM/n7zttgfHK8gjMlHQTVLWCI7KnVufpAYl0cBbASc3MD4oV33tK
	u+iyUSafwvzNucXo0LM+J4CJ3xEuPwCIDeg6MjWCnkXLlEa1O2llk9CUP8wtC77BmmMP/UoiQjF
	3q/nSzGSSdmnAeRS+xo1+a/vQpqJ3BkpyaKi6JxUdTiipC3dhE1oA6zez3iVn2Uig/HizhyEo7r
	aPCO3kpolmPMBx5vca4XhRuCkLTnNJ06l3R1Kl26cxTv21D/333EO8rsQnejGHnI1NOQYm1t5xz
	IBumflRl49lH667Y/OCr2Xfu0jTl50y+1i4LiQosguWS6kXhdhCwpImB4hqkncDmzqOaBuAaaGp
	w0yb+b8gY1SQ7oOULx+uO0sltkA+ySaBMjgc+2QqeoMA39DbRLMDRevFIDaYwcVEKWlzH39vRai
	LjbR6BmN4K9M5ttADS9O/nVgr6IcFfoU95BiHoTsWuD7fE/RkEUJChDWe/YHKh3TlX1pz7T0m8G
	euJ1gpMyFCFCeM7xFOABH3o/qdL5HWZL31HsDWt7WWAhO1O/2gM951ANrBjXaySubEn/1zUXQgK
	uIGlPr5Qrfk+/uxFxJ3Sy44u76NtJf9+Mkcz7uSQB/s9T1IOH54Af5w/5A/R3tSRhFNFUt62ZAd
	pw5U5aZSfblcYxy1xN6SyM6t70BrBrIoaiG82H191
X-Received: by 2002:a05:7301:9e08:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-38281bfc037mr3868548eec.39.1795055771985;
        Wed, 18 Nov 2026 18:36:11 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm12160265eec.29.2026.11.18.18.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:36:11 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andyshrk@163.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/flip: drain the flip work on cleanup
Date: Thu, 19 Nov 2026 10:36:04 +0800
Message-Id: <20261119023604.1495603-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

drm_flip_work_cleanup() only warns when the queued or the committed list
is not empty.  Nothing cancels the worker and nothing runs the tasks
that are still queued, so the caller silently leaks whatever the tasks
hold (framebuffer references, vblank references, ...) and, if the
worker is still pending, it can run after the structure embedding the
flip work has been freed.

Cancel the worker and run the remaining tasks from
drm_flip_work_cleanup().  The work item is the only producer of the
committed list, so after cancel_work_sync() the two lists can be
spliced out and iterated without holding the lock.

The helper only drains the work items that exist when it is called, so
the callers have to make sure that no new item can be queued.  Both
in-tree callers already do:

 - Rockchip VOP: rockchip_drm_unbind() runs drm_atomic_helper_shutdown()
   before component_unbind_all(), and vop_unbind() calls
   pm_runtime_disable() before vop_destroy_crtc().  The CRTC is disabled
   and the device cannot be resumed when the cleanup runs, so neither
   vop_plane_atomic_update() nor vop_crtc_atomic_flush() can queue a new
   item, and vop_isr() returns early because
   pm_runtime_get_if_in_use() fails.

 - MSM mdp4/mdp5: msm_drm_uninit() destroys the KMS, which releases the
   interrupt, before drm_dev_put() runs the drmm actions.  The flip
   cleanup action is registered after drmm_crtc_alloc_with_planes(), so
   it runs before drmm_crtc_cleanup() and after the vblank interrupt
   that commits the work is gone.

Rockchip VOP called drm_flip_work_cleanup() after drm_crtc_cleanup(),
which memsets the CRTC.  Its worker calls drm_crtc_vblank_put() on that
CRTC, so the drain has to happen before the CRTC is cleaned up.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_DRM_ROCKCHIP=m, CONFIG_DRM_MSM=m.  The affected hardware was not
available, so the teardown path was not exercised and no fault or
race injection was run.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/drm_flip_work.c             | 23 +++++++++++++++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  9 +++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 52c437746d48..b8ce3966fa9a 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -149,10 +149,29 @@ EXPORT_SYMBOL(drm_flip_work_init);
  * drm_flip_work_cleanup - cleans up flip-work
  * @work: the flip-work to cleanup
  *
- * Destroy resources allocated for the flip-work
+ * Cancel the worker and run the tasks that are still queued, so that the
+ * resources they hold are released even if the work never made it to the
+ * workqueue.  Must be called before the object embedding @work is freed and
+ * after the driver has stopped the code that calls drm_flip_work_queue()
+ * and drm_flip_work_commit(): only the work items that exist when this
+ * function is called are drained.
  */
 void drm_flip_work_cleanup(struct drm_flip_work *work)
 {
-	WARN_ON(!list_empty(&work->queued) || !list_empty(&work->commited));
+	struct drm_flip_task *task, *tmp;
+	LIST_HEAD(tasks);
+	unsigned long flags;
+
+	cancel_work_sync(&work->worker);
+
+	spin_lock_irqsave(&work->lock, flags);
+	list_splice_tail_init(&work->queued, &tasks);
+	list_splice_tail_init(&work->commited, &tasks);
+	spin_unlock_irqrestore(&work->lock, flags);
+
+	list_for_each_entry_safe(task, tmp, &tasks, node) {
+		work->func(work, task->data);
+		kfree(task);
+	}
 }
 EXPORT_SYMBOL(drm_flip_work_cleanup);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 69e72727da24..38935ef08b70 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1990,12 +1990,19 @@ static void vop_destroy_crtc(struct vop *vop)
 				 head)
 		drm_plane_cleanup(plane);
 
+	/*
+	 * The flip work drops the vblank reference taken when the framebuffer
+	 * was queued, so it has to be drained while the CRTC is still valid.
+	 * The CRTC has been shut down and runtime PM disabled by the time this
+	 * runs, so no new work item can be queued anymore.
+	 */
+	drm_flip_work_cleanup(&vop->fb_unref_work);
+
 	/*
 	 * Destroy CRTC after vop_plane_destroy() since vop_disable_plane()
 	 * references the CRTC.
 	 */
 	drm_crtc_cleanup(crtc);
-	drm_flip_work_cleanup(&vop->fb_unref_work);
 }
 
 static int vop_initial(struct vop *vop)
-- 
2.34.1

