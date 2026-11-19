Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099790;
	b=mvrqkDMWJoH7rSMhz8lE2TXP0L8rDddF1wG3189bgfe2Ll5BuFtGCUx2rzupaJYwry4o
	 Ghn4tlt8anjq7FD0AoFZg5BjKf4+ma8agsjLiMTte/XBlxlvCNMutcH6jSqj42/tJY+7P
	 QQVMOs/jXgt+tRVNbVSlGIs/IcY9Ma9ZivR2aDGQEOynpRLDPjuX9kCbr00wWHy1ujHDS
	 C2qhtVq+RoMA8jtoJZmz6feKka19Umjf2xIfd9F2sRdBehAU8PwsyXJtHAHc2rbvPQynJ
	 wx9fHx3w82vtLhkeJiKFjfenE7SoGaKrixcMFz3+qVd2ijekUJWZj9iVef6xEZR1g4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hgLxpH3LEm6Qly6PZhos0Gifa/hrNOwM+ajMDoFp79c=;
	b=TFjSENgZPrvUGnlR5SvMAe+tGOKDhSO+fSQi2yQyLI2x8zmQo5vU9u66oULLaJKJpJam
	 D3M7w8XpLfE9YRjNgZ+iroePAEiicDu7rcPdKJXUui+Oml4MmduYMi/qLVGuefftr2p9i
	 MZFPMVD/Vw17hzNUEkl/5c89lXsyz95ZOwkefccO0uLJ+P2b70Rf+4mvQEeFPux+u1+6O
	 K9GG8z+eryFjdHZSzvpEqf/Jcp6khebya0BH+kzNHWWyA+jJfzeh1dPc/DwLZbv16vgs+
	 GEEL6YgUXMzwabvo+coHYRMOfx6RGIDPdn9sgJx7b2dlXDYcKl/daIgf4yv8ZhdjPXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6fCl+45;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B1606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7B1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6fCl+45
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso7150645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099788; x=1795704588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgLxpH3LEm6Qly6PZhos0Gifa/hrNOwM+ajMDoFp79c=;
        b=x6fCl+45ixHaVzRWq9gW49enc7GiJtX3xFpujl8gDQW98Gc/4whXh7tQXkD5nnwgAh
         PUwZ8ot4cVOHw7iaFGA/QBQ1hJplVuPCTfBwXiRQbrLzHZFFFloL9vyORncckpR3V5AN
         ev3eGUTibtK2mhR3Q6eMuNKcLSxdsBdRbBbInSwnvAB6Ztlym9OvAaStZaFBl/7Bmsox
         YhMwdmnC8JMgPAgYgpbKdQ8rdlkQK80OVUHOG6oEljkXk5SBAACxbHrmwPar18yB4c6K
         9rIxtTKvWXGzfM9QRH+ro7UV1gZdFt0bR4sDIUj5emMKS6f714Qu9WCssEmm5uD55P3p
         xqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099788; x=1795704588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgLxpH3LEm6Qly6PZhos0Gifa/hrNOwM+ajMDoFp79c=;
        b=2Di/5vIuoyu0k/8ZjbPXvCX4QuRo6IRHopTlVs8YavC75SRFMullFkZ8qjki/yDzKW
         1zj8zQuYjjWzr6GP2t/PHCCnC6e1ZopsOEmNE66rfGqSQ0hXoaKTrnMyLtP1ryoYLz/C
         2e6CbE5I2g/IWFI8l2SdU0t1KBg7elCt86woXIj63MSacu9NSVRiz+eh2WiKaY3p1eHQ
         9hRTV9xJdSttr/sCNZxwd6MwbxM0749bZuq52oCh5NrWiXltxv1khRT4xtBYKcQHrzEr
         TXXD8FIXCmdkcDhZ6SeFkqndXoWzBRCbYoh38RNtj51w6x7GX6yKNQBth6ZgdJT9GjUX
         rSRg==
X-Forwarded-Encrypted: i=1; AL+hErGZ6RxYIRe7UCoC9NrEHIkj+5rwk02ztudGPHGpGgSc4a+vtQPs86O+S1hKT7/4QSDGgdjNcjfW7cC1vj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i6c5snrz4CAfynMgptdzX2j0nKKUcLya4S6RBWL80v98rM1XJ
	F3UuMy50670iEMnra+Pnj2OmixS0PoGmzSiguRnx9lxWpI7M9BhsENX3
X-Gm-Gg: AYBFou0s6acVeKHX1muGldHwp5bBDX8pKErCfMYpYHbvAHrrOGG66AuUSdRjW+oCzh+
	e9n8wTUEgFw1k6qX2vInl5dkkP1lbD8fFBJGLH3N4P/ZAHjSWywxA4tSF0+SUn2ku2TxrqemoEH
	3GyqmFWx9ClP7m9IhTzySe68OhryOZijET2Ff9mi03BnEyznp1qq6TFoVD7/UWJ6A7yGIR26ynP
	edf63cpZymiMzuc8XsBB2j0UV2rMCyrwYeMOPdcDLGO3RqbO+qIg+naoM5SSbxahGQ7PnN+G7YE
	L8nsJN5yXDiuCEHBEx/AFAyIMvs7Uf/zF/ICh67lNHX7Q7oZjnZnonooXpLd4u2LNNJTda1BiVi
	q62VjyTC3HW9vERzJG9ishQIgJGWcBNHoGFXZKJZ4oVCT7IbD7Zdxfg7sMn+NdpqHWUtMNIXuT6
	58JIY+SI2fQDBWfFZWQi5R9m9tIf+gpcaRUfZeivEp8CNXe2e5XDVnNY3rQyoFHZH6Mg+d28Tvw
	YsnPbG+8DL3qZ6/SzfJ5LcH3uIkn90YHnHvNhY9LflDHwNcfSt8Pt41FA7djMdQhuaYlThN3D1V
	eFZbLxwfwXRvE3Ff/EZwKrtL4+JBNUCHka+C56nzJg==
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr143326545e9.32.1795099788158;
        Thu, 19 Nov 2026 06:49:48 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm38881785e9.3.2026.11.19.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:49:47 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 15:49:08 +0100
Subject: [PATCH v4 2/2] drm/vkms: queue the composer work under the output
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
Message-Id: <20261119-composer-v4-2-5973fc9296ee@gmail.com>
References: <20261119-composer-v4-0-5973fc9296ee@gmail.com>
In-Reply-To: <20261119-composer-v4-0-5973fc9296ee@gmail.com>
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
queue can land on freed memory.  A legacy cursor update and a CRTC disable
both complete flip_done without waiting for a vblank, which is what makes
the window reachable.

Hold the lock across the frame accounting - including
drm_crtc_accurate_vblank_count() - and the queue, so the state that was
read is still the state that gets queued.

Fixes: 88ad7f3a5660 ("drm/vkms: Reduce critical section in vblank_simulate")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h  | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

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
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4f9f1614281a..290eeb988498 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -213,8 +213,7 @@ struct vkms_crtc_state {
  * @composer_workq: Ordered workqueue for @composer_state.composer_work.
  * @lock: Lock used to protect concurrent access to the composer
  * @composer_users: Number of users that currently hold a composer reference; the composer
- *		    is active only while it is non-zero. Updated under @lock and read with
- *		    READ_ONCE() from the vblank timeout.
+ *		    is active only while it is non-zero.  Updated and read under @lock.
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */

-- 
2.56.1

