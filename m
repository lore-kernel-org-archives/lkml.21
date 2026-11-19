Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795065706;
	b=o+mbqU03GNMbz29FHiWng6lRo5yziwHnsWJcNZdUEv2GIiFky6K1uRR2iYxuCMO5/XEK
	 r8DUGdI51L39Ymf6CctwQpxBjzsTVjAHJCFXv9Yj1E3DPKLr5r/H1S8pZ7SJSd/R6dDvx
	 ykXofhPoUGJBSVis2JcpA+T3fndF+RhDTZrBBCG8uFtRSt2SzxI7AGGEnsB6Jzgco+blu
	 SVyacFK15ojjibygmfjRNdyr/PAYrLjUedKEb6Dz7uzprhMBwbj3BmfqPFzdlnLKUxN27
	 YfH9/MGKlgcuPfoWFQQd1VLrrnBYtTJL5d+kXP7cNC+EGgDC92SOGyCZmu3oRVKqU8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065706;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PzBvfDusqdNlv5DLo6OY/yFYLol3a8veTUhJuJ+3CVs=;
	b=lfgaul4c3pUiNQ3qRGdOLTqfIxoWGSjaXfXktyJWNGWy+VnvscmM9u3WxCducTGT93oF
	 ofdDFAReVz22P2E2cPHuaSTkFAoJDLiZPbyKrGnAApzylI+VlbK7WVReqZTyW+FpKyDfq
	 xw4sxvgL2Nu6Z0w43lypJX9JL6Ez2ddetLMu+cwc6a2PxlQ4xT0LwjR5cKE8LyN91woMi
	 nNhLJ4Ygn+lOyIPuhaM8kug8IMCejqC3ap5Soyni/kI9xOx+05BFWbTy0vX2RjOLucJs1
	 zc3TpDCSNjNx9se0FK6WLpncDwKqpMlP9jj8ghjZOv8ZxmAhLK6KU29Lxm3THOjwxpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M/YZcCqM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A460A2625
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/YZcCqM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065706;
	b=xpz0K1LoxHwP5Hummt5oXflsmsrazqW6cArkpS43fUN2xVrDk4/TZoETTbFnDDgCw8wZ
	 iJagKok2PvqIpgWCySZx3LHfj0Mn4tcrgbd1yhqYFy0vtG8V2uNPSfMDPddblDO0Nm1hq
	 +VOs/0dpmCTQCHteWzKNQ1Jssbxs5DrRjtveMtOOouWqAEojko4KAolxP3qTpIP32KUeF
	 z5iD1WRN0vUJgWFKOpYGAdGYVywq63ptEMldI6+Us4B/vCDwbFmYw6pECDKZ4N+v/bvUp
	 JOY5EXWhJUcp5O+1dNTLUcRa5vqt+N2ELIrfuQJ3Cr9VZpzN6nfPXx/RwvwIi/zRMCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065706;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PzBvfDusqdNlv5DLo6OY/yFYLol3a8veTUhJuJ+3CVs=;
	b=JT/6fhN6lT9RP2NT0T0Ggt+vjDCk8RMfXOMjUwaKM9aCN42UzXJqPFJtPl4Q/8nPii0I
	 YxII2A49HNV4ZG9eCoRrIys/3VFU2M8LnenwIcBsYJCPbjneUHa6RlYBTU2EdQPV/KbSz
	 hZyJZr3ccQV3gF6+/IhzrEpyQgWA++T455RwIWRp7K9rjv3O7NGrO2VYSHYJThFs4r1Rc
	 ahkkL8uTucvv05qymkW4QTW1Ks2MWvbogtlbWbgD5X6aUGnhz1mbXBMKziL+cV4nx1tSs
	 sxycae08a5VXkAepeDD1/w8wj+Yr/QdTfn1ytUvRFgrZrVca0SJYptWymxF4pQ2CAWA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EE7D1F000CF;
	Thu, 19 Nov 2026 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065706;
	bh=PzBvfDusqdNlv5DLo6OY/yFYLol3a8veTUhJuJ+3CVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M/YZcCqMWEcceEOAjH/l5KdUMVFOxQJtr4gR/i6rBXl8yxQ2CFByMsEa/AW5VnEfZ
	 v2gHq0AmV3V3uviT3KrnYOZN7wlh8dj6PtbhVvMij9FRW7osb5finXK6jBj1Vtfa2U
	 2tRDGy/U2YDfSEv1hG64DJ7LwB7QKz+1hsUPGCWUDjMqagziMtZCW8aG7dtLslvsEa
	 xbzIhDj9CvNzFZYB03NncpJbDEFfxXwtxcCc122He3h2f7IUG9Yhd8Fcfqk2g9NUJg
	 TAhuZUUpd4OFwWmNPGlPNOeZ1XjXsTZPG6soB2P2/UCmIoVP9Qi9l4HxLaB6ik/2MU
	 C46G4UB6mRjcg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06F554B115;
	Thu, 19 Nov 2026 05:21:44 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:49 +0000
Subject: [PATCH v4 8/8] drm/rockchip: vop2: Fix the AFBC offsets of a
 source that starts inside a superblock
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
Message-Id: <20261119-vop2-fixes-v4-8-4b8f5e7148c9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=2614;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=TKQv8lkwPZ5sd2Rf6HL/JUQwo4LrM3O2/MLRjh5P0BY=;
 b=0RocM37D4tuZkn5YHqDXNLASsCJnLv1FeBe5RjnGkveNcmJuCUEFSyZl14kNI6qdbCf3FdTRp
 tbYH9mxdJm2CU51hDwljYI9GElyxzG1ItdAUD9oZGCtxNJjoMKT4faU
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

For an AFBC source that starts inside a superblock, AFBC_TILE_NUM misses
the first, partial superblock column, and the transform offset is the
whole x position (truncated to 8 bits) instead of the offset inside the
superblock.

Count the columns from the first one the source touches and take the x
offset modulo the superblock width, as the vendor kernel does.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d4103e02f37f..670875ade4c4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -435,7 +435,7 @@ static bool vop2_half_block_enable(struct drm_plane_state *pstate)
 }
 
 static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
-				      bool afbc_half_block_en)
+				      bool afbc_half_block_en, u32 block_w)
 {
 	struct drm_rect *src = &pstate->src;
 	struct drm_framebuffer *fb = pstate->fb;
@@ -483,7 +483,7 @@ static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
 		ty = act_yoffset;
 		break;
 	case DRM_MODE_REFLECT_Y:
-		tx = act_xoffset;
+		tx = act_xoffset % block_w;
 		ty = bottom_crop_line_num - act_yoffset;
 		break;
 	case DRM_MODE_ROTATE_90:
@@ -495,7 +495,7 @@ static u32 vop2_afbc_transform_offset(struct drm_plane_state *pstate,
 		ty = vir_width - width - act_xoffset;
 		break;
 	case 0:
-		tx = act_xoffset;
+		tx = act_xoffset % block_w;
 		ty = act_yoffset;
 		break;
 	}
@@ -1437,7 +1437,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		if (fb->modifier & AFBC_FORMAT_MOD_YTR)
 			afbc_format |= (1 << 4);
 
-		afbc_tile_num = ALIGN(src_w, block_w) / block_w;
+		afbc_tile_num = ALIGN(src_w + (src->x1 >> 16) % block_w, block_w) / block_w;
 
 		/*
 		 * AFBC pic_vir_width is count by pixel, this is different
@@ -1488,7 +1488,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 			vop2_win_write(win, VOP2_WIN_AFBC_PLD_OFFSET, yrgb_mst);
 		}
 
-		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
+		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en, block_w);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
 		vop2_win_write(win, VOP2_WIN_TRANSFORM_OFFSET, transform_offset);

-- 
2.55.0


