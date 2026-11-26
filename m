Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674277;
	b=S8VUgXP2vqaGk3jrBaNMUk+zkL3YISZz3F/VOoGfADPTtU9zSA2CBw1anNYagvxW7OY3
	 nDYIGdGSp93UR70rU7K+NuqcV/08dxujlt4ic2QcSh35gu8hNbtx6bIOnC2003x0BsE2L
	 4/O9/QrgBwVtyGIcPlOZEbv6OiPLnqzuNgUPOh0qm3ISp/SBhQAY7plBRMTJ3AeOtrucG
	 ccEH4nv5eA0uWM9Z4xGP9zVVTW8fymylPnLPwI8wbEQqZfmn9Z1hmRf0YivLtj3dgUVxF
	 GdNgR7qsu8n4dBkZW223XZGk6A02eC1OMmExKRkwc8xaXim0bzyfRs9fWiX6MSJKxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
	b=v1SBCg8rkeh6+Wm2H324KLpFcqic1nZ8JhcAPkMCNXGwRb141ysiiuFyHGJbmQgY9PmH
	 EILdiiMMRExAOAh1LQfwQspeYrxgbtuE1rsbhzyCrbyCRncTq5BqVsLhrCGF+JC0u9T15
	 ZBNDn1K2KxbfQzwOB4HVg/iRwPiAfHW7b4Q547WnAquntEvX5D0OevbGmwjl5SUChK2S2
	 slkMLmu7FVp1Cpv7+vzWjJ95rXSg175MMLjHVMeJ9kfkKiJ2i9Oo2BZEixbmbPxSrwZCV
	 0CznTqVtxKj4ZXKY8sYZdyCIiWpBmREsIqueZKbdLd1DurCpD56X6PbibGKvIPo4XfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LIFvDPvW;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A99606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LIFvDPvW
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5039745c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674276; x=1796279076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=LIFvDPvW2Q4ON1mtKt+ZrHY4wmRlqR2atzM4VLHm84GX6Qku8c4P6LPdMzGT8DC0nt
         /ADAmiUX6bU9yPCxYv5OEqNFmqGjUFTUcvnltlMi4LXrEA2MpqkVDjBum0wEG98ryW8p
         TXxzTa2jXLitNUANDtOeucYsxGa28yDAY2GS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674276; x=1796279076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=HSh+yHtCEQIrdL3b1QXfwNfK1s85oRE0UfcUfKdPiU05a53FhQOdX7bYkvs/UsZyUD
         5s3raxcGXCqPpMhTIIt/NjlV1LXeTNzWP6RTxW1YEfdm4NvAK+KFEFEOgfaO2QkqiPSG
         /lRTB/C+zkgq4MgJd7WQuEl6SlmdJRpP0iL8ESyPHmOzLRnyQqoOR/WXXITtmNgObKtt
         YwhE+kNXB2xfx1/LPohog9U8cKMvrkhuPwBy5fFm9w7Fu6eE43WbfN5UnGkMgbUTTCwk
         rGTOd2b62NIDS/XegkBdFNlK4aQJtb3atilPAoIrKWEvP78HhlBtTkoIsopWNwEln2TK
         pvZQ==
X-Forwarded-Encrypted: i=1; AL+hErHv+zswhYnsP32Fu0eCmQVgi4XZqnmz+GnTh0dUbk2xJAs07evbaHioi+XNzteiuQiqLhkRAj7CMIZDxYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rbbcnD3uw6673jexmyugxffR93RNTt2D86rAT7O4DP0V9JILc
	9+fQyo7Ob3YDPoUi8PB1ZV9lhzgWzQB4EkXqmwKJaDwppkut8RTzczBvULx216No7Q==
X-Gm-Gg: AZFdTZcMmpcAk+8eBzNI+ig+11SSeD4o4iNOEILAqPgXEgeJt+mUTn7XQ92d8VjmtUq
	NjI9EMNMUguejx+24jwKMhk8L05YjPwshxrQDY7ZeOBi91HRbuqrIQoud/oUGUUq1DGWjk794GA
	fzUfv6ef51KqGiRod7bYIcdKaoI848t5n67UNkXo9TqRu6IBipMi7AWn93128BDh2JJVCnDC+25
	Ojr/DMqETp2dVlVBtAKhXyPZXjqNRo2IyJiaxsJbWIUhQFy4M8vDGFqgUeWZmUrTfUsc4P995hq
	KyIwkstsCv+K4CNF3fucPH+YrGCNR6l+X2iF0eJByQvR2dXZOv8Qd8MRE/xwMuUfYeP0ueLB1i6
	bsKxXoALr9s7AqbGJ1KKQ17bKZH7S+UcLeDZ0fWjqTh4bjx+JgetwNr4Bg4OfcAi+9/vXVnDAuO
	OME3d4l2SmwmjI5EEDDR3zDAcsvQjItC9cP5gvQ9NJ8mGVBszdg87PZTvewEjUXg2y1cXWQAA1b
	YARFGtegQNfWd8JkKHFs/sgG0gzTjcDt9fo29eS0mTacJz1WHGjNI0ahNWVW55Iff9toG6BuXA9
	v8m5AZ98/40zNLx4ln9Zs50iA3kY2uWq3hjyedpRPYzX2rBUNkwC8ZlF4JgHxJNj7+pk5ys+0DW
	ThhqxiBjGzcFU9Tmg2zDbMA==
X-Received: by 2002:a05:701b:4585:10b0:1b5:8f22:9803 with SMTP id a92af1059eb24-1b58f229b6bmr2042435c88.1.1795674276127;
        Wed, 25 Nov 2026 22:24:36 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:35 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:44 +0800
Subject: [PATCH 2/8] drm: Wire drm_show_fdinfo() into default fops helpers
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-2-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0

Wire drm_show_fdinfo() into DEFINE_DRM_*_FOPS() in the DRM headers, so
drivers using the default fops helpers support showing standard fdinfo
out of the box.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 include/drm/drm_accel.h          | 1 +
 include/drm/drm_gem.h            | 2 ++
 include/drm/drm_gem_dma_helper.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 20a665ec6f16..1f3088002e52 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -48,6 +48,7 @@
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_ACCEL_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #if IS_ENABLED(CONFIG_DRM_ACCEL)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 56dd15921c7a..d0c30bf23e58 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -43,6 +43,7 @@
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #include <drm/drm_device.h>
 #endif
+#include <drm/drm_file.h>
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
@@ -501,6 +502,7 @@ struct drm_gem_object {
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_GEM_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..3fc22b426070 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -267,6 +267,7 @@ unsigned long drm_gem_dma_get_unmapped_area(struct file *filp,
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.show_fdinfo	= drm_show_fdinfo,\
 		.fop_flags = FOP_UNSIGNED_OFFSET, \
 		DRM_GEM_DMA_UNMAPPED_AREA_FOPS \
 	}

-- 
2.56.1.839.g22a8290db9-goog

