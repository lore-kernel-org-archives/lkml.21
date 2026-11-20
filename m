Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208210;
	b=ZBjLWNhEIHt9JUlRUixtiJhme+NkNq2NU4DBRWHIl4pJEp5gey9d1WBUgb/m0zFOTQDE
	 n70ZYtmg10aP8mPhj+zqA5Pbs2k+ynhZYbBrmrFY2RbLRhzEGaWSn31kXSVbH99xa5kXA
	 Qzlkm+KpFi7a71Z9v2RONn0Dlq+SQe3ogEUfpagkwz4mF/3ERHGfESqvgXNAw2oXKuIzN
	 hsM40gQx5lTLiS3GcF1hax5OqnoqCWTrAA13O1NBbXMjwmdPiZXsueOqqr3Zf5T6xl05d
	 jjRCYo21OonyzKBp3lND9rnuziffTULlX3weYK/eWg6Z+GSCF/VpCs7+FaJTsN4IpdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=waGADWzE6IdQu0VH1ZdbZFR3KhKgWCtUwN6jG/+XHqY=;
	b=fjQEPSIVUrOLFmkAoRNyLOtuVl9iZgnWG115mLv7uQI+ZpOTK3QDeTvliSBmfscHXjUY
	 bdiYiIqc1Ss+UTyTatkxsmlUTIZm0KsCiWgOXn4XqPMA+56t4zL2EO0U56q6VMllKzDRD
	 vMCdE2sLfLzPw/dgc93efavo4IEkLEFk25S/NIcCXIuLDbQYyWZLtMYwq3+l67fTaijxu
	 3rnJIDvfPGjfA72Ye5rm+mxW4GSIpSannCckqJYaHL4npMUlE2/DBEe4wVUGV1eBjvrcP
	 qvGaOR3s8wUqSC7AdHLJemGLWU0KA19h1AArOS3QEYMqbvJWfq5DelQsReR5P/nT+Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFieO8d3;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A82606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A82606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFieO8d3
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso1390618c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208204; x=1795813004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waGADWzE6IdQu0VH1ZdbZFR3KhKgWCtUwN6jG/+XHqY=;
        b=CFieO8d3YDyepTJCNOQCnWF3w5RwZclwTy95iiR5o0qv9cT0zIWFlI8vaE+zFSbF5L
         a5x4Iu+cRZY5qqCKo/r8Fa0Mj29WLLroBd6obv6leKK+XRwmhJoIQ4BHhi0kel93NPou
         qTimY848cpsbL14BH/nBY8lvlsahLKNoTJIg9LPhWMX4ik1C9yisbWIZnXo9LUU0VWi3
         aIdBckXLCPpm/dlvb158YoVmiOAk00/nJ3n27Jn2r/TMEKDobauTs5Mt+QXeq96GahF8
         bbPI8j6cKDBOByN2HisBMzgRFeWsb4IVz0mXEhyxBPotsGyYqkQ3Y80fxRfUqXmUAR1f
         FdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208204; x=1795813004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waGADWzE6IdQu0VH1ZdbZFR3KhKgWCtUwN6jG/+XHqY=;
        b=JsqWA5TjJ9Mf5kroHYp5PSV/8IYpD+nFodpBs2MF27zhm0A7FkD2Guz0eKiCToGJwn
         rE06q50ZFlXdoM+x188traP5uqR2P6rjoe27sg296SoP6J0k7M9wrGYxlCpTlN8+qvM9
         rPS4jUxlh/0rYQZH3P3NZaSGYtKy0sakQp3t9jhE9h+zM2knvSdXE3GMCnnRLaXuqSNn
         GnUNHjm/vrimnGP2xOZXOr4X6diz5ymtyX0yPXjpIKtFcP1oiZTLh3hiG9Wo/Yy1WB7W
         kF3k+ZFTtMLoAw+MLphwNCYDbq4sWG6SmFM3SI/JhqR/8ne4QqGM04FODCU00VOUkBh4
         /c5Q==
X-Forwarded-Encrypted: i=1; AL+hErHSfTlzLv0lS0cjPmNQe2ssRYm/0ORhgGVIJXd9iRzZZ7u+u4Ljx3wsKgGfpe9L9/3AwbIkk2SrINwPeuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mZFXe0Sx83RQuAKA/EAhH1UwCwshmsmjfSd8yafdiZyjTLMrQ
	Xnucfcy2SjmrQH0rH9uw5pHto/MNo+WCnRGlGVKZGiNmz8EiEB4PoXNp
X-Gm-Gg: AYBFou1FP0vjQhI3gdjaDQP7KYD13/q4f4VeUh3Oj/Dmzr6Z3d1jJ74JmV0bJXn9p3A
	sUqnd6myAL8d36s0P3aB2HypDTj3Y/atWtYpxRdc44aaAZrMGgOsbaH9s70x/yqf+Y8jzJY4QIG
	NTsC80d5deNHo7h8FtzkRpxu+XUzgZR7qWo5GLavhzZwAUQecfnIElfnajmApu2SYFKiHcJ7O+x
	6Php50GG3e7YCMAsuyC1oLeUIujeRa/yafyRSaVW2ZbgY7RLRsMAefmJn3NR2myJ7ns6oKv19Yq
	96QERZr2W0kTVTnUdpBIT3ckCAmjyLwO8IokBWf1reaiE5RXTfD0UBg3VnFUnqyJ0QpyS+lr/Y7
	8OEk0CFDXsjyEpYhMbR6vSRCvlTFbGcby955nieWa9MCLRo+XUPD6ob3H+h9tsnpghyWq762zFr
	L93H30OF0YHPEbD93ZKkrUfjAelfD+VRkuXuaw5iRhznR2VhgR50SG2+Nr7099sgxsnmMAyaXJy
	ouoHZTwTYSBTg63Gvi0LFEFP0Agsx1RaCk1S9YSMWLjh1nQHKTNOfdqgw0UJTjMDejdk743bRsF
	VU0q6IOQoGulF/EfkUX9
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr3472015c88.39.1795208203965;
        Fri, 20 Nov 2026 12:56:43 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm1598373c88.5.2026.11.20.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:56:43 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] drm/connector: Fix misspellings in the HDMI 2.1 capability comments
Date: Fri, 20 Nov 2026 20:56:40 +0000
Message-ID: <20261120205640.1466229-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Three comment lines misspell a word: "fom" for "from" in the kernel-doc of
both struct drm_hdmi_vrr_cap and struct drm_hdmi_dsc_cap, and "inide" for
"inside" in the comment of the vrr_min member.

The two in struct drm_hdmi_vrr_cap came in with 014da1db5e64, the one in
struct drm_hdmi_dsc_cap with 76ee7b905678.

Two members of struct drm_hdmi_vrr_cap are documented under a name with a
leading "m" that the struct does not have, @mcnmvrr for cnmvrr and
@mcinema_vrr for cinema_vrr.  A patch for that is on the list already, so
it is left out here, and kernel-doc reports the same warnings with and
without this change.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
kernel-doc on the file with and without the change.

Fixes: 014da1db5e64 ("drm/edid: parse HDMI 2.1 gaming (ALLM/VRR) capabilities from HF-VSDB")
Fixes: 76ee7b905678 ("drm/edid: Parse DSC1.2 cap fields from HFVSDB block")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/drm/drm_connector.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..f5bfb0f0e7ed 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -259,7 +259,7 @@ struct drm_scdc {
  * struct drm_hdmi_vrr_cap - Information about VRR capabilities of a HDMI sink
  *
  * Describes the VRR support provided by HDMI 2.1 sink. The information is
- * fetched fom additional HFVSDB blocks defined for HDMI 2.1.
+ * fetched from additional HFVSDB blocks defined for HDMI 2.1.
  */
 struct drm_hdmi_vrr_cap {
 	/** @fva: flag for Fast VActive (Quick Frame Transport) support */
@@ -276,7 +276,7 @@ struct drm_hdmi_vrr_cap {
 
 	/**
 	 * @vrr_min : minimum supported variable refresh rate in Hz.
-	 * Valid values only inide 1 - 48 range
+	 * Valid values only inside 1 - 48 range
 	 */
 	u16 vrr_min;
 
@@ -297,7 +297,7 @@ struct drm_hdmi_vrr_cap {
  * struct drm_hdmi_dsc_cap - DSC capabilities of HDMI sink
  *
  * Describes the DSC support provided by HDMI 2.1 sink.
- * The information is fetched fom additional HFVSDB blocks defined
+ * The information is fetched from additional HFVSDB blocks defined
  * for HDMI 2.1.
  */
 struct drm_hdmi_dsc_cap {

base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

