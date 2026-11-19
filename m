Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092956;
	b=DBgCxgQ0X/iOK97P94EMP1QdR3xQtFxbo09E6rd6vmT+F/iWkbQA8WFQgIGNHPDA5Zmi
	 2otA/pawxeD85nYf10oPUcKVMSnU2xk0Svya/HRlQvFggR2vdfvlkQRDIa3buouUYAWAv
	 gyG/II+Lt/uJm/pY4CWFA1IAeT9H79L8HaExostNNi0QYN4xpoiMD8WMBueUUvzhYp7UU
	 q+Q3r08J6GYloFuLbJZvafgSrfNZHBu2yP/6IIuUthknojzBFDbU5VnDcY+lWlaNDGdOX
	 X8qpgzOr2bXzsTnzwIEB5rk5SMD7YqvST4mzjqDqYx7t8shGj1/UlOTY5FY98P9GJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/TmqwLlzq9lcY3l8pvZouPD0/wGxR2mpOzAx8KQEQZw=;
	b=oCwi7wuY45Uxp4M6P54Q4evqFK5Cs80FPB4JyOT7A+L0Bb+LFFszbAssxd6jQ482MrfV
	 EkXysG4P4hLqWbB6lSXZeEJUXy9uwio1JcZUl6gvMe3d7eT8r+Ujf4J7GaLAqgtw+jzHr
	 ybqlbIIHmRS4NZtMSYsotjo51dhHzo0LHfK5AilmTKTvBieJV0MRBJjqhlBcFpfkflMYL
	 dEbL7byENZTmXTC/q3yeeEQZXohB7wJjWGhCfcwLdnyVeKCCTH5vZ7c2f3Gx1mH7TLiIv
	 X+9Cnsu9yU7CGSzqMt3ee3PTo11UPLaWRsb+Mw2+o+g7gbJQ0zWdaKpa6rsHyeVhNaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R77+D7+u;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94654606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94654606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R77+D7+u
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1225240f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092954; x=1795697754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TmqwLlzq9lcY3l8pvZouPD0/wGxR2mpOzAx8KQEQZw=;
        b=R77+D7+u2N1NoXeaBid1Q3cTnrDy0wjEzMATGBTaZm9kXxHn+q3fkT/MXDEqB6XoTx
         uHSw7LaoGNdoScTWltqC9asGO8TDqw7HqaZjzy0TQF4ZPmMS7Itzmcn7BqnWFh6Ym4Cx
         Az00u29bryOmkn5FuNkTBZSo8QYDnjwDecWUiV1HRirNveyENUX6js5bnViVVAgXSa1N
         sAdDHj82LECdUt/9nlLD+lNEzS10+ud+T/cqf8lEztKT5y1FYDK6gVAiq0stZBdGx58Z
         zbC5pkM6223X4E/W6xtN/6CxsgZkB+0eZa9yPsJiZVD/AExk/WU0eXqqdSLeNF+bPtLk
         oTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092954; x=1795697754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TmqwLlzq9lcY3l8pvZouPD0/wGxR2mpOzAx8KQEQZw=;
        b=tNmKPABV7hgI0jysZeeY/cmAKdEn5cB4X5vc76bRL5xN4EBkKFRBmC+nLsh3GQJ5ah
         4RFGdyUn7ymg7IM7wz49G7J2YRdphWCNUUi4evee0VvIMAdLnkXLjAVZR1Gc3RMdTslc
         Q6AFWmmcYScFhguiidhsnqFmJdtu+qNHw+Yd0xGIuTbV5wehLcWwnnTquDdkVGY/sZRC
         0TAumeZJdtrLDApz5T8a1fnQ9MHpEjZIoKXUtSJivNdbNmTQqfNOGhlV0OGQENMw83SS
         5fM0VuOoy0VdPzU/I0den8HQXYsA8p5UI6yUZLPy9bAeqKgE9H3YIaJ/d14peZXQcTUo
         I3Pg==
X-Forwarded-Encrypted: i=1; AL+hErESAb6YGbEABQSjXCUHaOW2AwOHHQoEhc9ORwOUhP2ohFYbB4SUWTl/JuiER3fCjwusIQ7HY49bFzowU2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8baJjOEzt13mBEIfwZunHhwFCEIKq4Mi/OrDO0bq1RH/nIk8D5
	+472kNbEVCi8c/dEj3egJC/RJ37KphLfqDI/VRJnYJ3bfeWatkBUt6xnaQpSELzE
X-Gm-Gg: AZFdTZcCC2howHlSCBEuhP0N0/Qf5Pg4wiRjnDfG4b++t4aeaV6adAmgOz6PJt4ydUG
	65X6q+74ECFKle+LCy1ppIHZQaL2glyYAx6uezz6g1WDaruDJyOJ6fVEdYargY0rI4PULVvaXcK
	l2ny2nnApkWEN1q2yI3K5/+fh4RRQdClkXy1ZgVGx5SmeZHi5wUmgN0A/4bKZgxSvznRG6hVymk
	n3GInRBY96TXgI/JYd1WYH4vajzZuhMwuu0isgYjAz1UR+BjSyEE/D0OWWwgbni9F/mJ3wkYeiR
	KMgVKMdAvOrZMXjfcheuT4PofxRYtdamAL44wA7NhkLIcJqzd1a8+SZcj3DcTwom188IszwXRnv
	P/nHH7fNx5O3KlwoDhMDAHUvaXVuR05R1rCKK2CjaN2qfjZlA3Vckkst6Q3x0CPcn1NTYuAkYiu
	R325MOABUEuvoFtgV+6+FLFlpUbfnyufCDFGvDcLQlG8AfJKHSRLBC/5JiIux1tKTCKK2/xKhig
	P0OTh5GrUOv545jkS574qmfAxl8rwL91XUeAOq62quPoRbsYklGcqUUStFWMRsh8ruz4TWQLi3H
	AB2o6mlVYnK8usuZa6n8p0P3qK3qSNSflwC+jAGjyg==
X-Received: by 2002:adf:e191:0:b0:4a4:f86e:d90 with SMTP id ffacd0b85a97d-4a63beaa18dmr11375163f8f.52.1795092953786;
        Thu, 19 Nov 2026 04:55:53 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm10198193f8f.4.2026.11.19.04.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:55:53 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 13:55:26 +0100
Subject: [PATCH v2 1/2] drm/vkms: count the composer users
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
Message-Id: <20261119-composer-v2-1-a935e9bae6be@gmail.com>
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

The composer has one on/off switch, shared by the CRC reader and the
writeback jobs, so either of them can turn it off for the other. Replace
it with a count of users plus a per-user record of whether that user holds
a reference: a get() only raises the count for the user that asked, and a
put() can only lower it for the one that took it.

vkms_set_composer() becomes vkms_composer_get() and vkms_composer_put().

Fixes: dbd9d80c1b2e ("drm/vkms: Add support for writeback")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 39 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       | 31 ++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  6 +++---
 5 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6bc4..fe7dc8def44a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -246,11 +246,6 @@ module through configfs. Use/Test-cases:
 Writeback support
 -----------------
 
-- The writeback and CRC capture operations share the use of composer_enabled
-  boolean to ensure vblanks. Probably, when these operations work together,
-  composer_enabled needs to refcounting the composer state to proper work.
-  [Good to get started]
-
 - Add support for cloned writeback outputs and related test cases using a
   cloned output in the IGT kms_writeback.
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..24b8436eaa74 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -711,19 +711,39 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+void vkms_composer_get(struct vkms_output *out, bool *held)
 {
-	bool old_enabled;
+	unsigned int users;
 
-	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+	if (*held)
+		return;
+
+	if (drm_crtc_vblank_get(&out->crtc))
+		return;
+
+	spin_lock_irq(&out->lock);
+	*held = true;
+	users = out->composer_users++;
+	spin_unlock_irq(&out->lock);
+
+	/* All users share a single vblank reference. */
+	if (users)
+		drm_crtc_vblank_put(&out->crtc);
+}
+
+void vkms_composer_put(struct vkms_output *out, bool *held)
+{
+	unsigned int users;
+
+	if (!*held)
+		return;
 
 	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
+	*held = false;
+	users = --out->composer_users;
 	spin_unlock_irq(&out->lock);
 
-	if (old_enabled)
+	if (!users)
 		drm_crtc_vblank_put(&out->crtc);
 }
 
@@ -735,7 +755,10 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	vkms_set_composer(out, enabled);
+	if (enabled)
+		vkms_composer_get(out, &out->composer_crc_hold);
+	else
+		vkms_composer_put(out, &out->composer_crc_hold);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f49305a9..4e15abfd92a0 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -29,7 +29,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 	state = output->composer_state;
 	spin_unlock(&output->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && READ_ONCE(output->composer_users)) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dea6cad3f1b9..20c219a15604 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -89,6 +89,8 @@ struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
 	pixel_write_t pixel_write;
+	/* Whether this job holds a reference to the composer. */
+	bool composer_wb_holds;
 };
 
 /**
@@ -210,8 +212,10 @@ struct vkms_crtc_state {
  *	       vblank timestamps
  * @composer_workq: Ordered workqueue for @composer_state.composer_work.
  * @lock: Lock used to protect concurrent access to the composer
- * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
- *		      writeback)
+ * @composer_users: Number of users that currently hold a composer reference; the composer
+ *		    is active only while it is non-zero. Updated under @lock and read with
+ *		    READ_ONCE() from the vblank timeout.
+ * @composer_crc_hold: Protected by @lock, true while the CRC source holds a composer reference
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */
@@ -222,7 +226,8 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	spinlock_t lock;
 
-	bool composer_enabled;
+	unsigned int composer_users;
+	bool composer_crc_hold;
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
@@ -317,7 +322,25 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+
+/**
+ * vkms_composer_get() - Take a composer reference for one user
+ * @out: VKMS output
+ * @held: the user's own record of whether it holds a reference
+ *
+ * The composer stays active while at least one user holds a reference to it.
+ * @held is owned by a single user and lets a user hold at most one reference,
+ * so that it can only ever drop one it has taken.
+ */
+void vkms_composer_get(struct vkms_output *out, bool *held);
+
+/**
+ * vkms_composer_put() - Drop the composer reference recorded in @held
+ * @out: VKMS output
+ * @held: the user's own record of whether it holds a reference
+ */
+void vkms_composer_put(struct vkms_output *out, bool *held);
+
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 858df1f89f66..dda90eaede3c 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -118,7 +118,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkms_set_composer(vkms_output, false);
+	vkms_composer_put(vkms_output, &vkmsjob->composer_wb_holds);
 	kfree(vkmsjob);
 }
 
@@ -141,11 +141,11 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(output, true);
-
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
+	vkms_composer_get(output, &active_wb->composer_wb_holds);
+
 	spin_lock_irq(&output->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;

-- 
2.56.1

