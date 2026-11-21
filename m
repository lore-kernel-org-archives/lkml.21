Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296182;
	b=2rc5m3dIlzJTp36PE3CRyGEZSyf+Y1f0CtF4AYmurQd48SaMLnGvjCHPilutbm8hltni
	 C4HE8ULTYT6XgEw4mSjjxGIhGFCxemlp+8l8fkx+48WHsNcxlJo3/+wZBtz2ry6M9I7ad
	 ZkAnVS25KojzsBWfLzlCy5bplGqiTjK2cQL0UX6QPhmAOUZQFF/Nsse/P6nPz4BkC5/m2
	 kU8cBsIEgb4vGADBu/IRT3/wHGPxp+qo445aAedkm1WURAgZa66+LouHdjtLpBa+wQETh
	 5WEuYzWGeVkJ6LqUpX/9WxGNRPoWa91jedNsG53QN+xJPzUQnsl2H7nFc+N7QLh31Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296182;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=We1e948mOaBzb1CSHWditFMjKCZWojb84Gd7SLIbn2g=;
	b=EILHxIXvX4Mp+yczKeZjzaVpdLiNzgcBXiebvtjgOyap6W8lS1sHI6NnlFg6de411E7k
	 THaB2u+38M8aQ2B0uwX/FAIyxpC8Vwr5MLKlSgzrx2tJbKHVYtYSMzRQJYFErCsOg+0e+
	 Z5RBKVcNavxge1wFOepzNoEEJfx93peEwRjy7YJh7pM5JjKBPUF9v+DflFlHBHYqKWc8s
	 9kFttwCgOVTpKSGPHLWsN8nkkEIoAbcWhV95dW1X6Z+2eYfGcqZVQUcrgQtIg6Cb2Uuoi
	 QyQV+U5ddDqq/2wybF5sUf+bVjxiKpw16GDlVJZWIlixuZ0xmu9Y/hc+a4RvpmKB2pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEtNxfy8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEC606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hEtNxfy8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795296182;
	b=uTLU7CRAlx00bn6j2/2LHUYaCEP8yJpZCfLv5RoO1i/8GQ9HyUSZhtK2CXzzrwJnBlq1
	 /XjIoxOWH2wekCfU7FuZRt8RueLKb2X9Ds0EzKLvn1EL9IYHyAzonnUCggJBZeWmRQdUv
	 LmBRH/vpWoNaJv/uf+/EJVGPeRvjsf4iy4xs7wYL+5Y/nVT5ll76RVoptxQF7vB+Fs8ws
	 6V1RUwdpAkJdIEydpyXAeCNP1admMC6EqQO2j2s46VVHpl9Uyf5QF6EXY+3QBFbbDdg7w
	 VZXg8q3WdXvM/lFy2HXA/WkT7EFfULRJveVudbDeSxe4RIsuSvjjXGnrOkU2DCdgHyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795296182;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=We1e948mOaBzb1CSHWditFMjKCZWojb84Gd7SLIbn2g=;
	b=PsKvK0GVzOWhhWmF4WX6rTSU6JEaS3+k+tY1AoiUyC0XvHwUJruhW7riCKzVdliJ1s9h
	 SkjQHDxKujtPZ3tQ/z34AfotQ5clATE2yi7GntJaUaRS33GFyuoKHhFgC4berX69+i51F
	 QnXCyXYR6MnA6xDTKg0ElTJTGoJeuU9L3CGItuQXmY5NfNgiH1XTdtc51HVBtoUA9MKoB
	 r7aT83dF+fqchNBZNX22dCIMbjcEYFW9zOE7CS5ZNXRTr29q0MTdmXRQVNQQgo3HZkZ9J
	 OKQdm8Fgl1sAbWqn9YdhdS/oDMVrHIuknOaQYcx5/sTWnK8AwyRIS7JzFn0DXL6wezg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 795EE1F000C0;
	Sat, 21 Nov 2026 21:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795296182;
	bh=We1e948mOaBzb1CSHWditFMjKCZWojb84Gd7SLIbn2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hEtNxfy8pnnLN8/1bc4qymkwhHHxd2cqesT+m3t0FRRbkbpRUFua0tDKYpdo6ZK01
	 u9xQkP+KKNvIMrPuXzi4IfCyQ+UHBNMY57BuibmNZTwKHrmAok2Mk8Tx+b14S4RAIe
	 WYxIcBv9wIGd751NiGgz0jFYV/fHUVmZOVvSqv5uvlvlJ413IgmSkLpB9jQigOPcg5
	 Uv8NA/mx9/4SdWDUU5KOKbksvn23Qb2RJVnsQSJ10YSbJ2wbhkgJ7WLVlA8MwZ29EM
	 UZzXY7d5/qpFqDxXp+BY9fGDpwY5nwZeoua6t3+YrG1DkZA7YIhWi8smSnHTbqxw2S
	 o5DDPrPXcV3iw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F05B34BDBE;
	Sat, 21 Nov 2026 21:23:00 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:22:54 -0700
Subject: [PATCH v3 1/6] drm/print: Mark __drm_debug as __read_mostly
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
Message-Id: <20261121-rd-mostly-v3-1-89e74b23b491@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795296180; l=1190;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=0kwXpdVLXiB5IO7ltNhfDof5ySe4FrwdEVRL0SZIEB8=;
 b=tn6BJvh9oiUTxvJTlzzVM+X6gScHEeV/BZlIdEL2dLB1C4jxADltsnJIs3SqIUhZ92zEra7Io
 YFQ0HmlLoVmC/W8BDUkxMcEFeP/fhOQWX3jFpqeZKzhbGyWT2BevnHz
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


