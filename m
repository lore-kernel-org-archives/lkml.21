Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795065706;
	b=fHcTeD3MaFXsUAkC2sxyruIprDdIyQMVOcH4eyVRFe6l5hF01DeehnhoiyDvJybMEazd
	 71iwDVltEB8pI/Ad253hrPe4/rSPT3EpLenX+By1MM1BeaadzIeG2+KKpoQqKTqiZKePH
	 suoWhXPbEAfi7N7BjzJ4RiZxDaYnInCK/3VfCP8U4gXc2tiRxkCEwzL9b63O71bgLeVqO
	 I+bj2I7m99yaA4L9J1/CFBRWEsUbZ5GCGJ8afi07ZGWVmHX6uURhRiX59/8PC19BHKkft
	 LxqRRR9VevaQ64mKC8Er7mKbPcTlgvI2dWaAVfarEskXR6xxhK7qk4PlZiXwxF7fLaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065706;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t8OUTjcEA/bsDeIubO7Cit5FqjNzQshMSR9Mm0bmIeA=;
	b=xsZVQXnD24icwuKeiQtQC5ZBuYRNMgaDADperqkbhJl/HAbzug/v7L88EucHjmM34oaO
	 mzTTRWVWocymGjHDMb2Y5KmbsU1mQYAL+u1X8OCn+aFj4R0g6XcAdlcswaZExDeQ03awX
	 0ynxXtF0uqMI5QIbBG/HmQNlRiBDrqYAW/0eOUhpLkWTPAanqYdzbOq8sTnXozkdtjQHY
	 qNio2qVS6vnhoNPXgkTLjr2aguXuLor4fQd+iUf2zq19ECTSWsn6Wra1JeCRZrBn/cAFP
	 aTX69Y4xdPtdGQGTraDxABIPOORUvavb5h6X1J4/KTJxsj5O6haoLZRm9BB+mKvfBUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DTHKT/pA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D260A261A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTHKT/pA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065706;
	b=zJxwKAN7XVllkVDU7Rzg/quiTZd9C5u693jw3MPRyV+bDpU1lx6YVkvhTNPQSZsBKN1o
	 zBNY4bEtJuLLj8tBwNKCMGdSxnNooIHmBWqWSB8oUP4KWCCfg7SneVYw5hD4dRAtG6X4a
	 blP+0iAec79QgqxqY/f+Vjvcd6ideH7XIo0mAyGyujdjvWeMdf0zC40iMjDccNCFCoP6W
	 qR7JV9InaZYBQYwSaQaTw8LXt8bA7e645v2/gDLahQITEPUxhrS0p/6r2iKar6lTWDvSb
	 JWk6780hRtpVoUSCW036YZpEa05fCzd/IQPB737pwjqhshRte/28QtrSsw8QeAqeLMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065706;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=t8OUTjcEA/bsDeIubO7Cit5FqjNzQshMSR9Mm0bmIeA=;
	b=dVFZABO9df9DPnTviu0ceXELwBOrwTkmMY8Heb2HkOO6MV7Pb1dpLGqTa0Nl867Quyr2
	 sbtM2nB09TU/ye5qh0DqnjO45yjnPgCAKX9FN0fyer32wBfYfABmZlOxA3I7aAF28CYEf
	 /9sLBuzsAt7GnxQvK4JMsRZB21c06z1ptjX4CMLB+jBOxo8Dne9vm7qSuB7MHoh+I5Okd
	 81egcVArUhHeIoLQTYoIKceUsoy+OZiU0mj7i92NUg3b5y/j8qINPSgEkiz76HgTUFEs8
	 tHEolo1PPaaaLF26trYscONBqd2p9s6/z26lg285cKcdeIn0ssoj+EY27p5ujHR0V8Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 954131F000CE;
	Thu, 19 Nov 2026 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065706;
	bh=t8OUTjcEA/bsDeIubO7Cit5FqjNzQshMSR9Mm0bmIeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DTHKT/pAbPwVqVNZC1HEa0crNxsDYWfOu0jolkvWa1aBG4/93Q2kpHdp7n8T+/Ja7
	 9B3AeaBRTJEwA6zEXjzjypEZ/B9gvT/hm9/fhFk5JzyDQqOKGJHEY0vUKfS2wzHCjT
	 hJB4MKrLQxMiy7RS6/zVuUUBOA/xRN6uAA1zxftB61TDpKipN3IixYjk6MLfuq4LRI
	 NDUsfCDjVyYrmQnGcXP21LLBTytZiMqi4Pe+vzFZFTsL7vo5cjaBQyxkC8JxdElwT8
	 pU0ZVh3VPWUdD0Yf51o6HYzKw2gJHh99KfTsCA0BHAawDRcfFPtGAQcOvJ1N3PISoS
	 x999LRzGdV4CA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E27004B111;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:48 +0000
Subject: [PATCH v4 7/8] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
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
Message-Id: <20261119-vop2-fixes-v4-7-4b8f5e7148c9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=1431;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3e27nsfR3kLioD20l/ktODt6iemFLIN5uuPeuYPl4xA=;
 b=mCPe/r/rGkvgWMHa2PkASfNke3mNliov89vNPYIHiCo4PxJZT2FoEDQbpcL9NWDgnvzvuXIzn
 PFJ0S95xfNyB63yJPNbjlLbS0pnd46K9t7DIKjSGv8bdaQOLsf9Edh+
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On RK3588 the gamma LUT update writes the whole LUT_PORT_SEL register to
select the write port, which clears the dclk source selection of video
ports 0 and 2 and the VP0/VP1 merge enable held in the same register.

Only update the write select field.

Fixes: 4f537776340d ("rockchip/drm: vop2: add support for gamma LUT")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 1408b539c311..d4103e02f37f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1625,8 +1625,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
 						struct vop2_video_port *vp,
 						struct drm_crtc *crtc)
 {
-	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
-		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
+	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
+			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
+			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
 	vop2_vp_dsp_lut_enable(vp);
 	vop2_crtc_write_gamma_lut(vop2, crtc);
 	vop2_vp_dsp_lut_update_enable(vp);

-- 
2.55.0


