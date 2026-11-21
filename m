Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296183;
	b=QcZH5i7uT8D7c6SSlbwek4pIlSa4quJJeYvmRi/4nMxOuDCSCylQZoGr1+4EpMcDfJXz
	 QjhTJUlWLsuuUiFHbMpRhyXqoX/9n+FKRJkY5L9jEc6bnF24VOrqz0m7zBQDihb9AqbVp
	 ZHAoHxwp8Er1Qvv/jL+qJC5u5jXltePRmTri93jT8lxfv0rDZ4+d0kTTjgnZ+5Yf7lhBb
	 p7Nh46vrvoIANZKwd0AGFwnQ61IvZQQOnFt7q8hDgxkbPzxndui1OHG+QyWae8BTVzaYP
	 VEjVzd+zH22UlOZVtfOMhNrA6sTFjVpcODCvyUZvCaun1KMEcwVuUYFVn5EcvOZyrBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296183;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x4XRBq3Pn5wzsPC99XTIJw6bsLuCLk/3nxJnla9KLVw=;
	b=hMWlvwogR+3hAnFEzN/SWcJMpBeZWSnH1rL9iW6WoUoToUHBnaTiUaP5Ou+SmBXZsMUX
	 NJyz6Aa30998ogTx/zLE4H5Z24eNjV/xd9rw7RaE1trrKPlNj7KdonnvvAbhcWA36VdWS
	 JyELFOa2JRA2JpajFgqJkWvgTrjec1ejrZBHZQFDppmofz+ufTKf8TGwKwQIV2XnEafIl
	 ftcppubZSNTIRAKctH5+AugdGvR5JHBzo8VzNDjL5Jjv+fSlfEVG3N8DsXgDEj8v4jP/K
	 N61lbEJTC2ejXra3uITbsmjiscPmB/BZ/Hufv56roAsbEDzPnffHYsScpIjg7Z4wCQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5PDbX27;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D702606A685
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A5PDbX27
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296183;
	b=XdAyp6YkuNwUPtcodWCgB00jSXu+/JzG2MyqtzX1jLoXkdxz5e/u6r9EvN+io1QXsjXz
	 4seZzr39mPZ0vCZKK37RvA6KkEdNcbrdPfYIgI2wgIfgULJGrMOHZRWNR9e/QuacDIDZu
	 RxQcNbD4PvH2AtHJ5JTPm0rmI3AztKV8vbbHq/494dENcqza1oohZ64E1DTiN+ql4VaKM
	 NCtLI2ZSfzS22u9mCwK7fHIVntR0FdyeRmzum2OjMm81VqTKpb7E3TlVZNDHq867vkebi
	 frvwoFckobFKvy0NVfk7PbCnPq5SOz9bi5mk+hY5ShADwAo7T8GDSAsKeF/3JhbjiaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x4XRBq3Pn5wzsPC99XTIJw6bsLuCLk/3nxJnla9KLVw=;
	b=aBmz5aln8pRBHZZtiPiD0X594XOst1UbmIeUtNeuEYPuHldR1+VaAKKlKHURQkEIVDk6
	 a+p8d/gUWv/Knl5heUP5u0F48cHddtnxnPkMmOkKO5th4qH2TXiiCgAVlDe51y6INZ96W
	 xCzfYVUDrGtusIOMcPXjvku+jq0LJ4eByyKy32aQl2z+mE5yWENYO3qlhaHhHSEd7i0kH
	 QwM57Xwq+pL13r4ZU+eBumJMX8Llc4MyINHv1Bzlsc/kzoq5G3iNiul/gNjqDy3AH0Uqw
	 /5Lwb4CmhKXw8pk7PXXndk7eymxYqK2Gi4p4d2VRBTuABZukuT8JzXnULkgIq12CM6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C0E71F000D3;
	Sat, 21 Nov 2026 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296183;
	bh=x4XRBq3Pn5wzsPC99XTIJw6bsLuCLk/3nxJnla9KLVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A5PDbX27xNPku/5wBSaZel30n5lcgCLoGJRk17KiS2hMOf7yIf43aq+CHlXrWtE7F
	 qq6iT/M1x4A8jnNW/4k8wW7RGYcIX4HM7j5ZqORO4AiNBL5jmpJfTQTGfnM4cFJdF2
	 DiaAKu4Y/LvfOsWVTuNajdjoF3BiNOuQmLF/7gSWhikETTa2hHAJXKiB8Bu5hcoXPS
	 GJ2dffyh6eIIH5jcP1ktwUAeKI1rjvYsaw2vtqkA9ERZCxE6E0o9ZxSf89/fdFgge6
	 1BEBJEBrWGJURPFfu8pZbVBA3l+edD+mGDnL/KfZGICysqVUFeV3t/5pap8jlHEdvN
	 hKa/lXM0+D3sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 788834BDE4;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:22:59 -0700
Subject: [PATCH v3 6/6] drm-dyndbg: drop BROKEN on DRM_USE_DYNAMIC_DEBUG
 for testing (DONT_APPLY)
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
Message-Id: <20261121-rd-mostly-v3-6-89e74b23b491@gmail.com>
References: <20261121-rd-mostly-v3-0-89e74b23b491@gmail.com>
In-Reply-To: <20261121-rd-mostly-v3-0-89e74b23b491@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=818;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=FywBSQVzh/O/x8StOKw+M4F1py0iU1srNXGib4Mzet0=;
 b=T8tjzcqYU8dNAr80WEMaNe5Y+y9n1HhIv7+/s+beMcEpAeBQQtcrMHIbFoI/02hVK1IH+Qu3T
 4lO67Oy2KlsAFVJgY6oaQ64wM2hUbJBOx4YTCCssztf9sXKlIesd6OO
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

remove BROKEN from DRM_USE_DYNAMIC_DEBUG, to facilitate testing with
it enabled.

DO_NOT_APPLY - full functionality requires the (forthcoming) classmaps
patchset, and drivers/accel/ uses drm_*dbg, and needs the ccflags
additions like for drm/Makefile

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index b909cd0a619f..b0aa56281413 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL

-- 
2.56.1


