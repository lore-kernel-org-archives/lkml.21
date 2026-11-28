Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886814;
	b=N3pLHFUj0HPMOKX1U8cdh9I+HS/WYXhnxgiWIsNoJ2uxU/5c3jPncK0E3w+PDL4qcA0t
	 xm+yizaH5woXedC9p5CKjP31zMz4zDWSojgWwD+CXM09WXLQ2xJgxKpwUL/yoEwQ0diA5
	 sdWzxje9I4H6A4VZX7cIo0WEXzRiDdd7nUi+NDFSSVVzTDdcXDTXQNT2mg8oe3or4wUnQ
	 jF66Y9jlfZsgUOl//qVEl1S9zO2W0GVAhtAfJMvYHTKLOiY6M6mIupOKfLDhWCnWBYMdb
	 7647vLO9uKAI/U2F5zVEieTzKRZtN+8EP79/+aIpRUfBbPWRappmOoy5Wde+uVU4ovA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=a8P8VypdTASzl6lH/vOFbcp09GFgTV1ODriwboyagiE=;
	b=U7q3uPPX5DpXq5jusnEA45FQPP6kpKoRwiFpBXV/Vm8Srisr1PyIHAWgf3/LE0fccXy0
	 klfWuGuuOlS9F7MjSkslV64H1JxNQLf6ADGNMgAXkadjXKBM/hUzArMAzPEuV6/c5PNzu
	 Qt3AjlJn/HVtHeY0XvXea8pQ5SzfWbNrdVkdSR1P1fGbrTtfTeYZWxq9rru9ZgVgjnLys
	 FpQEWb3vxh3+jpJvTEBOY/ttkr60S6OIu2NaehcfvqqM8gzOHrYHCWxEC0ue/ybs0u+67
	 VS5pdGM43o1whMMZYQtolgz4x1bm77e1KrE7Uym9cKNf3ns273kOKYUUHmcDUCt+kIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wvoa/2Zc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E914606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wvoa/2Zc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886814;
	b=AI7l2H+UFAXxNtGCrJbiz/69DtkwpvFZ6CmlPUuLyiNcSAz52fSJac7TaNr/Yk9SBTFs
	 6LH5GyUOq3d3BmNSt8BN3+hCM98JZy6DvkBYTeArSHbIcAK+NBkXS9KSNZZIf8gBILZK4
	 XyYKxy2/EcK9vz/8sgf6QVdynihC58ea0NFhSZpz5k7f1iwNeiKzo7/fqTg0nIOTo3Qox
	 qJ7U4RA2ON9wmuGiT8oX5/W7BHfslRCSCZXXkzLCBZPnvox97A+BAaeB0YIt2IqC6gRTf
	 d2+hXRiCCZ1OFxxN6TEI+76Ayn6uHVv2d7m6Uy3Wt5XubZlleX1a/8DPWenpeK8RxwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=a8P8VypdTASzl6lH/vOFbcp09GFgTV1ODriwboyagiE=;
	b=YN/QbNBNykF8aKYiOiwJ5xvt/buXn69m0Tv9XShFoX/UnrzVaUKxX8Kg9qB2+HD3H1XI
	 oFIALxgnHQ13l8YW6N9Dd4ssa0kLZBcKF/mHeT4cILSwVN4LNMINnwILNrk6je/Qhxg7B
	 5Pb+yFOiF0zM8M9pp+YNqcNzN1TjuaR+R6yx6zZRyUFIIXkc+lTGLg63J4ijjAEfTMlcR
	 yzHgoNm21w7ZHNno5TWetkNYSFmMdJ+pgNt8tfVM26EV4NzjI4fyyIGVizoEsGkrykG6W
	 QgXtriYtuItch7Pj0ZuuUsQSm1Zd0vtrPKa/SGRjYm0Cog8ZcUUKamGVa2zH+/pC3Fg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D4ED1F00A15;
	Sat, 28 Nov 2026 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886814;
	bh=a8P8VypdTASzl6lH/vOFbcp09GFgTV1ODriwboyagiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wvoa/2ZcCc3Uk3an0JYMvx3yfNWEJNNB0DxZkJx1+RQJo8qPvbmw9ca0pDmZB5e9U
	 sSa6DzWxVqM2gjdD+2ep8za0OyPDtdmafJUb2aqVz+RJFvKlqEiGMXUDx31z6JpwXd
	 DenpjojGDPswBmzNejH5Kje21xmFKVaHQS9psIwIlz3K6B0wtjWk9xSDGZk3Pfip0F
	 66lidGIGtNuw31slpZXJyj5GEjEV1px/zuLGGq+b6zwNp/fOs78v9KH5TFP4W0yiXB
	 l/MwFUmK1Ijs3XG21+t5gGhjYMiFP+quETLXq0DgLFGSVaz3afc2DFRxXTfUDkvTvd
	 vHSZieEw8iF4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3DD7B4E18B;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:41 +0000
Subject: [PATCH v5 10/17] drm/panfrost: Don't cancel a job that completed
 during a reset
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
Message-Id: <20261128-panfrost-long-jobs-v5-10-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=1339;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3lUBnktZkSvOacj1VqiKAjZOrqk7CYYBcx6fKO/61xk=;
 b=ZV1U1A/Ko7Q9Ki5j0p0ijKB4bJlUvHH+CnN/C7YOEeSU7aAnpKKudbdsuVUgm/XCaYVXurJDW
 2uxYsF/o/EuATaHRG0QzaKEtOFS/G66dyuakaOKjPTtafDsXbN0mZZ7
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A job that completes during panfrost_reset() has its jc cleared, so
drm_sched_start() cancels it. Return its done fence instead. Depends
on the previous patch. Not reproduced.

Fixes: 03877d621db0 ("drm/scheduler: mark jobs without fence as canceled")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206581@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: shorter commit message.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index c9bd3555f..a64c33047 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -409,11 +409,9 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
 	if (unlikely(job->base.s_fence->finished.error))
 		return NULL;
 
-	/* Nothing to execute: can happen if the job has finished while
-	 * we were resetting the GPU.
-	 */
+	/* Done in the reset: drm_sched_start() cancels it without a fence */
 	if (!job->jc)
-		return NULL;
+		return dma_fence_get(job->done_fence);
 
 	fence = panfrost_fence_create(pfdev, slot);
 	if (IS_ERR(fence))

-- 
2.55.0


