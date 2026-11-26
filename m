Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685865;
	b=1PMWVyGD4hngt75a5qKz5dvMUqXt8ZWkexjRIdArT7ZAcLjupaWaY3HO+Sj5jSFZ8p6o
	 5aSbtXJMNk3zOVmRdVq5oaee6LKrpPrLf/uUImIy/Db6p1TWGFVJuiYruJwC3ythAFoyI
	 ErLeHOPpjIYvO3UmxNhzIMAkEX0qTcO6e9/RUpKxZXZHeNPtWAwpsv3ZhziMNe9697Lpk
	 c+SLo4emcXNoT96q/8/6PtCU8d6uaD41r3MjRf7ngbbD59yV2QWoYByTx7H9kdlTTuwFi
	 QRvXCUkzzHphoMhzfioIxIDg1BJjbRmH8Q4wT7516MJB1H+Q0pYF79Vm3CGj/Uae8eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685865;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=a8P8VypdTASzl6lH/vOFbcp09GFgTV1ODriwboyagiE=;
	b=mFhNiF4Vr67i6yhFbJ6zITFPyjBzLQpkuTP4sWCKwqQEoUTotd9uCyvV+tahTfmqp8X0
	 rc9aPuCOnDYpFBuzhyLGy5RbEM/mTQ0CaS+v3sggN6J2G6QRUMj4dvdxYjTMQSCl88bAi
	 pLInPrsvYbcoPuS71K+BaNIxFS6slzynpkBWzMLyLLLY+xURL/leQXuLF0LEFYTB8Jgdr
	 ColEDhgZfZxN0mgMnsdlYe+YbnpsmFjlo90viKdaLu0o7pIUfwP1vVQLlK952CM1g9EXg
	 i2bUpv+KnGvWdTbPRMShGx1C4lfgk++YlEu8W/e49WgdF+dTmIt7st6zLoBgANXKWSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW5e4reb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014D8606A692
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JW5e4reb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685864;
	b=cXdjkvWEq5fST86IyzHehXrhdE3xvU0beYbwa4Dl5IYPTM9UgqqPWv2+QSu4uwHm2XcB
	 ZKrZJTIfLojUZuV9z5szDgbU5fKqKbmrxEOuR6uUIZRHRM5NuqyF1DCDa9WY3O5dqQD6u
	 hZuMhsDFIQBmZx7KXt54lkYLmG3JN09D0OkWfrACxFlIJacJFmSGEw/9zSrArh4HX1Jgk
	 Fd4Kvtjmd8yry5gbcSJE+0G4F04020qtAoEv9Y57dVy5+K/Y/IU0V7UtMUleDq0Ab1TSq
	 5MLYcMEjqo9TWbNSFPWRY3n7PO8+Q6dLFxywbrp+puslgWpwZJ0PtIs3ieSQ6a2GLoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685864;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=a8P8VypdTASzl6lH/vOFbcp09GFgTV1ODriwboyagiE=;
	b=VUAyslR1H4848rMk07S5Zjq74WWgOxMji22qr3d4GjS0jXJ5tjZaHNlv4zchYpNKipmK
	 BmT8xhsKRxstGOyGJaE6/PrduzHLzcAqZFpuV4LeavMaYWqX7c0vWzEHJxeiWwgA95pyt
	 mDouReww/Vq60QXmT4ByrRD71AyHFNHoXSXhergNiwdyd0PO3AqIJyj9tzGnG32JXTHls
	 5fB0Kaq2jfzu0Fi/wslvzwaHGz06rvMmEDcSYPzql8TYEUDm7gID6OkYlELoyaapdVH8L
	 dGllykDdwG/ExDwfw/flmaIhChqda/n7wF882hsjEkG5EV8Q7dcJtzkMVG5aoVgBNPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D99691F000EF;
	Thu, 26 Nov 2026 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685864;
	bh=a8P8VypdTASzl6lH/vOFbcp09GFgTV1ODriwboyagiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JW5e4rebwMXwTbnfmrEA2uqnSsMOCRLt0kdBXHMIVI33F863oEJB6TNqRUdTfEgri
	 NosKSClZCLlje1qV1mO+vGMen9lTEVI/74LjqCWnrvMml1zJqX/m6CN+YZiNBlN7/Q
	 sWrcQ+oERvJJ+8Exb5CBNCLeo66KUdc+iM19o1MPWjydGEbNrG9Nr5iFY5miYNVyzb
	 JF3ZptGxVnK9QKiFEvZFX8nGWade4JiJO90R5idXoZRGppTm/NAW0S3E8xY8a2cDfy
	 wwc7oVr2vA5D2iheW2DbHpQFr0k7+/UksqfQEem4E7J43ZJaSEXsTnMOoD8zVaIUox
	 3pj9ocCCKAzjQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 75D2F4D394;
	Thu, 26 Nov 2026 09:36:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:53 +0000
Subject: [PATCH v4 10/17] drm/panfrost: Don't cancel a job that completed
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
Message-Id: <20261126-panfrost-long-jobs-v4-10-23579629ceca@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=1339;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3lUBnktZkSvOacj1VqiKAjZOrqk7CYYBcx6fKO/61xk=;
 b=QOC1f2Xvp2yll8tHGNoYUUQCDqpNDP+S+DbA6TlYqU7HbbSIv3Vh5JrnjrDRvxL6PX8rkqLCk
 amGqoYBjnRsCxA8HeSjA1IMcIG8Jbd5KX8q01t7eZl/QQsicd18tGcn
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


