Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886189;
	b=TK1nEKkgFvdo90jj7TXhoMVkG5gF8iGkXY0jCwELW0KoUY5Cf55B4iccMgdkWFtw9d90
	 BMvj1HrZiQd60Y26Ru1yWR+yTnd9M9Lednw/7rWU2kp1sxKvoy13LlxJOrgO4bAzXGrp5
	 zR7O5EbT+XF2ZX3s7+zwHahJdFVP/TsLSRpHjmfOswcWOt2NxSAldUKsCYY+gApCm147+
	 cj1Kc2QGcMrFfcshUbzU7aH8Yr+l2ePbK9HU0BerOTcV7ZM9AWekUqAOsnVIASJlHQNRs
	 H76wZ2Ur9qKYGN6F9GxXoMDf9ZEY8kmchrXh+CQHFJbarinBwmWzl1dvKfe9JblZTXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4iuG6AWSDaowvXh/YsqYhfb5Mttxr4/Y9Bs8/UE258w=;
	b=QyeSUjskLr6rOu4Dc0V6o0Uj3gxIZqpHNoDFYpS4RRCJHejJdql3IQLFCiAkXoPNSenL
	 9dNU8nvceUOS/7xIx1/royqe6o0H0RFeA0C6Y+oILQcX8p148FrH/3e0oT7WhgzNOTpp+
	 sBd6335JJuLkqMGIUBmgPX8GoRK94zL3f5CIF3ZrOD0oHS0j/1G2DmER0LgAbEP2OQw6d
	 VAuncgTbkr/v7L34lW5lUWXxrvP0F9s2fDqiLfdqrgAJ5kkrvw/UAEtYkkST3+xXZTQCX
	 s4R7Ye++t74qLxNTFOa/Eggoi1rArLbYXeLLib+Jf7tfARgbmDpJPd/n1ta6go+cAAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTtrTek8;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAEF606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTtrTek8
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so5977454f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886188; x=1796490988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iuG6AWSDaowvXh/YsqYhfb5Mttxr4/Y9Bs8/UE258w=;
        b=iTtrTek8HTlF7vvXfecmGgtPf7++ph/wNlp+jNUHx2NatlCDTF/vAlFArvtOJ3fxf+
         PRlXFRmsW3fQHrVz0Qxa3EvXY7B/WKeo/8guTsF1NEd9pUvadhlNnwkF2Wx28pNXeR1z
         f919hBOMFm+kkWCm+UNc+CKhvwDwPKU5/31ziaUE/Q8XiQVEdNjfF9TBdylQ/MZf6Oyk
         w0AXBCWGHZNznXMxb6vGW/FBA76oQ9eHHFJdohpYO2mI909YNXaFm7oR7mmFp+ayuEUD
         GGsBb2FlcETg1cWaheAw9HuwwrLp4yWA2XGC2KxoKxMUsG87CfpJRt2plvrrXMl5tBIg
         KxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886188; x=1796490988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iuG6AWSDaowvXh/YsqYhfb5Mttxr4/Y9Bs8/UE258w=;
        b=okdaGDBZDvH46cAX5N/iSvPoqNi90Gvkw4pc6wv8TEQGOzniI7xqKO508iTG0pusa1
         gUd6GEZLQ/8+wbALQQSDQ9aXp2Z19BHvP506snP/L8rGoRWqcSxKI4cZUrscPSZv+4j2
         Lhi/rksi5xz9JYNiyJXdJFaDkjeQEn8j8WtQgWlRD+CIIqwNE3BscT6OeyNjPMtVX35T
         Mcm1RSF68bL79+jEzwAke4+nkhL7CCCelXuQsowMlyV9setVlNcp0a9m0e6kb7D0L348
         0KagULyrzDzg6GdxkN1ya09v3NMllSIxWPlCgOm9won+zE+Ih0SdqeIdWaFAvkSvsXIa
         tTcA==
X-Forwarded-Encrypted: i=1; AL+hErEjlJcT2EMRHULA3p4gODb58dexKp0UlhHn2v3jR9953lzYu/NTqY/5JRmlnY5VUDzoeGoUSq0O0XqWhlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oIEADgBXUJ9YANilG7V1yJE1j3en5HizsRqeWwnJ2bM70HlI6
	5JKMYZN35GmM0mI8YuRC1dSweW1j0nGNzh6oV+RF8NdOE5Kr7YP9HOp+
X-Gm-Gg: AZFdTZdE1qnUvO+RN/dDGUa4uY7VbQk47mSMSgErfrC10gl/C5t0rQDanByYThrTCMt
	gHeoUt85nY0AG9UHGBlizA5TO3GMg3Vl5+VHNEcqOFinuO+GlZehgToX7S7VXtFGBfYfOkNXbHq
	mG2r7JYq7kC/HacNjF+r4HmqnNbBkOsOJu1su1i/MOVdZsTnwUVw5k0Qvt/Wpso6JpXdWit+60f
	XgU6/qcUHX5FiAiVg4ejBoti+fFFkd6Qvef938uAaQBg0xGmAHOOaOWWXxPVk1au84MHDEFI53w
	DdBAGQMUeXkgrm7OO2RQMr7cTcdMniCx9oBXc6IKGfnUtH1Q3AZntjCb3eHPWCKeISPwWUD80JT
	ZKfedJv89nnVgzt+B8BxXg0Gca1OpAUE6uank1y0Otd5aQT2A8VsO3Ktta4UC8Z5uh1BanWU7PH
	r2RSdC7MhFYuy8KE4LJvRNpcH6nRHKeMcVtasCBtxOoWv1cLfKgkapYf54gkCdcY3xBUWMSWDGY
	K/r2liHJjdrDyCLRLTloSL+PP90zVpsEClHa/B3sgqWtV7paJsvDBQsWykPSEDUUX2Zgw4GPYZc
	LV8a48mou/uGnTr65I3MUHLB9dt/xrtpuTyrSw==
X-Received: by 2002:adf:e009:0:10b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4abb4c7ab68mr39436606f8f.26.1795886187873;
        Sat, 28 Nov 2026 09:16:27 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:16:26 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sat, 28 Nov 2026 18:15:24 +0100
Subject: [PATCH 6/7] drm/vkms: add a multiplier colorop
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
Message-Id: <20261128-colorop-v1-6-dd79919f822b@gmail.com>
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

Add a multiplier colorop that scales the channels by an S31.32 gain. The
value is sign-magnitude like the 3x4 matrix, so it goes through
drm_sm2fixp() first.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c  | 17 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.h |  1 +
 3 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index cceb9acca0da..1e1e470be4dd 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -157,6 +157,23 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
 	drm_colorop_set_next_property(ops[i - 1], ops[i]);
 
+	i++;
+
+	/* 8th op: multiplier */
+	ops[i] = kzalloc_obj(*ops[i]);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, &vkms_colorop_funcs,
+					  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
 	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 51ac2ae75cf0..b94c51264c64 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -365,6 +365,17 @@ VISIBLE_IF_KUNIT void apply_3dlut_to_pixel(struct pixel_argb_s32 *pixel,
 }
 EXPORT_SYMBOL_IF_KUNIT(apply_3dlut_to_pixel);
 
+VISIBLE_IF_KUNIT void apply_multiplier_to_pixel(struct pixel_argb_s32 *pixel,
+						u64 multiplier)
+{
+	s64 gain = drm_sm2fixp(multiplier);
+
+	pixel->r = drm_fixp2int_round(drm_fixp_mul(drm_int2fixp(pixel->r), gain));
+	pixel->g = drm_fixp2int_round(drm_fixp_mul(drm_int2fixp(pixel->g), gain));
+	pixel->b = drm_fixp2int_round(drm_fixp_mul(drm_int2fixp(pixel->b), gain));
+}
+EXPORT_SYMBOL_IF_KUNIT(apply_multiplier_to_pixel);
+
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
@@ -489,6 +500,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel,
 	case DRM_COLOROP_3D_LUT:
 		apply_3d_lut(pixel, state);
 		break;
+	case DRM_COLOROP_MULTIPLIER:
+		apply_multiplier_to_pixel(pixel, state->multiplier);
+		break;
 	case DRM_COLOROP_FIXED_MATRIX:
 		break;
 	default:
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 28323df662a4..5546ee864504 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -26,6 +26,7 @@ u16 apply_lut32_to_channel_value(const struct drm_color_lut32 *lut, u32 lut_size
 				 u16 channel_value, enum lut_channel channel);
 void apply_3dlut_to_pixel(struct pixel_argb_s32 *pixel,
 			  const struct drm_color_lut32 *lut, u32 size);
+void apply_multiplier_to_pixel(struct pixel_argb_s32 *pixel, u64 multiplier);
 void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
 #endif
 

-- 
2.56.1

