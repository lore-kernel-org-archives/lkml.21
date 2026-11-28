Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886822;
	b=iHWmPVojBrSwE4+hWxiR+6+0ddvJherTk2Z3o2KlNSkSRvfKrxmRHLsbbZnKZwiUpSZs
	 LIBGJC8hIQobGj1/RZvOx7DSv+BIYtKNhjfaXgFZWh3tL0NSVOPZ4USCY8qrQdexRjmN0
	 1JzC1RC3LV0aGA9T3y180mDnuJOFqGSN49dNvQW5y+0jy13EVE3QmtiB1M4/IAxAkv9Nr
	 uXbGTU+xU6leXojDPcbaeF2r2dMMPYy1R+CYnftFhmtE4aGVl2hwWK5nc4c21GpnprFCx
	 cb2JqnB1Ql3WbQS1lO2UJb96G3ZT4bZMqfadMuh3Cv1Tp21L/2xtr/i/ZLVbuMWEL/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886822;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b1Vnpjw6TkLbgzGL1wuTpBp+Omi7UldDv2w4ZaQiTe4=;
	b=xMYkM39SYdfWt+SASaTCppmuKhcow3Q64LTlTzVzLS8j0UiPpUel8uTNz5KQBZIoeBSt
	 sRLm+Ffi1FTii5tFsT0EbH0ZEoWzut+ID7W7o1ianMbhIfe0EgTGN1G67SwYlw2PvYOa4
	 4JEE6ENCy8OTyvwjdNKRqF4y/tRH2T7vzjoDB2QCKrqfijsQcm86GpI59hwisUnyyO7av
	 W6kvENI/p964DOu4hoFcdd0YmzNlAEX067LlVLh8J1oFpVmo9Sb7d7kjcP29b81hX7AKJ
	 MJVhvM8z5hwJAMA1PPdZHmpLEoDwK6MwBrdCMJsnbOqdQzKX/83CFxKpD3ikWe8z81Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUKUQiSq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D0606A6A8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUKUQiSq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886822;
	b=FWA1zqJIP7HwLAG5eG45FuxfCM8nod8rlOahyQubHxeW7xG8CQrbpTOThFoRPyHmq1VT
	 QUD7hgM4k1Rsi8mHlGnfnewTnrMS5k3zC9kxmF3zQRZmnh43moCxlZwqhueYrnuvV7MHp
	 iZwrHqvCSKP475bQ5U6T9kfZvDcZb7Cp2Kw3jVV8o7iE6vHE+mzu176A+41uQEcOUGG8x
	 M29XzUPQFJ8XgpCLaxhgH0eT23gmusoqb0Jph6cvgyxFKOMZmOFLY4BrRlC/ErXcLb6wx
	 cbTZ4737wLQ4mQxPLQIona2vBHJeNYoK2na5x3mzbgiWPTBq0H305VtOgQJLiWGDrDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886822;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b1Vnpjw6TkLbgzGL1wuTpBp+Omi7UldDv2w4ZaQiTe4=;
	b=0M813S4PEfSpKpSL7CavQ4e86YI/9XRom5UQL7w22A2W4NZjRjLPKbT1C4N/w1t9HRyc
	 OZ7XExL04qpiDk/cUIP5zrrlkhwCDCBA+DkLcBKDQyUcUlpIWhzH/wyaZ5+xvI123fcqt
	 2kGdJXDM0VwOsx7ZNWT+KI99pc4cXETfkCYZhRH71AziG7SYq1sqE2Efjo+kFzLhupSrJ
	 WgcPQKvvyhR/ELYI2htt4BW2OdLm8ECagRq1apkAO0TsYnABXtoLoHq9cKqll7xkKxYGj
	 e6JWAssbbWSsOjfG8EtKSICQ84VE0NSp7r7MyEMHX9jOL3pMBqMc2s3sT34bjgt5pdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 275071F00923;
	Sat, 28 Nov 2026 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886822;
	bh=b1Vnpjw6TkLbgzGL1wuTpBp+Omi7UldDv2w4ZaQiTe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bUKUQiSqqlG/ygR1nyRPLuysE4BZxCqDM0NxA95u7OzqlORskXRUu9aLBYHMnnJdA
	 Toqe3qg7tfqwz5vD7YLaN+nV68q4U9QxuACbGfRu4BWzWxoMFLeYE5Uc4Lw4x4/jxc
	 oDJuaP+8KOrnKWzbET4eI9pNQ0umyGmykFr9oTApri/+Dbr95HWmDpOVQNt1SwLri4
	 tytnUMLCtxpcRYwZOERipGYiEJFlrHCBzqO8eEwaHsScFRah9pBnkQwSC6e5OvDPbv
	 X8+pJuDxKsIq7AQfr5sH9lR4CckL8daVYwSm1XhmyvvepCs7ORPHxr1Y2XfELCDqn0
	 mysGpxEXV/weQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9B2B94E197;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:44 +0000
Subject: [PATCH v5 13/17] drm/panfrost: Wait for the soft-stopped slots
 with the live slot status
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
Message-Id: <20261128-panfrost-long-jobs-v5-13-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=3109;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=vru6jIS0f9TqDaLwqRrhySvhQChWFPA8qS25wfCvx6I=;
 b=PIirl5WdGoWNCq/kPJI8MQNkNZfYoCyrxzJIXvUPkuZ1wkxL8BQ+q9r2XjPcj4NbrDt0D7f/Y
 8lZ2Ly7lNCeCkiwSKEKr8VYkznwFicqHVHUkNK7gbYtndEwOPrASER/
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset() waits for the soft-stopped slots by polling
JOB_INT_JS_STATE, a snapshot taken at the last JOB_INT_CLEAR write. A
job started into an idle slot shows as idle, and the wait ends at once.
The GPU reset hides this. With the job resumed instead (patch 16), its
resubmission ran while the first run was still stopping (Mali-G31,
OpenCL CTS Integer Ops):

  Unable to handle kernel NULL pointer dereference at virtual address 00000000000000f8
  pc : panfrost_dequeue_job+0x2c/0xd8 [panfrost]

Wait until no JS_STATUS reads ACTIVE, and make panfrost_dequeue_job()
return NULL for an empty slot (a WARN, not an Oops).

Fixes: 030761e097b4 ("drm/panfrost: Queue jobs on the hardware")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 34 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0946da3af..722f87ebe 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -173,7 +173,8 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 {
 	struct panfrost_job *job = pfdev->jobs[slot][0];
 
-	WARN_ON(!job);
+	if (WARN_ON(!job))
+		return NULL;
 
 	if (job->is_profiled && job->engine_usage) {
 		job->engine_usage->elapsed_ns[slot] +=
@@ -645,25 +646,18 @@ static void panfrost_jm_handle_irqs(struct panfrost_device *pfdev)
 	}
 }
 
-static u32 panfrost_active_slots(struct panfrost_device *pfdev,
-				 u32 *js_state_mask, u32 js_state)
+/* JOB_INT_JS_STATE is a snapshot: it can show a busy slot as idle. */
+static bool panfrost_slots_idle(struct panfrost_device *pfdev)
 {
-	u32 rawstat;
-
-	if (!(js_state & *js_state_mask))
-		return 0;
-
-	rawstat = job_read(pfdev, JOB_INT_RAWSTAT);
-	if (rawstat) {
-		unsigned int i;
+	unsigned int i;
 
-		for (i = 0; i < NUM_JOB_SLOTS; i++) {
-			if (rawstat & MK_JS_MASK(i))
-				*js_state_mask &= ~MK_JS_MASK(i);
-		}
+	for (i = 0; i < NUM_JOB_SLOTS; i++) {
+		if (job_read(pfdev, JS_STATUS(i)) ==
+		    DRM_PANFROST_EXCEPTION_ACTIVE)
+			return false;
 	}
 
-	return js_state & *js_state_mask;
+	return true;
 }
 
 static void
@@ -671,9 +665,8 @@ panfrost_reset(struct panfrost_device *pfdev,
 	       struct drm_sched_job *bad)
 {
 	struct panfrost_job *evicted[NUM_JOB_SLOTS] = {};
-	u32 js_state, js_state_mask = 0xffffffff;
 	unsigned int i, j;
-	bool cookie;
+	bool cookie, idle;
 	int ret;
 
 	if (!atomic_read(&pfdev->reset.pending))
@@ -724,9 +717,8 @@ panfrost_reset(struct panfrost_device *pfdev,
 	spin_unlock(&pfdev->js->job_lock);
 
 	/* Wait at most 10ms for soft-stops to complete */
-	ret = readl_poll_timeout(pfdev->iomem + JOB_INT_JS_STATE, js_state,
-				 !panfrost_active_slots(pfdev, &js_state_mask, js_state),
-				 10, 10000);
+	ret = read_poll_timeout(panfrost_slots_idle, idle, idle, 10, 10000,
+				false, pfdev);
 
 	if (ret)
 		dev_err(pfdev->base.dev, "Soft-stop failed\n");

-- 
2.55.0


