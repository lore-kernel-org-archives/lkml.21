Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228340;
	b=X6QivBmRC8t7Vl+XvgDutpa5uwBKqfYu14X+hbgD0lHQf7JHRVk/sSTarbUym6UG4uBg
	 n4RvMTUyGff+nj9nUgvXgJk/nfTE9dscqXJbDJNE3snI8sYVXtKlKDHeukw2guqu3njWd
	 eYAF5x+kbzbKPaDEon4kJkiNsUOdTX1qlEEYX58192aoVlhrIH+0bGL0cPEtn+kVTAcOu
	 OtXk8h9y+ZJke+82Nfd1JfCLk9j21fAf5Q2xLN3CH22RC4BFpNFV+0NarJeyM4PKFrxhq
	 UbnhwvbTTVSMIBcTqc5PSPc61bLrI+AOZiuScLKZZbtpl26NJkJq6Qau0UScNOYj6GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228340;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=pcu4Z0YBmWCircjybAGycW1Dhcl9eVo6UivDa5/Fmxg=;
	b=U1fFKFByLr1MLJYjmvTcuRmbWxdccXPHVFU1bMD1XK5tdUu+tSMZWeo7nwfa9MtMf2d4
	 XetcX3VMLzISs/xIMlPjskAZx8vOsbt9zC8peW9cnXscqKdF6LfjaiQiDBIG/lwYnNWJy
	 cVz5TNC3v2rNeRLiUwDwzwpnlIxISxOzVm1Ls99t1XdJzwxWJj++6/Q4iuDd0B8xJSVyC
	 7fhsI+gYf3RIo6572gQva0MglEIaesyi3eIMnQqEdSoxUAjKXeHojM91YJDrhLuNbqf83
	 hJMmEQnGAdR0wBxDcCkjmon/Jgt/fCRz01QqnCGCFwAIrW9MDJwjp3NxF8geXNUiGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timsurber.de;
	spf=pass smtp.mailfrom=timsurber.de;
	dkim=pass header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=HJh39rsn;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67614606A6B0
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67614606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=HJh39rsn
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jWbnp3qhfzKn5m;
	Sat, 21 Nov 2026 03:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1795228334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcu4Z0YBmWCircjybAGycW1Dhcl9eVo6UivDa5/Fmxg=;
	b=HJh39rsn0pCQK2z2PO2POp6xK2+FKPT1CeP+YAoEidmXMinZJzJVxtECgbIGE3fDueqTfe
	Pmv48qfCNA3vGZJdDWbTVnPOqJPpvC0QHdf9QE/rNbayws92eKrn5730LcefjLK/qKJRdy
	PWFDqeTimrEw2LXHTAziBd4WL+z2DYX0mzaYj7QeJnGXBTbmNVWsj0er2O/yIYbh2vcCSp
	y14nWIAeBDChiMSlt5sLZBT5rU2NFsflD1enUul6zuEfygyJJFNde2GLPE59YEREOEyybb
	+z2/uFRqC0n2czfiepexptiFo8b+xMi9KvL+qeA2QyUPzFciJXbHFwA3H42ABQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Igor Paunovic <royalnet026@gmail.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/15] drm/rockchip: vop2: Reset AXI and DCLK to improve robustness
Date: Sat, 21 Nov 2026 03:31:18 +0100
Message-ID: <20261121023139.3515640-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-7-1bb63ef5766e@collabora.com>
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
X-Rspamd-Queue-Id: 4jWbnp3qhfzKn5m

Hi Cristian,

On Thu, 05 Nov 2026 03:00:41 +0200, Cristian Ciocaltea wrote:
> @@ -953,6 +974,8 @@ static int vop2_enable(struct vop2 *vop2)
>
>  static void vop2_disable(struct vop2 *vop2)
>  {
> +	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
> +
>  	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);

with this patch my RK3588 board (FriendlyElec
CM3588) hangs hard sometimes when the last CRTC is switched off. Without the series
or with the AXI reset in vop2_disable() removed it does not happen.

Here is a minimal reproducer, run as root, with a display on HDMI and fbcon on it:

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

This hangs the board within a few blank cycles. In
practice I hit it when a KMS application exits: it frees its buffers
while fbcon takes the display back with a full modeset.

This issue can be fixed for me by moving vop2_reset_assert_deassert(vop2, vop2->axi_rst) from vop2_disable to vop2_enable.

--8<--
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
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
-->8--

Does that work for the cases the reset was added for (the RGB <-> YUV420
switch glitches and the DSI panel on the EVB1)? I can't test those here.


Thanks,
Tim
