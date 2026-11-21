Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296184;
	b=lJeJwFTEvYHzwC9E/ocHa0a306GvEYb6bXseTIJJXrfwRUV0vu6YQJhU/ljACRxHIbDm
	 179vVbsSpsT0HqtukJcOtZbEtboV0T6rg2NJpppn4Wp7H3wuQXdtT81M11XX2TD2j5V97
	 qfbSfd2HpwvXnAY/Q2fUI3k7EmYdGCFGoBgR7BWaO+xfvMmucLq8DAZC97gfuQKZ6gLiD
	 WfHVrDZMmG+47DyXu8PAyWgRoMLY8zKh3HmqY5wSjOqGBeN+GMZsYTqy2LF9rv28uRHNe
	 vk4yDKjZhFxMdphvWLHEMEHKC0VfDrf/FLeIM3zeMJLpedvd9SQDVjGqgXhwqHtYmTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296184;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yh5n9jWo/3W77LwmiI39asuVgN3yT8N8hYH+AL2o/iw=;
	b=wZ+DsmNopuBI+RNfxZCQjbZhMf9SgsHjhtH2T2Oje7k5Q+GzE6JI/rp4sdaFYe7a0az9
	 3g8rgOC+9Gg44QKCrwyzplCoZTyKXbaZS37S0eZKHPqje//NAPzF6sba6eGLDjzwEGQjD
	 FaDaBw4z3xZJqLwBYb+SzqRwX6l17fxeIt0p7EcYg12jf4nB5CCvepkBvR699erCzH/kh
	 7lJKQ78/1yAi3e3KQGcrCD9p5fAaiaaLo+VP4WDlpkqs+T/fO3rfpgBEX3NcjWrhhYDB8
	 wkT6MUL9CTYpx9r6Tg+0fJdSTJD3pkDA/DzvFB1/70qUGRlj6SrcIrpBnFplJhNrElA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsBqPoLf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E441B606A695
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SsBqPoLf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296183;
	b=lp4I8+LLbPPCo7mmeVhvSk0WUApGBOsAzQi0qgenP8Gx5G5MOtjCpkWA1UeThPO2FkTF
	 OlMMqv0WARcwTy5V1AGMMN6dFKAa7pd/kaB2YLN0ucn2KxR6tKaVvBoZrAYSLYmH5EmVa
	 R6RXShpI718+Ml2mELjWjFo8bMYk3LC0UY5QGsxVQFtQAzTF4/33HLHCqdBZnbRHwfGPt
	 AwWtVK1pXDyKhSywBy/tdc/dIgbYQ45Mzwt0WfP7mYdydkT3u70tbxXhLA+r+jT6tmwUH
	 kh4lYpV2p+Ku6IQUnthCQ2tkyu1aTuMjW3/k8Kj8/S9sukzEfnxVju29aSPbAJc9P1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yh5n9jWo/3W77LwmiI39asuVgN3yT8N8hYH+AL2o/iw=;
	b=YjDNPRf8yZxsx6wWukEW2ecmYSpytkF5V1D5ZeiLnqDPnPgpMTPk+ofO+ZkjYSTjMFGq
	 moN6CdkGZCBFvWoE0R5fF/d/K2wojeTZPHXqxeMCVrIGvPhdudX8oB7UytC6ZI8i1d4/V
	 4jGIJjehplStLYyh7ANW2tLyUk6eDbSqvFbFPvRbrlADFczKTBvfvBjKlNZZNIYaUefUs
	 K6/Uv0+HJN5xXvQmoAq/r97NEoQl8UuKJCsr3nx6yUIToHOBVEBSXDBHXfBCBey+u2vd3
	 L3lxEzKlsBN0JPAsFTpzC2keBMfcpb3y00FYXu5LrbosRk2jpphSM25/8//ix8VAf0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAD7D1F000CF;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296183;
	bh=yh5n9jWo/3W77LwmiI39asuVgN3yT8N8hYH+AL2o/iw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SsBqPoLfELPgAHAFiP6D40AcMQ3jYb1hXizl0OTwxIo9bBaLwMPYdstiAtTE0Ddvx
	 BtTY/HvjjTfnyUyJBtYrSE84pmUNHMn2n5LCD2g5ftMWU+F+owTcRHvRn62EOHd9Yz
	 /V//B4uAgyUUDkpIRu5eFCOxYSMUndQjOYa0b9rlol5Gex6ir3veZEKFRU7y9X6bVP
	 9EkAJhhuhjJ+Vtmei4NTyfT0Kx3KWWlmPiQsXK4VmGjPapIScbI6O9pcj8wx2pY2sn
	 2OYDDxCOWT7TOFgPsM2BdaNcGBhMHWpgCCgAQ+j21e1scGI3DJCEakn4wpPwoNTsjA
	 wU2M/ZJuNag7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 47A8B4BDDC;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:22:57 -0700
Subject: [PATCH v3 4/6] drm: fix config dependent unused variable warning.
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
Message-Id: <20261121-rd-mostly-v3-4-89e74b23b491@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=1091;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=WYqgqfdXOrDq4v0yuAR6MvaJ1SIWhEUIBbzt9NljjaM=;
 b=LMSMZPR+lY9Fh4RkwTCk2ofmqp14vTuIwkzmmaCGG/duE90zYP0v7KZGb+Pq1byuRkZBhopgp
 arQBWsUXqovABonxmNiwQrhkB+m3ufYqy+kLcpIULOmrloONwmSV14v
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

__drm_printfn_dbg() does:
      enum drm_debug_category category = p->category;
then:
      if (!__drm_debug_enabled(category))

When CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_debug_enabled(category)
expands to `true` without referencing `category`, causing an
unused-variable warning/error.  Silence it by passing p->category
directly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 50cdeb1b15e2..12b95901eb70 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -218,9 +218,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);

-- 
2.56.1


