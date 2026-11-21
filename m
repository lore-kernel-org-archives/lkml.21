Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280997;
	b=HwXQ5ZGKu2tsOGd1W0Wvl1FGOdhqM07tOItxqsH1Srt7gu5SgZk0ygXnHxqmuWR1gM5y
	 ispMALN+pn5Xf0IxQlAuXPMBeOrrQTnXSevjoyWYlsNIw4hXX9m6tx24PWsosbogFkjlf
	 ypZqJiEfj9kNPCn/NnXBsIsQr+CTMpomLahZl5u9Rhx8izSZ9+4Opl37f4cpUnO6+/LUD
	 UwMZ0TNrt8YTFlo0WY09wz/hFVn2gJ4KeDgEqaHJuK81jE2xZRqC/zf55K4aBD8W+SeMa
	 Px8GiO4R+u5z54lra/VAUZeanjijbjm2d+gL4YSk+C67Qd+nFT5RySBqBNwb18f4lmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Br5Wgqfcd8YHOwGqfpu6oGdHrpDSdRTUFKUwp0MuJ4s=;
	b=b4zVDWPk4yogq7aw4eE1f3kaa4r3Pfdc6FyJjAwrmsdrmL2/JEj2HLzUf+EzfiVKon8+
	 ovCvPIG+djYeDC/H1JCNr3Wz6jeMk24C5XFd04ScyrfamGnwKsxIJuaT4KW6MJ2emwYYX
	 NsLWhUlrSRAM2Y++GmxtLL5OFoFz50MLkdhvnmP8h4TL69GbTUpP9vBQVeEQdFfn1Pbnw
	 4ra21qTNgUKcPtYG7wcMKiN7viYUW6+RZ/VO4rUT/LW/5CdfNJaJ89/HLtJWaPEd0qAs9
	 0KJMJRIjsQZc73sxv3YuhbraWT4sBjFBf9BY0HkTKMBEN9yEVyZ2+yKYnl6Zm3wzlKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCadNJo0;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78187606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78187606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCadNJo0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3869aac69c7so78265eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795280997; x=1795885797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br5Wgqfcd8YHOwGqfpu6oGdHrpDSdRTUFKUwp0MuJ4s=;
        b=rCadNJo0RuTy4jFssOn9xacINLHzWjmJxTdjKvRrhiVu6HdOrggab0VO3A/AaqbvOC
         49BsKjxg/fPaEGq3Cv39CFPq6zIUGibO+7Kky5UoOFDEG/AYGTjZ5BjwIYdJ6bN65Ys9
         CMeZT6vcKt0ElhdCg8ITMvelT7/McAJ77Eu0jWVSLKedIpSQIo9ECoTOo1nr3EqVgq0K
         2I8Sk3xEf9OPgYv8N0zO02V8GvlidU6WqQbSghETpkGwvqU6B8H1R89l8dKVZCA/2mvz
         I8Q53RLh88QrJkVhXSS6CUJ8lI1CVm8FXRUbvnjK8M23l5ncLK9eiIzAQFcV9vT/OnOI
         S+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280997; x=1795885797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Br5Wgqfcd8YHOwGqfpu6oGdHrpDSdRTUFKUwp0MuJ4s=;
        b=YhwinBIerS9lmoWYwDWa5oIophmrB1rKQG9+K0+8JLV9QykcsLWx+fQ0owmSPX9C2T
         Vor1iYD2qUU7ZS57gPE12micGLbiJHG54HzzEAo8NjNNwFlOoau4TM52fro5oBH5cdIV
         m7hAikoWHbUfaYylV3ztB6F2ndge4WbHy0pd5EnuK7pNs8u4cBzSmn62lwZlgHzgvgOj
         neFquoQN6WmiULuzlpiXR/njCmgZ+N8t5tHoNPQgmJmKBoOypyTP3F8+/bd5thT3REoF
         P/TAx19u0pQ7NQKAfR61eO9u+QUpLrfbxMHUJdC1aBIfuCD6m4TQK2oQFSNfjs8dOxN7
         E0pQ==
X-Gm-Message-State: APuU4Z+Q0R6uTrzGk22WTBGNT3vho268Fmnm7yDs5ymi5XUvq0VlAxyn
	UiCWymfWUFtgb1vcDdAqsugmAIaJ4+Ge9SqtLZ5j5wShP/WhePodn0aM
X-Gm-Gg: AZFdTZdxSesvdEupwwyRbyYTsW14fAxy8+oNSgADXJKKMPPR1vjp/LdIlD67yj02Cha
	ZjkVwAtdR6b2oRHCfiAO7oi0BMSRa52MpAhqMMXuLjnH5B0Q76mMs/4uY++aYwnyBC23BYVy9mU
	62/kz4ReDg2RsoWvMMoPQvfChUlWxOcgi/BV17Dg4gxjyUA1ZhK/N+ta8z0RDAhkn3k4p16oXEr
	sQCEGvOhU4ZLcEFwtuxJMxu3fDY/+J6TcqMyJGd7WNsD7ScGOD79FOIdgsLnqpVW0CnJCtzFkDN
	fsALZdIOIMyYnTz7w/SuBCKuY5OUAacdmh+wODa5itB+YsEMhA+T7/oJNsuWZDLW8Ucb1Dc2mD0
	zMTno02coUBZXADks3FrrI/qHnnHLaauAhw0Y3L4ijm8qHmtNATsYl9mAv8NLK7Ls2FvAhvh/VA
	14VsVMIPPf7Fa1clhT6j86+2sDLE53O90Htj06QMghAe9eLzatKpo7AIiPzSqhO8rCd3C+kC5V2
	Up/v04Gz4EQhbF5CK9p+DIdHYMyynE1dvDJufh+WA4s34kxyGLB9xWGNr6hLK4d2wfA5/sGlGz5
	GcW7ll5eu2OG83u4mJY9e3i96moQvWx6LSypPphckQlTrlE31KFDGaLfNRA/9xdlm+Q=
X-Received: by 2002:a05:7022:7f12:b0:1b4:fc41:3b2f with SMTP id a92af1059eb24-1b5568a1b89mr8928389c88.2.1795280996213;
        Sat, 21 Nov 2026 09:09:56 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm22813152c88.14.2026.11.21.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:09:55 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Sun, 22 Nov 2026 01:09:26 +0800
Subject: [PATCH RFC 3/3] zram: use split-input decompression for LZ4 and
 LZ4HC
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
Message-Id: <20261122-zram-split-decomp-mm-rfc-v1-3-4e69b08c0fed@gmail.com>
References: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
In-Reply-To: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

Use the split decoder for dictionary-free LZ4 and LZ4HC blocks.
Keep dictionary-backed reads on the linear path and require the
split decoder to produce a full page.

Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 drivers/block/zram/backend_lz4.c   |  1 +
 drivers/block/zram/backend_lz4.h   | 19 +++++++++++++++++++
 drivers/block/zram/backend_lz4hc.c |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
index 1e4ad31d39a6..2cf8ff656f13 100644
--- a/drivers/block/zram/backend_lz4.c
+++ b/drivers/block/zram/backend_lz4.c
@@ -150,6 +150,7 @@ static int lz4_decompress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 const struct zcomp_ops backend_lz4 = {
 	.compress	= lz4_compress,
 	.decompress	= lz4_decompress,
+	.decompress_split = lz4_decompress_split,
 	.create_ctx	= lz4_create,
 	.destroy_ctx	= lz4_destroy,
 	.setup_params	= lz4_setup_params,
diff --git a/drivers/block/zram/backend_lz4.h b/drivers/block/zram/backend_lz4.h
index c11fa602a703..6c1736ea1a87 100644
--- a/drivers/block/zram/backend_lz4.h
+++ b/drivers/block/zram/backend_lz4.h
@@ -3,8 +3,27 @@
 #ifndef __BACKEND_LZ4_H__
 #define __BACKEND_LZ4_H__
 
+#include <linux/errno.h>
+#include <linux/lz4.h>
+
 #include "zcomp.h"
 
+static inline int lz4_decompress_split(struct zcomp_params *params,
+				       struct zcomp_ctx *ctx,
+				       const struct zcomp_req *head,
+				       const void *tail, size_t tail_len)
+{
+	int decoded;
+
+	if (params->dict_sz)
+		return -EOPNOTSUPP;
+	decoded = LZ4_decompress_safe_split(head->src, head->src_len, tail,
+					    tail_len, head->dst, head->dst_len);
+	if (decoded < 0)
+		return decoded;
+	return decoded == head->dst_len ? 0 : -EINVAL;
+}
+
 extern const struct zcomp_ops backend_lz4;
 
 #endif /* __BACKEND_LZ4_H__ */
diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index d8aa01bb258f..56a6eecf8d67 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -7,6 +7,7 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#include "backend_lz4.h"
 #include "backend_lz4hc.h"
 
 struct lz4hc_ctx {
@@ -134,6 +135,7 @@ static int lz4hc_decompress(struct zcomp_params *params, struct zcomp_ctx *ctx,
 const struct zcomp_ops backend_lz4hc = {
 	.compress	= lz4hc_compress,
 	.decompress	= lz4hc_decompress,
+	.decompress_split = lz4_decompress_split,
 	.create_ctx	= lz4hc_create,
 	.destroy_ctx	= lz4hc_destroy,
 	.setup_params	= lz4hc_setup_params,

-- 
2.47.3

