Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795274960;
	b=h9sE022G6HR5DUmDlgItyuzLp/HN9tVxvlquO9aGsM2AtzqL1Rbkd91gGzkJY4EV2y13
	 /a2pxAK51tUkumw36rEMLxEt6IWNtEarQ1jb3k2N9aHp5qtrppw75IkXYBXOlUzkZE7WM
	 BQ303TvyxmJ4ikliMGEFWeeIqw+hiH+tJXhdVFv4gqPlUIKL+16TlqSvAmtwMRjdlFDts
	 g3ugk70uqf8xznImJQCqmD18HyK3IB1WZCQ8CAp1us4KmXLqhsP46nPDbwM2FYCrumlAH
	 Vda9/OjE1bYDyOvT5lHE28oPqToZWxaLfaCiOs0hGx/B6cahjM6ArafYmChIu5x3kVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274960;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=p1u89U4m7ML6xsuINKydNEguxcp6HUQl8vcznYUTeTk=;
	b=ChaBQ4+MBopfW7mx4SOQE++04ib5xkOjUjXlhtlSu4sCrOH5XSTNh0JHCFGCRaUPO7PD
	 QSL3RqUlLGzR7SE8/a5Aru+XausDpPchVXt+76cGY/CmF5bPmnYXGg/49gi7UXDDy870V
	 /ZXhA2hYLeETC8lx2THDe6f5gR+vFBMGx7KgB8YwCfOeKlJkg3zAuwDb/4zi7jMdLvq8n
	 Syusoles1mTMtrjLMUaH1/SEHhdoAiN7iujEaVEAQ3HEjkhryJamjxgnESxRNZIQ+F1TS
	 BCTqEb9IqVy/IRBheNE2DSgwUQv+dw9O8PMTIYCetx/0sqTjGZyZSAYW1KMRLKsZ/bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IM82JPyj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757F5606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IM82JPyj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795274960;
	b=spqhbdJ8CCZnZEW0AUNOmvHYYz6Qoww8tujIIvP3Lgwn6DKM26B/Mtxgw/smdsg3Xq/c
	 7kTEySa+gFkCIt1SEw20uD2UJEGpMm0J/7bl/Mu7Kw7CdIfwuv+VYKEiZKxO4hsCiXP7X
	 cgn0AJ5oLdGr+lrUOYbR8Qm0iQkEXOshprCfmpFalZG2N771JGdOzhQhPrzsHZ3KE+f7l
	 uVTnYe1ypjwRW06/g+hEsZLgJjEkGaY5/PbXdPYqWTer956erFsH0PfJr1q7pzFRUNhVM
	 ISItUOvWDf5ldE/3QdB44WWD1fmtbreTlVrVOYj8OJ3aovILGLSWd6lPOR+Fck3kpTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795274960;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=p1u89U4m7ML6xsuINKydNEguxcp6HUQl8vcznYUTeTk=;
	b=SAlqfwDv6F3DRg4IUASyqymKHFZjMzgVeIzERPvgDHIX22mxtbmBqMPxEeRzOwKj/Sip
	 aK7vZBQK6ti81wHrKSF78O2IOleXwavem6WZ8E5sb51pfjxKXZ1addJibuTobJN+Zxsvd
	 i3sTRKFnaWm53efRHdZM8o8piHGLsR4//QvsT5ASpgcd0GhGCobd7z6KsT55snVqWotH6
	 /IO2D/NVRCA0N571uFnFkZiSLRxfpIQftw9cWkdieXvDxKwydYpAK55mFUVAz69oB+IVT
	 lvesQtEDrZQMa8bvbvW7kmBaBFeYV+AcaQxCPIsJNxYN2YgPMVaS7Kf32YGuhtMsCcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D371F000C0;
	Sat, 21 Nov 2026 15:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795274959;
	bh=p1u89U4m7ML6xsuINKydNEguxcp6HUQl8vcznYUTeTk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=IM82JPyjdjlHKOsshTnIAr+WQvNrmyyJcgFA23oS6s54RL2ajdTSwvdxXojKFKv4I
	 LmnYG6nlgPKkI7E94D95umERD49QvUUZNDRUStQpegDAnVAz7HtQ3i6rWc7b5haJ2G
	 N9hHwCzGFAY93Q8xjQXUzn5zrBh8QIVCWMxwZUlQEg72+xY33uk8G13E9c2W3diDwy
	 qPaHmecKgQoXqkGo6dC9trrJsSrHKbM/IyJYp5Gop+Bf3lonMTc+VbfvAmt12qz5Mi
	 bc8JE0xPz0z6epPHs6L/ZSpYXFDcl+3OSg6VV40Ig6/gr7iqYHKsxWiOlvN+iZdlgJ
	 U4g6wD6spaL9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F29E04BCD2;
	Sat, 21 Nov 2026 15:29:18 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:29:18 +0000
Subject: [PATCH] drm/imagination: Destroy the common FW object when HWRT
 data setup fails
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-pvr-hwrt-common-v1-1-784ce45b782a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM24AWsC/yXMMQ6DMAxA0asgz1giBjJwFcRAgwFXIkEOUCTE3
 Unb8Q3/XxBZhSM02QXKh0QJPsHkGbi59xOjDMlABVljyOB6KM4f3dCFZQkey9LWNfXEthohVav
 yKOfv2HZ/x/31Zrd9N3DfD/nSUn5zAAAA
X-Change-ID: 20261121-pvr-hwrt-common-336552a2e64f
To: luigi.santivetti@imgtec.com, alessio.belle@imgtec.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 imagination@lists.freedesktop.org, simona@ffwll.ch, mripard@kernel.org, 
 donald.robson@imgtec.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795274958; l=1761;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=gTwojV2jRtpN5KQz6nKYwAtp0ctHyB+2xD/Uq99tn18=;
 b=fUJWQ3b9eG2WOJijLLHTxd2hrgzc3IQsxR9Wa1uYizjt7UAmN0zr4RFfmXTC0DUwM0xAaI1R+
 a7k+iYFMlEbBng0sRa0TQdAKsfgNfKlS8QiHdzy/H90yh4hlipzRQ+B
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

If hwrt_data_init_fw_structure() fails in pvr_hwrt_dataset_create(),
the error path frees the per-data FW structures and then jumps straight
to err_fini_kernel_structure, skipping hwrt_fini_common_fw_structure().
The common FW object created just before is never destroyed, and its
init callback data is the hwrt that is then freed:

	err = pvr_fw_object_create(pvr_dev, ...,
				   hwrtdata_common_init, hwrt,
				   &hwrt->common_fw_obj);

Besides leaking the object, this leaves it on the device's FW object
list, so a later pvr_fw_hard_reset() calls hwrtdata_common_init() with
the freed hwrt, and pvr_fw_fini() warns that the list is not empty.

Destroy the common FW object on that path, in the same order as
pvr_hwrt_dataset_release().

Found with a static analysis tool and checked by hand.

Fixes: 6eedddab733b ("drm/imagination: Implement free list and HWRT create and destroy ioctls")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 with clang (W=1, no new warnings). I don't have PowerVR hardware.
---
 drivers/gpu/drm/imagination/pvr_hwrt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/imagination/pvr_hwrt.c
index 05c68c78da22..6057f8dd1eaf 100644
--- a/drivers/gpu/drm/imagination/pvr_hwrt.c
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
@@ -487,6 +487,8 @@ pvr_hwrt_dataset_create(struct pvr_file *pvr_file,
 	while (--i >= 0)
 		hwrt_data_fini_fw_structure(hwrt, i);
 
+	hwrt_fini_common_fw_structure(hwrt);
+
 err_fini_kernel_structure:
 	hwrt_fini_kernel_structure(hwrt);
 




