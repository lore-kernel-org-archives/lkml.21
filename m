Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886803;
	b=pcV+sE8Y1RCRIKE5px7eIwE2qjcdoCsEwJP0sC9cAaoQG52MG6vv9UM2QRhcUT3jLps6
	 bC4ogYCmaGhzRzdJ4NuS6U7mMkus4+Czp7L75ZmR+GOujwu8Fp6dIAWFL0FFN7U9Tf8RB
	 fyDi6QwAndycB6aVbil1H8KQxwvikYwOfXE7XWKbIzKSjmORaLTKjrGZs+70z7an5l4DA
	 fOL6QQFoi2YlvFzrRtVxrqykjF+/XbKbuFh35JhMIutifM2dFDJivSmCygGXvKaeP+nVg
	 ezONWvwyi2OuIdUuedVBRT4yGbK4r6L1apm753aqUgx5kxkmyKIs/ibHb9ir+R9e6xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886803;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Z8rRhNnnx7xvbNdHoowQ2dZg6MGm9QtwIQEbr+lOv9s=;
	b=5HiSdclRmdzN+6UqyQT4Uw2IvsfiS+tkUs2fMgG6x1fszynsZjZOMFs7K2FtN3rs2ID7
	 fRMtAEILsS4Ve4xPaTotBW89qW0DLDoUdV/cJIAwnpkMPozIR+WE1HGwxGcqXk5UUMWP8
	 4vd2XUoIWmrOybFQG22EElb7wrZwtBObuTGHD8oTzl/Mnfxbr/nHIi0YL6cOZY3D2LXyt
	 m9tgobN6089m2q18hfqeXGyqAAAJ7bkjATj1NHIe9GHjK1A8xdlrXd9K5WsA8x+c/JKgE
	 jamRjGnDWJ4VCBhZKNhPFoHWuhM53gtBYj3awlRy1v0FGmDMTqWZ5Xm+vHsuQsOd93g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3OMZ8fL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2ED606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3OMZ8fL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886803;
	b=fsp2GKdPma561rBTIVzVjNU/eIVYxdaGyCeX51dZg23+ComJ9XeiQggZbWl0a1ABiB5G
	 QePiPUebKqbBbm+G250KTja3+2x3/JRMh0vQcDN7yIyyljNcRda6KUFsPxZ2urLfN1KdP
	 4e9MeuNCPThl9lA0u5xl4v9CGTETKn/ATfbjiD0t5ktLy3qNRaMotROOtaajf+k0Js5dw
	 ToVYsCT8QIZ/eMNBz8YeAZbtnQ9NFRBvFWn7GxlEov3rrreD1JagOLHg5czU82eRLSura
	 zo3TF2ZM+BoPFZ4Ks+9ReqpcikS4QgzC0b2JvHbhOfxdcA5wbekT/uRTM+Grqj2xm4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886803;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Z8rRhNnnx7xvbNdHoowQ2dZg6MGm9QtwIQEbr+lOv9s=;
	b=2E3QCYKvmxavZw5Tw7AmO8YmoglDi/ODeiioBJzRyvnmQm9LHEzH9IRfdvWTBDOWeWrH
	 ocjOZ/G6elMSJAm30BzBCFk/3nwk+A3Xi51+8t5QcasBZCY1OM57s/0eIS8Txs3eT5StA
	 2C8Wjzudai8ugVC0oy02dgsQdq04shbGj+DIvNFcoO7etgGLyOQnI+zk059nueYVbJrTO
	 6G+gDNVQ5zNBudhnKnNo2GRI3L5OJGh2ZpxwWiEDY8NnKiZ60WIyQKD7Qo9fLXD6eFAUd
	 HyVdIZ1bkoM8SYTlSjvjC2AKKzso99Bl6w6Px4UmEY+D3naEYjvP1XVCxrn4/TNIy/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B441D1F0089A;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886803;
	bh=Z8rRhNnnx7xvbNdHoowQ2dZg6MGm9QtwIQEbr+lOv9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f3OMZ8fLPUIIdejwBMZwHrr3ResGLVQRCGx6rn03cJ5+8vxydbmTQrWzy9i0CcxiG
	 Ns8XqVE9g0bHI4DkWverddGEKEA+WS/nVst+DZ/IhODV+Jn72UfSXt5a3Wpi1pegYd
	 Xez0JGgLCR9uwB6tKMzV6N54+yDM3pQhW6gMcHFiqwOgi/WQfAAugGXv90YCETOtGd
	 Tc63aS5/BKt9vk8Gi6kl82PhfH7ZmsW44QjG4davLVqC04UnOryOAr+OKNTBUE4uox
	 efkyTtjNtG81Wg+NpyNjELuTBsdoPobl5th/qxIJGBITqRU7rO5Mazk5m82Ez0GDkl
	 qz9h5ikJy5ZTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3DADD4E16F;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:34 +0000
Subject: [PATCH v5 03/17] drm/panfrost: Refuse to sync the CPU caches of a
 heap BO
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
Message-Id: <20261128-panfrost-long-jobs-v5-3-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=1145;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=RVUC7wk0C94NNPazliV5oYEit+c6cilShSIsrPrq+ds=;
 b=9ovKzVW5b4IBCwtyLr5G7GAFFqiBIcYb0Q6U41w1TUtZ6ZSY4T+B+2vdDEaj4BffQKb0FSCQz
 R9+4eaDAhEPCPsQknGf11n7La4zmc/FJUvLHE8+Bx+uJ5x4ai/YQMLA
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On a coherent GPU, PANFROST_SYNC_BO on a heap BO dereferences the NULL
entries of its sparse page array. Heap BOs cannot be CPU-mapped:
return -EINVAL. Not tested on a coherent GPU.

Fixes: 7be45f548976 ("drm/panfrost: Add a PANFROST_SYNC_BO ioctl")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206561@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: shorter commit message.
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 518f24549..8067c5533 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -569,6 +569,9 @@ panfrost_gem_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
 	if (drm_gem_is_imported(&shmem->base))
 		return -EINVAL;
 
+	if (bo->is_heap)
+		return -EINVAL;
+
 	switch (type) {
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:

-- 
2.55.0


