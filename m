Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450863;
	b=uBvFZIsATOFT1Eh+JD3rVWIA+ofXgwjggE4Y79dyiFuBEKKQmLqr+pP0Rlc0x49JXzJT
	 ACG75lI+Dh/y7AWpaU4MvSnuqOlDgSDkYl56ZcjvX008g1PRLWKaRhXwU7oRStFyOpGtV
	 UTgEWCWlXU6utRmcFrvrIzbFR2c1Wwho0LBS4yynU3KwBPm0GEUTnZWhMN2FIuTg6VZrT
	 MORLqzLdhvcTlidSWQe71xUMwFZS6PXZZYUhS5qlAesIqOxBL3rgF0ysuokk3TIMzp1N2
	 Jt1RWNpGGDfGdMfBRAVrYyuyi+bLvdkU12hPgzJhwo/xO5jNjuRj9wOxtv5DnnwFRrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YzubQEnjwJsrBu2RrZ0qMrb2/G0AODdy9U67Pg3rZzU=;
	b=CW/em4iL6JMylrWjytOjHytgHLPlyayp6yXTw04FTX5zJH63ImgRVtJnswqH2s+j9JcE
	 g8d6kmc2vg3pApvc6vWbtGoiAXxNVunZzshngflygVbytk2P1bDskT9qWliwOPUaafUsY
	 +25ZKG8EZ+QaAwH55hHR4qudDQt4gbTfuS6IpLTBlyqauOI5KMV1AMK0PwVjbdyOReH6C
	 YFmsbSwPzdVvlm7EWQDeasbUEUZ+LfGr92flTlA1JOiv6WsvgUkzsPLMbwZQ4osepzVU7
	 5LUmWS9xid/0kanbrHUZFMNr2K0MUQaV1+tB5XubQ4VbRsbRmce4WHs/dSkNnVaXBzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apXuLujZ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD57606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apXuLujZ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so3229201f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450861; x=1796055661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzubQEnjwJsrBu2RrZ0qMrb2/G0AODdy9U67Pg3rZzU=;
        b=apXuLujZDyW5B9GuXuyw1WJn4mZpDsVI7r9AySShOJE4+hu+Q/l8fNy1ZHtFFp96Km
         3y2ZX6RAuFmvGlI4s9GZ/pPGsRO4OvoJRpLohDKL0ImX2ow7AMwFy78k06NSFopLuPjH
         rcS0UnI5PAkQfcHqSASvMzXT6l6DY/MDR3Vhn/BSs6uDvl4vmbwZCGpnwMXadwsW4qp3
         KCxXpRfP0kf2xXg9ibHkKU+TqS75sT0ryPj6LzIfP1fEFkDEWuSujux1vUYuPfdoFA1I
         hbk+T+eStKfXydmMV56Bth7shmIRuOFaaU+sSo2YQgBp/rxpXtLWEdngf69OusYtG1SU
         hcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450861; x=1796055661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzubQEnjwJsrBu2RrZ0qMrb2/G0AODdy9U67Pg3rZzU=;
        b=fFQhmunaDGa8Pu7/CH974AgzyqP8rhZ5MMt/fINqx1BoFzWdMAkPFaKX7EyPOmxmb/
         gNsNvfUmifQOOHvVZCoU8QD3UWUW9dwi3lYUbFVmKeXLpbja1vuclEYpO33GnT84e2MG
         pduCefUgFbVsPtLuwA53R2zLstUFZAh7Ogtlo+MlFdIZRZk115vjmPa/Su3BWqicT0B5
         nT6HTyC+wkFwlt0v8LFq9CJDaN4P1/JWPF8je18o4aTAE8WCqKtemmBgRsTEdjz9ey5k
         lskZvmu4bIvMoh5i8+HpowA0Jn8I02XJagO/oquHWClmSLFbISPmKV34hKtVIF0ePgVu
         1xQg==
X-Forwarded-Encrypted: i=1; AL+hErEniqFzGx4i6wyYgPalUvnex0skAKTPgwurLO4PJEkqzwQi/mq3Wo3dJvtggLwRfjFOfKiAZDRneO3Fy7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fmL6fQpe4EplgtsG/cgkNi4HhUVqTd5bNJCjrwfpruf5WLsal
	2Cx3LLjGfLgS2h3C6GDmbV1IC2oTz3FeifbEN9nY/4Mm5jDJXrkLSn4D
X-Gm-Gg: AZFdTZd7lT1KJdx7alzoIS/TKJQ4HvcqslEH8hBin0uX70wUric3IwpnQ7X0Q504GUj
	ivAFlttlbZjRk2WVOEFlIFSD8l3Z9MTSzXRT5gbErfCz0xdt5EXkvwQU8p1Cr1Ub7TrRtRVuh/T
	Dm2ZkVoLPt9xHYpGo0A80TVsyi+/4B+sTMubRGzfp4Hxu5/M7h2feg1w9vxscxB+fyiMKJlGhvP
	9KI8T2h4giI77Y8aPtsays2kIJ2+gUmr5keG1l7EOt9+DdBznPJkfrE10ZyxcySCqZKSHr0nkOU
	Us+Tm9Mqq+6hcw3BS6AOPNEAIdH9J+WKzNuo/BxGSZ4YHhbwarsD3B6drnJxRLIFV8e2+x5Dttn
	Ue6YRC53JwCJApgMQGRCSIpVV+naq+G1us/npP6z0+Lrd+njgEw7BFp1pcEIM7EOn95DoSSgrbr
	DqRVnnyKrzUUscZXrzWvEDdIblwi2ldMxuoEs6ZbItbvKfkgSjsBX+0gIp4VO++m2PEXc7lNBt3
	7qPDTa8pKKXlYXlHFUgtQyvggfKdthfGfy0dZ4+XxE+U8osv91/e4jZ1g5cpN9i9ihVXAFoHELS
	wcK5WE6MBfLB7D8hUMTgC9DsR7JcyLDBIXIM+TOkPNHOxMC+LDunf13M1rT/Xg==
X-Received: by 2002:a05:6000:29cc:b0:4a9:32c9:a6c with SMTP id ffacd0b85a97d-4abb43deca6mr14713618f8f.50.1795450861461;
        Mon, 23 Nov 2026 08:21:01 -0800 (PST)
Received: from [10.56.169.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm18863696f8f.35.2026.11.23.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:21:00 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Mon, 23 Nov 2026 17:20:26 +0100
Subject: [PATCH RESEND 1/4] drm/vkms: use the gamma LUT of the state being
 composed
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
Message-Id: <20261123-lut-v1-1-5556c89a2ebd@gmail.com>
References: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
In-Reply-To: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

The worker can fall behind a commit, so crtc->state may be newer than the
state the frame is built from, and the frame would mix planes of one state
with the LUT of another. Take the LUT from crtc_state->base.gamma_lut.

Clear lut_length and channel_value2index_ratio in the else branch as well,
so that gamma_lut is either complete or entirely empty. Nothing reads them
while base is NULL - apply_lut() returns on that - but the next patch
decides whether to rebuild its table from lut_length alone, and a non-zero
length next to a NULL base would have it build from a NULL LUT.

A zero-length blob takes that branch too. It used to leave lut_length at 0
and channel_value2index_ratio at drm_fixp_div(-1, 0xffff), which nothing
read either.

Fixes: db1f254f2cfa ("drm/vkms: Add support to 1D gamma LUT")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..1d5658bbd493 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -609,6 +609,7 @@ void vkms_composer_worker(struct work_struct *work)
 							  struct vkms_crtc_state,
 							  composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct drm_property_blob *gamma_lut = crtc_state->base.gamma_lut;
 	struct vkms_writeback_job *active_wb = crtc_state->active_writeback;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	bool crc_pending, wb_pending;
@@ -625,19 +626,22 @@ void vkms_composer_worker(struct work_struct *work)
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
 
-	if (crtc->state->gamma_lut) {
+	/* crtc->state may be newer than the state this frame is built from. */
+	if (gamma_lut && gamma_lut->length) {
 		s64 max_lut_index_fp;
 		s64 u16_max_fp = drm_int2fixp(0xffff);
 
-		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+		crtc_state->gamma_lut.base = (struct drm_color_lut *)gamma_lut->data;
 		crtc_state->gamma_lut.lut_length =
-			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
+			gamma_lut->length / sizeof(struct drm_color_lut);
 		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length - 1);
 		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
 									       u16_max_fp);
 
 	} else {
 		crtc_state->gamma_lut.base = NULL;
+		crtc_state->gamma_lut.lut_length = 0;
+		crtc_state->gamma_lut.channel_value2index_ratio = 0;
 	}
 
 	spin_unlock_irq(&out->composer_lock);

-- 
2.56.1

