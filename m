Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079301;
	b=dlsueYDiyqjK1ccYs/zJ4tnucWApenv3uedwdchtCd5+QKIgD8vFveiq6fZ0XKdvqWDR
	 EMDbtuAHjk3LrdUQvA2H8sqYQPMLa1M/6dRi4pkDdUosItb5vV0/nBL7tHlMrVPL9MMjD
	 Ei1wL6N75o+2AjKYfy685vWI48TtmnbWJ7HnfmvuFXZIna1NqmBVfmxo7ExQ4UHakuz4W
	 dKvUlDKAydtYu6/uYjc7kDz/vYidVSmwrcrU8ELvdqswMYJMttmLENCwEISM3iRjekg8e
	 LnX7MVDftB+spXcxy/XqUH423dC5nM7z7L8FhOtofBp9PqGy9x7Bv6IodLXpJI8gPqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OEuafh/btliWcWQzu4rL42Kz6r8EMDrqcLczyrhz1a8=;
	b=iZ+GxGa0mzfG4BlgBLSpqMZ35ChkrnfQgxMfir3dwSGvT48Zn2mATp7QukPg81ZJ4vjY
	 A5N3whEtFE75ZQ5KGKVk6IPQuBVcQxUydCJbMzabE2ir8sAbUZNDviv9A1YJcQYpKXVq7
	 WFFlBQiSZvlYLiKrjuqXGbf53RIt0a9BE/SfxTa+wG+p6jcBqktQqHyVW3xJ3fG4yCBtY
	 xhE9fGv4el1XUpi+eavShwVssHtFDRFCbqyEJ9X6m9T2WfqOw+GQ+dlBG485xeipbrI54
	 HzFmPGvRjckKXxT911u94OEPG0xumMv4ou2qqKRthip3WT5JHCsrC0jTi+SPQCclcQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivhOHjpw;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36F606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B36F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivhOHjpw
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1207417b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079300; x=1795684100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEuafh/btliWcWQzu4rL42Kz6r8EMDrqcLczyrhz1a8=;
        b=ivhOHjpwYOPE1L5uIt/jjHkS0bxkVIfLYN00+Jrul6Z6PqSTVwGvEpbBL8Rg+aRGgx
         f5diEeYcoS6QTFzpjaQyqMDBNVwqlqGBI8GUWwegHu83VLtImTUkkcRT++RRHU0vE1AK
         Y3NQXEvGIjij58Ohe+tfSZvPOZMDzEVTaD2F6PbYawub1R1Ulc1O1je+hCO21AmoX+Rs
         zfLk0bFDU13M2IzHrG9Q05RMtCNvI7CKbiQz9nWF066zmGYf9L/8KOwcCCQALNrO7S3m
         tMayo07AMF14NUr1uS2BrQnaGecyrx3fbENtQAnZ4KTs52X3m0BccuFjh5fLHyv0c4i2
         l9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079300; x=1795684100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEuafh/btliWcWQzu4rL42Kz6r8EMDrqcLczyrhz1a8=;
        b=r0lbxYmuOww4EaAuQ0lfI1LErIh0/O6I4e36vC78cc6F4rdGcj3cjw4FX+lnvGRpZn
         TPPCiQQ4/ahvaM64PR+I4y0NMTK1qf1+K8FWglbmESSR7tvl24tS/C9upKr8Y2ll23QA
         ywSgO3ZciaYOCu6J2mi8WYpRuWToSnLgpctKjnuc5bt6ljwMSlEDX5QwmGYl7sjlob8X
         M2KFo/+lwGs0kimcefEuYjJ9TS8ip8n9B8A8R9rQm/nJKzB6AYZyj95PKKlXczlVoj1k
         RoC0ICuCk9fBV4SmP3wmEg/zXYuPZzPXtUARkWc/x0L911YXOrDmxy5rfh7ei2oUu56s
         EkHg==
X-Forwarded-Encrypted: i=1; AL+hErFUaCrw8WUlRsIJjWDpzE7pAMYP9riAVjfNe0WnMXYbH155F30+T+74w81/MRIhSbXwLcreB6ak81s7TLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8kq7M8ew5bmlvb7uqCyZm24TOeUZRBGS7obcTsOUpr6MRL7j2
	rF4Wz7+eAr/CScl0fGYbYbbPcQoZE09pywArTsyZt7HniNXQkBMmhqUd
X-Gm-Gg: AYBFou3y+Nf+gJUQ+ofXfQdKI3V7V0dAfmeEoBdgMPobsGICNYMqJo5nZGy3pzQQUId
	Tf26QHCtucv9x/br/iRLvKY9qYlLYDFdhY0F3yDQX1HvxWfPhNK0XtrP3HAITRGqCLHy6uJ93iQ
	EXhdIOV4AZx4UkmmrJDGdEnxYXp/YB90hzXbTj20DcIsbz5+rj3sfxcS1aoivb04W8a/g9GHPzG
	JUwcFxtvsPu5ws9E9k2CDRb8l7ejBL+Vpj65iDxrCQQRwqVqL8BQ1847DlMTe0zI0AVMiHpd+Bf
	XVv/oV8IM6ciMAE0XKMM5NKak6tl4xgCyw0his19pzry+hqumrsX96h5RP2PuFmjQ/9TWidDoWA
	bIihhnLN8y4z+ZABjzbC15vgam9jG1s8F+vmTfLiy2pk02PPPo0pvST3tMe1zl2mCp+9DczxR7e
	sxljcRv5zd2R3Tz97RapVYR2PdLbb39x62MmA5kUV/vL8CzBLpideh+jS6X5cB1Ic/DrOXGDYph
	Kx30JgrJQWnuhylzRPTJ/WXQVOjwnBzlBXpMfTiwCzjq0g5HtwmyKuizL+i7A3ulbhRKyEkWlad
	HUi+bfPTLxkm2kISTEVTMdL/1XuJWo9T8Q==
X-Received: by 2002:a05:6a00:3007:b0:8a0:3ed7:93a7 with SMTP id d2e1a72fcca58-8c5d314d98cmr4789290b3a.32.1795079299712;
        Thu, 19 Nov 2026 01:08:19 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93d023sm2372941b3a.47.2026.11.19.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:08:19 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:08:14 +0800
Message-Id: <20261119090814.1355651-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119090055.1255028-1-ping.li@horizon.auto>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
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

mtdchar_read() and mtdchar_write() use mtd_kmalloc_up_to() for their
bounce buffer.  Under memory fragmentation this helper halves the
requested size until kmalloc() succeeds, so a userspace read()/write()
of a few megabytes may silently degrade into many small mtd_read()/
mtd_write() calls: more per-chunk overhead, and device drivers whose
backend cost scales with the number of transactions pay a visible
throughput penalty.

The ioctl paths (MEMREAD/MEMWRITE) already use kvmalloc() for the same
purpose (83208e106a8e8 "mtdchar: use kvmalloc() for potentially large
allocations").  Use kvmalloc() in the read/write paths too: it tries
kmalloc() first and falls back to vmalloc() when the buddy allocator
cannot serve the request contiguously, so the buffer keeps its original
size instead of shrinking.

The size is still capped at KMALLOC_MAX_SIZE, as mtd_kmalloc_up_to()
did.

Most low-level MTD drivers only memcpy() the buffer, so vmalloc'd
buffers are fine there; controllers that DMA directly into the buffer
(brcmnand, gpmi, cadence, atmel, ...) check is_vmalloc_addr()/
virt_addr_valid() and fall back to a bounce path already.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/mtdchar.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..442fac076940 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -148,7 +148,13 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	/*
+	 * Cap the buffer like mtd_kmalloc_up_to() used to; kvmalloc()
+	 * then falls back to vmalloc() when the fragmented buddy
+	 * allocator cannot serve the request contiguously.
+	 */
+	size = min_t(size_t, count, KMALLOC_MAX_SIZE);
+	kbuf = kvmalloc(size, GFP_KERNEL);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -192,7 +198,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 		if (!ret || mtd_is_bitflip_or_eccerr(ret)) {
 			*ppos += retlen;
 			if (copy_to_user(buf, kbuf, retlen)) {
-				kfree(kbuf);
+				kvfree(kbuf);
 				return -EFAULT;
 			}
 			else
@@ -204,13 +210,13 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 				count = 0;
 		}
 		else {
-			kfree(kbuf);
+			kvfree(kbuf);
 			return ret;
 		}
 
 	}
 
-	kfree(kbuf);
+	kvfree(kbuf);
 	return total_retlen;
 } /* mtdchar_read */
 
@@ -237,7 +243,13 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	/*
+	 * Cap the buffer like mtd_kmalloc_up_to() used to; kvmalloc()
+	 * then falls back to vmalloc() when the fragmented buddy
+	 * allocator cannot serve the request contiguously.
+	 */
+	size = min_t(size_t, count, KMALLOC_MAX_SIZE);
+	kbuf = kvmalloc(size, GFP_KERNEL);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -245,7 +257,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		len = min_t(size_t, count, size);
 
 		if (copy_from_user(kbuf, buf, len)) {
-			kfree(kbuf);
+			kvfree(kbuf);
 			return -EFAULT;
 		}
 
@@ -292,12 +304,12 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 			buf += retlen;
 		}
 		else {
-			kfree(kbuf);
+			kvfree(kbuf);
 			return ret;
 		}
 	}
 
-	kfree(kbuf);
+	kvfree(kbuf);
 	return total_retlen;
 } /* mtdchar_write */
 
-- 
2.34.1

