Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795563529;
	b=wTnwNzLyKLDFelxIdNH9per7c9jBymNrulYePLD6j5nrCSs54qybf8qQZ/ZSPh6ZZvWh
	 /ASZBaKMpPvmkoJ2d51PZ2/d13/Jd01DQZKt6mJB/t3/8oWAkRvSPH7Y93m5m+TuYQB2G
	 +ORUFz62/qIg/XqO9fuzFrDwYmjc17ZkVQK3e1qpS3g66NeqviZqmdvKLKAbQyF/ONKEq
	 Wo+vzDHMPS3Rwv3+xrVdnoSu/gtG/p3VLPCZ+z7hTRSmDCR42whHTajm2m7gzD3h7MkuM
	 zrk9IfWZRbZzqPeDcqUuT3AI7vIRTyL1PeVTvXe/URHpQv+ow02xftQSRsPcno0C9uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563529;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oHeiA5mLTrxkSVLAJwJUXu9707GodpfsoqhlrqiJ9S8=;
	b=Hz14Le+7XvIyrlATcy/1T72NOKH957rFiv0kwrE/2DaMqV7sl1glEQeriliT5MiBuuWW
	 Lz6YmE96xuy6Dt2N/+RHhfaM4UlEIBpnXsd/EIrAqWedIEymidwkeUaG67/BHvRn/P9TU
	 GeaaPnhZtPfYmLF81mYzuVAbi66TZo00LZESQQu8is29W/mJIS1ss6gMGK4O671JOnwqV
	 SGp53JQ1hKfaoO6S9BMYvNW2IrlYrNk4hcCln0GcE7E5AFNsXZNc27ajeVUtFPvCYF8x/
	 anzpj5xrK+mp6AnC1V5rujmMjShi7G7QwWnXY1cfPnEp/LjD3/GIYYz44bdqpPtbWSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYjQgZfQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE20606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYjQgZfQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795563529;
	b=mC67zMvAI7axdRkrPr+oTf+RmaB/O2rQJwimDPMD/07sAO8PW0g7j7uf0tdLgLqAdOqH
	 UMGIpq5Dc+1yvyN7MpQ+P4/v1xae178CTrH1I6H8ChmxIZNwEvbTpcqzsAXmN2H0K3g7E
	 Yq5+ZnOdEG7wZr96Uiyplfa0Bb+LDDBcbBuyoH09IX4bjTHjHhf+fnoU+BPe9ra7rh2X7
	 hGGNE6Gax4siVnisfLrzAO11yPokmB/qUp7VoXqJXdEBJNPzwvYjYjdufEeFgOTrTpOx6
	 Aqpz2aXwHJBuqtYGeUMwlry/Dy9ZsZQSpI0h4THQrU05SZwrTsnAqCXgpHwj9+kljHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795563529;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oHeiA5mLTrxkSVLAJwJUXu9707GodpfsoqhlrqiJ9S8=;
	b=O5yAiK7dWkOsXPvmu5HDC0fXOoXed2F2ZX4ASUphWv9PqHLVQDyz9XR2JBt++Wp6LN8O
	 C8RaNEeiyab2GID0dnoXvvyu0ACtJEZjzvkFk/naKzs1LxO7zeVZa8RKtuKqnCzIsGFEO
	 1vaNfZyubFTGmwErWrRJdsacN1rzvB4k/AeFm+OFOYvz85mbs8gxNtUkruUCIPbiTlPZz
	 0fY49sL/o7A2V8BZBvgWvu7VnlONtPT6qnTF0hAdXo9lIDoaofeVTY5IFZnnrllFIZra4
	 irGGGTl7IRvMY2hqpNQFAgetIIpb9U1E4LtCzPw6PDA9V+sYZL+NvMZ9OFDm/0eDVbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5B501F000D0;
	Tue, 24 Nov 2026 23:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795563529;
	bh=oHeiA5mLTrxkSVLAJwJUXu9707GodpfsoqhlrqiJ9S8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KYjQgZfQotj0UV5xxzOUE+zbnzn9s+fTTW0h7kUjHWzykNComLi/snIDPdy5PzmO2
	 p0+LPmBn1qgcrfomGznTSFntzJPUJluN87O5Eob/YnYEgW5Sxi0oNanREMNXq+Ezp1
	 Sz5O6mbuHTLO83VFQXdlbdSzj+pxuyV2WoQnB6ZYShKdAmfD0ISOp/xh26KzVBWG4T
	 wbYDY7WK9p6ANmHnuogmbZmc1VlFP5hrR4s+W5LAstY6D9j5LBK2QvISexue1LMr8B
	 VhKnAV9mfPg3Qpye/MHcA7lkOgxCa/YxmwmjogeVXCKOFBiTdaGgooPRaODuc344ML
	 lWNkdcvdPKPUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 594AE4CC67;
	Tue, 24 Nov 2026 23:38:34 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 16:38:35 -0700
Subject: [PATCH v4 3/3] drm/print: fix drm_printer dynamic debug bit-test
 bypass
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
Message-Id: <20261124-rd-mostly-v4-3-26d60beb6666@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795563513; l=2848;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=y0RWdr4HR8Hk2DeVmjJ5zNw17ifUMWtuwVaP7R47qsw=;
 b=o/UPdYHp3ZSlSA352RCmGdx4bwNiWNRBEtVQZfdCAr+VEeNWDZNiiVVuPpXN/Sg8lqYCYmBXN
 l5Da1oeomWwAxTBPIr2u7bCiiC1yqxmfDqlQtWfq+pOzSgalBs1DPUK
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com
Content-Transfer-Encoding: 7bit

From: Jim Cromie <jim.cromie@gmail.com>

drm_debug_enabled() [$1] is the canonical bit-test for drm.debug.
Commit 6ce6fae84536 ("drm_print: optimize drm_debug_enabled for
jump-label") elaborated it into 4 names, controlled by
CONFIG_DRM_USE_DYNAMIC_DEBUG:

A- $1_raw() - rename of the original bit-test.
B- $1_instrumented() - like raw, but adds a pr_debug(), allowing us to
   count callsite frequency and consider optimizing them later.
C- __$1() - evaluates to 'true' when CONFIG_DRM_USE_DYNAMIC_DEBUG=y
   (avoiding the bit-test where callsites are already guarded by a
   dyndbg static-key), and forwards to A when =n.
D- $1() - forwards to B when CONFIG_DRM_USE_DYNAMIC_DEBUG=y, and to A
   when =n, for cases where an explicit bit-mask check is required.

Later, commit 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm
device specific printer") added a general-use __drm_printfn_dbg()
function, but used __$1() instead of $1(). When
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __$1() evaluates to 'true' and always
prints.  This went unnoticed because CONFIG_DRM_USE_DYNAMIC_DEBUG was
marked BROKEN.

With =y, this results in a flood of messages, and in CI-tests on slow
serial consoles, creates bottlenecks, as seen in DRM-CI on i915 CML
devices.  When IGT causes a mismatch in intel_pipe_config_compare(),
the resulting UART storm causes a hard timeout after 20 minutes.

NOTES:

Drop the single-use `category` local variable and pass p->category
directly (which previously also triggered an unused-variable warning
under the old __$1() bypass).

Because __drm_printfn_dbg() is a shared helper invoked via p->printfn
with a runtime p->category, the callsite cannot be guarded by a
static-key; we'd need a macro version and callsites where category is
a compile-time constant.

Replacing __$1() with $1() or $1_raw() would also work, but
$1_instrumented() adds the pr_debug() in both =y and =n configs; when
enabled it can provide call-freq data to inform further callsite
optimization choices.

Fixes: 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm device specific printer")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 2e7685849f44..3d26483975f2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -218,9 +218,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!drm_debug_enabled_instrumented(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);

-- 
2.56.1


