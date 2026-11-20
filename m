Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195137;
	b=ZCBtCpMydK5DLqX54BgT471Nwu1MpjjeYCS0KF3yR2ybUT6N6J3zOIm2NCrJW6KpUrpc
	 CIM5KdnuSOIwwDwuJhq59K2r3fySp2fVujK7A7pFnXEnszTmIQOiVXbwDAxU1LOprePc+
	 fn/SnYAQxC6Vb/ylb5krEsM/O+MW6v6mPJf1PEp8t97Vt7aEYZ+0oplhfbZ1w7YFw/VC3
	 iqJm+0PRDbSqSr4ENNPJDqTTQD/GmGc+d400Mqq7kgAoMri5HDIAOBi1M8QLZ+huHI4nn
	 5sbZtdoUEVQ2QsOTvaJ+84DjoKzGjhdEGmweLuFp5N+GBSujnguwNWZrajCZaa2yh5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195137;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kw4/UKpftipTC+fFWP5rOXFEJMDwlmri+nW/2RqDwDY=;
	b=FDjA/AWK2qKM8rd5w6lhZQuqeJ3nmVtPP1tPkDG8/rKap40Q5BPuOPp1Ir86XrA3A+1/
	 RmSt/s9eDVQ6ST82ixjLcviR7tHvHSlP+rAjaJE1kRHJTHkojIRlfoyaKw7FrnZJvoYSF
	 Is/COyPKewEOAxQqX3/M6Rl7AAZy6y3G3QZRMrL8Wu7tG1/HNs74n7Uru2Va4PzVF6S1z
	 nX79EZIQiGZ+3JN23x+u0GjMica4LzOkKk4jSnq4bXbscm19Ae2jVlHQtsS8Heo6ZtV4v
	 jw4Gu1zNzhwPA5AlH5wyhjvvjDHh0m6DHG/YQQCjQq8iyOfokJrwoXjM2IgWw+PCI5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFhRYFLp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3C60A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFhRYFLp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195136;
	b=RBM1C/KXZi+hNHFqucSoDH67OWpmjpyB2aesSROAmNtpBt0jbTHBUBjbSxWyupfJpP5B
	 +ycqLq6meguTLgC3DX1kyPRivFJ79TKMmbjqTLfOJLuQLis/DHTTOiRPh2eUlkA69TOX3
	 ZSlyzdg+phlQke8GbW6vPHNrm5SVch7Vhpomb4KYseDitsGY6PJuhwqm0z2Bc5Rs+6zU6
	 0Aw4pwe9DcFW6FFTYPplWXBVRzuLrwU6il1HNLdIxVw43XeLb34ZvTHIZQBtBXpqMjfzL
	 fjtzYvRUJbCxIJ13Zt+/xr9ZphDRVOn+LGknxL8uyzZ5etENjKcc3bMvg9ubU0o4Nkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195136;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kw4/UKpftipTC+fFWP5rOXFEJMDwlmri+nW/2RqDwDY=;
	b=Y7vVOe8xIy+xU4eZ/MiN8SZmtKMDdxCDGQgs+ls35Ea2dQXPN1ejx+V6huBiRnZQeP+c
	 AG//etmhm2aeKIEcJkoCgg9bcGATjBZE203eD44qJljTjUXfHYXfVpLErEDHTK1Zxs/Qz
	 Gyq34bJgGw9/53VFVzqBCCqYUV7ctpopQmZk6zSfwlNqk2T1EqOcaF8GacGAbmiuzBsfx
	 6pgrioUo9elTqUrat2EpgICNBrMJ4odFGjhUWujtKmJk5TSmwrd4cgEhG1S55O4ImX/fL
	 U0NuE/6vouYLRDHih6qkn86iax2RsfrMyNsaixf5xtGos+yzybW31uByeFHDYEcxiRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B08431F000ED;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195136;
	bh=kw4/UKpftipTC+fFWP5rOXFEJMDwlmri+nW/2RqDwDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iFhRYFLpan3a1PJNRTxktJqkJJu57OZRDz153RJmLb4RSnM4GqdRBe6rFHpeQvWSq
	 BoBumLIN9+B0AS9X9+tnZRBZnEbB1QfcICIKT0hRDtzZWcjbATOxNjhI6OpueVk2Gh
	 o1tv2Pl6CaABYcTaVQ5+tTTT3IfRYCE8DyQ2H6uRYiLjj+XIc57dMoSHrlChVNNbpr
	 4+VSgY0eCz4Vx6IYjsQ8muDeid4pHEkZJNZpK/+d1wB5nloRJVigryiZ3ouBRtd3uf
	 CGboOgy3vLpuEQe8A75+ji/QMcu+iPsJid10XW3VGU2OoNn/f4kUFr+qVwgsDGJ3bz
	 7JWTpVxhF71og==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 27ACA4B875;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:18:28 -0700
Subject: [PATCH v2 1/5] drm/print: Mark __drm_debug as __read_mostly
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
Message-Id: <20261120-rd-mostly-v2-1-88056ede02a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195125; l=1186;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=D6W8tWtenIsgiyMreYC5QW/B6n7BcZ65dGqNb/9WKso=;
 b=EQ3iRicgTPMQeDQToK9ggtxKErp1GhG8LYdE1ZTJqHpAGA0HDp5shlCwzPR3lLHJERW4yCqBq
 uLj8w6A5p6zBe19QikAynfPWnXCwmZeMogowG4HHWz0zMdGss9yEwN2
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

__drm_debug is written only when userspace does:
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


