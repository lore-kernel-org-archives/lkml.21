Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886829;
	b=cNAV2T21tQFO4N/+LQYZAXyb8GpK9aN6oGA/QFZfgdhSV7hW/OEplCBCACmIR+sqiX+4
	 gIw8Us99ZCJHe37McBKQFZvDgfbYZU/lnRc3oBPJAomCAoVM/FNxs+kklKMOQsGwXG6TO
	 xLAsxntfipNNHxWEcGOv/8z9nCmqRCHhXBgR9hOqcyTqmjsC004GRG3n6kZkn9DzxYPzt
	 i62u+3Rze8pTMU6QE11i+7cVMW/udTE8KvGePLHE3lBDJlaMklv+BkHYARMbf6ACDJlTi
	 ONZFQG6UgjWXqv6qJ6IU0B9YLk5hLWkbqSAprN3pwgBti9lN8r8HjHZEkKMEBwMKIcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886829;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hPSEypHSaJJjSBlCg1hAoo1b1WaPsw3VXs/KojvVbfc=;
	b=gQaDKX2exayzmCdutY02++2A8PbbbDGQj/P4NTAsk+dAJgGgpWbsIW3jvUiMWoAsluyT
	 0k+vgjCjjlzeCw0P8OU5YeHpfd9GaSKE0th1ztN7kuxT/ZH8Dr/etZrwwJTc7+8Wsdj1h
	 Xd8ohUkHmE/0ga8WQIQGqgDvKs3gYK1AfU3GpQsj6ZqYiLJki7/I1oR91EYCth+8cw5FM
	 lIX7urylqMao/SVBRHxBb2ol0zYw5marPosy9OV29kRhvwzB/cg0EvyGXd5I8CRWeSkPt
	 NafkdtTyCTgOeVR564qS2iJmzM5AjZ9eqzrr7lpjy9dY9USyB1sUPkiS3PsnZfKEuQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdxMBoYp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB26606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdxMBoYp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886828;
	b=mmJCLS93caMkS+ZO6fZUkqOJ1zF4ynaGLyzmkpkpB+OobjjrZzvHWoDCPG2mnug0jzdB
	 XJHlf/PQRpxdSVejMTVkc2sOyKOAkZnWKlCyEJKU0Xk3CwsEvA+AQNrtL6Zw27slTLlr0
	 HdNsmgMSRL1R+M35539QlQUdO6tW5KN0vupibv8NBWV7Pq9KxNbXYC52F+4/QeKVNt0Uq
	 TrJ8DANMOjo61/mkaKc9HZXkLCP6NRCjylpzhgpazMf8RVaqMfFKVrL5UuU9JTVIE9RF+
	 QdDd+jmmXm7YWIsdRj1JHdaReqMTXxjoHi4M4TIeOR0rEpCV1v0gCKqcxo74udWHoVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hPSEypHSaJJjSBlCg1hAoo1b1WaPsw3VXs/KojvVbfc=;
	b=rjTjYUrKbopuZNgpncuS45n1HBMekUhrHFgyhwiUnJcGt5ePuSPdKix57CTJ1vRvAp1c
	 zx6kiFYg84PhlpA/wcfmAC8jhUVBKoK73fM1bvE6AJJi8SHVMvbk9n/0ZpQNchiOtkZag
	 VEkethrb8XQRUpaSOzNsOrwU+yYx7p7ERx6XPIAu1/trnDd47RXqzbyLmWT76lj0M5wvS
	 n493L+z6uRt4v1gcMFYLmfydKQxbvPhuq5q2qs9JZsA1JmQw3umYvbwewEtkXCgGreujO
	 IwHvse7MR8mj3cqg5RxGOVLo9pgv6OIZTcEAHSkEgM3J73THpq4ElgUK17BsmdL1vDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 905061F00925;
	Sat, 28 Nov 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886828;
	bh=hPSEypHSaJJjSBlCg1hAoo1b1WaPsw3VXs/KojvVbfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BdxMBoYpgNZRKLvJLHaxqCfbcEKuGlU/PUbiZzEoj6kXD/+MSmLE8tjmIM9IhOJSH
	 5EEh2HElTytA2noRXELsuDqwWHJ4bX57f0b9h6vkwyHyqZ8SpWCgvIQp+dIjlJYO3B
	 3wRj0kPAVQYKyNxgS2oPH1itamfJgwbs1GD6+zzCFmIAMUbv70YZftCA/lgFpkFcry
	 RMS4mwocSUsnH/cE76dzgcf+j1rA2zVqBgjJKJ6rDQeWykAbFhu91BSKZqsc/ikmZg
	 0YnKLvQwQJ2qK1S4Uh1y0AgpxCcdi6yLGpoDx9uNbhI4aoeDe5LVwoDR+WrQd+3GAO
	 NenlUEloP0EZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 046C04E1A3;
	Sat, 28 Nov 2026 17:26:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:47 +0000
Subject: [PATCH v5 16/17] drm/panfrost: Soft-stop and resume a job that
 outlives the timeout
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
Message-Id: <20261128-panfrost-long-jobs-v5-16-e7d62045a676@gmail.com>
References: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
In-Reply-To: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=9818;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=rvQVFjy3I5tCov1GJcKW/gcPBzj8+JBgYuHjAmedTsg=;
 b=WO49hGB2Kiy4GbkVpW91aDqly59Dp5EcyKVu9XQ2nL0osUUn22u7Y4cdpabB+UaPp6JCQHjn2
 x+2EkVTRXuKDUE0d9XQ5+oIeGnk6gYH6yZsZLUElJq55WUmyaUkwsAz
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

At the 500 ms job timeout panfrost resets the GPU and the job is lost,
but OpenCL kernels and heavy fragment jobs can take seconds on a small
GPU. On a Mali-G31 this fails OpenCL CTS Integer Ops long math and
Thread Dimensions, KHR-GLES31 mixedSequence (a 0.7 s fragment job) and
dEQP-VK spirv_assembly vec4 fragment cases.

Do as the Arm driver does:
- A job still ACTIVE at the timeout is soft-stopped and resumed from
  JS_TAIL, without a reset or karma. Its slot gets
  JOB_SOFT_STOP_TIMEOUT_MS (5 s) to reach a task boundary.
- A job still active then is hard-stopped and gets karma and a
  devcoredump; the other stopped jobs are resumed.
- If the hard stop has no effect within JOB_HARD_STOP_TIMEOUT_MS
  (0.5 s), the GPU is reset and that job is failed, not restarted.
- A reset requested meanwhile (job fault, MMU) overrides the stop-only
  request, PANFROST_RESET_STOP_ONLY.
- A job that completes between the fence check and the JS_STATUS read
  is a spurious timeout.
- Without a reset, the AS references of jobs cancelled from _NEXT are
  released here.

With this, those cases pass; two vec4 fragment cases take 4-6 s.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: the runtime PM reference in panfrost_reset() moved to patch 14.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 152 +++++++++++++++++++++++++++-----
 1 file changed, 129 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index ebdf16968..934c5f39f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -27,6 +27,13 @@
 #define MAX_JM_CTX_PER_FILE 64
 #define JOB_TIMEOUT_MS 500
 
+/* Arm driver: DEFAULT_JS_HARD_STOP_TICKS_SS, DEFAULT_JS_RESET_TICKS_SS */
+#define JOB_SOFT_STOP_TIMEOUT_MS 5000
+#define JOB_HARD_STOP_TIMEOUT_MS 500
+
+/* reset.pending: stop the slots, no GPU reset; 1 overrides it */
+#define PANFROST_RESET_STOP_ONLY 2
+
 #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
 #define job_read(dev, reg) readl(dev->iomem + (reg))
 
@@ -662,13 +669,25 @@ static bool panfrost_slots_idle(struct panfrost_device *pfdev)
 	return true;
 }
 
+/* The second job if the first's DONE is still pending */
+static struct panfrost_job *
+panfrost_running_job(struct panfrost_device *pfdev, unsigned int slot)
+{
+	if (pfdev->jobs[slot][1] &&
+	    (job_read(pfdev, JOB_INT_RAWSTAT) & JOB_INT_MASK_DONE(slot)))
+		return pfdev->jobs[slot][1];
+
+	return pfdev->jobs[slot][0];
+}
+
 static void
 panfrost_reset(struct panfrost_device *pfdev,
-	       struct drm_sched_job *bad)
+	       struct drm_sched_job *bad, bool job_active)
 {
 	struct panfrost_job *evicted[NUM_JOB_SLOTS] = {};
+	struct panfrost_job *hung[NUM_JOB_SLOTS] = {};
+	bool cookie, idle, stop_failed = false, reset_gpu;
 	unsigned int i, j;
-	bool cookie, idle;
 	int ret;
 
 	if (!atomic_read(&pfdev->reset.pending))
@@ -692,7 +711,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 
 	cookie = dma_fence_begin_signalling();
 
-	if (bad)
+	if (bad && !job_active)
 		drm_sched_increase_karma(bad);
 
 	/* Mask job interrupts and synchronize to make sure we won't be
@@ -717,20 +736,65 @@ panfrost_reset(struct panfrost_device *pfdev,
 	}
 	spin_unlock(&pfdev->js->job_lock);
 
-	/* Wait at most 10ms for soft-stops to complete */
-	ret = read_poll_timeout(panfrost_slots_idle, idle, idle, 10, 10000,
+	/* No slot may be active when we touch the queues. */
+	ret = read_poll_timeout(panfrost_slots_idle, idle, idle,
+				job_active ? 200 : 10,
+				job_active ? JOB_SOFT_STOP_TIMEOUT_MS * 1000 : 10000,
 				false, pfdev);
 
+	if (ret && job_active) {
+		dev_err(pfdev->base.dev,
+			"Soft-stop failed after %u ms (js status 0x%x 0x%x 0x%x), hard-stopping the active slots\n",
+			JOB_SOFT_STOP_TIMEOUT_MS,
+			job_read(pfdev, JS_STATUS(0)), job_read(pfdev, JS_STATUS(1)),
+			job_read(pfdev, JS_STATUS(2)));
+
+		for (i = 0; i < NUM_JOB_SLOTS; i++) {
+			if (job_read(pfdev, JS_STATUS(i)) ==
+			    DRM_PANFROST_EXCEPTION_ACTIVE)
+				hung[i] = panfrost_running_job(pfdev, i);
+			if (hung[i])
+				drm_sched_increase_karma(&hung[i]->base);
+		}
+
+		/* The dump allocates memory: leave the signalling section. */
+		dma_fence_end_signalling(cookie);
+		for (i = 0; i < NUM_JOB_SLOTS; i++) {
+			if (hung[i])
+				panfrost_core_dump(hung[i]);
+		}
+		cookie = dma_fence_begin_signalling();
+
+		for (i = 0; i < NUM_JOB_SLOTS; i++) {
+			if (job_read(pfdev, JS_STATUS(i)) ==
+			    DRM_PANFROST_EXCEPTION_ACTIVE)
+				job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
+		}
+
+		ret = read_poll_timeout(panfrost_slots_idle, idle, idle, 200,
+					JOB_HARD_STOP_TIMEOUT_MS * 1000, false,
+					pfdev);
+		stop_failed = ret;
+	}
+
 	if (ret)
-		dev_err(pfdev->base.dev, "Soft-stop failed\n");
+		dev_err(pfdev->base.dev,
+			"%s failed (js status 0x%x 0x%x 0x%x), resetting the GPU\n",
+			job_active ? "Hard-stop" : "Soft-stop",
+			job_read(pfdev, JS_STATUS(0)), job_read(pfdev, JS_STATUS(1)),
+			job_read(pfdev, JS_STATUS(2)));
 
 	/* Handle the remaining interrupts before we reset. */
 	panfrost_jm_handle_irqs(pfdev);
 
+	reset_gpu = !job_active || stop_failed ||
+		    atomic_read(&pfdev->reset.pending) != PANFROST_RESET_STOP_ONLY;
+
 	/* Remaining interrupts have been handled, but we might still have
-	 * stuck jobs. Let's make sure the PM counters stay balanced by
+	 * stuck jobs, and jobs that were waiting in _NEXT when it was
+	 * cancelled. Let's make sure the PM counters stay balanced by
 	 * manually calling pm_runtime_put_noidle() and
-	 * panfrost_devfreq_record_idle() for each stuck job.
+	 * panfrost_devfreq_record_idle() for each of them.
 	 * Let's also make sure the cycle counting register's refcnt is
 	 * kept balanced to prevent it from running forever
 	 */
@@ -740,19 +804,36 @@ panfrost_reset(struct panfrost_device *pfdev,
 			pfdev->jobs[i][pfdev->jobs[i][0] ? 1 : 0] = evicted[i];
 
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
-			panfrost_job_put_cycle_counter(pfdev->jobs[i][j]);
+			struct panfrost_job *job = pfdev->jobs[i][j];
+
+			panfrost_job_put_cycle_counter(job);
 			pm_runtime_put_noidle(pfdev->base.dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
+
+			/* A GPU reset drops the AS references itself. */
+			if (!reset_gpu)
+				panfrost_mmu_as_put(pfdev, job->mmu);
+
+			/* Restarted, it would only time out again. */
+			if (stop_failed && job == hung[i])
+				dma_fence_set_error(&job->base.s_fence->finished,
+						    -ECANCELED);
 		}
 	}
 	memset(pfdev->jobs, 0, sizeof(pfdev->jobs));
 	spin_unlock(&pfdev->js->job_lock);
 
 	/* Proceed with reset now. */
-	panfrost_device_reset(pfdev, false);
+	if (reset_gpu) {
+		panfrost_device_reset(pfdev, false);
 
-	/* GPU has been reset, we can clear the reset pending bit. */
-	atomic_set(&pfdev->reset.pending, 0);
+		/* GPU has been reset, we can clear the reset pending bit. */
+		atomic_set(&pfdev->reset.pending, 0);
+	} else {
+		/* A reset requested since stays pending for its requester. */
+		atomic_cmpxchg(&pfdev->reset.pending,
+			       PANFROST_RESET_STOP_ONLY, 0);
+	}
 
 	/* Now resubmit jobs that were previously queued but didn't have a
 	 * chance to finish.
@@ -782,6 +863,8 @@ panfrost_job_handle_timeout(struct drm_sched_job *sched_job)
 	struct panfrost_job *job = to_panfrost_job(sched_job);
 	struct panfrost_device *pfdev = job->pfdev;
 	int js = panfrost_job_get_slot(job);
+	bool job_active;
+	u32 js_status;
 
 	/*
 	 * If the GPU managed to complete this jobs fence, the timeout has
@@ -806,18 +889,41 @@ panfrost_job_handle_timeout(struct drm_sched_job *sched_job)
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
-	dev_err(pfdev->base.dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
-		js,
-		job_read(pfdev, JS_CONFIG(js)),
-		job_read(pfdev, JS_STATUS(js)),
-		job_read(pfdev, JS_HEAD_LO(js)),
-		job_read(pfdev, JS_TAIL_LO(js)),
-		sched_job);
+	js_status = job_read(pfdev, JS_STATUS(js));
+	job_active = js_status == DRM_PANFROST_EXCEPTION_ACTIVE;
 
-	panfrost_core_dump(job);
+	/* The job may have completed since the fence check above. */
+	if (!job_active) {
+		if (job_read(pfdev, JOB_INT_RAWSTAT) & JOB_INT_MASK_DONE(js))
+			return DRM_GPU_SCHED_STAT_NO_HANG;
 
-	atomic_set(&pfdev->reset.pending, 1);
-	panfrost_reset(pfdev, sched_job);
+		synchronize_irq(pfdev->js->irq);
+		if (dma_fence_is_signaled(job->done_fence))
+			return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
+
+	if (job_active) {
+		dev_dbg(pfdev->base.dev, "job still active after %u ms, js=%d, head=0x%x, sched_job=%p: soft-stopping it to resume",
+			JOB_TIMEOUT_MS, js, job_read(pfdev, JS_HEAD_LO(js)),
+			sched_job);
+	} else {
+		dev_err(pfdev->base.dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
+			js,
+			job_read(pfdev, JS_CONFIG(js)),
+			js_status,
+			job_read(pfdev, JS_HEAD_LO(js)),
+			job_read(pfdev, JS_TAIL_LO(js)),
+			sched_job);
+
+		panfrost_core_dump(job);
+	}
+
+	if (job_active)
+		atomic_cmpxchg(&pfdev->reset.pending, 0,
+			       PANFROST_RESET_STOP_ONLY);
+	else
+		atomic_set(&pfdev->reset.pending, 1);
+	panfrost_reset(pfdev, sched_job, job_active);
 
 	return DRM_GPU_SCHED_STAT_RESET;
 }
@@ -844,7 +950,7 @@ static void panfrost_reset_work(struct work_struct *work)
 	if (pm_runtime_resume_and_get(pfdev->base.dev))
 		return;
 
-	panfrost_reset(pfdev, NULL);
+	panfrost_reset(pfdev, NULL, false);
 	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 

-- 
2.55.0


