Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095403;
	b=On8CSylqzgx99PrTc+SSluXvtOaa4X8aIjxkzbjLmrWsAZOh1JXX+ZiuLvG3uJBeWfOV
	 uJUyRbeB6uSYap+rodecB22w5GcBMBcKqdUl38IgFSf1kmSBhNrXGuRNX0ek6SJ0QDUJK
	 4D0n47DOGXzRSsafuP/QYzxKtsBIGdPPPUk2aUwafsg8kqIUMP0P9k/yuEM1rcr2okqSj
	 zgH3lsVReERP5tEbRffXkgikDrulRtYf5T7Ht0UQmt/p6FKMiyae8FNPylBii5rXII8lC
	 X3OpiiVI3VZtC22ATkWXoajgMcBwzOslMWjGZCpopYNf4aXM2JdtXIQ/PtnMlIXNswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
	b=mLzjr07571vFOS1m4mvania6mcub3BJ6epfbkbzvv7pJFbGVPty/KaXgqCZoPHhh/cJ5
	 GgUGv/D5IckTx4t3RkfZt37I4gv5tiLc7S1Vz7jrwq9Ug/HvP4IzfVCXuXI52KAmqKf5a
	 jMacFubR663fmUGNct1DUlLF7koyimq8IiBUw4Z+B4Ik5WxpTxRCkzacctM+cyUJ6pd/p
	 HnePCQtCwaPZhqiiRgsxxKqQ9pyAY5BoVUEediSeWyrDO5551IX0sh3S2WGc8I4A7ot7E
	 d0mD9nlU/BRlb9LO8qe/5FlvMtTpspVmBuXcMJGizaVU7+O2BafONzhxJQ5kYMGMEKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4qQ+EJT;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8C6606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8C6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4qQ+EJT
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2057882f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095402; x=1795700202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=H4qQ+EJT+0hEzIoPgYTz1jepaPSpvUK/Zo2h0MM0Yc8ArjFbvw3txZCErZzEUEz20m
         Jxuaj7j+0GGFEgcSC9FleY2yDJJUrfnwJan1bCNbL++COhoLWFcy937uIX8McA5GUFoz
         K8yP7BwMS+6veUjWGL+rnb2z1tjHgCy85x7sGKq1TMSamnbPxG61FSeVMNKN8uJMBLp1
         yTYNnVRYDjkvB4OXlvDD3cmpJ6n0+zXDab6aNoBgUInA40BzSHcxG07KI+6V9yC3DLaN
         3P6TrQVbiKC/UjCTg9+kHIIYMQyOrmmpqrCYDZYCQVMFDsW7D4BxaeaZeXbtlrhM/rHK
         skdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095402; x=1795700202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=Hj2Riwv1vjfwLXaqmwf56NViZS4s8GAI3XoJ7ZBWWaiYRZLPA88u6lGWX9L2CWvjfn
         JjcSiZI/fHuwog9yFMT0r4RSWfg6k2gFUOX0g0DQOOkyzsNP05tE8XND0+gpI8lmpUNC
         t/qx+8EEiADGvokLMvoMWV15b250cDLlJZI7FMmf3PmW6dDSXPYHRogAAtGke/UihS/X
         g+HoE6CSlFzPw0ZLdfLUuYGp0I2RsL16YYUesg4x7i6aSZSB6slIdDyBVqKq3rClt47j
         Q8/gwfMwRlaV5EHZ0Wyte78HVKZ6387epAhjS3faPNn/qILKxT/KUPJtqYOS/MHg1PZ4
         Yvjg==
X-Forwarded-Encrypted: i=1; AL+hErHTJPfxqHk8jp38q3CTzZPlGhGFr9Qd1wMm/cN8hiR7Ppmbs8qoimZVETH7RODkALv6B4DZEowYwg2XGD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V6X/FpnSJn41AKe7YYDhMRzPXyx38Zv39luofgGbQBBx5ITwY
	prMIOe1RPi6W1IqPmdRuWvDhGw81EhRc3nJXj3lVenFnGnjhCsD2sVo7
X-Gm-Gg: AZFdTZe8XD+BqmlThb37TDSYUOjBFHHvFRT1+q0PWRwEeqDOQE8XXX3KjtgjVkVtoHT
	eyaDpmOvu/tJnYcjc3sNZyNnZgcnfJRKGRcT6YfevdM8zoFp0boXMYUzhlIj67AcwGAxjuw0VLa
	2INd2/YE+Wpj3S/hUyT0VXomw2t1T9Z/aNvF/PuIFu6+PyqbX/a2xc9a+7N/I7N+wPqqETOS2S1
	dtLPnGExN+RTPUyizgt2u3UJ9/EtaJ+1ue1EvN3JYoY46Uy14WeqzpIUGIrdjHPdTixrgZrzBoL
	OPn7Bd/p+nmqWuJpJ7hvgGyl9QX+koPpECmHFFndu1w1TYxpj8lNj2cCHb3sw0qqib4pyHGs/Wh
	CryF+tcbdW7SXBGAsP5K6g6Dg9IVdRbxLM54lI9SO6f4k0kW6EoskqBHVtCVttvco0e7LAzG+0N
	Qc0fengqehUu3aGl4SNdGOLrEajneortOACRf11udthBb5xpIfN6F8bTdDB2siCfzq1/aIIDoZ5
	7FoCU7Iic5BbaZCH5e6JhqV+nQM3Bd5aIZyCJu6k+frBwNXXuEeK+v+8Bnf2a0aXnQB2OxxW3/Z
	XY319XKmduYNLQ3K1JHVKClFbJ5TGXzlM4FyiIncsw==
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id ffacd0b85a97d-4a63ab743f8mr8922005f8f.42.1795095401941;
        Thu, 19 Nov 2026 05:36:41 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11547911f8f.56.2026.11.19.05.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:36:41 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 14:36:04 +0100
Subject: [PATCH v3 2/2] drm/vkms: queue the composer work under the output
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
Message-Id: <20261119-composer-v3-2-dd470a820303@gmail.com>
References: <20261119-composer-v3-0-dd470a820303@gmail.com>
In-Reply-To: <20261119-composer-v3-0-dd470a820303@gmail.com>
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

