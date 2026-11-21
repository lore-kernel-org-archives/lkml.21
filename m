Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296183;
	b=FGZwbv4s4PWPNmZLEDuFXNAIDVpLTbx+zFJbyogbcAkK+8eR3U88ldInt6OJXqE14qtt
	 pNg6JOOrK2SnX41jVbgiuaq7QhHoaX0jpwvZvHSir4XzaiB/t9mL9iT4YB4QEBdYIeO9r
	 u8UF8KsTBFfA/Q2Nqwu+hc8dk1kSFqKIClc0mkLEY5HxvxI3y+PSy4cBoabR+BSIER4lO
	 svxgd4CNPXml9sG9jkMsrZ6jQRt+06qW3z0tYWF3iILnjNHRXS/dgAw/bX1uLDtrCDx8f
	 m6A4oLR5T2P3qEswNVkeDQ0keShosIowVbVWHsc5tJ4PrLmVjQtnNpFC4UIPJ644tfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296183;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3csgu0tjIUZ+obCVSJX7VQSV8oTLlItzQji91gW6nIg=;
	b=SroN9pduObvWjrxRqYAFU13yzFsB6IS7bG/MgkACLM2rBO8AHxiwB5nfwuiOhSFs+GVP
	 ySlsD23hx+wwLKBuBsOC3oAerTM9tR2tOEUtMR4cTzRvA55HnvOKBqSuM6MbHBkXDh0oO
	 lyzqNbSkuCT6/80b+yJWQKmMI/GUaHKQzM+fHqnMiVuWfh8iHkCYg3ZIOXBtPNaPe+39v
	 /YFEAYJfQrUGmxPL+EuA91lBGIPcwMCkpT9B9wkBf4zQ0zgm730uPEOPfrpsRrQPGTOH6
	 hcvOlu3cvKBJc2dLb9kWt+UXzlULCZ4ok6SpxZa1IeFtiSDq7QqXkAaOkrAwbczj6Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYIaEpGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FBB606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYIaEpGR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296182;
	b=DWVxZOVYbw0kuIud2JIjYBmnJXIcD9U1bYRPt3ekb35gPQqeZTFHkinVCUjjtap44vMH
	 tF6s67WhF98SMQogivRBPZQXT2dJMkfgIlSsZDWEiQyIMdFLsO//MWdmOVdbiM9NzYJK4
	 LCLvS9oby7fA08FOJEjuJF9AM5xiLnXE44OHnYD1nDF1QbW875fisrQ03/hSQ+xvZrSEO
	 zIK32kdMB1GaLb5UQhPIkDmPTI59eYGfLKjUtV8GSYHfQ4FEZdh+OnoIuYr6whg4IDOQ3
	 uesYD6HJCqkU+J+6pLmn8IGLEi26z7d7pkAFFAIuiEiteEvfheEEGRsYVoGqo69NWnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296182;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3csgu0tjIUZ+obCVSJX7VQSV8oTLlItzQji91gW6nIg=;
	b=V+14JfbLwqyIbXPsvBDZPOf3fGKuzQAazd4Y/sHbBSBpI/WTD9d84lN79NWoRsKBhEgp
	 wYwBGq+z6pu2k7y6OjJOUrg/mHrA4EoDMErjG05FiWzcLr1/7XLrJdDnqiT+o/2keVcXw
	 8YEqCa3s5XAKIi6mawuuxOrUIJEwINzCJP+FcHJK0A17XTrzjMafYt/5B5oz08uCqK+gt
	 0xdn4g9IkBW2UtXI+AKoXyoY8e43T+8eWmAopSxDYul7khJ2wPvw+g/mOaUP3mGGF1OPn
	 129xgJcNq6b3ECTgw3zNv2sYU5JY9U3wd40/fLsfwQvxENLi3/scVvFV+ozKUFbpSsw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A18CF1F000CA;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296182;
	bh=3csgu0tjIUZ+obCVSJX7VQSV8oTLlItzQji91gW6nIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OYIaEpGRzsPO9QpHqSDtHtdSPVCndp2MH2DLT3TOMbYnYpIbUd6gg1um6Uaks+1bj
	 23HaXH6v0wHvn9YC6kMNCIeSTqo9kON/Sq1JANN8l7ToGcmWq8ncncCfA9XGTuYfl4
	 /x+0Z64r3TRwqkpj2YjLMLwj1LPj/w/LXMEtY2GYjuhe2U7WZUM7eR7qWpieSfYrhE
	 gWclZ2E5FHGujh7ueNdUqPVey1/WToO5SbwdLMsEhE/ChDXjda1OQjqk8C1GtfTbnD
	 9WgaAE/aOjfGAoSgk6tQEgfxQt09mkpzI/cEK0zYcH3NB9omuHD5mznbQ3ojRDi0es
	 qWry0ap+iBm1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E3694BDD8;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:22:56 -0700
Subject: [PATCH v3 3/6] fixup-makefile
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
Message-Id: <20261121-rd-mostly-v3-3-89e74b23b491@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=715;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=UbYmJUbYozcybXjWWNTdliSZ+bJNJebHuGNQgVyBKs8=;
 b=W9b1h0CFK/+FvKXIc86Uv20na8l571YFEIY8hv/KYVeF/KJ6yWBD1+YHHC2aZHSmKfszziBsk
 H2r9xLeXHWsACnP7X4V6/Fp0asDBnR81nl5hPm2XvVOlbAQDWYlFoXu
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4a93c09f08d9..2c0839b6d648 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+# enable dyndbg for CONFIG_DYNAMIC_DEBUG_CORE (ie mechanism) w/o builtins
 subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally

-- 
2.56.1


