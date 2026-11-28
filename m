Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886150;
	b=oY1vpLRwH2Dul3q6CzEqF/BB2BBmUnDsBZuAZLhVBuNEU9EqGX3FY1dXsDvpFejxeD/H
	 NjdgXL1aAyeo/sHDsTD/+rVVM9kQ/CONgALgxbkSzX5tSDgVhLOOHxdrLHEO8zhywJWhL
	 9PjSecSIWT3alGpgWzRuqxelBFENezUNPR6YezLrRufxpOcTFzWcNmaoomYIFJ+Aw3iPO
	 Qst/usalr1IsbMoRNGF9E6tdCYB7VJrEEDdSe5iuxy30CiGrVYEtsoGajLmHD+qmK3TUg
	 C2QJyX9Cp5mi8oYaL/kjup475IxsCmOEPIsgZ5+8Dq3lytQB05KTE29P1l4/wvz4IvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Sxmf31wuvdFLAP2JCKDxt/MTRVSqatXjBBVxj2QWWU0=;
	b=YgOqG1tHHxjIOlqt0MFQM0e6B7w686wzwKpX9pGbRzgch6vMB+KPCP6GOpr9pFrKcqbZ
	 xQxtLFKM8TnyWu0j1Qlp1McKUOyI72QBiCw+QuMLYVE6PeIloj5L6FgP1HW5zgJQFh/HH
	 Yzh6dNs9Su90S26LCJbSAFbjvKltXiQNKEdbajCDkY4WXo5LshM7kfFTvAY2I70fQvHu/
	 rGEmI0IOi0gqo8hBkPAwtfCKJeDH0W/cZB/GBy7ORQ6kk4ccf54GPeYxtTZ/zYxDbQH1s
	 +7UIhiabQryV4+jKsgDNptdSiBVFdzZEiadr1/rZZAhloBTiRW0o+2aB2UlboT+bNdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofrty6xC;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C5606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1C5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofrty6xC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so8585255f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886148; x=1796490948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sxmf31wuvdFLAP2JCKDxt/MTRVSqatXjBBVxj2QWWU0=;
        b=ofrty6xCeHnDYNjrxGQlxRfOAEjs0VP8fgrrd7UZu82IXLoceXOKykNx1rYRzsyaZN
         clO1ln1iNS/Cx9sBppFdw7AbDG2MtM1SP/uHRhaPcLD0u0bTVQhKz5gJOtcs3jFcvg20
         GSW2ugkz69ykBGYsKbEBCYs2ZWcQ+l38UitcEV+lDrk+d9ZDKbwcgnqGaMjp4KUIvEDi
         c/bdbOKsmTHIiJk2x00Tvm1FWv6kFxZnT6Kv7iYiVO0ylI+8iOwmgT8oHqs/oI2naE4P
         usOhY3ddy8MFgtjyABEzV3dPs+LatoS0Qmn0cffnTdB8jPOWJ68Cf//rz/JxxlGlnFnL
         aNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886148; x=1796490948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sxmf31wuvdFLAP2JCKDxt/MTRVSqatXjBBVxj2QWWU0=;
        b=S1YuOCSPDPXXi8XrNjKq+EdsNtMRI9gsu8RV6vWvkta1y5MPCeGV94cJkPTCj0P0q1
         ChTCRj9D9Kt5oJU+TazYxzq6wxjQkgoU+k7P5cw9gAMZEGQhNDBIU4jSHV0S2AWOV2q6
         /TOq1XmiwlDK5upDyjx4J9/Mz+oh7WLdpgQFa4XlHoY0fMk0N4c0BEsARVgJrULlAOQp
         FBOj9qz8R3tv601HttfPg4K6jcyJOeTCRWQVuCpSx5UQVgCxOX9y7DmMIdnWVax0X6AD
         9MBg/200N8qQLgkpLxGdd/BZxryHAi2VWtpOpMSN3Nwyx2DzPC0Ne16sdtiKpW2sNLPh
         c3mA==
X-Forwarded-Encrypted: i=1; AL+hErHhZP5BoYmif6dsnnL+QVo39/nqaAY1Sy2N+7AVhUzzTegPpcKzYLu8GlN1I0q6UFiIBZyBeCxaY8Z/n1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k3Vc0N7HIQWlQPIQ77x7DOWXX+9QBwl0WqyWuFd1HVC9jm5KN
	PHFzPFvSjlOyS8J6mWzV3rLIGISsjBEomDLajST/sN7Xo13nMENn/bXb
X-Gm-Gg: AZFdTZeOU8IP9rQke6NjmN0CIeaFqdXJa5chyhjcBi2EI1aL09mBjxc4ZFiyuX77jvv
	DmPi8IFfm4CEbEsq2RGw1Az+F12Sm/FxJy2L/R9p+H4S1SECQM5iI2PrpxZcJhor9OpSi0ozAgC
	VewMCP9GqU+nj6aTBt/qjfqS3LDH/ShjSmCvBe46ukKu0B3vY4SrU5QZT7NpDewulm6t/Krd6O0
	VS7mIGY7Bdpp8MWk0Biq8wAIc0Z5mP34Q0H7HKg5rKOOtjivH4xVrnVoeWEhHPHbpqXifjLPJQm
	g2RUlRUum9WEfIr/DU6lhrX6g70NZojVc1ioEUBiy7SG3RGpwomeeI7DwqBo7tN66hJIG0ipToN
	KdQGj1/yYsa4sxJZ/mslzmxnd8ii0ifN/PFPla1K8AA41sH46qjFcpMuRwwkOONqwiHCqxHEZWr
	nqEAc6YyO5MJh07i5X2bqiLDYTXV5ABQ9IE3wAsM9h1OEQDBxh43heeI0wnRX19/sfgbRGy/m3c
	CGDyyPMHWw8bw/PVNXq697CGFr+InjgY0V3U6vvUAPdF/rsxtisBW1dO1quvOqPRY8j0IK8s8Fh
	Xx2fKAsCZHMZbf2FfabAR7iW828Mk+eUCkGOiw==
X-Received: by 2002:a05:6000:290b:b0:4bc:5a78:9d9 with SMTP id ffacd0b85a97d-4bc5a7809f8mr19114030f8f.55.1795886148272;
        Sat, 28 Nov 2026 09:15:48 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:15:47 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:19 +0100
Subject: [PATCH 1/7] drm/vkms: add the colorops of a plane that is being
 enabled
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-colorop-v1-1-dd79919f822b@gmail.com>
References: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
In-Reply-To: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Alex Hung <alex.hung@amd.com>, 
 Robert Mader <robert.mader@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>, 
 Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

drm_atomic_add_affected_planes() walks the plane mask of the old CRTC
state, so a plane that is being enabled is not in that mask and its
colorops are left out of the commit. Its first frame then sees the
pipeline as bypassed, and a YUV plane is composed without the YUV-to-RGB
conversion.

Add them explicitly in vkms_crtc_atomic_check().

Fixes: 589179b18224 ("drm/vkms: Add atomic check and matrix handling for fixed matrix colorop")

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 019d7bc90cdc..7d18178d5320 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -129,6 +129,22 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * drm_atomic_add_affected_planes() only walks the plane mask of the
+	 * old CRTC state. A plane that is being enabled is not in that mask,
+	 * so its colorops would be missing from this commit.
+	 */
+	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
+
+		if (!plane_state || !plane_state->color_pipeline)
+			continue;
+
+		ret = drm_atomic_add_affected_colorops(crtc_state->state, plane);
+		if (ret < 0)
+			return ret;
+	}
+
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);

-- 
2.56.1

