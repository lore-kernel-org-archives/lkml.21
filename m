Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077105;
	b=Z5QBfRr64PYpAyCmuFHLeszMaBObkiRy8sudO/Qqm1UlmXMbXn+zLHo04OOuLQxPkTB6
	 7iC6UK69ausNqrAbyHAEUmMTmJTmH0LFUc+SD8CvUCURW8PxZ04KB9+J7fE+GxogjuZHO
	 06/VTPBB/ovVg4xQj4h3f4jQALAR9Ps3ESMDVSLQeWQkcMAh0O8yduMgNrdS58twwkVzh
	 tj+dUjgG2j8nN4NeA7HAtBXFTDM3qL6Q4O1As0QsdSdstctW5T4Tfhcy9onP413POLo35
	 ZCsNovCEdhDpeHHzIRj8vbBq+PKXVHI7g/Rzo8VzDKMbThy2u6c4zYVmQOJxYKC04gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X92Y8+q760KTTL4n4XSfmzYYpr3dLaACGp8eBo1xrHI=;
	b=3chG4cCYqiNCepQajeA06/V4Mv1jfzVkvSrhtTNog8UAGc6/yvMKMI3EgbVSMqzVZwcO
	 U68PJBPW1V4KcUrwAVevczUtIgcxJL4IfrEH1Krq9BZT5hS52wzWOrk1yK/MCypcGhvrE
	 sOSnpL3DOGsJG4OqbL9tT6w/4XVhyqaU4yUlqeUfNBUB0L3QX8SRB3WvWW87sWYbjW3Fl
	 ntX0nmxBhaljgNEFCYlIA5xUoADKt2r/MeTPk6o9rY4qBxKcCqFlSYzG15aK959IHzJSm
	 LnmEfmuIRn8VpqIElqlICdBEH22IWkbwK4byAn8/F6VNEcZoGzfgPviSsUu+GHvXF3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+1rV+RK;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B6606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+1rV+RK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so2637583eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077103; x=1795681903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X92Y8+q760KTTL4n4XSfmzYYpr3dLaACGp8eBo1xrHI=;
        b=c+1rV+RKKN6SbNMi1B1M4NaW+We6pueNCakuRcbRcuLyRELWSSfZSgnubRZ7OyyY4D
         QAZdRUM1ksvv+Jr/e65lhjw/9Scg6jYw95KlT4C+Ok6RP6xvkge2CSDlzZndzekMLRqV
         Y4BerCUC86P1up8ihTfLVfq/l3fvaI85aURXipGNh7684IbbI+Bhs0gRXOcTLmMklY3v
         dC16gJupuBYulPHXkUg3msYQjTS74gfub38KqLZFh4ce6kMr76SByXuiJOzLLWAZpQOk
         SwMCUAyUwlpI5ireY3x3hTbW4Fd6emQuB8xXjBuSkEHt4/UO8XX4ZU2AlwzUvUwxaLKB
         UR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077103; x=1795681903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X92Y8+q760KTTL4n4XSfmzYYpr3dLaACGp8eBo1xrHI=;
        b=PedRzqe8mRQI7xtZKN7EGV2gJ9oN0FEdj2aDpRrgu5B6SgFlncOWRSXLsLDC3w9zJf
         HxjxMBzA8D/iFyOtLOrixZXek7a995aB6aOtm02GoEcvTYxk9MEVnVO8R+EElkOjv7Fr
         gEOY8XpKvrrMwN5rQgTuL27VO2QToGLVY+Ia1zxesUrfKQ1129c9N5N9QzhJI+5P3Oyr
         2PHu7mNVeOlJc8/yzDlIoOk63adUB7gEQ8Ez6rcdHxpDLpwH/FIIRdhR26YAzP0Uz3il
         1NvBK2LpOa6Abb3TsW4tOmVyIzyfn1e2k2JLjr/X4tJCYVzR7bCv8SpxCYLT09FXb2Fp
         MHaw==
X-Forwarded-Encrypted: i=1; AL+hErEfMrbeVsdiqbtBKhoeEdMwS+wOFTVsjFbo1uZruRp4RA4X2V8fjavWKAFyysf30x0toExW5K8+Mt8jRbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NcaTuwcR6Pv8cDGj+6rN2vA0yGV6nE6A8zzimfw8KgJrRH7+J
	1R/GYr7rZ0fQK5kaIcNx7DqnrLT8j1j33NyvYmzg6C/RMJNmJparpUIO
X-Gm-Gg: AZFdTZfkuZ8ZRfzHAX10HsUv9OtsDCcU5GBt3ydBpo2BbB1NkJAON2EuIhY9FmugqG7
	35wkTBzP5QRjn0ZS8oyfn8e3h0KMsmHLJ0yfC8+w5ps1a4V7wKjncR0OQyBrbAjTznDjB3ZQXFW
	B/FQNidbf6lMBgklJGg7lhZvkYXR+1dD6WTG6c0LhK6V0xf3zlrRzvOI/VqokLZc/AM/SXRaTbA
	6BZJSU9DuGkKZDsP8T4r2i6kvTDnSZvgRRMeZsKWqrPPGh+3Sg9SHcFvZHvrgiSrILZKhN2vh8p
	deRqtWFQxK/KftXGl8AoEol/ZAKjtNjXuElr187ksJzajoAzM5evOEnYBNdGx4QL9xLL0UwIJK6
	7ya5AdYLqFvEcWii4ym78lX+sGDjqVJluNKiMB2DZUpWANydYjD+pV3J7BAZqw0Hsa4XEKDd95i
	4Nv91ukz10Wncq2J93YM0WeYBpq1vAKr3MT977C17rSpw9WBuzFFFfE2lBg2HSNnyRRWI/1Heh0
	g2myV/Y5rsJvfHtDTVqxT2lDbIv5b17PmtvIIVVZsSMEK6C9vOgssHbvZtI4SGxhH+0pXbWrBzc
	dGhtLDMaFrqJAkGGUAKgofavcIUPHfYYisjZ7orHdrYlRzX/HTSAL07P84KIquLru8O0+ofqB8H
	PRPK2DcKKQOHJceJ9lVYkg2/y1X9CSWG1BU3ZsgS85UrD0F4=
X-Received: by 2002:a05:693c:62ce:b0:384:7b5b:e1d4 with SMTP id 5a478bee46e88-3847b5be8fcmr703529eec.17.1795077103060;
        Thu, 19 Nov 2026 00:31:43 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm16553792eec.4.2026.11.19.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:31:42 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/2] drm/msm: release the cursor flip work before the KMS is torn down
Date: Thu, 19 Nov 2026 16:31:32 +0800
Message-Id: <20261119083133.3437277-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119023604.1495603-1-shunsheng1218@gmail.com>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mdp4 and mdp5 queue the BO of every cursor update on a drm_flip_work and
release it from unref_cursor_worker() once a vblank interrupt has
committed it.  The work is cleaned up by a DRM-managed action, so it
runs at the final drm_dev_put(), while msm_drm_uninit() destroys the KMS
and its VM in msm_drm_kms_uninit() and only then drops the reference.

A cursor update that was queued but never committed - no vblank
interrupt after the last atomic commit - is still in the flip work at
teardown.  Releasing it needs the VM that unref_cursor_worker() reads
through the KMS, so the cleanup has to run before the KMS goes away and
not after.

Run the cleanup from the KMS destroy path, which is after the interrupts
and the KMS workqueue have been stopped and before drm_gpuvm_put(), and
remove the managed action so that it cannot run a second time.  The
action is only released for a CRTC that registered it: a partially
failed init can leave CRTCs behind that never added one.

Guard the new CRTC traversal when the KMS has not got its drm_device yet:
the teardown can run on a partly initialised KMS.  This does not make
mdp4_destroy() safe for every such state - it dereferences mdp4_kms->dev
before the loop - and the separate KMS-init error handling series is what
reworks that lifecycle.

This prepares for draining the queued tasks in drm_flip_work_cleanup():
running them from the managed action, after the KMS and its VM are gone,
would dereference the freed KMS.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Changes in v2:
  - New patch.  drm_flip_work_cleanup() is about to run the tasks that are
    still queued, and for mdp4/mdp5 those tasks unpin a cursor BO through
    the KMS and its VM, which msm_drm_kms_uninit() destroys long before the
    DRM-managed action would run.  Release the action from the KMS destroy
    path, before drm_gpuvm_put(), instead.  Reported by Sashiko.
  - Only walk the CRTCs when the KMS already has its drm_device; this
    covers the new traversal only.  The existing partial-initialisation
    path in mdp4_destroy() still dereferences mdp4_kms->dev before the loop
    and is left to the in-flight "drm/msm: fix the error handling of the
    KMS init" series, which is not merged in msm-next yet.
  - Checked as a series: both patches apply in order on msm-next
    (d024361c631b) and on drm-misc-next (fac7a5f16230).
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_DRM_MSM=m.  The affected hardware was not available, so the
teardown path was not exercised and no fault or race injection was run.

Checked against msm-next (d024361c631b): the patch applies there, as part of
the series it also applies on drm-misc-next (fac7a5f16230), and Dmitry
Baryshkov's "drm/msm: fix the error handling of the KMS init" series is not
merged yet, so mdp4_destroy() still dereferences mdp4_kms->dev before the
new loop.  The guard added here covers the new CRTC traversal only; the
existing partial-initialisation path keeps its current behaviour and is left
to that series.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 26 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 13 +++++++++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 27 +++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 13 +++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h  |  1 +
 6 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 93050b3c3548c..9767d9aef43d6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -54,6 +54,9 @@ struct mdp4_crtc {
 	/* for unref'ing cursor bo's after scanout completes: */
 	struct drm_flip_work unref_cursor_work;
 
+	/* the flip cleanup action is registered on the DRM device */
+	bool flip_cleanup_registered;
+
 	struct mdp_irq vblank;
 	struct mdp_irq err;
 };
@@ -622,6 +625,27 @@ static void mdp4_crtc_flip_cleanup(struct drm_device *dev, void *ptr)
 	drm_flip_work_cleanup(&mdp4_crtc->unref_cursor_work);
 }
 
+/*
+ * Run the cursor flip cleanup now instead of at the final drm_dev_put().
+ * msm_drm_kms_uninit() destroys the KMS and its VM long before that, and
+ * unref_cursor_worker() needs both to release the BOs of the cursor updates
+ * that were queued but never committed by a vblank interrupt.
+ */
+void mdp4_crtc_release_flip_work(struct drm_crtc *crtc)
+{
+	struct mdp4_crtc *mdp4_crtc;
+
+	if (crtc->funcs != &mdp4_crtc_funcs)
+		return;
+
+	mdp4_crtc = to_mdp4_crtc(crtc);
+	if (!mdp4_crtc->flip_cleanup_registered)
+		return;
+
+	mdp4_crtc->flip_cleanup_registered = false;
+	drmm_release_action(crtc->dev, mdp4_crtc_flip_cleanup, mdp4_crtc);
+}
+
 /* initialize crtc */
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int ovlp_id,
@@ -659,6 +683,8 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mdp4_crtc->flip_cleanup_registered = true;
+
 	drm_crtc_helper_add(crtc, &mdp4_crtc_helper_funcs);
 
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index ab7b62381685f..3fd528eeff0e3 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -136,6 +136,19 @@ static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
+	struct drm_crtc *crtc;
+
+	/*
+	 * Release the cursor flip work while the VM is still alive.  The
+	 * cleanup is registered as a DRM-managed action, so it would only run
+	 * at the final drm_dev_put(), long after drm_gpuvm_put() below has
+	 * destroyed the VM that unref_cursor_worker() needs.  The interrupts
+	 * and the KMS workqueue have been stopped at this point, so no new
+	 * cursor update can be queued any more.
+	 */
+	if (mdp4_kms->dev)
+		drm_for_each_crtc(crtc, mdp4_kms->dev)
+			mdp4_crtc_release_flip_work(crtc);
 
 	if (mdp4_kms->blank_cursor_iova)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c9..48cb2b9d896b8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -184,6 +184,7 @@ uint32_t mdp4_crtc_vblank(struct drm_crtc *crtc);
 void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
+void mdp4_crtc_release_flip_work(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int ovlp_id,
 		enum mdp4_dma dma_id);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 1e1fff37380c7..2d457311a3ef5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -53,6 +53,9 @@ struct mdp5_crtc {
 
 	bool lm_cursor_enabled;
 
+	/* the flip cleanup action is registered on the DRM device */
+	bool flip_cleanup_registered;
+
 	struct {
 		/* protect REG_MDP5_LM_CURSOR* registers and cursor scanout_bo*/
 		spinlock_t lock;
@@ -1316,6 +1319,28 @@ void mdp5_crtc_wait_for_commit_done(struct drm_crtc *crtc)
 }
 
 /* initialize crtc */
+/*
+ * Run the cursor flip cleanup now instead of at the final drm_dev_put().
+ * msm_drm_kms_uninit() destroys the KMS and its VM long before that, and
+ * unref_cursor_worker() needs both to release the BOs of the cursor updates
+ * that were queued but never committed by a vblank interrupt.
+ */
+void mdp5_crtc_release_flip_work(struct drm_crtc *crtc)
+{
+	struct mdp5_crtc *mdp5_crtc;
+
+	if (crtc->funcs != &mdp5_crtc_funcs &&
+	    crtc->funcs != &mdp5_crtc_no_lm_cursor_funcs)
+		return;
+
+	mdp5_crtc = to_mdp5_crtc(crtc);
+	if (!mdp5_crtc->flip_cleanup_registered)
+		return;
+
+	mdp5_crtc->flip_cleanup_registered = false;
+	drmm_release_action(crtc->dev, mdp5_crtc_flip_cleanup, mdp5_crtc);
+}
+
 struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
 				struct drm_plane *cursor_plane, int id)
@@ -1353,6 +1378,8 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	mdp5_crtc->flip_cleanup_registered = true;
+
 	drm_crtc_helper_add(crtc, &mdp5_crtc_helper_funcs);
 
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index ff6751b2ae626..834faf9c886ad 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -201,6 +201,19 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct drm_crtc *crtc;
+
+	/*
+	 * Release the cursor flip work while the VM is still alive.  The
+	 * cleanup is registered as a DRM-managed action, so it would only run
+	 * at the final drm_dev_put(), long after drm_gpuvm_put() below has
+	 * destroyed the VM that unref_cursor_worker() needs.  The interrupts
+	 * and the KMS workqueue have been stopped at this point, so no new
+	 * cursor update can be queued any more.
+	 */
+	if (mdp5_kms->dev)
+		drm_for_each_crtc(crtc, mdp5_kms->dev)
+			mdp5_crtc_release_flip_work(crtc);
 
 	if (kms->vm) {
 		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0bd..b8b8c23b58500 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -284,6 +284,7 @@ struct mdp5_hw_mixer *mdp5_crtc_get_mixer(struct drm_crtc *crtc);
 struct mdp5_pipeline *mdp5_crtc_get_pipeline(struct drm_crtc *crtc);
 void mdp5_crtc_set_pipeline(struct drm_crtc *crtc);
 void mdp5_crtc_wait_for_commit_done(struct drm_crtc *crtc);
+void mdp5_crtc_release_flip_work(struct drm_crtc *crtc);
 struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
 				struct drm_plane *cursor_plane, int id);
-- 
2.34.1

