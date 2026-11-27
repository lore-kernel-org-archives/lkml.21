Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813752;
	b=yA9ekvGeIbhIPMlu6b3j2vEerv8CK7Nzl8/jfP6V3JvqGmq7bPvz9+SEN8davYMDSOor
	 G7Lf72IIV56QCh9g0ywzu9/4Pde1CFhk/iT8V9A+SoNjUFWs8ryHMds1IIp+awS8Dz633
	 eMKUEbUL0UJtxxJU3PTJMTco+160H54MwmGfks3yAnuzT0kGiI0WDcQUyHVn3/MwJJGzP
	 TrUCBf0GJ3mS3ZPqdL2f57qNtM03W5Y+IUum0/okv1P+pT/P3FQ3YaLXMmCiUNSAKV9Uv
	 UNlny6jLbDAAE7ORrMpc07ExcL+I+CvGP/JeuCOZnFLGW6m5Cn1At8ySd9qbvpaVwcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XIvy0mpNH25dJka9yiHVSc+lFF3CQmZ8/QH30h3M4Z8=;
	b=QGyPNKxw1XPq3UdwZ9qI9bIAmj/Fx+hvIQJz7r2EhUPgGh/3ptakLCWy9SV2ZZvFfKJJ
	 xQErqYRGUB/N2FiGegd1ZPHTfQmpYl0yoyEs6dghlo9AZ1nWUSL4GPM4d4+TvMOVcXwa5
	 lbguQbaW8WZQGVjeXxZ5IMvCTPKRBqvRy7jTTMquWZ6UBWz+LCslP5XMw2Ijq0Y1eW03y
	 Z/X5bxSvD9s67+f7qy9J+lKwSexc6Vhv+IV8TaEwUgyyVoOOH/B1HYE3enirAzVDznCp0
	 66Ecj3Lzv+4BYy7R1m/E2YLBPePESJwN+oU2TuLfiZk4hcEMO94u7tdZObhpEuPJuCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxCEb+7z;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sxCEb+7z
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-92134c4592dso73551726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795813751; x=1796418551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIvy0mpNH25dJka9yiHVSc+lFF3CQmZ8/QH30h3M4Z8=;
        b=sxCEb+7zA+wFTPzdrar6GAaO3t7CBZTNjXIZfaB2FTtT5vTG997JcNdHGjN2KirZy/
         eqLILNLSuus1tGchZzG8TuV7IlqZeNA7LMxqICsaaiFAYlHISVzhBG0kVtAb7a7yszGI
         V+pcEFopGxbc1bIc83BxedgG2fe49+YS7PHmIyge52rb0W16DDtO7wB0LMeAXgVIt/ra
         ImHbZfvAbvMi3sZs4FVS8/nL/5o7zTBigtOnF59wGdKzD1MwSii9ZvcTU2caWHWxeY5O
         Pd5PAUCbf8JDUEg2tqfjdF84qf4ksqT1yyYSqpErHWwsYUHD8HT1KCGlMpwqZBhiZEul
         /RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795813751; x=1796418551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIvy0mpNH25dJka9yiHVSc+lFF3CQmZ8/QH30h3M4Z8=;
        b=Fi5PUJWu9j+bDWJ6RK/x73BjAcEcRUZlNKb4pbma8+p8IwIoJbmHtAeOJuy33QPcGk
         0CIKncOZ64wUtXIuuUjY4yXFfiageCt3Y7nZXkJ64QXr5QYgvYZR/xO+wLyNZFcmzjBl
         LV2gnvWpZfp310RJmsvt119S5AhV+F98bC0FfbS96JRH/UPVJDiaDFoWsnqjAFCTfsg8
         2OxwXOtHsokKtj4lNzrna0nk3d6kBfbBHRM3eMHUIYMlVm7Ai5N4GFRqClZ/hF2N3ZRG
         mqHS+VTDdSS0HWnY1GhoxGhGczM2DrORuPOUs7Oa8NXYJFCbOyc0R4WV6NTev8CyQZF/
         +5qw==
X-Forwarded-Encrypted: i=1; AL+hErEkxUJxv5SUVD3LZz+RivuSNInfchIo613yE7UuNNpOr/crK8URXE333BfHJynCwqh1UupX6FKllb3Dth8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fwZPzCPwbw85SiuOqkDm60/XOQvGrX9HMFs4lmcR9yRykq84P
	oDfoasELrAQKCH19BUoKZzPqxJLMmll7aFW4TptfpapKudZ02TkmnRixntdbt7KbeHgbT52N
X-Gm-Gg: AZFdTZd8a4HSd5Mp8LisVk6rWfLoNKTi83KzD+CRSc29As+VXkyLeGwXaYfXivImr7s
	diqvCpqXelZdTGi4O7kaLsZ3lyb8ubUXOJeRdTwT6EtnHcBloIWXjOG956yeaqusiY+56SsUts2
	QphzW4wcVGMaNeHRvKf9dUq07XTou8knXu+ti36bbvJx0tyR665+EIpxZFWqxBlPIavfuB8Q8gx
	IupT+N3wpt67eFLCzPz8h5tt6p94Hg0s3GMrhDYKt4JN1twPhQonR8pnhKjIsU0uPhLWtFarwJv
	aJwN+ss4VSjGf9aABGpv3Mfp6dlx6uOLhK8fO/W54jK0aRYUfaNnEgNS+qA5PQxmIAQKsoPGXBY
	Y/ONMkrETM6U7Y1comCuxrkpRnLgysNf1Nue74HXcyOWBalAX80O2YBTfJd2M781tIG7gHGZczc
	lwArji4KSO/QggkLXdXqx9FFLPCvmMMqjtkQt3NkiI5xI2P//vOaukjdiS7dj2wL9qJZA3Dqugn
	a4gMp8kIE28dCoJKnDRMSjeoheo9IQiO8AYrVLfNrLdsXo6Ktqyk/oBjPIkB2k3orRM5IYGqBxd
	AezwBUuU7Y3+57KTnKAyE1aY54SvKDmCuiZD67QePYMadjI1iSo8N88Yoly1ZepY9+lTldvdu37
	VzMt7J2TrQ8IXNvA7OdnrjjASfaFWKdpGqXcRVRL9ehJY+boNCqEzs8fP9XZY334tfW4xV8+IZQ
	DHTLFZdrc3icZTU3o/1ny9VDjGC6x+yTIPJzu+eRnMsGYF/VHYIm2xu1DULvk2i+HVXkcxZ/3us
	nptGGOmF+26+Ch6Ldo3T6U4zfls7hn6x0BnZRNf18J0+0vWv1QQ6SqzquUGpbISIM0=
X-Received: by 2002:a05:622a:a10:b0:55d:17e:f87 with SMTP id d75a77b69052e-55d769374d6mr471770991cf.1.1795813739524;
        Fri, 27 Nov 2026 13:08:59 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5046:1a00:2403:c7fc:983f:c934])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e32dsm219584681cf.13.2026.11.27.13.08.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 13:08:58 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jesse Casco <jesse.casco@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: link Glymur layer mixers 4-7 to DSPPs 4-7
Date: Fri, 27 Nov 2026 16:08:57 -0500
Message-ID: <20261127210857.65336-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Glymur DPU catalog defines eight DSPP blocks (DSPP_0..DSPP_7), but
only LM_0..LM_3 set .dspp. When a CRTC requests a DSPP per mixer (e.g.
for a CTM or gamma LUT), any third display assigned to LM_4..LM_7 fails
resource reservation:

  LM_4, invalid DSPP_-1
  failed to reserve hw resources: -119

Set .dspp = DSPP_4..DSPP_7 on LM_4..LM_7 to match the declared DSPP
blocks. Tested on an ASUS Zenbook A16 (UX3607OA) with eDP, HDMI, and
USB-C DP active simultaneously.

Fixes: e2aeb8deddae ("drm/msm/dpu: Add support for Glymur")
Cc: stable@vger.kernel.org
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 4eb4a0e..280df25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -175,6 +175,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
+		.dspp = DSPP_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
@@ -182,6 +183,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
+		.dspp = DSPP_5,
 	}, {
 		.name = "lm_6", .id = LM_6,
 		.base = 0x4a000, .len = 0x400,
@@ -189,6 +191,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_7,
 		.pingpong = PINGPONG_6,
+		.dspp = DSPP_6,
 	}, {
 		.name = "lm_7", .id = LM_7,
 		.base = 0x4b000, .len = 0x400,
@@ -196,6 +199,7 @@ static const struct dpu_lm_cfg glymur_lm[] = {
 		.sblk = &sm8750_lm_sblk,
 		.lm_pair = LM_6,
 		.pingpong = PINGPONG_7,
+		.dspp = DSPP_7,
 	},
 };
 
-- 
2.56.0

