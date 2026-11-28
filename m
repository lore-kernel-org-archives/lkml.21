Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886796;
	b=ZVLFChRQqgRPLQK+ehNFtjXhRoHhcojD36ognQ5jZ+BmcrOD+8gGEccHjWQlLmuNUS+B
	 3YTJ9Z+CGMKVc7cLBlt9ZkDsw2LM1DieOQkeJrnkOMBqNfySoLGUfVD5AMMAOh+WvSn49
	 2QOaQFDwR/Bo77XJjelwo73fOjk30BSGWU6Fr57DtG/AiWjgut3De8BwXFAPNxFbWEpPc
	 qv52V/n10rAwl0DokkWQmG4NQ5Lc0TVXfmnxmV4BVe7CtqIbbDuln7W63deC0U2m4E4cB
	 +7TzkJtx8urrYOFuegZj8oychjf8y5B2oaHMd1e486rWgeXpq5KkiIYZ/k2gsOVLHrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886796;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bek0tQOss9y058o3OZ6jwGk+0z4tO0g6QTI9DYa0+Vk=;
	b=roKHuMka9xhTpSQSb6Cce6s0p8QuPe5YxFRzQVGJMhlaEerVW4QZhmHoEnVR3i0zZvT4
	 O1WmgPAwwjluUfC70UVCLnl53hqId3JJvKJnxqZ7n43oXLH3mJDUCal/o0k3lGaZT5Gmg
	 96zwlSNGRyhkjlzjCwTrW+X7IDVs/VcOjlCCyMyBWPf+SBsExuVghd4i89CWY33eD+z7D
	 yPoYZADICoCeaYaVu5rAYBSkmMne/V4j3WzUB+Fz4m2nxJD3ncQAuQlA9Zdgx5BV9YPaT
	 5GK6TwKKn+8B5j6H3KkguUAervAOR5uU4AJKTxiPqNAk9KcUCYt7X53kX2WxbKIy0WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pz+XulBM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF30606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pz+XulBM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886796;
	b=0ZUgA8LUVdJskY6wYeUhQy/Ny/xTA9GH/SrHRve0pqIzJPmUdyFG2TIDhVBVb+OenKTE
	 B8n0IvSSyAfDTyf4Ae3/E+eq8l94SWjyuYsz8/U5xOuwY6y5OarMejOv8XcJTWvbMzbu+
	 YE02fMkwND5hD8yT1vWE0jby+wIMo95kOH9rum5YU3ab/kkFz67JBWk8MSp+1Z3VhNq8u
	 9A5enHCczynQ9oT8C94GSqyh0u7sehLbf4hp9cREQWy9p3wzgPfY2Hvo7GYlB86x66s+e
	 pqYg9MC2/dd98Ju7o/5ZSFu1n4f4dBHZYBFQOwu+V5YZJ0RCWbaLUt2ybxdQ9P+Fbxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886796;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Bek0tQOss9y058o3OZ6jwGk+0z4tO0g6QTI9DYa0+Vk=;
	b=p8PT51mzbPbARZtvLamQbKm/+scK5A6KEZTAHxp/Nz84xWiuvwwhFdirS8zTGlo83A5F
	 8BXIsNfgkliTfc8acQdiFKTTTpNEWMzN788GfZVVUKG+A8voe1JPwFxP7KcpvzDR6KLOY
	 3qagK8x9cIvVGwPKeoryUojkbpkZHa6ey2+eVQeSpC2GaBFeMrpPDJL25Ow2MmBjs6xPq
	 KWikjETOfamhhn12WY+lb1qmH9MkD1BMZ3AcRuI2UP/XBXp6+uwCPa+Cx0oxBlaJiyrCz
	 m6svUIS6s8E+kS2ZSligNo2Fhtaw1S+LQus6aHTC6O8zy/sbVOX4/8st7Rkinq6lW0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72DDB1F00897;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886796;
	bh=Bek0tQOss9y058o3OZ6jwGk+0z4tO0g6QTI9DYa0+Vk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Pz+XulBM0O4s8oCKRB/BFEMSQGZ7u0iwXAgd0UJLGqHYNVlc5p7JMs0vfiTs2zNOf
	 gUpenrrUtIXsgoa+dnCzs/zqBuaHhviG5KXwOu8FFRd4lGFukkwI0IEcoIBjO8s3eA
	 n1Yc+3bWk9iE1asBUdxSKqQwo8u5qiZIfhhmcf7NCezZn5rySw15A/kzWP44mTL3NK
	 moQS3FevM63HUJ6T6xO7TZBtYgkyqtj5D3QYu/gPcbL9G5iDs221LipVCGouevo2/7
	 MnggVTcLpGFOsy952ASSprz9mYijxSevTHk6pedtcj4VULAH0UtYkiZT5jILPF6yhZ
	 v/8R573Y2+CVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F027F4E13D;
	Sat, 28 Nov 2026 17:26:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:32 +0000
Subject: [PATCH v5 01/17] drm/panfrost: Freeze the reset workqueue during
 system sleep
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
Message-Id: <20261128-panfrost-long-jobs-v5-1-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=1382;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6c2Dpu03JGJeqBmpPCQQMuKsg5qJDVUkSb2yqZ0AwZ8=;
 b=kQe7+XFw6omzipPyuVsmPQncWYyH6RvhTpPEIqgrAPXAEhxUdgPdikl3FmzMUaOFSXtIT1wK/
 biyhbkLmYrDDpEihAkibrJGwwX5LocTkoHoniMoDUNe4+rBE1ZyDuKb
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

pm_runtime_force_suspend() can power the GPU off under the timeout
handler or the reset work. Make their workqueue freezable.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210830@kernel.org/
Closes: https://sashiko.dev/#/patchset/20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com?part=13
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: new (Sashiko on v3 01/14 and 13/14). Tested with s2idle entered in
a test-only 8 s hold in both: before, the GPU was runtime suspended
inside panfrost_reset(); after, the freezer waited for the work.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6a604b5da..79b302fef 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -893,7 +893,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 		return ret;
 	}
 
-	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", 0);
+	pfdev->reset.wq = alloc_ordered_workqueue("panfrost-reset", WQ_FREEZABLE);
 	if (!pfdev->reset.wq)
 		return -ENOMEM;
 	args.timeout_wq = pfdev->reset.wq;

-- 
2.55.0


