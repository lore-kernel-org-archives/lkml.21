Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886816;
	b=CImWkCUuRYuevnNv5+aJgLxf2ayeMkh2J44zPIiMt0rZeJ/G4mXlyyyQO2AD7+yai9ub
	 F+4CtwzvVKXqhFIi0DxGEDLA9YWL3xVIE8FEmlap6SiqRAmPHWAY1dmceq28puSG7FQEs
	 r3NpAswLP9S4xBH/GLmEe+oFXCkh4LYQisopbBq4iajfhLO+PKSXg2qn+mQqH8DOT56vg
	 phkARiEnOgkN/LTYDyfBNFgiRsC3hQnjRtzY1hkWoTprMzjg74mwpyAaq6s9KGA+MhkVB
	 avQ0kubjoo5CuhRrYvXSml/xDAJCsDeomOcAAOX3ketdVYqRX+SefKu9XF+HRnNOusg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886816;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rA/YujkDkr5JpC5Y6LmlZVMzul8FIE7rq/8T+Qv5b8E=;
	b=K67aukiWyOA8TQmQH9gybaLBAEvxnF4WKhYZqf4EqmqFBSSb6LrnglmUzyx8DxtBR60m
	 Su67MC8Cmg+DKBgw1Qrov53mEdZUTh3m169Dr5MsoghPHzC4aTmuLCnu4DcIz94mPppuW
	 VGzGLkBBBYuRh77IhXqXuJZkO7A16FqJdgHaUorGtAm+X96LkORJccphmbaNBcdVf72MF
	 SdGKXoXY693R5svKYu993gpaZ4KJjF58oobWGtBoAk54woKtUY4YIBTjrdAQ8PtHusuW7
	 jvALlEfmEckMzeLF3tA87UYQAgJTe1D2YLBIIoMIPFOTXcGeNyNZjkbUNsfP/KyeFCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJmJZB0N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DA606A69D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJmJZB0N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886816;
	b=M65ZGjb8ENCQgsR7+g7vAFH9LWbVi+2lb5HLFSDGnx7Fp5fFBhJczJnvsAAitCc16bcf
	 B7HFea25tr5XVHbSMJIpb791FHomK03+VK2lxE3V1iN7bkhBqQgIu/C/coolUqQUG974D
	 IZGQA6xRC4g6YVQnj3Q3x+DCy/svoV7TYWVINq4ek8NaVI2V4BgCUqbmX1K1T5i0uUXx3
	 8WVc/gH2jyWiEoMkDTuZGxkREh2BbWO48+heoaHuJpET0qkTYlHWDKC3DBEA4NmeT5D2i
	 HWYrUTjjJM4HXMvPISePYWuto2ZRdp/c1Jr2gKsTSRuggVia6k8GriQ0uL85eo6E+xA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886816;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rA/YujkDkr5JpC5Y6LmlZVMzul8FIE7rq/8T+Qv5b8E=;
	b=AEWZM6b45PAogUQ2kqDt6oEuBhRO9eDcwod8Gle72iBjh9inDxhk15poyouQuerOPAWE
	 Jh/ZncJva2AGMFBFgINgJDKLQHWzr49m/9LjUcjYPCeS2vVahbU9D2MfRiuTB+w4fAQA+
	 Ywi7T7H7a0DaobSOGbPrpimOhlJoxGNSZhTOz2UDPxd18CmDpmEVKfFN0U5aVElFOhBSa
	 hrfRaK+Bw6et5Ezg55JtLrx7ZxLcli/fylufM8I0fzirhY6GumEELW4lSNVoKBwIp08Oq
	 E0jnNc2he/GV34joGzKIusUjS7jwRiMGdnNIfGFYsMQwToRurkorgW98chOa/LKN3zQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A3191F0089C;
	Sat, 28 Nov 2026 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886816;
	bh=rA/YujkDkr5JpC5Y6LmlZVMzul8FIE7rq/8T+Qv5b8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BJmJZB0NAJ0mWwWKaJfElgmJfnZxwG7cX5lV4jbHA0I4eL4cAmWzMnhnHlcFs0/tx
	 abnXnB3libhowhzPT7l7hwf6iKSCpsB7PHgiqTbcLYImMTiXMexWwQ/u5Agz6Ut1ie
	 mYLpYSZolvIUkCCGCOdCqRjGDRYulToThQZPGBKkd+RoWw/S9MoTEnLmDYWVH4M04z
	 y0Hk5Rc567FgOHC4Ucp+to0ktF7zFtKVIlueipRIXz3FcfP95ndLHgraTjPEJx+jnf
	 TLAXkgzVb0agWgrV4lRKEAOGti+hd+NJwQ1JdldvFdODkVl4OnqM2rM60DIsgCDs8K
	 4gTc2xIYrtLJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5C6D74E18F;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:42 +0000
Subject: [PATCH v5 11/17] drm/panfrost: Drop the cycle counter only for a
 job that holds it
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
Message-Id: <20261128-panfrost-long-jobs-v5-11-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=3305;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=vMKaKZ5mQLiJl35MCdiCDsift3wdtfGyvhrgb9GdKPA=;
 b=wGClFl69gTnnqx7hqrHLFvlp6BlLGGumTSWO3Jq0DcLBQ2UOxkwpToqu8uAaV7iMUZ9yzapg9
 uwH9FV7F3rhDHYtDgiXQpdA2JsZ2fYL+/R0RwvIA+2qTie6wyQa6Qxg
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

While a reset is pending, panfrost_job_hw_submit() queues a job without
starting it or taking a cycle counter reference, and a stopped job is
resubmitted with is_profiled still set. panfrost_reset() drops a
reference for each, so use_count goes negative. The reset hides this
today; without one (patch 16) the counter is no longer started.

Record whether a job holds a reference. Found by Sashiko. Not
reproduced.

Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210891@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 19 +++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_job.h |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a64c33047..fcddc13bf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -160,6 +160,14 @@ panfrost_get_job_chain_flag(const struct panfrost_job *job)
 	return (f->seqno & 1) ? JS_CONFIG_JOB_CHAIN_FLAG : 0;
 }
 
+static void panfrost_job_put_cycle_counter(struct panfrost_job *job)
+{
+	if (job->cycle_counter_ref) {
+		panfrost_cycle_counter_put(job->pfdev);
+		job->cycle_counter_ref = false;
+	}
+}
+
 static struct panfrost_job *
 panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 {
@@ -174,8 +182,7 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 			panfrost_cycle_counter_read(pfdev) - job->start_cycles;
 	}
 
-	if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT || job->is_profiled)
-		panfrost_cycle_counter_put(pfdev);
+	panfrost_job_put_cycle_counter(job);
 
 	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
 	pfdev->jobs[slot][1] = NULL;
@@ -259,8 +266,10 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		job->is_profiled = pfdev->profile_mode;
 
 		if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
-		    job->is_profiled)
+		    job->is_profiled) {
 			panfrost_cycle_counter_get(pfdev);
+			job->cycle_counter_ref = true;
+		}
 
 		if (job->is_profiled) {
 			job->start_time = ktime_get();
@@ -734,9 +743,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 			pfdev->jobs[i][pfdev->jobs[i][0] ? 1 : 0] = evicted[i];
 
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
-			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
-			    pfdev->jobs[i][j]->is_profiled)
-				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
+			panfrost_job_put_cycle_counter(pfdev->jobs[i][j]);
 			pm_runtime_put_noidle(pfdev->base.dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 		}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 3e3b97178..7f71e4c38 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -36,6 +36,7 @@ struct panfrost_job {
 
 	struct panfrost_engine_usage *engine_usage;
 	bool is_profiled;
+	bool cycle_counter_ref;
 	ktime_t start_time;
 	u64 start_cycles;
 };

-- 
2.55.0


