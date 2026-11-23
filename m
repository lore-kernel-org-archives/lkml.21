Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450887;
	b=L7hGBLvBu5ZV0f9r2bTUzcgbs9HBQzlEN7CginkgDC7SKaVosgHH5saupuS6g/fwGQjQ
	 YxpPpparGzy9zZdPlwpea6ME3qcT7bac7v8KfruPrLNdjawNqbUxwSL6zEuTp+uImrLwk
	 DrmKpnwdiP4b5s2sQfw7qmvRQvxniQBSTsVAdq28G78Vpo9B73oBelUkgHZpTb2M5IgCX
	 b01vU4Tc80NaAnHTLkGXU3yWMnQzBTdrVEmA2KVfhyCPGcmBJWNd8Qenn6wb1VgKaytD9
	 QGSUsVwjqix1rDZn+iJZfJnaMtOR5KAPvyt+xaolTTm6631sGtyteqOB10MyvIHkOkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CROCkTNrvr9SVl0fcyGZz0CF6h4ZrCTd+OGObZ46h0I=;
	b=4gTlmBeTv0Ynq/3SUauaBgQwIdxFd6Dq+fA9R8CAVOIqXDUyjF9yWM5rijrcedXIswzo
	 9V6A6w1sqPStxRUNt+XzByYZNKyGmqoayzIXL1wCDGM5fB2JfEjb1s3wThICmWNuf+W3s
	 9tVA1wmETlD5ThuIU4vPLIfYTmlmq31cOskupZ+BbjNtFxJHn5lstpEsiVb9DSOXvmuuu
	 T6IXtYw8A5La6Xh/YRniRrFxmiGD/eImGyb94PVOnXrZOBtO+NdLIvtvt6flZItuLAgpK
	 tj7HCuvj4edbpDjcCqUUDr3uKzh8xNa+8lcyfj2JrTIQXPAad48AfVRogTlz7Sj8yKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5HOedR6;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C6B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C6B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H5HOedR6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso2895188f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450885; x=1796055685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CROCkTNrvr9SVl0fcyGZz0CF6h4ZrCTd+OGObZ46h0I=;
        b=H5HOedR6DxEd3lZek7sEi19mGuWs9LgNzQdTLOLmy8Kcau4/0c1q0zAe3X7clSMFHH
         VDp7rUhKJFPxu3gfIgF8+s4ogEm09gnUjB9W0bqXT1OEbXNbMyrq0O3WFYSEDfBmAP+j
         YI4yLH1JzrUNeNwoxpTR04CehPlI9Tlri2JZnNL9rRqZhFCaXaAQcuEvJ115r9LdLtTa
         hqo3z4jJFvAmYdHfiTesqlh2rGxKl2zFFfrx62f0a/BnXGeO86awv5OXFYe5XUk6HWpS
         IyuezGlwylzkZ2TMpcq6O6VJEYAPxPKn6dih1JXMgFUPLPrkspQJokw1g5gyZRb8yDcb
         9cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450885; x=1796055685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CROCkTNrvr9SVl0fcyGZz0CF6h4ZrCTd+OGObZ46h0I=;
        b=oCHBAUA9763172kMpD4twCnq2e2Sar2fuOwADrKQJfyoTSv2uC2Ta16sG4N06d+4gT
         SrJioJHBU8M8ds2jWXN/rYXLDMzyaqKuPJ/w4DmTJA92sR3KhdZkQmOm/yvSVZVMkfXq
         bgBDF835tj77hRBnElkJoOQ8hPivRTCsOrPtey/v+KKGm3l9rFIhfsh2HTA1+Nj5TyWT
         z07thaqmfZ6H7bCWwOTpap/GbM6pnZcniqNUu6e8JSbwm6jx4Dp4DBlke2xK4weUIfUI
         KiO+oxzN+rD30AzsKHLspoMPjzjN1umM5gTauKb4RHtDuo8Koj4cX/8hZTje6jC7WN0G
         Wlrw==
X-Forwarded-Encrypted: i=1; AL+hErGq+7D48OwBHQur1gkMP+5u4l86eF3GHARqmsU6U4jcXJz4VWq4JURW4Fx/vH6WWwmkWJUwAc6KmhjBdwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CDQMdZHxOruqFc1ofrAaAgYKdYfVAhednQ3W0HNeYFNJmcpVY
	VFXL7nJqfk8C7q1OMw+MoHzpqouqT2x7+VZfjEqzV1u/hKS36H9Ef+Hq
X-Gm-Gg: AZFdTZdZaqLzL4GfxZ8RuJAIahYP+wZy63gV9mUewzTdhEkD3f78cIdvuyu3GvaBu2s
	yuO0x5j75vwu6kzN+CDHeCy8eI3cqZ7rDWTCZ2uWlJ8T9W/ADhfWs1ahWkudwsvNcb1zhqRZI/U
	5e8T6CdTE6TwsBZBRlAdwU0+dapd+HaWgBgBXU/6BFPNRyzyIDbSp4aoYGt8LNyGviAhNIIFt3G
	aWrRGlbtXwoPaeIjE6PDDmtgs8CmjxbaiVmFgsrLdBVyL7q+pipwHbJvpVykcvK7MHJ82bRq2Tk
	wBFuNewhax5YPlySTt7JNpNwmdCRCkmCrgd8aWYgoPAWEi1H/FhvHGsxVLf4XsW0xWS3e3zjmPJ
	a90cxqpV0e7WyJK65zDJIH+d1mYH3iZqXCUS9+pkW/3ObL96SqNsnskXyKU7gwRFzRsVraW5fuH
	XjKJRXSXnQv8zWTgymM76poG15jhQkBl9Phqdi7iSXtcxVgAk2zaHOT98r3m3kadpuPsAKVV/2D
	CaukUX+Bm5a9F//98kmB+fUivxr1W+OqUIGxMCVqGv6qSFnHCOCSgNsyx0/mcJdYHTUiSgYrfgw
	/fI9lpgpZJ1LANaX7cHJxPK+739Eezjr0cOTwrpM
X-Received: by 2002:adf:e19b:0:b0:49e:f905:4698 with SMTP id ffacd0b85a97d-4abab6de682mr23267543f8f.2.1795450885341;
        Mon, 23 Nov 2026 08:21:25 -0800 (PST)
Received: from [10.56.169.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm18863696f8f.35.2026.11.23.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:21:24 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Mon, 23 Nov 2026 17:20:29 +0100
Subject: [PATCH RESEND 4/4] drm/ci: drop the kms_plane pixel-format xfails
 for vkms
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
Message-Id: <20261123-lut-v1-4-5556c89a2ebd@gmail.com>
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

kms_plane@pixel-format and pixel-format-source-clamping are listed as
Timeout in vkms-none-fails.txt. With the per-pixel interpolation they take
160.1-167.8 s and 78.9-83.8 s locally; with the precomputed LUT tables
they take 9.70-9.84 s and 4.87-4.90 s, so the entries no longer describe
the driver.

This patch depends on patch 2: removing the entries only helps once the
subtests stop timing out, so a job that takes this patch without patch 2
fails.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 029bd4956e85..6ebcc7d89fbd 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -16,8 +16,6 @@ kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
-kms_plane@pixel-format-source-clamping,Timeout
-kms_plane@pixel-format,Timeout
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
 kms_writeback@writeback-fb-id,Fail

-- 
2.56.1

