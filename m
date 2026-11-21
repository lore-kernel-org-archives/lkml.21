Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280992;
	b=g+hZxmUVH1ZhyxrwVvEcSg/qE0ILdvASBpFYrNZwoTwDJkfuPZGXrjfsl6Gkm6jGmwbT
	 JlancklVobJM0nBztRsPuz3DnAQlPDg+z5Vt5OFJekbQTZunea5kUEb2vaGLwINFEfNeV
	 sP5piH4jnQ2hwkw3LGNZWmRc1AJTOag4SPnPn3HTXfx/JNtR/ydAWKcHSo2tCxpYU7Vze
	 Q8/7dHdQjnuYbNgaT1BTmJsh+ZjgiOXo+DbCLjR8d94hrFimvDnBUBj86lZiZadoGXQYi
	 cd7rU9oB+ZpQOBN5R+qANS3zMH0JRigdl6F+0QPh+tDjkTVmcNC2lxrAry4wKG8iIPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=K/+8qFq0fxk+zkew1h1e9djN/Qh04Qvqfk0yOUMbaxY=;
	b=AybUgCHpg82ieeB7l/RHtjFo77WRC0VvI4Z+1NRyxOa32jttxwKiztDJvDwGlE5fVUhU
	 iA9UBUT3zfNhU0qAJWAs5JPMo5jHyOkkj1Fi4acCbfiK1sZG6hFKyeIb5c/tJaBo46mTS
	 1+18l2u9WoYKfrzRWVJ8gMephZv4uFyvF/ajnYIO0G7E0AU2CSQg+vYTzTB1Mf2s3ex7v
	 iCQ/yF7eWmbFENugblULwobqC6ht6vlJpHg3SenBMIpEBKEQyEZPNfwttEloMHioqVb08
	 mpnIMSpwMDbbwXYxQ6keoIlIs0qdUmTcRWMnndURyxjM/k8VtGBITYc+l1mEM8gdlfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f40xqKT2;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD8606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AD8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f40xqKT2
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38622e0dae0so139357eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795280991; x=1795885791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/+8qFq0fxk+zkew1h1e9djN/Qh04Qvqfk0yOUMbaxY=;
        b=f40xqKT2P6kmFYfLN7E5Ti76LIfmjmohv1aUIqhsLvE7skD8ek5/i2KDrDdPeQmBCL
         wNWNRM42Qx2bnqU+VJn+R2C9xvVk/Um8CewDIj/PAdVXZryD2oNj+mzbt7dHOqrq49p3
         3D64DyTeEgAyO1wyOelWZWJkZjcCGjn1prDfKg2NwUHUm99j+Sma+PJKimBN1KBTevbr
         jRgmQcCDdIXFPp3qL9VgiW2S+VxwgGr9790TeOENoT5LqrGdYzLan8TG2c2oSZiIhOfF
         oJB5PS1UYcgky/4Tx4H9dHceA4fy2eSmjigXGSUzX/S8+GoPFd7dZUarpiYiJXFg9nv7
         AMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280991; x=1795885791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/+8qFq0fxk+zkew1h1e9djN/Qh04Qvqfk0yOUMbaxY=;
        b=lpvFA3/IdbK69p41+zf2Xil68dIQoUBFbwvo6GpGvs+kgHbqcDjdzprC9kKCTNFgVx
         9KE+ypL3echEf3A1Xrq0z44iyC9qgjs4VQkqehTcpDi8S59xmrhekEo+p/NCFa7G/R/9
         sY23lmYLd8wQmdn8fBGqUiYRArU/XMHUOIZzC9+iptPFrJByqApKAecC4uJS4FzV+h58
         M7+Ok6ZHWlDn81UYzjTXl8YPwVylZ/uccfO/TRN2gcUKL1e8IfEago7Tw0XetQRNky9C
         Ul5fWKXwblt7HzM/GqfESn/qnA657r6z6vpOB4ljL2ytED9dzUVxPwYoumnju+iEEYdt
         RXwQ==
X-Gm-Message-State: APuU4Z8WlebBdQu/YkzNUrF+dMhqYnFYSdg8wxYwG7Oty6rH/isy7W7y
	/glPKYjvCfR3c4Z7Mfi4BDQE+gq7pP3zBIsuj7m1ENOWS11GhwYyRHtA
X-Gm-Gg: AZFdTZds43IIn3qLUD42WGsCA2NKvxyy8Wb1saOYskczgRz7eAD7xMC71lDvF/gL+vd
	XuvN0dYvAbzN++7ioJisXJg1ojYFd3zUnr9aokDCUW7o4coRaS6Kd2SNWJ/kykjCUUJy7sJTUiK
	jD/1rFXIBxHjPe8M8FX4B39AVwCb33qM7kOXr0i7CLGd+yojtNfkJqHkZ8tm43iiUcwiXTKBbl5
	IF1+ZII7SAmESYIt5Sxi7HGbmCSnREPD/w7jgXIOr3bVotb5/0GcPGwH4YGmwYcup/h3+hEfCWV
	iIUkcUkauaH2337YAI6VKJiZTBBtJ6n92e3hlxvflz78ltW0i6RyWf2Ael7OeO/7I+axAPGUc7v
	mdxCVMGyzefF0pSBc9sD3zoq6jEJrOS+/+7V9PcGMVbexqtX+DsUAtTJUE56gR9ZTG8c4//9vx+
	85LS6z/9DAC/JsvoBpengUfjweMxVfNZnLcletJlGh/WLbZrnhTQq6XUcvlxrumRIRI+49R63Y9
	dJq4wBLgJORbpSvM/Rnh6NaVk9QvFeMhUhvBUeJJ8VSuRjgtQ8dpw0u2+j/Lj1nUM4oLGQyFgjT
	WepmXD7Tx8CihYPCK0mfwCQSZjM5S9IBNByFpn3k7QCV+q+FwpSQMaYDTCl1s0EdYok=
X-Received: by 2002:a05:7022:b90d:b0:127:def:dd72 with SMTP id a92af1059eb24-1b55687f1a1mr8704565c88.2.1795280990776;
        Sat, 21 Nov 2026 09:09:50 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm22813152c88.14.2026.11.21.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:09:50 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Sun, 22 Nov 2026 01:09:24 +0800
Subject: [PATCH RFC 1/3] zram: allow backends to decompress from two input
 buffers
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
Message-Id: <20261122-zram-split-decomp-mm-rfc-v1-1-4e69b08c0fed@gmail.com>
References: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
In-Reply-To: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

Let backends decompress a spanning zsmalloc object directly from its
two scatterlist entries. Keep both fragments mapped for the call.

Use the linear path if the callback is absent or returns -EOPNOTSUPP
before writing output. Propagate other errors.

Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 drivers/block/zram/zcomp.c | 28 ++++++++++++++++++++++++++++
 drivers/block/zram/zcomp.h |  8 ++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 028e2f0f587e..265108b9f332 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -159,6 +159,28 @@ int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
 	return ret;
 }
 
+static int zcomp_decompress_split(struct zcomp *comp, struct zcomp_strm *zstrm,
+				  struct scatterlist *sg, void *dst)
+{
+	struct scatterlist *next = sg_next(sg);
+	/* Each entry from the zsmalloc read path fits within one page. */
+	void *first = kmap_local_page(sg_page(sg));
+	void *second = kmap_local_page(sg_page(next));
+	struct zcomp_req head = {
+		.src = first + sg->offset,
+		.src_len = sg->length,
+		.dst = dst,
+		.dst_len = PAGE_SIZE,
+	};
+	int ret;
+
+	ret = comp->ops->decompress_split(comp->params, &zstrm->ctx, &head,
+					 second + next->offset, next->length);
+	kunmap_local(second);
+	kunmap_local(first);
+	return ret;
+}
+
 int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
 		     struct scatterlist *sg, unsigned int src_len, void *dst)
 {
@@ -177,6 +199,12 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
 		src = kmap_local_page(sg_page(sg));
 		req.src = src + sg->offset;
 	} else {
+		if (comp->ops->decompress_split) {
+			ret = zcomp_decompress_split(comp, zstrm, sg, dst);
+			if (ret != -EOPNOTSUPP)
+				return ret;
+		}
+
 		/* the object spans two pages, linearize it into local copy */
 		sg_copy_to_buffer(sg, 2, zstrm->local_copy, src_len);
 		req.src = zstrm->local_copy;
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index f38fd31f9e4e..92a93630aead 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -61,6 +61,14 @@ struct zcomp_ops {
 			struct zcomp_req *req);
 	int (*decompress)(struct zcomp_params *params, struct zcomp_ctx *ctx,
 			  struct zcomp_req *req);
+	/*
+	 * Decode one block from head->src and tail into head->dst. The input
+	 * mappings are valid during the call. Return 0 for a complete output
+	 * or -EOPNOTSUPP before writing output to request a linear retry.
+	 */
+	int (*decompress_split)(struct zcomp_params *params, struct zcomp_ctx *ctx,
+				const struct zcomp_req *head,
+				const void *tail, size_t tail_len);
 
 	int (*create_ctx)(struct zcomp_params *params, struct zcomp_ctx *ctx);
 	void (*destroy_ctx)(struct zcomp_ctx *ctx);

-- 
2.47.3

