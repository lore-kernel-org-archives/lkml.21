Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074851;
	b=j9vM4yiJJF9LII83nH1JsnHbf4KQILA/8/K5o/DRoB11vuDR/HZ+Dn5/QhG9+3oo66B1
	 SVVVGnle747aohWrTAJhRzp6mjGGhCJYKCY2Ba4gWWu0qDBg8r6qGuxO0HOBBpKxbljbG
	 Ei9vUQP1mJC815VI+6LAYXoFXwvTQt2rIGGvrP0CSttljcvSZJHMf4ELdo1B2+jzpJ1xt
	 EtpuUgvMRy2K+Fikv9DDBdUGiq0xmZgsGDfwVWqDkbDBKI5x3A+7kS/ZQtkUewInp5bqe
	 5L2YJVAudyUIs9vqoVHar20Fs3arwYoba04eCGK3jQF9+3GAET+6iMKCruzYOjtL2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ru+zngfgoDECA/tIfj0+4KukrDwr8BnCsZQt6lEWRQc=;
	b=UN1TKQwTtVuT7IJQ2UvMlCP5OWk1uCvhfdlOJ9vXQEDEYYHjZDwq45QEi7xbd6B94uf5
	 +F9bx9KBur8nSfNwVA+nTp6p0VjSzwhMSbJTcIrTMrFFuFF2zBlTwLAg27kl9nijiGAt2
	 SfFg/2W4Vdj+n56h5bqLTC137qlba9P6MYmW8/DYs9+V2Z0hSWFd1e5EWFVUkvlX2PE7c
	 aVhWacPuQ7HnzKmYYVHYyeU1cN0cd+PFtMK/kQ9BD5vQV276+7WhBp9rDphQojA1eGQ3f
	 KmKzq3NLaqAJSHqDTc52snt6QYM43Cu/xAnDD25eHWhdvSw7nfhIISoH2Q8siXC8ZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pV0xSG+R;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF7606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EF7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pV0xSG+R
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so1490580b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074851; x=1795679651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ru+zngfgoDECA/tIfj0+4KukrDwr8BnCsZQt6lEWRQc=;
        b=pV0xSG+RLb4ZPBZqpnlvm/SbDVVcW7JlV8GeDxwpRcFsoEZrXd7qvsN6poUGrMZNxU
         uXBTV/0D+9JTe220kiI6d9IsbgY1/F8suayR+i4DpHtOaL00MssQqX6dnCPP+uSH2SXI
         SLlsYyoYYQnUAl9W9zl/EnOpg8Yw0pZInI69Cwu5RDh4BWDzLsnWwEeXB9/nXf97iukg
         intGLnEEFjxw1yj3kp8FZgmgtVccHxXK505rQ4EdQ1JXVgRhzmlhp+KoxUUigLcHWXQ3
         dEe6uuDUInZRnwmh384i3ebgV+PTr4geBGulamBVhLD1b5FpLcqvmbgwBkOc6xDnhcGV
         /h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074851; x=1795679651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ru+zngfgoDECA/tIfj0+4KukrDwr8BnCsZQt6lEWRQc=;
        b=uK1qrrceAanu5vuYOxNJKhaBp3halV4nk3WMu2qfIFVuL8k/bYLvCnXqwODG0ONgh3
         GRIX2vug4t+Z06G/LgXYOhME1edZj33gMhxerieQp1XoWiivyPUXo5ZKnXg8Y/XiQjuY
         FskoaOn8p6m61EJXTYGIMAG9nGIeeF7ozFAHbIF4XESeSGa2n5/tCSLZ/ajb18yi+Ek7
         2LzODuPtOzg0jF3RVCYL42ilDhb7h6zuJwjI8pgo8jzQ9lqSfXd+i+dPdfXxMoQyqJem
         TWpR/HNS7iyfAA1mXHinnCGrM4BBmF4DiYyE8QGpDlJpfC/faw4t06saRpidGZv9un6w
         LKRw==
X-Forwarded-Encrypted: i=1; AL+hErHUiWVv7+M+L+BfqsJBQhj3adwfgsZde+w4kYkgv61scLXqSMyL4WgF3ChpWjf9j9MyRXQWtXSihi6oqMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sCqTfRdSyEMJOwQCfRLb6f+jfiJYm3TZEXlNurjVKm7lSSf/7
	q8/waVniBjIF6kHDm3g4B6p/7ATum80qtdHHJaU8D/nBdtuZhooJxPnD
X-Gm-Gg: AYBFou1nAHyBnSpynql8vsXXghi96ENQdGnUc8J8/4neMeDFUt1JSnTcjg6CSRy2W8k
	k2gC/PBCdBS+RsTwyW7sBq/BcVNYLGBI2isR2JOmoKInP68+7AB/P8q3quIOUMpshGgQpVx1p5B
	PE20yFwg+u6RWhdH/pudjE00BDS5gqs0iJGOK7GX81bJWza2J1Rfu637qHYLPsydifVh68iOwe0
	QISw/AQSldqSslj0nrrHhIQWyJpDy96O0Jq3+Y3rYFI5GVYBy06i07W/jJyE09kgIGPb6OHqxRr
	wtzd6WOrNNWd3QW8yF5I7JxhevIxRHmtwZUQJTPCmtxKuSqnqw+oTwgaHIClSHLZkJFhueCNuOr
	2yOg5J0rEcA1hZes2yYRA0SZ4lPKps/hZB/0eqeyFfFXy0ApxBXitJgJUiB2IgzENFjCYj/E4OZ
	cqgNJpd+aTS65MQVVblUtzm7SO2ufIdVhA62ZF8VZn/wxZsvB9/Bre3ziGYsCysaIpC149hEcw1
	cTGYG3te78OitVgtZL+Xf1pE0NC9cQUSfRWIe6xZIJp0yjNI8GaukTmrzd40Deefv9fzgdZBjJd
	qxUDaUS2qD/OcIVUmwbSv1nKTFVGkvE3zdXk0U3UB1cGcwFs2F67ZzP/AJPr/GL8lttxO2/31L3
	TrtGDWx4gRtaRzg4QzVm1NIr9NeRdVu4EIhEAwdcsEdy90g==
X-Received: by 2002:a05:6a00:4390:b0:886:31d3:51a2 with SMTP id d2e1a72fcca58-8c5d47e2215mr5130363b3a.39.1795074850480;
        Wed, 18 Nov 2026 23:54:10 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa75esm2373707b3a.15.2026.11.18.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:54:10 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] drm/exynos: publish the IPP task completion after the last task access
Date: Thu, 19 Nov 2026 15:54:02 +0800
Message-Id: <20261119075402.3397371-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119023550.1495565-1-shunsheng1218@gmail.com>
References: <20261119023550.1495565-1-shunsheng1218@gmail.com>
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

exynos_drm_ipp_task_done() sets DRM_EXYNOS_IPP_TASK_DONE before it
writes task->ret and reads DRM_EXYNOS_IPP_TASK_ASYNC.  A commit ioctl
that waits for the task evaluates the DONE flag in
wait_event_interruptible() without taking ipp->lock, and
exynos_drm_ipp_task_cleanup() frees the task as soon as it observes it,
so the completion path can still be writing and reading a task that the
waiter has already released.

Settle task->ret and the asynchronous ownership first, and publish DONE
last with release semantics; read the flag with acquire semantics in the
waiter.  The flag is the publication point: a waiter that observes it on
another CPU also observes everything written before it.

The completion path does not touch the task after the flag is visible
any more, except for the hand-over to the cleanup work, which only runs
for tasks no synchronous caller can release: DRM_EXYNOS_IPP_TASK_ASYNC
was sampled before the publication and is set either for a non-blocking
commit, whose ioctl does not wait, or by exynos_drm_ipp_task_abort()
under ipp->lock.

The previous comment claimed that queueing the cleanup work before the
wakeup is what makes the wakeup safe.  That is not the ordering that
matters: wait_event_interruptible() evaluates its condition without this
wakeup as well, for instance when another task on the shared ipp->done_wq
wakes the waiter, so what orders the two sides is the publication of
DONE.

Fixes: 9913f74fe157 ("drm/exynos: ipp: Add IPP v2 framework")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes in v2:
  - Publish DRM_EXYNOS_IPP_TASK_DONE last, after task->ret is written and
    after DRM_EXYNOS_IPP_TASK_ASYNC has been sampled, and do it with
    smp_store_release(); the waiter reads the flag with smp_load_acquire().
    A synchronous waiter evaluates the condition without ipp->lock, so
    moving the wakeup alone does not order the two sides.  Reported by
    Sashiko.
  - Rewrite the comment and the commit message: what orders the waiters is
    the publication of DONE, not the wake_up() call.
  - Add the Fixes: tag for the IPP v2 framework.
  - Exercise the publication order and the signal-abort path with a
    controlled test; the outcome is in the note below.
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested: arm64 with aarch64-linux-gnu-gcc 11.4 and
CONFIG_DRM_EXYNOS=m with the IPP drivers.

The publication order and its interaction with the abort path were
exercised by a controlled test on a KASAN kernel built from this tree
(x86_64, QEMU/KVM; 12 checks, all passing).  The test transcribes
exynos_drm_ipp_task_done() before and after the change and the wait/abort
part of the commit ioctl, and runs them on the real workqueue, wait and
signal machinery:

 - pre-patch order: the woken waiter releases the task and the completion
   path then reads task->flags - a KASAN slab-use-after-free;
 - patched order, same window: the completion path does not touch the task
   after the wakeup, and the waiter reads the result it stored;
 - a wait interrupted by a signal (-ERESTARTSYS) enters the abort path, the
   task is handed to the cleanup work and released exactly once;
 - a signal that arrives after the completion does not turn the wait into
   an abort: the waiter takes the success path and releases the task
   inline, exactly once.

The test does not compile the driver itself, which would need the whole DRM
device, so no Exynos hardware and no DRM teardown path was exercised, and
the store-store half of the ordering can only be observed on a weakly
ordered architecture.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 30 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 43bc4f63bb84..20d3c10872d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -764,6 +764,7 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_task *task, int ret)
 {
 	struct exynos_drm_ipp *ipp = task->ipp;
 	unsigned long flags;
+	bool async;
 
 	DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %p done: %d\n",
 			     ipp->id, task, ret);
@@ -771,17 +772,36 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_task *task, int ret)
 	spin_lock_irqsave(&ipp->lock, flags);
 	if (ipp->task == task)
 		ipp->task = NULL;
-	task->flags |= DRM_EXYNOS_IPP_TASK_DONE;
+
+	/*
+	 * A synchronous waiter evaluates DRM_EXYNOS_IPP_TASK_DONE without
+	 * taking @ipp->lock and frees the task as soon as it observes the
+	 * flag, so @ret and the decision whether the cleanup work takes the
+	 * task over have to be settled before it becomes visible.
+	 */
 	task->ret = ret;
+	async = task->flags & DRM_EXYNOS_IPP_TASK_ASYNC;
+
+	/* Publish the completion last; the waiter pairs with an acquire. */
+	smp_store_release(&task->flags,
+			  task->flags | DRM_EXYNOS_IPP_TASK_DONE);
 	spin_unlock_irqrestore(&ipp->lock, flags);
 
 	exynos_drm_ipp_next_task(ipp);
-	wake_up(&ipp->done_wq);
 
-	if (task->flags & DRM_EXYNOS_IPP_TASK_ASYNC) {
+	/*
+	 * The task is not touched after the flag became visible, except for
+	 * this hand-over, which only runs for tasks no synchronous caller can
+	 * release: @async was sampled before the publication, and it is set
+	 * either for a non-blocking commit, whose ioctl does not wait, or by
+	 * exynos_drm_ipp_task_abort() under @ipp->lock.
+	 */
+	if (async) {
 		INIT_WORK(&task->cleanup_work, exynos_drm_ipp_cleanup_work);
 		schedule_work(&task->cleanup_work);
 	}
+
+	wake_up(&ipp->done_wq);
 }
 
 static void exynos_drm_ipp_next_task(struct exynos_drm_ipp *ipp)
@@ -929,7 +949,9 @@ int exynos_drm_ipp_commit_ioctl(struct drm_device *dev, void *data,
 				     ipp->id, task);
 		exynos_drm_ipp_schedule_task(ipp, task);
 		ret = wait_event_interruptible(ipp->done_wq,
-					task->flags & DRM_EXYNOS_IPP_TASK_DONE);
+					/* pairs with the release above */
+					smp_load_acquire(&task->flags) &
+					DRM_EXYNOS_IPP_TASK_DONE);
 		if (ret)
 			exynos_drm_ipp_task_abort(ipp, task);
 		else
-- 
2.34.1

