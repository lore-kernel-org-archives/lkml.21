Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195145;
	b=Vkmt896wEINNnU4j61ZI8b/6MF/jo5Zx7jlFPcx6scjyjqNxUfB+XEwMMdgCOw2kcyFj
	 dQgIuubMKGcQQk9WeeSkgb2ovR8bgWgnBqPaElz4I0hFdAXgyvQC0C9epoSVeEfiBxmpf
	 BQ3zM7+kII4/8He3rOeW9eft2b9otF4ECZUsPbf4/x8/ZMGYOJ64GR/Okp7NBoLSni0B9
	 /Tm3pc1DvYq2hN3dYaZLDAzjrouJshpJZG+BkIo95a1U5NDcckllQzqSpwNP8xUGNuU7R
	 YtLncKD1nLpCuaFyD9FF9zW988vsd1R00dHF9XBpfqMpdbyxmMDLNZaEAbrnkLhwWpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195145;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sXmqx/BpyxR0AvNm23D/0Zb6NYTqs5DaHn7y+tWuYsE=;
	b=Ye1o1UFDGS5OAcc/bCbXA8uVdK6gL74nMpuFfPyjdFSVdLjrNqQiQ+n6QtArsT3VUuGE
	 sk+eBv5EM5Lb6hjenQi5WRCEEC1vTQCmoGM7nwkw8TCShJdPkgmb6HQR1JN/FVwDFvhBM
	 KqcqhVK2Gzb8cbP/6aozRmSqw/LT72K3IO2BMZJNU7uhbPEnkYFkg7acR+pFM0aKCbxyc
	 1OtVaBcPkunh5xJO7SL3zPwU8MW/PwcxXTc1127P2xwSS6qJ29d5NE2Nivl/cGfKY0Q1W
	 UyDym6cG4KwP/KLoQ72PpwjGacozuNRyHq8BlgE5Xfx40f961TDHdW9AMGIJt61R/lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7WEp2gn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5060A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7WEp2gn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195144;
	b=i/mtdy3MYuIhLRvI1r4fdgVIZRJ4ttT45WVm+HSzDysMhmACw1RtDbJZTEVxanJHs7Um
	 v3IIM5qb3lsDOEwsIwZC0ftdE9et0d212niX8PG6HwrPp6B2LOfUPwHA5ji+78bSHd6du
	 mSWlKzPjWzUEo8zmQ2CI1SyroNwgLVwHEhZs7lQh16e4XDk86CBBgfJEw4zjmbd45LXMg
	 KBWEFas3IU4N/P/ocXmE6r4VnXnUeMhOCc3pW4tAE6qqMa6nVdak4t3Snt3NZ3By57BQY
	 ug8b1M566Ef4JnG+f+sF1kY4Qia8v2jfy9vJOsy4EwVZx77QQ6FyNmbPX2rWxwvXYbQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195144;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sXmqx/BpyxR0AvNm23D/0Zb6NYTqs5DaHn7y+tWuYsE=;
	b=TD/PklK08KRhJIc7rXcP4DQKb+XC0XiNNzOuu0aPj4GXyWXFHfZbbZvtq7blFkkpTzxN
	 1n2Fv6Ef9SXaUCaJPjdloI6BcKObXRsHw+CdPyNXYIG/9I1zqK/Mt2jHDNGdw/8C5t8S2
	 nowBKYxtTdQ11TZEK0Hjm7+AcSlzVPMh9tbGy15c+++u5Z75LFiz7hXzD+Q9frJQBk08a
	 3x6kiCpjq4dfsG5tOYBbWg8rIHUqHAbfpw9Sv6COcoiD2uKHjVGjVQhIWVCu/mIggG2Nh
	 vTcKWl6tdq4NBrvCYyD+2FUbin4v2MMfYFjNZ1iiKTyQxKZE3pnWDRPaHaSlTbBf9Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B27BC1F000EE;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195144;
	bh=sXmqx/BpyxR0AvNm23D/0Zb6NYTqs5DaHn7y+tWuYsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=h7WEp2gnisp4cDW1LbH4y5G0hV3NX6azeR7RaJIASAuU8lq9P5jfvR3A7sYLI3D1R
	 WKGYSjex6mXP1zLJ7j3H4RiT7TcEmnngnuj71UWWT7hC58ZBQ2ntCNYHX+iLsRk5Zo
	 fDv7EOV6DmnYBJaKcFldEn8/fLWAvay8UZ8mWalz/H0wM1S8L4aIoGdMwAjeSw3Xx3
	 Ikd/cPZ3hOyWbI8F2zhJFnQtcXy0LxEFZLg/haVA14hRI7QMzNP9wejOGPkZ8PmLhm
	 CkB+in7ETiMTDgrn/UgrkY+LhN/BLRfITd0NZ2dIsanPfPyPuyEJGuHZVA+ZUTjr/5
	 PhZMY89t7/abQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 411FF4B879;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:18:29 -0700
Subject: [PATCH v2 2/5] drm: Fix incorrect CFLAGS-y spelling inside
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
Message-Id: <20261120-rd-mostly-v2-2-88056ede02a8@gmail.com>
References: <20261120-rd-mostly-v2-0-88056ede02a8@gmail.com>
In-Reply-To: <20261120-rd-mostly-v2-0-88056ede02a8@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195125; l=1720;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=hMEQq7DQ8Y+8kFzLF6fjt/pf2mXqFlMk3/m9BN7qO10=;
 b=YGPIoRWQF/LeWCs3OVwDqa81HNhlz/XS0XwldnHBv13k35ZLbsQgDT6QfQLMW38XDWpbrFC2z
 5ZhLXANqOUqBT6jUzvsBuW3ahyszHwZ+lljb5fxgx8pzv9mXADnGmL9
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

DRM Makefile spelled CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)
incorrectly, which kbuild ignores.  So -DDYNAMIC_DEBUG_MODULE was
omitted, breaking DRM dynamic debug callsites when
CONFIG_DYNAMIC_DEBUG_CORE=y without CONFIG_DYNAMIC_DEBUG.

Replace CFLAGS- with ccflags-y, and also set subdir-ccflags-y so that
-DDYNAMIC_DEBUG_MODULE propagates to DRM driver and helper
subdirectories under drivers/gpu/drm/ (ccflags-y only applies to the
current directory).

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


