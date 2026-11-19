Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108009;
	b=HYoZKPBQYUWnwPrHtKcD3z6+0lhi3BlZAT6w+tKD7cb8+61NJ+5AKc6DWJ0KtvvBqnl6
	 xteq5gGrOFyUWGGG1JPXWcJScnQLGiA0iOfeNPwtKP/XNUSm3MuIk2Q4yoR/AaeIFsNNS
	 wjzIuU4ihyVAZcYscUSBOvE2Lli49aGTJfGa411Q1y2Yv8Ukb88JnxzT2CrdGiGHqzwon
	 Z36ioHn+Flng9DzWvnEUhLGYNSqKrZfARZZo7miiUAhtnOpZkc7yndc2WHpkoByO5H1Lv
	 LiFgOn0e3pT+euRE7hbwgkiDFuTmc5WpkTmptr+kCUBLuLgvmn1AyyL6lb+nEfJoQyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=S+ehNx9nxe0Vbkw2VFM/NtFxwLazlnXEs5+6KOboXyw=;
	b=1YoNXkbU2xN48n44FdDp5W0ScY8b0O15VsqclSjH1+w9+0QJMNY4BgO5JSCcZRzCCwga
	 9Ic9htkfPoSAbJYUiQiwp6p7gckxVACB+dB8KEfJrqdOnZ6LfvoByoKJUQRO6OY0kttwJ
	 R/vnYaoeTTxz9kqPR88SWgHwqoxntf+a0LCeyUBp9DMzCrFt05l4RwUpv5dFdn4xXofCi
	 9ffnRFmmXHbo/qcJ15jh7V7h8Yf2UTST+CcWaK5ZsgqxeeDIE9HjwHjYUs8WEKBHIN/2k
	 kBufKBjAu4jeBwNyW6m8P9yxRPhYIy4MKVl1xFEYx7YOSr5Y9sV1hBAEzZRmEC/hYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BXFzDbRv;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5482F606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5482F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BXFzDbRv
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so1906759a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108008; x=1795712808; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+ehNx9nxe0Vbkw2VFM/NtFxwLazlnXEs5+6KOboXyw=;
        b=BXFzDbRva54ExaHHYyBmzwPKi07QFTgs9qXJVRQ4c/dp4vrYZJFoCefO6tv/smeR4e
         h+cjR31WN2cWM9XKsFSo2y9/ClCeipVSuhcf4SnxRvewLnkSCcHRHePh3vnWl796Y2SR
         cJqFJWorIuK2N48fKTXSSAq5PCJJEjVN+/Z86jNVKsmB3NF2Ue1oDa1UuPs4jiiDSs4Q
         0fbTrlyMJ8MP2IfbP0+d1El3ksI/9wxA6FoS6vtqHUuKktTcqBlRPUt91EvIcEqbTfiA
         aPiQeNG9a1IKhDOoj3WcyDX3Rv0IW85tAv2o+M+aPBWJ+NaWenB5ewGrD+MwjJHhidSF
         3nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108008; x=1795712808;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+ehNx9nxe0Vbkw2VFM/NtFxwLazlnXEs5+6KOboXyw=;
        b=k1GGv0Tgp3WkHNz75A2/8/78G1eTVL+E3X9l5IqLhC/djVgUJCf1Rq7SXo96uBMJyj
         2kWtDYnP5EgrDrQrDbBLKEZhPEDceIv/7NFyEU70j2ffeTnYc1uqaeueg8jE0CsvAj/C
         Q0knKNUFeuee6Wnx/c/TCBWbFXhXaKtNSbYrhEHLhGnyCrr+LPK3a74k/hIplbX6jp0t
         Iy212edLdp084lfsa3eBI35LqOYQTtR0zsDcALgIzRp2vYNceGBZklAHAbx61zzaG06r
         cUB0LY8LPSvbr1Y9uUlolxMDmtUlVypdeh1KLrDM7usyMeG0Gm6DXYAfLtmSiJGDb6bp
         gliA==
X-Forwarded-Encrypted: i=1; AL+hErE0VyfV7OTr1DZ0viBPXvRutLSrYf46ZVVR9Z9+dKPogd+hrec7/JCm3pG7emdFSVYuHsqxAeJoj98XcyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pMhmU63rvjtrC39N21zV6jmC3idxfdkN/ASNw4YpSpqZgqhux
	uvf9CAyfh1tfeWvQpln86uxoyszPf9UZS6pf6kodWEoaaOn7vr1R531jdFNdIHKf8pcewyQWHPN
	X1eh21m7VMw==
X-Received: from pgfv2-n1.prod.google.com ([2002:a05:6a02:8742:10b0:cd8:b543:4c4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a28:b0:3e1:4424:8f72
 with SMTP id adf61e73a8af0-4014d35cae7mr249471637.69.1795108007517; Thu, 19
 Nov 2026 09:06:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:42 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170642.1521198-1-irogers@google.com>
Subject: [PATCH] drm/i915/display: Pass crtc->pipe to intel_pmdemand_update_port_clock()
From: Ian Rogers <irogers@google.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In intel_modeset_readout_hw_state(), 'pipe' is only populated inside the
earlier for_each_intel_encoder() loop. Later, inside
for_each_intel_crtc(), intel_pmdemand_update_port_clock() is called with
'pipe' instead of 'crtc->pipe'.

When the encoder list is empty (for example on headless SKUs or VBT
configurations with all display outputs disabled), 'pipe' is completely
uninitialized and indexes out-of-bounds into pmdemand_state->ddi_clocks[].
Even when encoders are present, every CRTC iteration overwrites the slot
for the last encoder's pipe rather than updating crtc->pipe.

Scope 'pipe' locally to for_each_intel_encoder() and pass crtc->pipe to
intel_pmdemand_update_port_clock().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested for both i915 and xe under LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on Intel
Xe_LPD+ hardware.

Fixes: 4c4cc7ac207f ("drm/i915/mtl: Add support for PM DEMAND")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 6aed88173770..e5d7c05e006a 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -695,7 +695,6 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 {
 	struct intel_pmdemand_state *pmdemand_state =
 		to_intel_pmdemand_state(display->pmdemand.obj.state);
-	enum pipe pipe;
 	struct intel_crtc *crtc;
 	struct intel_encoder *encoder;
 	struct intel_connector *connector;
@@ -726,8 +725,7 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 
 	for_each_intel_encoder(display->drm, encoder) {
 		struct intel_crtc_state *crtc_state = NULL;
-
-		pipe = 0;
+		enum pipe pipe = PIPE_A;
 
 		if (encoder->get_hw_state(encoder, &pipe)) {
 			crtc = intel_crtc_for_pipe(display, pipe);
@@ -869,7 +867,8 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 		drm_dbg_kms(display->drm, "[CRTC:%d:%s] min_cdclk %d kHz\n",
 			    crtc->base.base.id, crtc->base.name, crtc_state->min_cdclk);
 
-		intel_pmdemand_update_port_clock(display, pmdemand_state, pipe,
+		intel_pmdemand_update_port_clock(display, pmdemand_state,
+						 crtc->pipe,
 						 crtc_state->port_clock);
 	}
 
-- 
2.56.1.708.g77570a6a1d-goog

