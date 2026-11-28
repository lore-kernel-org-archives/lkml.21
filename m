Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886808;
	b=OAsaltHUKmDBxzRse7gIadiI5xRgnYupoBjdIYva2lAMgu8RbsLILvUAi40gm2+aECro
	 cLLKW5RaFJleZtzJFjZS+OSmb3ebfF5DaEEdFX7GluOHcpCYZBp6jqKuLTwOr8L5eboor
	 cBejon9o39+idwHTUcasfB6ROTpcP0fbx27HK+jtVZHu6GNgr/2AHf2vNNtoBJ/EFuLYG
	 DPdRhuBfWW3s2LpQDTY2vYig/W29AZoTnY00RNnCVg5vVAW0cKsoiNfSAD5eACfcvFiEC
	 gfyBMeN3ayJxmv3eJ9Y5ame4InxnURXzdrWyJKTEeG8luzW78sVlMVXmPlqy05jRGXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886808;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kY1qunifErTZ0epogu423YdPR2qgrndoGzxQEGURuJI=;
	b=2zFV4Kq9JdSYSv9uvIsFOE7KPvq6vImgvbvX8RdEdCKl4mRCaChqZvPHEn9NqB4CR00Z
	 O+Wktf1JlZ4xNiNiUHn7YBzEaIzx2rvmTrf7H2bhtNDc0xaGyRd2rUvROLIKRyBPBy7hX
	 gAm0wSWG1AoH3G35/82GM2CmkFVBXpCR+MATI3wIlOe2IoubfbeWDnvyjpbON9iEzqxJw
	 /J83keJVuHcKR/4RD4Ir/VDkuFAx0nHt/RUDcTcRV5ODrYfTQgg9RLZqUiqt35LuWzG2Z
	 gsK30/d9qKFsRtFkkXcSdyVXPyNkkfQU6vxSzJvdqPFZ8dI3YGre/Vd7krE+WDxxtsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4F7z2aQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A6606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4F7z2aQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886807;
	b=GwEsupGh4Ia19u4bJDO5/7z+AVM41YptcaGXqXq4+dpE2czlHbSaMdWFyZrgPyPfwVqA
	 jZ96qvNTXVn1yRmWB0s5BkaVhMh43djqcynW9t5UcYK0xl16bYELJRu3kCSx8grgS649I
	 zh02luAuxqH1h+TTWMbXvyvUTQD5XFKJ2j2rPoTMpxnNgfNmvhzpqvmSM0zv3YFEtOpHJ
	 1jx/TUrHWGlH0qNyg6QLcj/j6pWVJssWW8fAFzuruxHuqB/nWJE5jIDWk+mLGm6uhXC+O
	 MP/8XdPH2nLV/1gmcZJUFbdLVUC4alhcs8OnSZxAoU2tZBE10xLoBwG2cO9mDfqlL8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kY1qunifErTZ0epogu423YdPR2qgrndoGzxQEGURuJI=;
	b=VLw3j9SPdjYexhb4UUVUQD3AfD7pGNsi0bq+TfS+5UsZ1urYxy1pxDiNZEN1H/5iWM8L
	 mqCb0OEhhlxX+LkSZ/ixtP3qEZLP8sZnPuuzMoKuNrrLba47XJuWdMRGuSWoIJxX+c7Ml
	 pth6LQzEwTuYGW5G5tNXZf3oscGtdDKxuA6JN3QRdwNQ+O12XIY1qVKkCCfage41PwYEP
	 hwvCfWmMpZZSJ2N1HidOHLkjwiPIPsAWyXuefNmsVlvkudReDFVQiMW6B0ZKVYUJWOXI3
	 pYflol4jdf+irzQxZP+COBhkMshz9k0G0xsRfjSQg9uYczfa9XP4SV9lO2ZqnpEh4ug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92ECE1F00899;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886807;
	bh=kY1qunifErTZ0epogu423YdPR2qgrndoGzxQEGURuJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W4F7z2aQ6KNjYlvc9JfvegO7fOOi/WQEdscjH5E6OBRqFG2uB43b9Cq3t0MNkudQC
	 cO9LqLPqVG64nCE9hBinnAtGlSckhkM3w8BCN0BQzDh9/TyvdtEG+733hiE2Tcw3Fw
	 z3syPCk9P6rT2XLoAC7qHJKYQgx+Ky3uWmfx+28w7jlM5e89hHi+S+/yd6sSmVZrRJ
	 eKW+6ZX1s1N3VYbBd1LLphfChIBnpewZhuBd1Re7EKQ/45LUE2KWxhS+ybz+EPt1M4
	 BOoouZ4EQh/AE+BPe8FyqvP/LhiJC9jYF8ma6XjBGkUqlyNqSEiJTeEyKvPVJgevmA
	 vrSdOj3Z3zR9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1DB3B4E16B;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:33 +0000
Subject: [PATCH v5 02/17] drm/panfrost: Power the GPU up for a reset queued
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
Message-Id: <20261128-panfrost-long-jobs-v5-2-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=1987;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=d/LITLeB5gWoIeqZGfkGbg6ByVPkBB9Gpn71KK4MPNA=;
 b=ZMvgU1oGdpXDDx3z+mAE9PFTvUAFYtX2IiTQXmxjfxpVy1JqfJ2vScuudp2IGdhSbYleDTu4r
 mf3QzVwrETGBLiESVirDZfG1XoXLTA9Cp6vz4Nqhk1JPESZDgYy1wOs
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


