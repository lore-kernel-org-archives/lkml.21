Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847956;
	b=O1vAx8PtbmRe+8yhS+Duc7ERo9jlxOSHaGTUXtLk3RT32/NehEswgaXKUwNNuUzspAVI
	 NjO+xk2EqRoW8sTF2VbtKupFSHQnn5MeSncQlzAFBfbi4B0xLk4qj26F72LOkA9dauKvq
	 DHuOILWHr12+Caq79peS/mHDO5ZXzdt7RhnspCVkL7ibKYfDY44riHHfLwkcxkffO6ePN
	 3BnsXDI+DvF+QnPOkH66od7Vty/Q5LJaJIrwF/gKfnWjTxjZfnpfprtNvru4B2vq3mGPZ
	 tHjX7vuC+x1U6c2Oyjr5D0hGcDQHjkjeVmGwoCQz8UBrcWGUX4yCBlmKF1XOH27jX/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9gp1NYV9MXlZIke0oUQdNHBR+MQ+XNi8DFIhrHDnoJQ=;
	b=1rtNKVmZ+MUiQ06Kf50qlex3E5xn5+8/mYTBhNz1TrRCIdpeYNKbVKd4oFC5qSiS4EOj
	 mjz5YIKoRvoLmBOGqyizwCp3vRq55WqRrscjn9F7J/2TXLMtXzd2XnKsku+RWYk+vYJYu
	 PsvQxMpqfzdKjBJ8Hiy0g1HwK9jrgjtu9CfN2L71UvDznOP5sYS3Ke6KIhKkbwt0UQK95
	 xhuebF7Ba8UR5ThC5edjQulhwt5d95RCk1ALXqoTPHIYfPMi3fh081AF1gIgZWMfZyqZY
	 Kxzz0HiLOKuwuaQs/BxqB21GpZv07KgfHZdlx3FihCiqSxqtRTFcYTXDQTVkaIK09Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=oDAd8S+t;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0731606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0731606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=oDAd8S+t
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b904d10882so3656310b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795847955; x=1796452755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gp1NYV9MXlZIke0oUQdNHBR+MQ+XNi8DFIhrHDnoJQ=;
        b=oDAd8S+tA2W+StCWRbbnWCfBYuW03U6u/SeNqzhTswbOm4DNcWhpzA56E7QFkf1S5M
         h7owlibyljp8LIRcUqV/6Ikf8MGG1V9ZwbNmMMADMlMIwZ7sbRImTt8oKcY55dehdCiG
         Q/ocAAKxP6u6XpHI/CdhUebEb2PsmKS9YOBgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795847955; x=1796452755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gp1NYV9MXlZIke0oUQdNHBR+MQ+XNi8DFIhrHDnoJQ=;
        b=OJ0gvZin5TpM7URd2MUzn8OG/FRIRbOa19RR9a58hgRWliA74GQ0HqrsDFlr65O96m
         LBe2lHU4kXO0mdKeo3IzlpjqWWXHnozcUxzF5Ldl3QclBjaAwGIN/6V80EK67znbvv0+
         OzCrS6M3v7WGe0F6L6Ko6nq8aoXtCx2zGj+75c+dTLX15X92nBj0nrje/lPGNfl3o8kH
         BEMcd8UEQYpHoaY+BEETDk1CbIgSjrfA/gayuitoeczm1X+SgoS8aERHRqmjBznxwtl1
         XO02UM5gb1vWm6tIGQG1HqHMse72dXGzdZG7eGLcn2t1XL8EDKhuhKYaQFeboj0aFtqE
         Rcqg==
X-Forwarded-Encrypted: i=1; AL+hErFxJJqzIn+lTUC0Xq5k222IAy5zvOrb4FiA5D1X5vaWnbB38zXMKoGMTeW44S9oa++TORuNppARf+1gh6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gRf4EVoAJx5hX8oNxHE+mrhL63zeicEbEa4eBAkyPmAfWncjO
	wSDCswIQHwOjvkutsypyAGe2cyHuc+9ANXCyd8MEwfsg0vbqTBv83OXsUjzfZGIjJbA=
X-Gm-Gg: AZFdTZcgiGdMIwe/AWZNcefz94PF2ZkoOs167B1mVLo8U/Ngbc3ExibEPBF1ccze1g0
	fS7swq/ElN3BYF6+YaAPZQuBxFlPFzDokG9oMbqNSmb8Z+oQb7c+ufHoRbW8faxnaeFwAmGAXXt
	XY08pkLeF0+JIKlwcTZ3xkJkcF6iAP6FBOBLzKNqzi8HWDZ0DIuu+HfkMGkvftsNKdo2LlEOPOt
	SMneTp/Yag9wgApNu3OHmsk245ho08gtgArByg74oSJjNTqMJpCxHkti24sxwDpb2B6q01p63mI
	cHhb7RtBmhoPgV1oCdNTVPn//Qw3+y6obm3B/iyL/XE09bpxoT/hKRyGSjKY84gcHDuc9dZacf0
	rK/QR4Tj4fblFcTZBKc9xU0FcKVNgtxq+w62d+S5fck28f0pFQBStFavCbbi8QXpWHutqeAF/sH
	T3MV+ozL+sICM7kBuiT1Yy+BvejSbtkWhk/nRCJBk0pDVOGuQl1QFtg1eHSndRPGxXocM7x2dWW
	gacu4T/8NYLELH5yQmbo72eZjXTQgKs1tdd6NJjT8gQPnVymWJNfxvH6zS2XaAL5OzRl+X1GG01
	624kvzC9wnznynEnd2u4PnbWcjtWVcqg3da1vbiNE7HmT6iEGeYChoMxfY5R2dfStK9PEGfFms4
	WahIMmN1R78evqNY4S+Coa09Rr8HFh53zvA==
X-Received: by 2002:a05:6a00:368e:b0:89e:3742:3e16 with SMTP id d2e1a72fcca58-8c87bdb526amr26434266b3a.18.1795847955449;
        Fri, 27 Nov 2026 22:39:15 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm13939838b3a.2.2026.11.27.22.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:39:15 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Haoming Gao <Naixumogu@whut.edu.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH 4/4] accel/rocket: Wait for read fences in rocket_ioctl_prep_bo()
Date: Sat, 28 Nov 2026 15:38:44 +0900
Message-ID: <20261128063844.1537615-5-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
References: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
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

DRM_IOCTL_ROCKET_PREP_BO begins CPU ownership of a BO and has no
read/write direction flag: userspace calls it before reading an output
buffer as well as before overwriting an input buffer for reuse.

Since commit 4d8cb7be620e ("accel/rocket: publish read fences for input
buffers"), in-flight jobs attach DMA_RESV_USAGE_READ fences to their
input BOs. Waiting only for DMA_RESV_USAGE_WRITE therefore returns
immediately while an NPU job is still reading the buffer.

Wait for DMA_RESV_USAGE_READ so PREP_BO waits for both write and read
fences before transferring ownership back to the CPU.

Fixes: 4d8cb7be620e ("accel/rocket: publish read fences for input buffers")
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index dddaf9d2fbc8..c5c08da72f76 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -165,7 +165,7 @@ int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm_file *fi
 	if (!gem_obj)
 		return -ENOENT;
 
-	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_READ, true, timeout);
 	if (!ret)
 		ret = timeout ? -ETIMEDOUT : -EBUSY;
 	else if (ret > 0)
-- 
2.53.0

