Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795065707;
	b=IwIZiIJ3rTF/1GmbCPC/IxHRkinTzwJlos6EOgDmFLRxxSNCY8EWSBdzCMFu/MqmAUa/
	 FIWxAtWm8V+DAW0qXo7nI3TthEAF0ti0IhqlDYETkkVBesk0IHBszAk8ll9SJNfeTYDvG
	 xe8qt9HK1Aee2Yu1lnRDaa0PpYn42Qhhk5BSuwgXEYSdZ2jUx7Ysy8hsD91/y6QbyENkO
	 qk4EyupFBxf5QNLgvtso91QZHoGbnxs9kZkzXR/uk5DTwWRrfLSjlr5TxjovVDqAmU15R
	 0mNyrDlBOtwzKv+EGj3215z9atmsqYQQuI6SJNxW5jpq99jtoM/d+nJUfog6dS0Ozow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065707;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vmmsCAmkFJPF5VXt86nWzLOnvQgS7sQpk97nCjyz42s=;
	b=4hwxq/E0gnj4FHjVlpUWSqUjmC+NxNi5vphIHAi1+54S2sJY1c9qJQ4clPxYXv8QLj6P
	 xrPz9YwSN7tkIL4Gl+8o4LJDSlWy4UuAQ61uaJRm48xENujyvavS5JMVMBaV8fCo9f2n+
	 JiY86sIM8S6mdwjmHuXHQSfW8tErQ7SHB7FcQBi53Szf2rj9Q+ocp7BimDYCRjO4P9aR7
	 AJ+2m/1VC2UdEvK/LXjLizIed4Zg2bd5YIWIIvLbElDzCtOLgW3bXS7fGDVkxy+EWR6z5
	 anCDj0vOikrpHpvpO9Jy37jqySgSvIHbfS6mj6l9i6QUC8lUHWv1PBwq/e3IRThrcCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cx1SiotZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0B60A262D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cx1SiotZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795065707;
	b=ku6wQ+46Kbh7rjeSmjKZQDS7jh90pnx99dANjtUEu/9+mkzrRRN/v4EtfdXALHXB1GBW
	 ejijsOy4fPAfRpokp0DPtOMJ/kihCaZ4JiHSrZdPGF1QRQ2YqTXKY8mlrLfs8lEHlsJV/
	 jGmHQR2Ut+fph0TmiYeYzMZND5anwMwowsSvnd9l+GP3lQMq19uHroy/tV8nQogHEdFzt
	 cBDTkvwGaN1hWF6kSF6yZ9hr5mQuHujUXnsCh8AOOaNC5Rpd9VDaLd3Ii73gP5VxQMGUQ
	 LLcPn+e+9anbc192ImS93PHuZMLMszPdsfQxh2yRwe3zO+R0jD4sFRbLYSljxC571ag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795065707;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vmmsCAmkFJPF5VXt86nWzLOnvQgS7sQpk97nCjyz42s=;
	b=vPui3xgcPqk24k8CCad1gjf9VKVL+HaKLZ22IGg6yV11VRW80b1wydfioyfjxaYTMHmi
	 JRZAu6QLqtGxAqPKYPARzBV1EKkLW0zuevCPYSHj4QEsDTj1JGUAKHkFnOrnD+1BV3cWb
	 yJKrxDHnoNEFvdkqF21IdknsBLQy+7yUlauiJzi5iUh0tJmcylLOWRSRFbUUtdd3mOVMC
	 PQ++I6n6AvWzgJdTrMHyUBc7SNaobONMdCIufJMndCfmrQxe1TpxxfUI8mZNC240pRlRV
	 4phM3J7fRmchXo1oqIhVizmE1FR8s6Rx7oT1LoA0vmgSRDHU3RHoB34fnfSVvFc11RA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1CE11F000C5;
	Thu, 19 Nov 2026 05:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795065706;
	bh=vmmsCAmkFJPF5VXt86nWzLOnvQgS7sQpk97nCjyz42s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cx1SiotZbWSumq13MxnpkD8KXzy+VyzN2UfnZ00YSPX3uvuWK313L6wJXfryo0FOA
	 8kHaPEVWE1WQvlJuv1HWRi0bOv56WUyFoztjd0oKmqbmzLBF0Xg7j1X53tO2UvFeo7
	 H/CG9xLT0QcRdlMgySlnyocuN4WJzcEZuJURadtygIEeNfJ19vU1gSUsVlFTFGhkvX
	 lSkiF96NTNg/aLj47tKHFvfwRKPQq9rtt1mDzly3kGKjG8LGzVXWnrZXjTkpg4Vf7G
	 2aCP9trY88TLWlLS+qK0uA7sqn7ksqzCDlJ4QF/m9+G/bfb8FVi0ktMdQpv5pfSFMm
	 e0SLsJHRH+vQw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8A894B10D;
	Thu, 19 Nov 2026 05:21:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:21:47 +0000
Subject: [PATCH v4 6/8] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
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
Message-Id: <20261119-vop2-fixes-v4-6-4b8f5e7148c9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065702; l=1927;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=65jy5ymajpG89k237tvRGcCxVl9Lytdo/uG5Ow0DDXs=;
 b=eavln/Szzu2kfv6EJn+f2yUSSyS0oEHYBNjqxRmhWRR/dAprw5iUYDy1WujlwSeTK+xNvx6ez
 rWN54Xr7MO7CsJooBXzdymCxHWAhNHwjRjYMqcM/IDF31l1DrduV844
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

vop2_find_start_mixer_id_for_vp() passes ROCKCHIP_VOP2_ESMART3, the
highest window id, as the bit count to for_each_set_bit(), so Esmart3
is never found and a video port whose bottom layer is Esmart3 programs
the mixers of other video ports.

Add ROCKCHIP_VOP2_MAX_LAYER_ID after the last window id and search up to
it.

Fixes: d3fe9aa49585 ("drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers")
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index de325cc50c59..a1668d234b84 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -807,6 +807,7 @@ enum vop2_layer_phy_id {
 	ROCKCHIP_VOP2_CLUSTER3,
 	ROCKCHIP_VOP2_ESMART2,
 	ROCKCHIP_VOP2_ESMART3,
+	ROCKCHIP_VOP2_MAX_LAYER_ID,
 	ROCKCHIP_VOP2_PHY_ID_INVALID = -1,
 };
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 3a95d2f9516c..6927db8a592d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1881,7 +1881,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
 
 	for (i = 0; i < 31; i += 4) {
 		match = false;
-		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
+		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_MAX_LAYER_ID) {
 			win = vop2_find_win_by_phys_id(vop2, phys_id);
 			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
 				match = true;

-- 
2.55.0


