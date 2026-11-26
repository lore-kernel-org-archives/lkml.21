Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685846;
	b=qd344ih46vGvOd4SFaYVvWl0i6i+3a9ShBJm5pmCt0wrDsl0Jk3UuUObMn8uBSZ2mzK2
	 cU2IVpkwf3xksS28L3QNlvTiOEg1oVF82m/NjDZxw79qaf54/jQ22x69QL2wSqXVnOVbd
	 rKqh40aOHd9enCAM2Rq5TLT7A6SqgCWjU+u68M6cVFxED/p4vHVDiUkpaxxAX1XIa51Pi
	 +wPh6otbDCxGv2hIInc396GVyCCmGPvFSSAgfE/jl4Oj+1k3z+4o7wsZKxTffq96AWvNz
	 8f79k1ORTwvG31o9bUGgLqr/yP7eWkecanGF05Y/n0b2uU7QggiM+tAFEfRfi1X1SSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685846;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kY1qunifErTZ0epogu423YdPR2qgrndoGzxQEGURuJI=;
	b=SkirFJKIVfIBCkotyw02fF8eNurYX+n9vJrEsruk08bL15cBoCCyrvdgmufZxImLlUNC
	 0P8PAADpv5Uvpzeq9dmYNmZHZBc/odOBWV7sR7u2h1uTdAA7BsYf8ak461Cq9DLWQjowz
	 DnOvQDj4gF/YhclTJBNf5KOxDNPyZm3UKZL4fXjwTohpMrlUggJPBnIcLBbAAoY2/vatf
	 XO+/N0bOuHr96Q1VpLyEKQvY3CqH415ycRhkRGLgvp4DOavXDY81eG/Ubc3crAp4OpUf2
	 OOVrCwC2WVHpCScGx8a4uZzoLQNOTZc0afMtLuoR3hvWzlXDsr0x298+IPfk5SLCopA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhSyWRnN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D085606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhSyWRnN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685846;
	b=tUrB+pRtSu0ZJvMGItiT4aGa/M1/zFJXFUqAh9Psj4xH3Gel/uNmRfJTH63VP0f4Ji/V
	 jWFjoXZbGH5o8C7xIeoBJ8nqWuaHkUR/locKpwThbFs3a6rfF4kzZmT8BalzGsJ8Zui/t
	 U0eZaDZdHR1kQwYKCIwE5LplZJXqRt93fYosIXFBW43G94Alc4bukehX4AS0KNor7TJIe
	 HeCdsMyku3tevSlgmCxJ73U/uxyaOISqpba0YUMV2f1C1bvOJkq19rv/JffWmYHIuHMyO
	 CPGZL862Diw9+dgNsRGZXmtfZ7NXftazUKk/VY9nhNoKBZZ0prfIgDt6rGM1y9Rg1Tg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685846;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kY1qunifErTZ0epogu423YdPR2qgrndoGzxQEGURuJI=;
	b=lVD7CqFsJO+XycW6gbI6D80t/Yz6TgxR95yDvhWTNJxH4F1geWD4V2/FQ2Tksk08pzTT
	 Z2BLh/NXOgjH5tCz2yZMQ+1F2tTi1j1TISu07a115YCr4LUjK9m1hmQW1r82l9I6Uq7cy
	 cfe872qjp6OaWti9sZ9zAWTsyvlLKuqjROM7ju3hvLMCOF2IbDOTrA4MP6Cn2ePDbYFi/
	 gFgMOD/bWBhQkfMhqFPni25UjozqlzU1gQpPRJ6yvHOMSFfEV+gRw0Ltj1Fod1fKit9rk
	 GFLsknADknMHwOaKwFw6KJuLjfaIdvZV1imczVwmDIOBKp4gyDHhDcZtmiN9bKNKcSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4CFB1F02ED7;
	Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685846;
	bh=kY1qunifErTZ0epogu423YdPR2qgrndoGzxQEGURuJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZhSyWRnNhYp8MzWjh/ubpzv/GIoAvuZZl5lTw8MwKNtUQt7S4xX8vjJqtSFDX2cbF
	 vDICw9Vdhxl+wYGLMJCm6VBEJovHbmMO6tWhiE4ZqZeBWENUxjoTbaRoKC1vOKWOV3
	 BAEOryrrnhsktU0XwN6WD0PdvXytcrupwbwPVAa1zhIeFIYkxjWx6/1AtIOGzFgZYN
	 WQ3VdWDZtk1y+qYbPHT6+qbMeekGXmpR9sef/KToARc6iAZ+roNBgyPzogCF8GjvYo
	 eXGPHS6OEbQPMcpJGQvz1C67j+8ojqEQrZUZOgjWUTuLdr4I2ht+qe/fqH/afflyPw
	 SUnLgCgBafPtw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6AE654D374;
	Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:45 +0000
Subject: [PATCH v4 02/17] drm/panfrost: Power the GPU up for a reset queued
 from the MMU code
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
Message-Id: <20261126-panfrost-long-jobs-v4-2-23579629ceca@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=1987;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=d/LITLeB5gWoIeqZGfkGbg6ByVPkBB9Gpn71KK4MPNA=;
 b=uEKQ91G95F/NA/31wcwx4FVEeEN7PvxKJeh9ZuTGICjxezqW54y6zSE+riDHf2UhCjhY+HmNr
 dwEYjl9aCYoA+JPhzQEs9n4z30MzjQqRNgbBIoWyKYsIIKBr+5kX9gw
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset_work() calls panfrost_reset() without a runtime PM
reference, and the MMU code that queues it drops its own right after.
Take a reference in the work. A GPU that cannot be resumed is reset by
its next runtime resume, so clear reset.pending there. Not reproduced.

Fixes: f9ab9c66f080 ("drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206548@kernel.org/
Closes: https://lore.kernel.org/all/sashiko-outbox-212557@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: clear reset.pending in runtime resume (Sashiko 212557); system
sleep is left to patch 1.
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 40eda3612..3c5f077db 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -540,6 +540,7 @@ static int panfrost_device_runtime_resume(struct device *dev)
 		}
 	}
 
+	atomic_set(&pfdev->reset.pending, 0);
 	panfrost_device_reset(pfdev, true);
 	panfrost_devfreq_resume(pfdev);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 79b302fef..b5b523cb2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -810,7 +810,12 @@ static void panfrost_reset_work(struct work_struct *work)
 	struct panfrost_device *pfdev;
 
 	pfdev = container_of(work, struct panfrost_device, reset.work);
+
+	if (pm_runtime_resume_and_get(pfdev->base.dev))
+		return;
+
 	panfrost_reset(pfdev, NULL);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
 static const struct drm_sched_backend_ops panfrost_sched_ops = {

-- 
2.55.0


