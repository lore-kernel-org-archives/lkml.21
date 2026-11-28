Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886821;
	b=S9iWsGVnfcjusJ0chDeCut/s8Q+5vGXeFVdrkvtuyrGy48MWiV8Bp3e6Uyfr6u3mYyfL
	 o3Rt+CF5TYZWYx0WLiF7J3OKB6x1NDl5nCR2TqE7TdhVa37+/xRVRwj4fnb7zDPO+u80Q
	 f1cfAkMmwojAf63Jfe/qHwX28I/gVYA9YMMr7IrN4gWJbv8epHapErQwKtwD6tBt8JVxV
	 mYkbRzlkV9rrrKXX1nBRX2v6xnYY4Ke2hPv+7i/YSr5qZVvhHwf3gkL2hf2M0LDCObdSE
	 8F2QTxMyMXsW058PZz1Ze1udZO2v4DP1b+SPNnyj8/uX++iszRdsA9B4Nq6BGFFuijA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886821;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gr5aK9yqnSUCDhMZqRxgxPaRQLfJPIgbPMqGNTgPuOc=;
	b=v1/cPzqmoXFt6oi+37BH7Jgx70q0+eTWRRz7PBqDqZ675v2l/VBbk5lbqEcD/XrSWGBr
	 DU/5tOgZaBaWQ9HhbJSA8hEPRvV3rFLwBuhOiQsVC3ESMpZEmc6dgPgsl1NsNYQ2y5g8T
	 j3SjFmxKjgKOd8S/hQPdio6JiJ+g9yjQ9N6/op9vczD+YXRrtdQqy/llVnH7TISvzxllY
	 pBQU2CF5jN26E4De6dS4bcV9wWWD3WcpNcPCFxXEqBSas1rkq+fFDgEJWjyWbhbTO6xVX
	 DFw0VcQx8qnMuP24f+o8O5bnoLwFgBOatuLxBzjp5fNzUD1zoIurn6d0nro41yVPoaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JuW5UZt1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17F606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JuW5UZt1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886821;
	b=Vilouz/+HeeUjbbhHvag+ZfWIkPF0R+AGZJxOR1YE8wQDENh9QQxd0bB99DIW1zuXYVZ
	 q4cqwIHxf/+tWO9Z9e9QFZYkL4XBDRnVqCfFervijWbRyXq1tCuaBrHDC98e8Cgi6tdvA
	 XPN30Ao2GwrIko6/osJ8wULLujsTuNwRNgBkn8i3X518hmLx6TA4bxZe470qbm4Gxz/MW
	 GDExUI/ikpex22q1bCyAKmvGkAxNrMrZF1a1UCEv87JCXrE+rWjT9hrOKeL3V4NaoxN2a
	 mIt9dYUQlKCoqMtiaZ8kcUO/lwHarPwSglcGgqFa3jOUjnGvVTyja5qnC/24KAVWZYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886821;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gr5aK9yqnSUCDhMZqRxgxPaRQLfJPIgbPMqGNTgPuOc=;
	b=3LrfT+or9s4UH3D71oRsLIrJk75jX0UpP2HTCh1b/YFhILEwkdY3x1yVspLn6P3TlCup
	 22eHhwvJBwXFetWs4G3lQQtu6Q4PhCu4egiSG7Hqu7JnZkimFbvZfQE8IJQPd76OylEtB
	 Kaa9bG4ivOjS9SHl/p6klXhmYptqihfvGzfYWoFX3/eyWoRc1XVrpDIz2rqhSnIQbug1w
	 h2NVTtTUWGW/7uYDm43YgKemLVd2XpLljQuMaELMr1GcYsjBlhqHZqj0cq1QNdaYPigMJ
	 RY9wh4Zk9ecAFzgBD43ymRfgNXVT8dmRrnIqMy9HPjFRKaek4sHzUO3Lh+ktwAI0Pkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C0B91F0092C;
	Sat, 28 Nov 2026 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886821;
	bh=Gr5aK9yqnSUCDhMZqRxgxPaRQLfJPIgbPMqGNTgPuOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JuW5UZt1QdrbVgMfnvVrQTV+fS0mOpUgWuJOkqRhwC2Yy/9lpQw94jDkx9h2P9Sac
	 TzJ+tEyXKT7HTVRkan/wp1tMgTjNLJU/9pumz31go8kthY1L5hpONt24aaF/A9711B
	 xn5AK+zxzTYGMqDydSU4FbfmhnZ8lLdaqQj1Mn5fnu3WQm/Ih+PXnJJMLLzRJzWzKW
	 YSkS2I2ZdxYX1PaPK9Ew26G1OLtH67ionQlhN4zNJncUL4KNQ9Ke5yqt/DyQp9+e2c
	 ShlpQ7S4ATaiureghjRftdeEp0w0fKWROKi+OoXgpnLUAdxFCEu4PutG/AmQEOesLw
	 Cg2JI4haGDQoA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAD6F4E19B;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:45 +0000
Subject: [PATCH v5 14/17] drm/panfrost: Keep the GPU powered in the job
 timeout handler
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
Message-Id: <20261128-panfrost-long-jobs-v5-14-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=2141;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=N3/r0MPqmTfHMSYcrVUI3Gc8NQD6K3bi1B+vyvlqWHM=;
 b=E9L2jv8dmFWarrMM2+mkCM+XoPbh7LM40y8WygCML7q7nkzNpmVcLuRTn78Lt9rs/o9KNzaGp
 epMb/lZKiFlD/baRFfTJdX/Gv11G1s4OHRv8st+FDfAATe2DhcA8lfw
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_job_timedout() accesses the GPU without a runtime PM reference
of its own. If the job completes after the fence check, the GPU can
autosuspend first (clocks off on GPU_PM_RT). Take a reference with
pm_runtime_get_noresume(): if the fence is still unsignalled after
that, the job's own reference was held.

Tested on an H616 with a test-only wait after the fence check: before,
the GPU suspended 50 ms after the fence; after, it stayed active.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-212575@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: new.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 722f87ebe..74cc3dd02 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -775,8 +775,8 @@ panfrost_reset(struct panfrost_device *pfdev,
 	dma_fence_end_signalling(cookie);
 }
 
-static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
-						     *sched_job)
+static enum drm_gpu_sched_stat
+panfrost_job_handle_timeout(struct drm_sched_job *sched_job)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
 	struct panfrost_device *pfdev = job->pfdev;
@@ -821,6 +821,19 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
+static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
+						     *sched_job)
+{
+	struct panfrost_device *pfdev = to_panfrost_job(sched_job)->pfdev;
+	enum drm_gpu_sched_stat stat;
+
+	pm_runtime_get_noresume(pfdev->base.dev);
+	stat = panfrost_job_handle_timeout(sched_job);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
+
+	return stat;
+}
+
 static void panfrost_reset_work(struct work_struct *work)
 {
 	struct panfrost_device *pfdev;

-- 
2.55.0


