Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795065705;
	b=CkbvyOw+59+aCObGP8Hxn7SIJn82zD8sKHVInPECk5mVOxDrp9tjbKSFohSShcMEhhXW
	 HLanLIuqnZgkyFORdnVHkDFO0qSPZlHNTVCE/XC0egZVhpElKsIm4Jo2SL2K/OqoR38QV
	 VCk8dPf+KgyqNRp4L5JXGB0KcRuoAzpa9sqs70YnI4K7y0wSPKiMmuDfLXtX55rEL/KCO
	 5t06nWuBpbK73M2bTIdQ8YK1VzWhiVd5oWtjKz2fHCOAJCxGbKpjenf3yUCWbZq6IoGyQ
	 NHMJ/JLj0AnieYZr6gwRxZ1Qy2u+xt60Y0Ny5CPnNw8M5alWbIbS6ESS6iJ3dft8aDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065705;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A/N4Va6GTxIaxciIAUqKko3R3j2OxhnaENL34pkh6n8=;
	b=Ga5qt7b+Q2FqbBZsILZYGpjZG/oWj286VZqvy+5jnQR7eZZ1phKY6/d8AhymLTGKEYbT
	 AXlxNJ7zfMp03HbpqI34ZoF/6oFu4hFmOsmPyD9TE99nKAbTs51pE0Z8Fj10D0MROpY5p
	 YmUVuKQoFNrnA8HqB+BqFm90oAFzwFJnwcIKVJxwimOUx1EcWbS9Z2jQe8S9IVd74Frbb
	 1bxIHPyqMctDgGdq5nUKoU/OYbNvGi2jr+E3WXaz618S1sCu5AWs/Cx3qTxXYX1hLzF6K
	 jL48pIy5aVUULxKZ74qeTItIBF06lPjf6BAy/ZL2nVgfmFjWjHs6LGeMztGhYMud/xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=astNp3gr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F9C606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=astNp3gr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065705;
	b=TlDK4wPEWdoP48QPDgEKNNbJPnBUz6Snt2LH9KryitpbmQCccOsz8HLYRyIphLH8qf3X
	 CwRczhITTBHdc0jwSLfReQyhkuWJod3jzu8cfDpQf47AZAbl9KWuxVsh4gxepmgtBcZyn
	 PXVrY8T+TXP0/LIISxuci9ocCHh3h70+PvROeZch707sljQruFtllb2DX32NlIEolpykH
	 022j18N0a/HC9Doh5UH2hXC/l0FKUSVHehCwxDafJio9Vev0DPYhDOIjanAJPiVM9e251
	 1k0SmMvBjzaW6qUKpA/oJlEUUu27nEEdLYqf2DPguS24QVictgqz7QbJ5hrVpwZ0AKw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065705;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A/N4Va6GTxIaxciIAUqKko3R3j2OxhnaENL34pkh6n8=;
	b=rnAzObXwDfACSd9hh7eiofkW4dsYe+k/Dx/fQUvIpJp4gtQPsFKZoWdz6QK7pNo8sniD
	 XshXrseVmIiO0Nz66OVtt8ipbOHvMDK+p6TcOKGAPPihbDb7kxu2jgrcYedOG99sfxY0F
	 6V2ZDpWwlxPugzeQtTVjk3vHsf9WGTbCT2y0H309spA2ueWxTHkKVDB6OS5vSO3js8U1I
	 GC5zMkP5Oz+rUK44wVo1bmmq/KSUHsZagoi7iu7TFLeCxXrpMqU61Hz/8Rhn113wsdJxQ
	 RIy20ai1dSIIv/cmCQjSlas85/braOxbZnGz+aMsOSDuGucMM3pFsqwqseC6LNW7MlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19B711F000CC;
	Thu, 19 Nov 2026 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065705;
	bh=A/N4Va6GTxIaxciIAUqKko3R3j2OxhnaENL34pkh6n8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=astNp3gr5OuvTjB7bByj01s2ZrXEGgUEzdumbAjB4PgYpMN1dHvAwlvJHDAc2B26I
	 jCvp7q/u1EhTEFI4pNz2tIGLaVIfxS+J5MU3DbQnhGXlsmicKvpuSJ6Al6DGaGZxkK
	 wZ+rSKGiq4q9hjX+BcNcG/4N9vhuN23+stp/ksRT59Zr1pkhTgoIFiEsvDR4MRgIGA
	 M/9WWH8AK403lB2dRxDjUeNaVytC2sYsXUrcYzlzotHUovZDDbfYQtDTyLdHMab0+d
	 VA25GA1tKgobIJEW0gtmgnPiteYLHXriCH2qF34J44qkQV5zxd+kJU+7L0XJQjnYAu
	 OsFePuYhrVbZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 96DEA4B105;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:45 +0000
Subject: [PATCH v4 4/8] drm/rockchip: vop2: Fix the HDMI sync polarity bit
 order on RK3588
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
Message-Id: <20261119-vop2-fixes-v4-4-4b8f5e7148c9@gmail.com>
References: <20261119-vop2-fixes-v4-0-4b8f5e7148c9@gmail.com>
In-Reply-To: <20261119-vop2-fixes-v4-0-4b8f5e7148c9@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Damon Ding <damon.ding@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=2035;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=W7Y7lBtSYyb5btdgg00p53tpUWo/IcKqgTwt/QaaHdI=;
 b=6zCU085P42dAkMTaUg8+8x+PxI1IfDUTstuxRy0xEGgPcmHR5aSXyqMnF8djt7DxYPoFq7JYd
 4m2CMZOuOC8C3EuXpg98b82MeALeTSuWNvqEz1FIS2pFWHg+ujpeeQn
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

In GRF_VO1_CON0 the HDMI vsync polarity bit comes before the hsync one
(bits 5 and 6 for HDMI0, 7 and 8 for HDMI1), but rk3588_get_hdmi_pol()
puts hsync first. Modes with mixed sync polarities go out with both
syncs inverted: the HDMI controller sees 1920x1080@144 +HSync -VSync
as -HSync +VSync in VIDEO_INTERFACE_STATUS0.

Swap them and name the bits.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 2 ++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 1c2d7d97a6c2..de325cc50c59 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -409,6 +409,8 @@ enum dst_factor_mode {
 #define RK3588_GRF_SOC_CON1			0x0304
 #define RK3588_GRF_VOP_CON2			0x08
 #define RK3588_GRF_VO1_CON0			0x00
+#define RK3588_HDMI_VSYNC_INVERT		BIT(0)
+#define RK3588_HDMI_HSYNC_INVERT		BIT(1)
 
 /* System registers definition */
 #define RK3568_REG_CFG_DONE			0x000
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 3e654cb99ddf..3a95d2f9516c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1683,13 +1683,12 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
 		return 0;
 }
 
-/* The sync polarity bits in GRF_VO1_CON0 are set for a negative sync */
 static u32 rk3588_get_hdmi_pol(u32 polflags)
 {
 	u32 val;
 
-	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
-	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
+	val = (polflags & BIT(VSYNC_POSITIVE)) ? 0 : RK3588_HDMI_VSYNC_INVERT;
+	val |= (polflags & BIT(HSYNC_POSITIVE)) ? 0 : RK3588_HDMI_HSYNC_INVERT;
 
 	return val;
 }

-- 
2.55.0


