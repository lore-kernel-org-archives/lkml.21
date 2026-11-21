Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296183;
	b=Fu5ioUqa+g+bfFwuDidFuuVKQdOegZaIEekW0yBk6K+wCftE0F+bOFd5Cvs67NjKe1RP
	 RvweLrzXARlwLa4l0kMFxRk3+mA1m7HZkWfjGVJ81qq197bovMDzKjqoaqUIObfXfCKhY
	 hMLjTshJoRNkOWDtqBw+IF8C4nCMRcP36zfIeBRgdMgPfla/te1PxKfxkVm7zMikCN98P
	 zNMV5+Z/zZ+u4tam7PsJbsNuQEA6GL85azOOkc+VJ7OkJW4mEhg9C0VCYKDPEAL3CJENe
	 MV3tlnQnGSd4gCLUFlEq8xWatd8Z59YxoRb8dEssO1xyvo9wfUqCaFs5ZzqVxuI7PQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296183;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kPxefFj5DZD/dxigVwgPLNCbE/33TaMQjOGL9JkEFwQ=;
	b=3TLA4K0pHouqNYzK3gAauTK/GHAcTjt5MwlS2lXyJwn6H5zayPTle5ajLSHa8DrdcH+G
	 LHOpz9lRVDh0CdyihU2CiUCAT1FMAme7QofsvYmSK43p+gnNLF9pErwtqzZC3BTQPlYN4
	 B3pj0PQOPIAmeqHxw9vUFaQMh2LdihTNSbGfful4uTmLiNYU56RaoN5Pt/d4y0edrglrS
	 n5Sdw4hnkQ3Nn5+aKqrIpzaRDj9aC8Bw2mD+2jVqOCpxZB1fR5PrrOdFIg9jX0hZSP2FG
	 eKy1P3yK6yM6d1Lgg6AN6SB/u8KFMUteo5kAH22DS4yCf+BMBclqwcuAFuaJpb8ChJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EP36zt71;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A281606A339
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EP36zt71
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296183;
	b=n/nZ/DEvTggvoN7BVzaf01WF6G9/+PtLCYE1qM+nsYYfNpJsahSO9mTGbdsOBvPzJds+
	 Bp5nZSU6XrZQaJ9WL304a+b7M7OF7xMwCWhJIXfVHPiHBx11MRMLPzKkgnxJDDJQ02Hjm
	 sEpw7qKyk3hhZlDdaOimU2Y0cm6r5Fw/bNWQbgPqVQinJYHFD/UjWZ7wmjsc9UvU5BlXc
	 gQXLsXG3wsYzT10SXq9T8zptVgVApyG+feMIl9m4BTD2Xhrtxbb5H88iD6Xb7thsnla8g
	 APYBsEZbGAQwWusqxexcJ5HGqwoy6F79dx/fyg5tlc8w+WRUpccNcrn1NOKIgEfU7mg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kPxefFj5DZD/dxigVwgPLNCbE/33TaMQjOGL9JkEFwQ=;
	b=UlH7qFxsUg8soNaUcGW6YSIDWjYRObwTFG0bysMaErn4WEoR4BDGGIZNRtV34EmjZe3O
	 xRR1WUBd+jOtaMoBcUBmee5vaL86HNKgCy6XYC2LIWk7uUn2k4vn5MXbU7hE+Nbwppq83
	 Jw/JUAnQNiBkQMPWmPbzzUgUjjhyjUGO2nPW6r8DicLpEaxjDaHLzFUjAtdh3hMJDMLRr
	 4WJtk78v0G31VlDppI9aeSvXBPsE5+FGT8S0P604tiEhmGMb1ukAvcu5OOjD42DX4LKvh
	 OHJ4zbXoUwPJO1v0QU2bmTN14ezJ2cm9aI5BwMdqbuhXCvCBVTyq8/YCIkBJid9hhOg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 881AD1F000C6;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296183;
	bh=kPxefFj5DZD/dxigVwgPLNCbE/33TaMQjOGL9JkEFwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EP36zt71vpTsjIr+PGCxh/8UP1R/sdhaPVvqZ0g+Z3SRwEcx6IJSjFAFM59ituyj9
	 T5ZIEd642q9Xg+94NUd+TjuJIByqzsH5MOOA3wsMnmaTeIZAdexwTs94PTJQPYBUci
	 CzcF9OgxZeBO2sExjYZCEdw4SqB+j7GaJSkaxj+kbD0Rbcmmr2decJO2jjSHCu8KVQ
	 DkJwEQSbjVPc3VeL5S3zPGYJ4i5jsPkH+NYJAhYmJSBBNJy33tlvQIm7qLEfIU0sib
	 L3KOdfhrANlnjOuwiubFNK5tN9MxYDr35q22HN8JzeypMsPE5UpkbVfNQk5VhaOcqg
	 jBBt3lA2Tmc6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1626C4BDD4;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:22:55 -0700
Subject: [PATCH v3 2/6] drm: Fix incorrect CFLAGS-y spelling inside
 Makefile
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
Message-Id: <20261121-rd-mostly-v3-2-89e74b23b491@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=1669;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=PNDrfsA84PuTN7eG4zqahY8+OYZihSCYKHCt1mJS2go=;
 b=Q6kceBssgoFt7rOTiEK1VGH0yxbBzkdT5eBxc86olKaz7paVZQWDuXjWaVpVLbEseC9xpc0Tk
 VqMMcCF4r5SBfRvBGFgkAqhtu9XVs9FyZ1VYoWMpKye1Q8lr7TOxUMQ
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

DRM Makefile spelled CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)
incorrectly, which kbuild ignores.  So -D<flag> was omitted, breaking
DRM dynamic debug callsites when CONFIG_DYNAMIC_DEBUG_CORE=y without
CONFIG_DYNAMIC_DEBUG.

Replace "CFLAGS-" with "subdir-ccflags-", so that -D<flag> is added to
drm-core and to drivers and helpers in the subdirectories.  "ccflags-y"
only applies to the current directory.

NOTE: When CONFIG_DYNAMIC_DEBUG=y, -DDYNAMIC_DEBUG_MODULE is redundant
because defined(CONFIG_DYNAMIC_DEBUG) already enables callsites.
Passing it unconditionally under CONFIG_DRM_USE_DYNAMIC_DEBUG avoids
extra Makefile conditionals and keeps the preprocessor environment
consistent across DYNAMIC_DEBUG=y and DYNAMIC_DEBUG_CORE=y builds.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923..4a93c09f08d9 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.warn

-- 
2.56.1


