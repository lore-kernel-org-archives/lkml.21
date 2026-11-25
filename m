Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639542;
	b=5LTDYQa4i91OYZGKBtlwE6QjXCmqQvoqh7r2TGLERHaGm7/tNzJAUj4GEvXLQwtUzc1E
	 wlkSIzX/rXJV4RMyPSOfHw+yTxXG0LbrUp3RT60r1Umqx7lEJIJaS9Tw+bhjEM1pEB1rG
	 cOsj10RgvzkR5jeswF1piWJw1pPn78CkgmBnWVSFCSVyQUZoCBN841PE2tsWDksL42FLS
	 D7AfDiBTxcP5qhnBdkuujwsn3NGTnaf+AHqh9qbuXdHLvGEmmbICOP75tzpI9YS8tV20X
	 1HEdI60ijgaOizQetcpStuOydYrwyuP5gEZlw5mJV5/3WoonVFypJq3n6OdaCV/wnzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639542;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=wFxbp9GWj8PRFEAiH5lFdlGEgH2PeiEbxgFBhgBZw8s=;
	b=MSBs3AJWQ9R2XZdv1cbT4rmFmICxOLz25/kIrVZVvu3s8DftQKqhuvSPSQp+da7TNZxL
	 Ch9re1USh0TwNfNy+uF8HLQ0ybY32CAdXGw0o5+TOlx0auwMKl29o4R9ta7x2FxceZYig
	 VBXl7G58k61nLcLxH2U7iqasb2joWQc26G6NsUx6rqbgXPoL+piJNV5qHEiJ50Bg/KDFF
	 sh76CDBwfYMNqZRORx10EF7DeOfT39hniggRcqlfBgBmzVEsNXj9jS9xMVmTSUFkNY/7T
	 8K//km8D9XEZgy8yEtp0FScS7kQAYgZ3PM5gVCKzc7WfBI2xlvhZ0pl60mKFNMiBIQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timsurber.de;
	spf=pass smtp.mailfrom=timsurber.de;
	dkim=pass header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b="MuC/HUpP";
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015B4606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015B4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=MuC/HUpP
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jZWsQ2xwvzMlvw;
	Wed, 25 Nov 2026 21:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1795639530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wFxbp9GWj8PRFEAiH5lFdlGEgH2PeiEbxgFBhgBZw8s=;
	b=MuC/HUpP+Qth1WdDD2K+Gla4bENN0jDjBLcnQT6FyWtM9x2rxJyd83UKS4U5UNTo/5Ugc2
	5cw6wXtLKcaB1olb9XQeNaACNsIUvuFMr+LYppqgOppzNe/9NglaLe6T9hOrjzYV1gr3u3
	OnWcpqazZWpu2Rh5NuNtDwyw3wxsU1Np9oiW+S/4zHYCNn7RY25LGq2I+ySeFFp8EvikJ+
	K1CH8oHhOTsk8BSeZQTSkpN8ysfDPIg9lNK8FRWp6currzWHDZiW+RKgSEE91XpFCaZcK+
	ybq2sB/Np2G5NwHfWhO1dPWsdf0hGWolgoyUZMAeBrBr1/NpNfhkXsdYi/5qaQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Tim Surber <me@timsurber.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: vop2: Reset the AXI master in vop2_enable()
Date: Wed, 25 Nov 2026 21:45:08 +0100
Message-ID: <20261125204511.2867433-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jZWsQ2xwvzMlvw

Asserting the AXI reset in vop2_disable(), while the IOMMU is still
attached, can hang RK3588 hard when buffers are mapped into or unmapped
from the VOP's IOMMU domain at the same time, e.g. when a KMS client
exits and fbcon takes the display back.

Do the reset in vop2_enable() instead, before the IOMMU is attached,
where the AXI master is idle.

Fixes: 67a391e50271 ("drm/rockchip: vop2: Reset AXI and DCLK to improve robustness")
Signed-off-by: Tim Surber <me@timsurber.de>
---

On my RK3588 board (FriendlyElec CM3588) the AXI reset in vop2_disable()
sometimes hangs the SoC hard when the last CRTC is switched off. Without
the reset there, it does not happen.

Here is a minimal reproducer. Run it as root, with a display on HDMI and
fbcon on it:

  python3 - <<'EOF' &
  import fcntl, os, struct
  fd = os.open("/dev/dri/by-path/platform-display-subsystem-card", os.O_RDWR)
  try:
      fcntl.ioctl(fd, 0x641F)        # DRM_IOCTL_DROP_MASTER: leave KMS to fbcon
  except OSError:
      pass
  while True:
      b = bytearray(struct.pack("6IQ", 2160, 3840, 32, 0, 0, 0, 0))
      fcntl.ioctl(fd, 0xC02064B2, b)                         # DRM_IOCTL_MODE_CREATE_DUMB
      handle = struct.unpack("6IQ", b)[4]
      fcntl.ioctl(fd, 0xC00464B4, struct.pack("I", handle))  # DRM_IOCTL_MODE_DESTROY_DUMB
  EOF
  while :; do
  	echo 4 > /sys/class/graphics/fb0/blank; sleep 0.3
  	echo 0 > /sys/class/graphics/fb0/blank; sleep 0.7
  done

Without this patch the board hangs within a few blank cycles. With it,
300 cycles ran without a hang.


 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 76d151b8bc52..a86ac9173aac 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -913,6 +913,9 @@ static int vop2_enable(struct vop2 *vop2)
 	if (ret)
 		goto err_put_pm;
 
+	/* Reset while idle; doing it in vop2_disable() can hang the SoC */
+	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
+
 	ret = rockchip_drm_dma_attach_device(vop2->drm, vop2->dev);
 	if (ret) {
 		drm_err(vop2->drm, "failed to attach dma mapping: %d\n", ret);
@@ -973,8 +976,6 @@ static int vop2_enable(struct vop2 *vop2)
 
 static void vop2_disable(struct vop2 *vop2)
 {
-	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
-
 	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
 
 	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);

base-commit: 479e381e77dcde0dfcc9d51e89ff3273da199804
-- 
2.55.0

