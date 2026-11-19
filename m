Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092964;
	b=02+tfjLQYTEh5K2k7TdNvxcCideZYEr54VT+JzRF+TnZwr8UedHhHfSBmos7/MKntqJ/
	 UQwhQVn14wHs75Fym3QUxFnM67qIrd/KoxLyhGvH8NCBjbXPrlvmMJyF+ivaFv3RCfW2O
	 r0ErK5yVk+Yzh8Fa5hue+tCcgu4mmxAdk3LelwvnV0fJ1xtroPZByH776aV3OhmecNYNT
	 jdFmn/1cAtlrrqAOXkJpmdFMF4+cxtXGElTNxqfX6O5rxYEHhp86GXSZsIqwtv9vBBgFz
	 vopr3Ee5T3OgL7M2Fq2FU8GVR82tkgXh98pm/Eiee8MpaKeIsZ9oASDAfoB0L30rwBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
	b=YeKV73TbG3+AwnKH7MJ2XO0DHqwHc9UtmHMRc3/L6T/nDIyMgDEcUxNcMpDFz948EBXD
	 i+YxRrCqDZyvQ2evEqZLwCAAYVJTIDe0x1QEawMyjhV4LFW0aOFkVQbBkxN39AsmiMxKx
	 QB2+0pCUO+TFnCK0cuj6hIBqtPe2QsqJTO5J96APC8ZGBAycOn1DzUb3+H9iDc+lJpmIC
	 UBCxcEYq+6T+dQ+oj3/YZ79Hz8lz37JdbMZDE5qpPwNhtp7QeRDgOsa9v6XgIZYtFYuPv
	 66MO6d81xtX/K5RvCE4e+CfFP4X1rcAsAYbPPOsGpCnwMGSinxCcCpHMcNQZgus0QbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgNLHSTY;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C480606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C480606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgNLHSTY
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1408873f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092961; x=1795697761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=rgNLHSTYoJPGGseqZV+abEz/haJpQ1vp8BB0CJza5o/ZkXPspUE47GaZA8RSxgL0bD
         oP5xacrwDEc4gYCLswBC16lkj+dLLCf5I1Q3YaevBCv17/9hzl0MmvM5jf6dlNwUzPsn
         PX2BsIGlq+CdQneMVx6fheOR3hN9q3amHE+EFJbdXI81igi4xwQ+zQh1jURoWuP5YkLg
         soaOdbp/Uo+Hhjfu73OPdPS90B8pklNWPhBBr8WaoaQrl8wlnz83XMHexXd6llITkCtx
         lkK0o0TsF4XIaUxs2f8qHr83ELZcV/YcIWJuldrcVRnib9PUGIrMJkftInIdC9u1kuyD
         RzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092961; x=1795697761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=jBGQs9/wv/mv8Hc/njqL8nT+7zS+17pDkTHNZTb4RuytjRrjqxyaQjfSGD016JwLXP
         6mzaZl2Pfc2Kz3okY5ZgtS7/+ZYVxFMJZtFynQrLAIPtIY+XmY3/luSjk1v/XIg9wFXZ
         s4qFaDVO8TwZ51o6iRoWNHFAQFA6hZTBGVdb66A2yeo0rG0Z+nAdjyOuN6pJxtsyBVAN
         973EAloJ05OHy4T6E5rbRLQQQhKSLU1riS3O/oQ66KVGe2os1cPFDMiXgbBLt1QwCnfl
         Aevs3RuQ2uOT+a5gHi/f+PeDIpd2uZHmJISe6jDk0rNeWh6XU8/8omlcLY6J3rWYeFs7
         82DA==
X-Forwarded-Encrypted: i=1; AL+hErGWKdSY9KLc5ic177bemDAyPmy6Tcz88Vn4Aicq2e9bekyz+anegRTAdKQGANqiCF3t/JAvTyDINIluqv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/glgaz+dJ+eJQ9P7lguk9DPe5hXCEVObvECqiGEWUpEKjMmqI7
	E4ku7i7OzwFJ8hB01LD92cTe2HySiyuKlue+OJY2lPLCwQZ057Htu3BN
X-Gm-Gg: AZFdTZeuijRMPwRoD4N0aYwtBmvJ8cIet5KHeCsx9Ywqy0i5z5ipAapxQh5jztbs//Z
	1cat9tfihNqGLFXPEJYrR4qNUz1DwxRL3wXcGRnY3ewNqHyIcuGQTPPHyhPAX09kkgGYuOEDOjM
	sesd46K8aUXUpyiTkVw3+K1URVpJF8ZULPL7NsRY8noBw193FONjzr1lRYaVt7Bl5Q05F2b54l8
	jzKWaGVGtCcyY1a5lIEZFZRjRUBggy4mrg333tXpiGrvMvIVlNgtVEijQ1725mNvFcJulQ8f1fl
	/2fh7CFDk1VGQl30Swz1PdYFzslvXjai3Nj4+bRr7Y0++VB4/Vedn3nywhWOQ0QCs7xxYGl6fGI
	yDJQsxmOCU1tygn/4GxzfD6BZ4rZEkjJYDRcbb9Ufh4owJSL/usdm8kkaneWTnCauvhlVTQhd/t
	dH5I5l6uiHRC7H5Xpk2hcEyaacFRlyzAg5me1H9MyctYoIMV0fkOHZ7kK768THU+5Z88wyKJr76
	Azh29xJhSxCO8R9/i0tljOhCdCmd9cu3yfOX1cbR+oeglZ351JbANOPIGAyTnR2TlffHWaXADvD
	u123WN6SRw0vEcG7leqtJUUYqbWdZvvElj8mBoJQ5dfZ3V5ue/ghh3fy3kO9xWM=
X-Received: by 2002:a05:6000:200c:b0:490:411a:1eed with SMTP id ffacd0b85a97d-4a63d2cf93emr12483342f8f.39.1795092961524;
        Thu, 19 Nov 2026 04:56:01 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm10198193f8f.4.2026.11.19.04.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:01 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 13:55:27 +0100
Subject: [PATCH v2 2/2] drm/vkms: queue the composer work under the output
 lock
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
Message-Id: <20261119-composer-v2-2-a935e9bae6be@gmail.com>
References: <20261119-composer-v2-0-a935e9bae6be@gmail.com>
In-Reply-To: <20261119-composer-v2-0-a935e9bae6be@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

vkms_crtc_handle_vblank_timeout() reads output->composer_state under
output->lock, then drops the lock and queues a work item that lives inside
that state.  The commit that retires the state frees it after flush_work(),
which does not wait for a work item that has not been queued yet, so the
queue can land on freed memory.

Hold the lock across the bookkeeping and the queue, so the state that was
read is still the state that gets queued.

Fixes: 88ad7f3a5660 ("drm/vkms: Reduce critical section in vblank_simulate")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 4e15abfd92a0..d2c6ffbad07c 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -27,9 +27,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
-	spin_unlock(&output->lock);
-
-	if (state && READ_ONCE(output->composer_users)) {
+	if (state && output->composer_users) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
@@ -49,6 +47,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
+	spin_unlock(&output->lock);
 
 	dma_fence_end_signalling(fence_cookie);
 

-- 
2.56.1

