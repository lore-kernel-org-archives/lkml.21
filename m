Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195142;
	b=IAjwqRm2GyEd0cf/nkO93Gij3JL66VOSPLsqF9v8lN3Z8J8ia8817I/YZWr8WBLXfCcX
	 b8TmT/WNKU/M2WV3ijLT2AjeDSL73norrihdU/BqKD25wXlrGsuogP13s9kwbk6Z1Liue
	 5/CoKFs/CTwTrD+mzePr4vQwb4UfuIevsjgnTBsD45kEr12RT1n3rp2rDzAK08hnyoD7N
	 NSi9xSri5tA3zmlc8LhasGdcMm+BM+Nsc+17z9emXehir00vzZEo6bolTpuUmBXxEJGjq
	 J2t0+xldvf/dy04Bt8YPkcEI03rBTppb8ChmPo509dSbED+LTH0To/nOIk60sIWCzgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195142;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x4XRBq3Pn5wzsPC99XTIJw6bsLuCLk/3nxJnla9KLVw=;
	b=TJ28o0U1wp75hNKcY1G/jYfEG8edK6U0tJVqh/P7wt05tSSb7/a0I+uhYC0LV6ox1r+T
	 ZRDokqQsOVPk3YJpSXOP/ol46ucotiGQ8KMntg9cLsJuC70lnPTkBqJh5wCMU56tQF+OG
	 NUeim0PEHIGTeQ4wpj0tvOuOjpNhyiscBXB7ev+4T5T7WFkfLhBqg+aoEzmZ3/9DPAJG8
	 SBdse9rtMSWTOogKSs525T+qFmjSI0MyG8wS/XkEJVE6aHZQu1Npu88EsPRtoFnIhY/nI
	 U9pR6m4Rtf4xjHSXIfI+lbd3lIFxL8jIVoDkRJqBe52afYQI/j1vAvRDDVrK5OuZHKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DfLzR/sR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575660A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfLzR/sR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195141;
	b=t1DRs09Q1hOlH0tkus3YjKGF01m5HWDRQA9V4eVi9DMRaKi1FEAhLGyFLXFOq6YvE5Y3
	 h9Iiz34pFHeJ5uFvT5xb/UojPozC+5sP0or40E4mGF4X2Qr0JbkM5XHT7nX/5ymHjqaxM
	 ZetZuU9j14nebfhK1IvUZVeZYU1M1OMBYxSCYwTYXrcAdiHSsiQaBrlVFsVQc7+9R4XE0
	 sWQHxLIVW4T5eLIVdo8MpynKvybNBugeBaBB2evOOUJHEyxyLF1+Gws7jOFW7iZhi62MG
	 rP06oq5LtZCEiuB6jLwc5fFlJbve6ZmOKy1V/OjoiersMs6NtjU7bIyA/F3SzTIDDFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195141;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x4XRBq3Pn5wzsPC99XTIJw6bsLuCLk/3nxJnla9KLVw=;
	b=Wydgz3WBij3qcCf8wlfiV0adkBtUNjLeXw4w54ecx9vrHTWY1fB4IYWyKDBBOAehJcRL
	 UQbXagitNlTH+KgO85DJFWfOuoSdYqlNZHiFV2G4KxT2IdMCyBwhWn44RSI/kV4j/KhW2
	 LOnxRDQBRxz74yL/WZIXLUqkIio9anBW3evE/PEnbJFlgp1UqMyYByL/sqQVum/I+NvVQ
	 V6chUzVwCiPdsRKrFO+ZUsL5deUtLfyzZJ5pHZMguAqp4LSuuVL1EI70I+w6IZxYrOJYs
	 V1gJt1hpRflBwon+GoBRfpF466STEYemeWV6DEjRAZE9ZvODwGqXZbrfqwnTimYSD3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57E641F000D8;
	Fri, 20 Nov 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195141;
	bh=x4XRBq3Pn5wzsPC99XTIJw6bsLuCLk/3nxJnla9KLVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DfLzR/sRS1pkjaXM6umRzdZecYpwRvS4ytx1v6hH9O8+Wx3Td+uzqLIx1V2BkLpTk
	 7tUzBaq5aaiEF7WAoHQsNkc1f0j9S8erz8x1sB55sw4nmyrdDcY+pKQv1Dd2ZKHbqS
	 /wmfzq/6/m9H5rs2nj4/kyx4ZnbG7JTaQ9iqoXFL9Js3Fu2pusnSZU/f4rCpZdYRej
	 ahjk+tzaHR/Y/rWcpF7J1iDeMMYEUahWOw7CNZlyeJOSQRgttvRG7NBu9S1JIyOby3
	 UHOvV0GPkD1orTWt28MfE0paW4ytC94z4ThAh+mrsG3KcK4uPizZacmedHM2Atu+MB
	 OMSL7bjFh6v2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8B0C04B885;
	Fri, 20 Nov 2026 17:18:46 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:18:32 -0700
Subject: [PATCH v2 5/5] drm-dyndbg: drop BROKEN on DRM_USE_DYNAMIC_DEBUG
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
Message-Id: <20261120-rd-mostly-v2-5-88056ede02a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195125; l=818;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=FywBSQVzh/O/x8StOKw+M4F1py0iU1srNXGib4Mzet0=;
 b=4Q8U85N1C78yeLyMj63YwqF5+U6ufImwakmci5dnOIkTR0vcUY/p5hPB0NgOgmTxtzEL7NacS
 D8I+sK++SG0DdBHGG2yIIQ9pyIAuGL+NHhbni9gLByaSDk7SS5SJuyI
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


