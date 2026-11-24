Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795563525;
	b=uwVVGUH0ii5qQDicfmoDdwFyr0XIjzasaDpE8npe7Ap+uWiWsgMa9oizyEhBZJTwtypS
	 IhIsPE0DgZOzWvGXDJ+E4ZKFjLz34wGgvjV0O+KD1w7uo1Bx+6exPBL32SiguipZi2Ud2
	 ONEpiaYXf38LOw0U+Zmh4uv9ehFjPR4L+ar3YKA9gfXFq4QwOg3Dik/t3dmuyOj/9oYus
	 KR0/28KcoW+vWcFwjvqS1CjpYfJyQbAp6UiZKXGfCqufj1w5U+xwrJ/przsqJFW1DVo4L
	 RR7hypjdntZtJdcGWRxaqk6qg9kw0octqOp8Cn1JEQR2cfFTfGWBbqqE/rS8iuKFhgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563525;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=We1e948mOaBzb1CSHWditFMjKCZWojb84Gd7SLIbn2g=;
	b=QveXLI3lztzY3ySS+Vi7gFAEFNAxWe6hYbywNsq+MbX00ruTpd9Ip39NMj8dqFMfgo8/
	 V7f98LTG39hBXRNOT/H1ik3EFNJyRSa8bKkHHsC4JEpVYboLK7XxdmfP0OSbcsKTPAU9f
	 Il9enP3UPzlxaa/bx4kyRPMjlPHu1KVcI5/eilQIdG6Y+UqDoL17M9/5ycbFUaOKRHXxq
	 rLnwhXW1RpaF8FVOIWst7iQCTqBoa0eBhjoB4G2bnsmG0zpx32GSoQi//+GNoByEWM0el
	 z5ml/fr4VfTnmXUXFK42T/Tyc8CD43UigiJwYmkKmve2IHxR76uhE2lJylXRY/brzow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWUp6tL7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90033606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HWUp6tL7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795563525;
	b=y8glG74/KSuhprIB0kb/KxDJTPTSZd7wq9gpv+76BMgToZv9R7rb5B+nLy1s/3tkaI9G
	 BsToPaIYAoujRQaaTa3INxn7JtQZk4mg2c+MxezTMtahPZyRwTkmd1GAekdTzUf8AOgvN
	 auNO1fjFyA9u7/1fpRXHS9qt3/qQQFePW2/Ir+i9I4djUbWpPyptkeGE+tsqeEfHH4//d
	 24GQGmKyO5YrqYdrNML34G24f7Tc/Qn9u70hGjUPxRlskW6jzrO+o9gU40ZUcsZlyMZbD
	 kDrM9BFpFvDJNWMGjffe9b7dnLxVIzEq+XazmZrZPoojZlkZWaQmaa8uJhYFGV7QVRg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795563525;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=We1e948mOaBzb1CSHWditFMjKCZWojb84Gd7SLIbn2g=;
	b=vcklFKxQDgb0vwY7fsz/hQBKNt+SLIKDeII4QXniJTmq+NsO8yTar0jzy4aWUOAH91gw
	 IE7919CYoZTkjyl2W+e+xbGiQVpI+hD72heVymq05Yp/ltfKQIJhefcnyAVc4V8Ta6FzC
	 lnqxkEF3MlDLw8usUAbuR5xJ18BMCvry4KuPDonfFlmQvbHulTb7zQ3akSuAQIJu/RR4Y
	 hK7oI6ZjY8mZniY5POEVCQfBb5NvKIsddMVSSeSaHP+HWyLi2avmhNemyH7NA+gUT0ueG
	 1mjaVprDhOWIy+jP/NEwzhRlgHIN1QPt6HkczXbyXD0nfWzsBluco72FAHqD6dUihig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98C131F000C0;
	Tue, 24 Nov 2026 23:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795563524;
	bh=We1e948mOaBzb1CSHWditFMjKCZWojb84Gd7SLIbn2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HWUp6tL7q9O/19Mx0eI5XCwWbew+EyIkoJMtS8BzEgMTXxNnnJZWLc85MPqo2KEEV
	 qXRIX96gD/uTehosRKZjdN9vRGW7lrN1Xsw5EGOgw1QH8tC/f/y0i7WcUU4vTCdOq9
	 J7eu7G3Dsu3qZQXPsouD5CSGs2pEjFHW1CSa5fZ+dRykK0cVA3qDXqHEiwxqBkoWBn
	 P8zC2L5O9vPzq8CkMx71HPywD6AmiicHKHZ5WvxdvzZcY3Ekb9lJYNWuG03aeTErY+
	 UOHDdLEvI6k9ZBIDLRmLdQG3aZ9A+bU2Sa435FORHzxtXTML0JX6nQiXXSskrZcVEO
	 4rbLVyf31GaBw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 212BB4CC53;
	Tue, 24 Nov 2026 23:38:34 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 16:38:33 -0700
Subject: [PATCH v4 1/3] drm/print: Mark __drm_debug as __read_mostly
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
Message-Id: <20261124-rd-mostly-v4-1-26d60beb6666@gmail.com>
References: <20261124-rd-mostly-v4-0-26d60beb6666@gmail.com>
In-Reply-To: <20261124-rd-mostly-v4-0-26d60beb6666@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Luca Coelho <luciano.coelho@intel.com>, Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795563513; l=1190;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=0kwXpdVLXiB5IO7ltNhfDof5ySe4FrwdEVRL0SZIEB8=;
 b=ul6W9MBN64ibnfJ1t5pYRmaNb1F+Hfvp1o7FmaC3hv9ACtMb1yyUs5cOGUlWmTokyfZXA7HJT
 XyZa4ezFnOSDk0/oaBz0hjYC6x0G1o5THepmYG3klPWLsie3HkL0cbt
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

Under a multi-client workload of 12 concurrent vkcubes on AMD iGPU,
__drm_debug is read at ~83.3 kHz across multiple cores during atomic
and vblank checks.

But __drm_debug is written only when userspace does:
  echo 0xff > /sys/module/drm/parameters/debug

Currently the linker packs __drm_debug into .bss adjacent to hot
structures: drm_lease_idr_object, drm_class, and drm_global_mutex,
causing unnecessary cacheline invalidations.

Mark __drm_debug as __read_mostly to relocate it to .data..read_mostly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 86cef1a37678..50cdeb1b15e2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -40,7 +40,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned long __drm_debug;
+unsigned long __drm_debug __read_mostly;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"

-- 
2.56.1


