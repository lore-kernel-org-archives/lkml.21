Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590367;
	b=q4N5T47OAHglGhRUTCvuyWsDropNCNy+RO9Tm/xCHNeY2kImpIopM7sXEtuGgTyrzGVA
	 uB3vVv9BCTgevG/BZfCvPGw69VU+ActgU89oanchweheXG1M54UmT3Ezuq09Y5Gg9XmIM
	 SVn4V+dVjblAUY6nZEBKluIc8fCJ+bhw/dDJLWuEmCcRCJx+WjcL13HmHr+/9ZlzO08uW
	 /G3QbUdNdhHFVf9A+Tc9jRq8jV4tHn1edNL+i1Q/9vTUGk6THhnpzs/9SrZyi9ySxROal
	 zzRr36tOeMh4wOZwyx03lSe3Vc6iQ3zM1/RKqYURSbKY7MOXsAcUSGlfrC0Lo097opw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2RzE/F0hiuhnUZy+R/vgP/sdimqcsNQo4juhfeJk3ys=;
	b=rIcwsXd9sN6gILMYN9C6FAQnh9BzcOrurOsLO2ZSMGKnB1bVY8Pmz6iJ3Kh7gE8wD6zQ
	 4OnfKvwAw8m5QSHs6vokyjxoj1KQKu0o2DdfTIvk5sZcOvudthZ7eRMF567jJiEg841C9
	 bkm75O1Sz++2/2jIDYXWAFjLn50Uy5LkPQwzu9cInytey2m9QnbuE7R0vIf+O3FLJTi8g
	 IwCPZ+nHTm0keFC3fSbcds82T31Ja96JyrkdI/mhur33SDpAru7DRhD4w0LkeaMgHuo2r
	 3OXA6gARGgTuo0jq+W4x2acv++gTkrQG/tV5A2WCtkLXEapsy0FWZK6OjEApZMJsCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP6HhqcL;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC6606A69D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAC6606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP6HhqcL
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f020d0169eso26289415ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590367; x=1796195167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RzE/F0hiuhnUZy+R/vgP/sdimqcsNQo4juhfeJk3ys=;
        b=lP6HhqcL6r5uJAL+ZJMg7UQBMPwa5VbXYJeKQNXjNDmf4AOMF1eoeMUbWjlfQFP1Mj
         C9EYYwx83maEvmHMVYTd909ac/tpABOzvkeKxS9gkwCu3bmt7xNcBwtqjUIJ7Lg5DNTq
         yNGC/Ihd/VfwgwxqY+PMvfsDh1ZvfQG+TTBnta5FTeb6o9BPtv3yuIlDByT8a3LdmP3Y
         +DVIEHOKvFCv7KHIjTIgAIaKQQ+Z+Aodkb5DYSFrr5xgp4BTBl7iFqIfqeyKjVpfeI3c
         M0zrs45+Cr4cwskcPcB4GKWjXDcmYwx8bYWbaxdK75qaQ/1e8+PjKZy6AHSJ5u+XLoK3
         Sj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590367; x=1796195167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2RzE/F0hiuhnUZy+R/vgP/sdimqcsNQo4juhfeJk3ys=;
        b=mPMbrfmzhxwEHga7F2drUh/A7EHs8JzCTLJqiFZYORgcEHWTi3stZlW3hGw5wrsKrX
         G27xO6h8VcWbUA+AoMxhACEwy+gDAmysjxfVzMLf4uC5U6n022RlgPI2cHnozsrySFE8
         MIRzP4P9+W44ZWUQoxY47Iw1hemf7mzTZQejqCqvStJ2fZWGCqZRUK7U6ZCc1Awat6N1
         sPjlMYtgBUpvQXWkTrn9BMToEx0gywAs711fZGTQM7pWp1Q0WPPfMDEgAxOMSYOGiNtW
         BHkUPqTpDYhPJIBtFKCCVrma3BGD8l4YL1aFABGLvB1LPfUwp0K7eKUP4+HfXkmfhQsK
         951g==
X-Forwarded-Encrypted: i=1; AL+hErEv7QP9eI8NZVLt3wJmIfvDCkRLwO8ONZuNjc9OqHFjRBnfaEhRVUK0LW/GRmSfz6TloFLQfE/aI5zKnu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JJqQvYOv7qDAORjQC6fsu+sgwgfvT07isUeM41F0TcuFA0y6W
	NZchpBe7eU4H2dwLW/r2deRTYBLOjrYVWELa+0EaYy3j5shwUg9NyWoW
X-Gm-Gg: AZFdTZcQPtwCTeYgJE59tjlhHvHgOFunA5mcuSLGRZ1EUxF50A6bUvY9Nf2BXfimQYz
	KVQdeeMRZGT/aGMCnLNeqbld+Z4liUQ3pUeKi5AEusdlvzs0uYCygJGk1ylixBLuo+k9lSawIOh
	ryKy0NwzzwYsSZ3VHnU8cr7uX+etvWOzTiNbV884KloeE9rZ5JXdgqBmkAZ16I3tQatSVJXHW3a
	29gaIw72VdWAJhgFNZnzjJHCNJkOEhxfJYfu0N3w9/hCmMy/2gJLJw3HRyxSmw9wVqXEFZpMpo1
	Y+tu4nbUWJQpXgr2OaYzrofN8jIP4bLVR8ziCODnis+Wj5Vq7CXRZz37/P2+MdHBKVJ5+eO4uTz
	tLjDcS+M4WeJVz4zWDhTe1m6XwgtW73VValR/POQy+A+1zJW5CRLVo4QN8CTUxkfljj1VKmC62i
	8+GQ5M3SVJ5IgWrgnlkc2A1XNSObwXJ9MHu5HekwICfFboQ8zGQrV8cuHrSOYNmQiRDYVFxmjqk
	0DJA1DwzBOjNiqSHKWBlWCmA5SfYxCIcDMA0PgT1sd24VKGRxJ8M7NlFB6l7P8D1HrGaok/CaTj
	0SBgZRot9rZ+gxQgCZCI89G6ZLDjXoBN7YM0YtPlDg==
X-Received: by 2002:a17:90a:dfc6:b0:3b4:e929:f46a with SMTP id 98e67ed59e1d1-3b4e929f529mr2782219a91.25.1795590366557;
        Tue, 24 Nov 2026 23:06:06 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:06 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 2/4] media: zoran: do not update device state before the format is validated
Date: Wed, 25 Nov 2026 16:05:46 +0900
Message-ID: <20261125070548.28989-3-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125070548.28989-1-hiyoukou@gmail.com>
References: <20261125070548.28989-1-hiyoukou@gmail.com>
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

zoran_v4l_set_format() stores the new frame size into zr->buffer_size
before it validates the line alignment, and zoran_s_fmt_vid_cap() stores
the new mapping mode into zr->map_mode before it calls
zoran_v4l_set_format() at all.  Both fields keep their new values when
the alignment check later rejects the format with -EINVAL, while
zr->v4l_settings, which is only committed once every check has passed,
still describes the previously accepted format.

That splits the two values which have to agree on how much data a frame
occupies:

 - zr_vb2_queue_setup() sizes the capture buffers from zr->buffer_size;
 - zr36057_set_memgrab() programs the video front end, and zr_set_buf()
   programs ZR36057_VDTR, ZR36057_VDBR and the ZR36057_VSSFGR stride,
   from zr->v4l_settings.

The ZR36057 has no transfer length register, so those geometry registers
alone bound the write, and nothing compares them against the allocation.
An accepted VIDIOC_S_FMT, followed by one that fails the alignment
check, followed by VIDIOC_REQBUFS therefore allocates buffers for the
rejected format and then lets the chip DMA a frame of the accepted
format into them.  With PAL square pixel timings, 768x576 BGR32 followed
by a rejected 33x24 RGB555 leaves zr->buffer_size at 1584 bytes, so the
queue allocates a single page and the chip writes 768 * 576 * 4 =
1769472 bytes into it.

zr_vb2_prepare() does not catch this: it compares the plane size against
the same zr->buffer_size that was used to allocate the plane.

Commit both fields only once every check has passed, which is what
zoran_s_fmt_vid_out() already does for the JPEG path: it negotiates into
a local struct zoran_jpg_settings, calls zoran_check_jpg_settings() and
only then assigns zr->jpg_settings, zr->map_mode and zr->buffer_size.

Fixes: 11c9c16f7cb5 ("media: zoran: fix use of buffer_size and sizeimage")
Cc: stable@vger.kernel.org
Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index a053365922c4..99fedac12b67 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -177,8 +177,6 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	bpp = (format->depth + 7) / 8;
 
-	zr->buffer_size = height * width * bpp;
-
 	/* The video front end needs 4-byte alinged line sizes */
 
 	if ((bpp == 2 && (width & 1)) || (bpp == 3 && (width & 3))) {
@@ -186,6 +184,7 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 		return -EINVAL;
 	}
 
+	zr->buffer_size = height * width * bpp;
 	zr->v4l_settings.width = width;
 	zr->v4l_settings.height = height;
 	zr->v4l_settings.format = format;
@@ -530,13 +529,13 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 	if (fmt->fmt.pix.width < BUZ_MIN_WIDTH)
 		fmt->fmt.pix.width = BUZ_MIN_WIDTH;
 
-	zr->map_mode = ZORAN_MAP_MODE_RAW;
-
 	res = zoran_v4l_set_format(zr, fmt->fmt.pix.width, fmt->fmt.pix.height,
 				   &zoran_formats[i]);
 	if (res)
 		return res;
 
+	zr->map_mode = ZORAN_MAP_MODE_RAW;
+
 	/* tell the user the results/missing stuff */
 	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
-- 
2.43.0

