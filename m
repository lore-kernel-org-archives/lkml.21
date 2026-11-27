Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762532;
	b=PnJYMeLRrTdcRfXPyFwSyQudz3qym1FfHJP4ytncIiTu3iwuAXDdj93UM6Vh7DpxsCMb
	 FB+vDLMWNN1AJFKyduLmUJDifzadJIhMXuN98QY66jG6D3x5iS8SDDahbj814iy1OXZar
	 YGK3w7kg+WOq1brg1WedYktsOOIEp10iDbIXB94qbmbnu6O5aydhGX4r6oma2N//1TLPK
	 wAFWHhGkCTJtcHgA+w9sQ8bg1C77839Q6CG4zNFsCHjPJK3NaCZSZZkvsW57FbCFXVLKm
	 ReemQFYmWquXW3UHj4BrR8JQXH/ckMA1ipwyFnwQhdGvgKduJCR6+hk8QA5g3HHzDLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
	b=BRzh6nJBzD/9ZzBcgVU+oquW0z938uE+ARFxCoz7END0iz7vjUGoodbq/+eeFyUEfoTE
	 sIpX+o8iJ1zS2j9fiTbCFXCVaft80QRpp+inTjq/usVqodkS1J5JQF0bLVNJRs8EPmW/D
	 e4sc6avH0ckqoD37cQ8iSR+MGFwa011BSWnhPawxFZ9an5fhh/7Z4ViGGTaaJ8k8yRVuv
	 XgIwQMUpAtJLkXXQrIpUpc537e6z9uO76i50JsWTaW3aWW9uJOXCLoaitC+jOoyyQFBT3
	 3bw60n/ONZSm8/vrTZh/UeZZ34UYXpB6J+HREOQ9wyvxFq+ZLGbhqVnTNckBP/9mhHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2xuAocn;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89357606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89357606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2xuAocn
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso6949417f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762531; x=1796367331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=g2xuAocnacVaAosQ4bsauTwXhKOyLKai2HfYp59zEHJI+QD7kOe4u+O7o8uKC9W0nD
         YxgCZUSYxOyxpd+pHmLQExrgi3I/NoZcew78Upxfm2WvWX9E+CMl1EY7Ir3z3UN3xECl
         MG8QdcwfpvSFGtCExR2kc0czFv/zKolauCizynLu6lvFZnXxAB8Kaa9hMCjWoiMPbF6y
         3a9WPhPsJDfvrmSSH+yASALrordT+7dU0k/VVeAZlhP/IdN/yzbmO8qGxHb0iOpJU44S
         FQZ0H3paGckUr5T1j86q2JXEcs5o0k9bCpzjlW+kIRdTNxVZVNJrgMltwZm538UFaPnZ
         T2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762531; x=1796367331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=sN32KeidvUq3DShHuPy61JXbXexWORFOWTWpimqrRe6o8BEXAd4yK3h354m1xspWpt
         esnKNO41ekSzUEaYVn9OGG6i88pi+slSiHFwpR4UiNZnDATZ4Pcr8SM4rsgdeVa4pPEe
         01mg5NvZ268QM97ARfKZ5G7amrLGgxXWricz4FpCY0oTwGOyyMEKQrnJ+F7CdZvWhpGP
         p0VvI+AtPEvohY+bBAMdbppTZduktYVmgLL3WqNlAfUqrzAV6u2JVFN0Nze+2ykUIFQg
         k8aJfSI8xtwfCPZCaZUEch1djQZ+yZkS1UEbP0AZw6rq5uSpz/o9pv5VMaqj0I5mRKt+
         tbIw==
X-Forwarded-Encrypted: i=1; AL+hErEv7WaOdZaMeZSYwQlQHi6063WXkeSAAq79Ohp5oC1FQUwm/2Xz4PxitdkmUjEPkH36mErBF6vk6kmWjNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vs4lszqPPgxJUcbU1APMBrX+JNCD5Tz25b76N8Q5ztYN7vf5w
	KyBFhPQmYDfA7U3HBIHgu/5EgDQX8z7ayvdktSK4nNuU53BlWK7koe1B
X-Gm-Gg: AZFdTZcU/WiZXnKVgmkxTDMcStY7IqZjrWkJ2HXVkY9mcc/nR6EhEVjIveTng0xUEvy
	bisF9m9VUM5O9mFSkO38a/clEuLOVVB+KiDQl/LyFqK3JauQo3B8GH8qxpt61YtU2GldOqFGPLW
	Wjw+riB0FJJzKYDaU2M6WtjXR/gNetotU+ILjsdcxrPoDMb5D/fhZ1a3okmXbOihPza3oNONT8t
	jwQ5aW3I147vd/mLTAQnaX433QDa5Oi9OcVnC7ChnK9pf+kQU46NbrhGtABZUSobdB3K+2jyxQs
	zhz11HgUaUudJPzTh2D1i7WN7rUBtHZAYQOgIRAYGcCUdxf5fTkvEGtX09StCUcjWcu6Ow+5mPO
	KgGXxCLouOEwstJ9jf/AVnIahP22DNPvX6TCrT16+5n387CIwScI5wVsfgXZY8qgIRLhrhfi1eY
	QI5cIqvK0TWXCOsOiUPUBKuuzCCjplkXd7S1Vkso1xPH+ssvgdAZBl8pRL/XcruHKSTqssd0RIX
	97xn0RaHPfigm8N5BseeB9kfj/qAdeG/UnGFuTF8neGSJ8zwtQDoo+VFYJshSVAiB4j55lN6FYP
	05Mkn1B+7FMaAuexRz/kl7tb3K/IgZ1qfLL3znmp1Qgp9Hru+PMqE8DrBOfSV54u78NSCzMtTOv
	3kTrv4x9CxjUcu0glcikb/OxeaOmJzZ/AZR1JivyvTpTBocfM5QOsLuYw7vE0QAy2+K7qQa5Krv
	Lc45hKTA+g2dtD04ePmwhw0trDYHPI3WzQy2kUCLGfp0V79EF18d412sPzN2mtOK8B+k2UAQuDJ
	2yZal2wFoLN8dvA1z1oa+VtnDu6SPNAb+5j0U/KlH904cH/5Cd5TcISDUn0myg=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr542353575e9.14.1795762530660;
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/3] staging: media: cedrus: take the output line stride from the capture format
Date: Fri, 27 Nov 2026 07:55:21 +0100
Message-ID: <20261127065523.3685726-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

cedrus_dst_format_set() programs the line stride of the untiled output
formats as the width aligned to 16, which is the bytesperline that
cedrus_prepare_format() gives these formats. Program bytesperline
itself instead, so that a decoder can use a larger stride, and so that
the stride is the one of the buffer when a decoder sets the format up
for a frame smaller than it.

Likewise, take the height as it is: cedrus_prepare_format() already
aligns it to 16 for these formats.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index b66d855daaf8..7e742cbb1cdd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -84,7 +84,7 @@ void cedrus_engine_disable(struct cedrus_dev *dev)
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt)
 {
-	unsigned int width = fmt->width;
+	unsigned int bytesperline = fmt->bytesperline;
 	unsigned int height = fmt->height;
 	u32 chroma_size;
 	u32 reg;
@@ -94,7 +94,7 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
+		chroma_size = bytesperline * height / 2;
 
 		switch (fmt->pixelformat) {
 		case V4L2_PIX_FMT_NV12:
@@ -116,8 +116,8 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(bytesperline) |
+		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(bytesperline / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
 
 		break;
-- 
2.43.0

