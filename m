Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685869;
	b=zRrUDwiZIjO3I2kO/MuTmknZuEe7VSBuXT/wRCX+xYqQUuM9MsnPH+WVhNU94ivReegT
	 9FOAyncTLYjkNd0DrKcAB1iZFULIhlXVMLxrLVp36lnM54EwNauDYYLMPartmTbNPw8oi
	 E0nTZQJgGHZbsuDVIgyeADNPGg7fcaM+4CMi4fJ7zUGVGVqAk/B8kkCoiigMC8Bv5HiG7
	 EpDi1p+VmSbpxogeHlygsvGtmo552/f7lWUZhB430BdV/nAhu+tNHwukE3CvJPMOCYPRo
	 r4s9hmjameIDDFoLy20m9iy0mplo8iAFYW/GzPAwI1SXMI8wzdGnV5qBT/rZ10vFNrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685869;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GG/w7h2FW12TWaQgOdgTi4664j2z5J2KKWC6RdlXPaI=;
	b=DaW576IR1XDjAyG1GstxSrWwcB+96Sfp1GtlI5OzRABtKO9Z823pmxEznV/sib1idKRg
	 7UAXOC1mmuVAzVvD9oWdS/hMaB7fJkryIdcNpu+cMk7yWfP22r8FdbZw1A1XLvJyzr4U+
	 81XTbBfempxl1uxJh/ySfOT/NtbsfASlX/QDdNO6p0bry2cvpJvamJQTmaalp++25nfjD
	 /mc2xVy0RTxzIPxy7R6wvXdAcGOXB8u0Y2h5sUpyDRyPtFMTwPdAyY0i3M4ymzswm+t+X
	 2KASXwwFrl3IEXjnF+9YfBvwE4Z26bj1TQGiyMQ5+UK82Qs06YLyo4iZl4N+O8ueJHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdCfrgBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33A460A380B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HdCfrgBE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685869;
	b=s9fFUi6nBwAtBNYxZvmZVU7bZu18iR5tvd8vWXlocXVy7+PZMsAuiLh+NMw+Vqhp0VSz
	 DqtXKF+NkbJhM1sKhkmwROTs0Wyi8k/b1VohN3mPPWnufqNaKGKYu77zOYWzW9lbV9xq/
	 3V7OuvAqk5tXFR6AbqzqR2ODZuUQDaPdWt8QlEYEnV/k3DuHH+IsZjiTCAUaNE3Q/Mxla
	 jvnt4r0bzbwO2XeeQnM29dr7rUy4vblwvLTsaVM5EiduH15Mi5zf1Qc4FJ3Zq809xWekS
	 eqHMgrgoZSIEH4mFspaMeYBFEPQrqrIbquLw7mK/SBcltMt6sz6exoVX8k0nILlr15Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685869;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GG/w7h2FW12TWaQgOdgTi4664j2z5J2KKWC6RdlXPaI=;
	b=SBqnKvTnunn83x5juPbPlDX6KJNGawnVtNnW04ORNWWV6IQoQJhhUtKjZc7ZcS+f7dKi
	 GXF3DmPSPN9v6L3Zfq1pOAMO7SyOrYPcOcJ7S2Zv+Lf9NnumdS1Lf6NImeo6TobINQ/KJ
	 UU5av+9o4VWhFoZYjlNsGM/nfNMyhw7Wp6SBZ1T5oeCuaa9p3WgYvjEpmckCP1FI6heBc
	 2H4xOHLCKzGt1LyxLD69qC4xTwBJbZqOOKhN5LnQOV2pjb75tufU80c5YwMjinC5VXq3E
	 KIPy/dkaTYNQNi+F33OASOfxKKDEmu7A0iUM+OO3joYk6B+8cuJKjVc7ZIcZNNDw8XA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D476F1F000EC;
	Thu, 26 Nov 2026 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685869;
	bh=GG/w7h2FW12TWaQgOdgTi4664j2z5J2KKWC6RdlXPaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HdCfrgBEKkBx5Cnx/svo60Qp1ifr8DUn7b4Jvn5qm0ywYtJujcJwHYj7H3+qyRI/2
	 5kedihiHRlXPUc9bu5OlkXI9JKQCYDdJrJacHeSAOsPC85zHBBOg9fl7p8+fehijrg
	 t2Uwv/g5ToklC02vr0RnwzzI7aONAIEIp/XHm/G0kJYg1JjY1n+bc+Ds28pm+xjxn7
	 A5H0X8JopD/OxWu2EuD8UREDTJDM/Gt3etXTUiJNLHGRECPXabgpLgKpJ32SnEDlRX
	 QH/kAeXnOVTU2TnEDkyiYksmj6Oiy2yqg02wPHBlXLcPpEmwLbS2wK+u9Ejft69C2C
	 HQlKSR1PDIVwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 551444D390;
	Thu, 26 Nov 2026 09:36:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:52 +0000
Subject: [PATCH v4 09/17] drm/panfrost: Don't signal a job cancelled from
 _NEXT at a reset as done
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
Message-Id: <20261126-panfrost-long-jobs-v4-9-23579629ceca@gmail.com>
References: <20261126-panfrost-long-jobs-v4-0-23579629ceca@gmail.com>
In-Reply-To: <20261126-panfrost-long-jobs-v4-0-23579629ceca@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=2563;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+0lclni43/Dq9naPCbsA255rI8BnM42gaj99yqkxcKM=;
 b=mp8iYk+cJtwnQxaMxBqxP4D+0JO1vRtXy0kDV2IjZ64YBBmHnBWIKTvkIcTIgY8YzWY1XjWyZ
 Nw2kDrRgvISD74foRvPqBNV0qqBrYqmiOgHh6ogxgcduW362QVu9549
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset() cancels the job in _NEXT with JS_COMMAND_NOP and
soft-stops the running one. If the running job completes instead,
panfrost_jm_handle_irq() takes the cancelled job for done too: its
fence is signalled and it never runs.

As the Arm driver does, read JS_HEAD_NEXT after the NOP; if it still
holds the job, take it off the slot and restart it with the others.
Found by Sashiko. Not reproduced.

Fixes: 030761e097b4 ("drm/panfrost: Queue jobs on the hardware")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206581@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index b5b523cb2..c9bd3555f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -659,6 +659,7 @@ static void
 panfrost_reset(struct panfrost_device *pfdev,
 	       struct drm_sched_job *bad)
 {
+	struct panfrost_job *evicted[NUM_JOB_SLOTS] = {};
 	u32 js_state, js_state_mask = 0xffffffff;
 	unsigned int i, j;
 	bool cookie;
@@ -694,11 +695,22 @@ panfrost_reset(struct panfrost_device *pfdev,
 	job_write(pfdev, JOB_INT_MASK, 0);
 	synchronize_irq(pfdev->js->irq);
 
+	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		/* Cancel the next job and soft-stop the running job. */
 		job_write(pfdev, JS_COMMAND_NEXT(i), JS_COMMAND_NOP);
+
+		/* Never started: take it off, or the IRQ handler completes it. */
+		if (pfdev->jobs[i][1] &&
+		    (job_read(pfdev, JS_HEAD_NEXT_LO(i)) ||
+		     job_read(pfdev, JS_HEAD_NEXT_HI(i)))) {
+			evicted[i] = pfdev->jobs[i][1];
+			pfdev->jobs[i][1] = NULL;
+		}
+
 		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_SOFT_STOP);
 	}
+	spin_unlock(&pfdev->js->job_lock);
 
 	/* Wait at most 10ms for soft-stops to complete */
 	ret = readl_poll_timeout(pfdev->iomem + JOB_INT_JS_STATE, js_state,
@@ -720,6 +732,9 @@ panfrost_reset(struct panfrost_device *pfdev,
 	 */
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
+		if (evicted[i])
+			pfdev->jobs[i][pfdev->jobs[i][0] ? 1 : 0] = evicted[i];
+
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
 			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
 			    pfdev->jobs[i][j]->is_profiled)

-- 
2.55.0


