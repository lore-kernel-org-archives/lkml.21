Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661296;
	b=2gPjxuDEVufPyiYMrbAG76gXJ5pIrlCCT+Hv9Tu7bzuRQV+WV95wrVGieHs+ytStgFNy
	 hfV0LvXDAu5tczEYkHiXMhUjpkblmMjwbERS2rvFSGhGOgq8lQyb6nJjQw18O3AcATGrH
	 UoDInSdxzyjGrTMn+k+BQLkZ5dszN0y/XKMKwTXSKB+j6eswvzICYsHQHVii/z5QtWy42
	 8qPV9OMfGiREQrWYkrVJnhuDR6H93Ryfctng1wR5HaJ2QKJfe9V42ti43S3EQXjrXO+qP
	 Izs3VDtjpobKxFcQK1D/HhFJieCBuH9rUPkoM+KLCD0eGvDiMm4QqleLRlxCRS6sZLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6MU1/48ZybrBDzSqWU7nC+slwlNUnGGFJ6ROpqcIX4U=;
	b=4j4iFfuoKGHIVq5P6Y4mhFFaSGMMIptLaSZqTRuYVhEn8mU0Yu9MsIehBK/BMN2kpnB1
	 3rIsbe3IEm56xGQNuhU2gUfAfuRNbuZCPa6aTWpXmqbisJQOX2Craxh1ID6UncnPaVFnR
	 Q1q+euPmS5yGGTgbfEIiosniCkR1y9PNYvWq89qU1OLhm13MYQVxfA8L5WOkYMb1ngLVy
	 AFdxfSJylA5J2jR+bAOdQUI2iMS8psuQhj2vkLgdGQyEwWAs5ARAG0vhbkVv32I36q7Lc
	 +QVNkA3veoorv2bgQteD7Cdr1OogeP5gaEUgcaoHWIehZ4hilVNcvKK4j2u2g3q0z+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZFwNIh7;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A2606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZFwNIh7
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so4425376a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795661295; x=1796266095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MU1/48ZybrBDzSqWU7nC+slwlNUnGGFJ6ROpqcIX4U=;
        b=IZFwNIh7WzHe3PbjJQ/iynoH6m5rUuCSzTBDF4gGxs+nS7INS1cVB6T5u40XFSLvfY
         Cv7t3ZB0P4TYE+M+XbyRc2PIKO9ZpszHfipULoVPN8rBvj1X0e0F/+N7Fk5zTtxi0Uwk
         pPxO8+okHgpuP0oXgWox+0A5oKObsyOBGV40tlU2UrRJ3aOenRZnW6txydUsNrxF+Gix
         l76p2UghEvND8FyvfptD4vEMbg02BPH77LRQilvbJHj3whyFs7IGVA+Xk4aNEUbrb3jh
         +cs2eAs8UbpwS3rpHLd0B3cpKH93XBVMF+43bXs6HZjBYgSCbB1qj/fFpGIl+T08Yi6/
         OHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661295; x=1796266095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MU1/48ZybrBDzSqWU7nC+slwlNUnGGFJ6ROpqcIX4U=;
        b=u+or2BiTdrxBe6T5flcIwPYzSwLykZFehxwY5uwxfa5MCE/zOI3wyCv6W2/wMM19PZ
         5v+wcSwsM1FvQaf073IxPFgzF6iYdgtXQaW5s6uSGiezFBsxnmMnXk4VKtOnk3mX1Mq+
         iP6u99Rf8Iy6vX143XedFsPqhb2kXGiiNUOxnXroKHjA5sbRFWEsti6j9W5630u89mr4
         BCDE7kqv9llP970O9nfKv6sIzl5/HvAP3PPuF1ltYnfQ07I7JWdPtJJRS+NpzyOIqALk
         fg1XiEJEMLAzZz7NOFhWsSmkn7/CuaPPAg2SDbI+emMChr0vcW30z1BMIFiu0Ty62cwW
         v41A==
X-Forwarded-Encrypted: i=1; AL+hErEgZJ46S1IbRvOTFrHKOwobfzuK2baGa90q9zDHmOXL+qGAgcR3kgR8mfN+D9lMVm4l0+cPi98Pc6dL53g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n91pyiOSDZ0RVzQNcM/1ycwYWVjsW+ZEGqN9t6M/U5S28yyjP
	70eXncOJ0WfXQrULUcLBBYVzc3kZEK8U89B/XaxVxUJQ05T7rTZ04oiKM/6ERlq+
X-Gm-Gg: AZFdTZfKc+5rFEoEIJM+7clHGCBvPoOb0HLF96q3FTUMsYlbOasxweUzem4ND7UunGE
	lCbwgOejU4KYZl2/WB8wy0ehCD1Av9znEmbkzQjvceR/L5sXXbZras/M6Ua7H8f9DGuW20ayD+w
	UiSviSYH2N+kDN4AaTwagY37cLwOlisZa+c3PZmAlK3USPWNc9mRX2XXVkiD7mDTShSW3Df8rJE
	2oebGsyUkFGQKYKkcjG/gu1BSCBAbdPi3k2OIqRqOjyDnvPl69YhNRObFmhkw2WtISoDNWSbK5T
	jLcWCGuKEggCNdcQ152b+bTyTU5/QzleUN8nd3fS20J1c/1q6SMzNlbsaDr+GCHlPjUwQZIpkHj
	wderBoUIXPOLGtNkTPUpaxF1YquJecV5zh25BtVPUhxdAfMIrCD9fV0ykNahqMaD3m2b9WgOYaA
	bAn+Qk7K/DPFnIVMBzQIYpgdqE/9ALsoEWeMTEbPuuOIU42U5TM8d0mnfA9LrWXPr/RQ3pFdSDO
	1N8UvKweImpnRatsSCNTOhprte0eSUURQUm51cuFlUezZl1vGD1XRKvtWwsC0CsLb2iIQJ3fCto
	x1x1+9YeOyc9jLDJEeGbLiklLq6kDD+GRudITdaf9g==
X-Received: by 2002:a17:90a:ec86:b0:3b3:ab75:c940 with SMTP id 98e67ed59e1d1-3b41c9b2ddamr19126643a91.18.1795661295006;
        Wed, 25 Nov 2026 18:48:15 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm14486670a91.10.2026.11.25.18.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:48:14 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: linux-media@vger.kernel.org
Cc: m.tretter@pengutronix.de,
	kernel@pengutronix.de,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH] media: allegro: reject S_FMT on OUTPUT while buffers are allocated
Date: Thu, 26 Nov 2026 11:48:06 +0900
Message-ID: <20261126024806.33434-1-hiyoukou@gmail.com>
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

allegro_s_fmt_vid_out() stores the requested frame size in the channel
without checking whether the OUTPUT queue already holds buffers.  The
CAPTURE side does check, with vb2_is_busy(), but the OUTPUT side never
got the same guard.

The buffers are sized from channel->sizeimage_raw when REQBUFS runs
allegro_queue_setup().  Growing the frame size afterwards leaves the
queue holding buffers that are too small for the format the channel now
describes, and nothing catches it: allegro_buf_prepare() validates the
field order only, not the plane size.

allegro_device_run() then hands the encoder the small buffer together
with the new geometry:

	src_y = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
	src_uv = src_y + (channel->stride * channel->height);

and allegro_mcu_send_encode_frame() passes channel->stride along with it.
Going from the smallest frame size the driver accepts to the largest, the
12 KiB that were allocated are described to the MCU as 11.9 MiB, with the
chroma plane starting 7.9 MiB past the end of the buffer.  The MCU reads
whatever follows the allocation and encodes it into the CAPTURE buffer,
or faults, depending on whether an IOMMU covers the device.

Check vb2_is_busy() before storing the format, as the CAPTURE side does.
That is enough on its own: the core records the queue_setup() size in
vb2_plane.min_length when the buffers are created and rejects a DMABUF
shorter than that, and the queue offers only MMAP and DMABUF, so once the
format cannot change the buffers cannot be too small either.

This was found with the help of Claude (Anthropic), which also wrote the
patch and this changelog; I reviewed both against the source.  See
Documentation/process/generated-content.rst.  There is no reproducer: I
do not have the hardware, so this is compile tested only, W=1 with
COMPILE_TEST on x86_64.

Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
Cc: stable@vger.kernel.org
Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
Tool disclosure detail, per Documentation/process/generated-content.rst.
The assistant was asked to audit V4L2 S_FMT handlers for driver state
committed before validation, across a long interactive session rather
than from one prompt.  The candidate list came from a script that
flagged .vidioc_s_fmt_* handlers writing driver state without a
vb2_is_busy() guard; it was calibrated against a known case first, and
its output was read by hand.  The asymmetry with allegro_s_fmt_vid_cap()
and the path through allegro_device_run() were established by reading
the code, not by the script.

Review and a test on real hardware would be appreciated.

 drivers/media/platform/allegro-dvt/allegro-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index dc76986ce48d..b241a7208deb 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -3461,12 +3461,17 @@ static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 				 struct v4l2_format *f)
 {
 	struct allegro_channel *channel = file_to_channel(file);
+	struct vb2_queue *vq;
 	int err;
 
 	err = allegro_try_fmt_vid_out(file, fh, f);
 	if (err)
 		return err;
 
+	vq = v4l2_m2m_get_vq(channel->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
 	channel->width = f->fmt.pix.width;
 	channel->height = f->fmt.pix.height;
 	channel->stride = f->fmt.pix.bytesperline;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

