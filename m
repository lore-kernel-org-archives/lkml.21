Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089618;
	b=cdr4Ef+ioOJJ0O3nKlG6EkLPROnr4d9t5Y8nuQjqqIFVKvC8wT/9gix/O28PzW2cpvcq
	 hLwxmrSyuymaPKDbiMbLnb3y31pH+MafUXcibiJKWFQkk9NGSBQ5QtlcERx8pek29IoBl
	 5iSH2CqpzQaKXqcrs5miyMSacKf8u4cowC7PxKSQmabEAVAB+D1SqLZKlnf8vN8TSRw2C
	 fQK+mc2qzfcyBJzf53rUcPFve0U0qVWbBSTIw6NSC5DmC8EFdHlgaJM3bHx8vsC5niFvK
	 9oJQOddYucyNaMT0p9AmoqMYi184l6wB1m3Lm1Uqdbz2pHv/djhWZp8oLF1Dl/fncAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9gIVlXgPEmkZGmA453gdpvq+MACAnZz6AjvCWRUAbDQ=;
	b=m2O1H83KFjppH4gdT0ppc5wLGSj4wR1Kldi7AEDprI3GwPlo9C73DRacYE8Cry3f0kri
	 /PsKy3B7KzDV0X4uKadAgwSul3nVsFf4UJG5eIRk2N5rynyEqLcuwORWR3I4NFG/LiFR5
	 umhBV/oOWwRZCTzKne/NNh5lXa03m5rwRj9PZzCKsVb3X5b1vjUToBPouPkXmzVi0RQb8
	 gpzgvKUQti6S36/DjoiSdmlunIg5Eg0cHoGc1cG/f/DOIgJVF5bQk++drstAIb7u/0m7L
	 22wTaNokX83J8yI2wj27TlopgVaPLLmuFjz5T0z0uy3M566eRfAh10kTD55ovfBY18g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MTPwBz/J";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069E606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7069E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MTPwBz/J
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1350289b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089618; x=1795694418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gIVlXgPEmkZGmA453gdpvq+MACAnZz6AjvCWRUAbDQ=;
        b=MTPwBz/JY27HN3sgRWUZI0tlkBcWXxf7M7RAXN68cgdg1Am8p7kKnqmSmbk9i3paIX
         nxuGPCiyFzKnbLXHTcpkZL9Jl05xOmooAxQ4ClctRHIr5+ntBgvY4iRhOPPxeMYmnypY
         1SPlY1JPWNh72h0Le+gSG7pxiVUY6/xphqQkwjAhgBiRQ9xfq4MSEwQT4mtoTarBFDIM
         pA2OfASffwaYexAEuos0xfq9yHeB+zfhsnIZivL5ud55stPCuYqdAMDCI4dK5GuB2BAI
         rsecijok4RzXP6n9QVIouU2C2dsMFACTuLaYblKxFjsHNOIT7edbPt+7lOVID009Ys9C
         aFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089618; x=1795694418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gIVlXgPEmkZGmA453gdpvq+MACAnZz6AjvCWRUAbDQ=;
        b=HzVi7GhzgozfEDQtRvcQseU/FiqBPR7O0WJ2vgRNFvGNdXuN2LtBo4IMFIwXfbJ2v0
         FXIRiBtTZgYMLglm984di1CnMUBIDB+aQky7qIOXSftWpOjgUevzinSxUGEsMAWIqd/J
         0GOEy3wFLrR/jdqGYSovSIYS10WS8FSAd4GfJuUuXjTR/vOq23GX71iL9Cljy8DmAGnk
         w//CQDg1mowi28uQSmJp+pyXpux7Owg85D31y09NtAplboIt+gjABUq5n+dkI/Rxuv1V
         2+DKKVJLKDS1xZM0SvO0XrXGfloUTQ9KVhXIFJIzrC6kFG7mwM2MqT/MPoU5UnPNok9X
         ytMg==
X-Forwarded-Encrypted: i=1; AL+hErHYoL/1G8THIUKMtimPbzyRcUXO1CyHpFkTbbYUX+RI/d+zw8LzcdN+heOIilP0KXavCHaeobZeh0Ah7R0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RlrMDYcGur9k2JhHzcKL0iaYGlvwV4MC89ksWHI2fLW1UCTVg
	wJjJtZwP2FiBQx/NVuKlGmcJY1bq9wwqaLFsvDhxI8wQ5+P7G+XRoIbJ
X-Gm-Gg: AYBFou2CjieW2AxlHeTK3tIF0Mv5TmfqU8vwapgWBtDIHAb3+xQ1WesCmp/0//MyIGN
	8UTovveX1iwFPZ7taboWC7ixZo4+kgadJW36jeJDkR8UlNqgUZ+1w4FAsWH3liCQCeuu87Q/8Eo
	6PeyifXbxEldBoYsqNpnI0n6Qp5cxbuGBK4IjWo/l3hz0WAIdKm5VxRLgrHrwxDJDbGRgAmYfex
	SBitupbPiaugHf8niyp5i4Y7+cECGUd/3XZQSAcCznSx/wGOjdh3TqkWyHeXvC8iCSkMIj8OytJ
	FPMJtFLYHtiIoPXTWURkHTdcxmr9WSYACqZ34Moy30qPxltavu8dalrzwFbOPAFQyUB2d5aLSsJ
	eW9ioVH8OLVwwldpgWT9BTXE/4eA1nu+xsDGt680CcuWFaDoNnhHiKZc+BmVZnXGrL92DkMghzP
	57BVRG7lOZ27uix3EDDwA3pWPbJe493mlXOUrZXvkT5RdVZ2dxfowDwbh8I9TnXpjVkplPlqy5y
	+AI9Wk8rJfL6Zxw+FmWr55wzrD7h8AYXY2SPZZmypWHaDaQTPHZh5DO+rFUYmkTWZlzqacRK28i
	6Xl/MdKDBTynRq2TPFQMmaJhyU1WC2cs7WY57FIsbkIo0MGc60cp/hdI0zK8OXpm
X-Received: by 2002:a05:6a00:2d86:b0:878:3538:8f7a with SMTP id d2e1a72fcca58-8c5d51a37ccmr4621024b3a.40.1795089617602;
        Thu, 19 Nov 2026 04:00:17 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93d04bsm2665088b3a.49.2026.11.19.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:00:17 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: asml.silence@gmail.com,
	axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/bpf-ops: validate loop_step before registration
Date: Thu, 19 Nov 2026 11:59:29 +0000
Message-ID: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

A struct_ops map with only ring_fd set leaves loop_step NULL. The
struct_ops update path skips a zero program fd, and bpf_ring_ops does
not validate the completed value. Without BPF_F_LINK, the update then
calls bpf_io_reg(), where io_install_bpf() triggers a kernel warning
before returning -EINVAL. With BPF_F_LINK, the warning occurs when the
link is created.

Validate loop_step before either registration path. Reject an incomplete
value with -EINVAL so malformed userspace input cannot trigger the
warning.

Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 io_uring/bpf-ops.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
index 6c2a587fb1bf..dfa93144b090 100644
--- a/io_uring/bpf-ops.c
+++ b/io_uring/bpf-ops.c
@@ -157,6 +157,13 @@ static int bpf_io_check_member(const struct btf_type *t,
 	return 0;
 }
 
+static int bpf_io_validate(void *kdata)
+{
+	const struct io_uring_bpf_ops *ops = kdata;
+
+	return ops->loop_step ? 0 : -EINVAL;
+}
+
 static int bpf_io_init_member(const struct btf_type *t,
 			       const struct btf_member *member,
 			       void *kdata, const void *udata)
@@ -269,6 +276,7 @@ static struct bpf_struct_ops bpf_ring_ops = {
 	.check_member = bpf_io_check_member,
 	.init_member = bpf_io_init_member,
 	.init = bpf_io_init,
+	.validate = bpf_io_validate,
 	.cfi_stubs = &io_bpf_ops_stubs,
 	.name = "io_uring_bpf_ops",
 	.owner = THIS_MODULE,
-- 
2.43.0

