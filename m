Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489053;
	b=f3AxxIWUPYrJHj7e9FVtdiL3bIN0bso759osA6N11Pgk5DlNTgHZfR68wclo3L5JkvNo
	 k1JabTLuaP9LOyss2idE0M9ZDGC518PDSe6KDArfUphufSW90ZhRdEb6gFeEzBlpoCdj0
	 /AT/LacxCCH7CtDCQE5oDTvmbmq+Zo0kB+E9dKTBoHiQE6nejuHuZkm+GVTxNtBg/evxk
	 gVQTZsc7YFjJcky99BHpQWFe5kRkZW6Ki2Nw1Rxzj8Ziy7y+2/xuPlNM0kbnAzxfsd4rD
	 Ttf2OyAXgU9utmZ/fIc1Kvkge/aLMeDMbVVEKDPAKcIZiD/lWn6gic1IWL3xJ2O+ImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iGzjYYK2RrRv1SuL2YUffxkbeCFA16ZG+Je/ZdpQngg=;
	b=Q3aDd3vGB/ffPJi8xL6Dv+ppVevgd9W+hLg7O9MTcK4s0tCDRokI7Z5mQw8Y2+wSeOuL
	 GnCNqisW7FQXAUH0R4FJPD7C5B/ZVaWA2Xjde9IGz2cb0qce9qOZhX+JWxC4JzYEtgFqg
	 YKTwIbTt/DZ9QhdpqiKYConrZLunwm5odOk2Q00czLAw1D3IrIqQco60C9Hs0gv0DQsO3
	 weOu14drh++y3hR9fY/3QW7N2+UiYShQTjDRjE5Zr7tXE74bTIPEw81YV8tJJJeGDcc1B
	 et2B4w/ur4SSOX0LlvhtmHiHlmrXJA23rVdKywcGyf/sG6il2/N1SgNBQ6tw9ENhBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nraDDaqY;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD7606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECD7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nraDDaqY
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f07a960666so20630225ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489052; x=1796093852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGzjYYK2RrRv1SuL2YUffxkbeCFA16ZG+Je/ZdpQngg=;
        b=nraDDaqYL4FerQuBLNbLvA8UK9dyTZNujD7ZsAwlTRoiKjTMz3kkfHirjlbB7/Hyks
         knZUcHwwcEnNPIjxg7ucc0WaNaCH3VETeOAuQtgryeZYs2DenI+/snJ+oJF20mbnDQZi
         4dA5ohPgMe/KitaZSb/5e7b3BBUh2OYVUdw+k/1PrqFEZclL6oNmvsaT3cGIcLKMBEPH
         zCDOoiiz/Orh/ovFGc10YEtfbiXtLdqeT0t+9hrEzLMT2aKROLnUpSO0CP1m7AHzk2Yh
         WsKOAiPuYRsi7NPmxUHPOnFI6WzVP8SswrH1Zoiwp+aaBzVPxIACmFY3045A/oVRB5TF
         OInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489052; x=1796093852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGzjYYK2RrRv1SuL2YUffxkbeCFA16ZG+Je/ZdpQngg=;
        b=J4yZKByvoAPrVxnDfSLpeaJUvyMndCDEP9SzkEz2NXTTrc7c6NykZvG4XPavX/yfjG
         f9PAg32ncexsLUXZHwksH1bHq7AQMsQp8pdN8zAdIoaj5pGg08OrgXIrkwRcPDMENcGA
         k4fHomNhQCVMH0S/lNMZ3louo5RQUwHmg1C6HHICF0ICSRlk2AMSh8qaXF6gxoVq7JOU
         Oq8UGNEoq5iDpUbeSQ8Td+W7aljEe1KMFcyfK8rnxDOxAHj7+wG2ZCKBwA6kyA/ICwTP
         /pn+iFSeZu88WE0fO7G2w747LxXlclm8fDdY4c/tUzZAMKwwk4FgMubgJnNGDKFRavNX
         6hjQ==
X-Forwarded-Encrypted: i=1; AL+hErH/d2vzPz8mNfsRRy69GMQz/5gnW0MoZBg9JjXKKFzIy884qzjQa4ixtzQ9D02WOiUtIIq7BkRBU1SIVlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pS6MkRWscNxUvFx5E02yzA+x5OSR0tKJhmJbjWdl7KvVaAPhQ
	nFREqVPFbKFh8qXP89PlEd2U7BCz7BO6Sqcf3oj871zg1hIJfAKOc20HIqGyPukr
X-Gm-Gg: AZFdTZdeX02XDBoiGtSKI/wJ/lqJfEBfQTdAtBCM/1mMY3kvwAIIRPaCghtN2pnU+yv
	2Dd2LAbLBUePdz/r79jNN4FlmfJSeist7BT3MDXnbJlAppXbPC35MAJjKH3JFWCGRjbMQ3oej+1
	ZruO7+ISITBmgspe7nhD+UqLJCWkGQdiMO5vwc9sL1JebypfYg3bkXW9TVKzIA6aE88tEo4N5Du
	GGf0LzSU6bvJuMryf0QUoibxQQUnTzaRsjon6V4lBllYYZWhZnPKjIXdbMDylQ5/8DoURHim5If
	O5ll0LzQTBk9kc/UzQlFU60lYEyOct4MKR+UaXV0WooETKvlYc3Xc94WbdikSVaFlnEVv4PKZ8z
	oQgxTV/450JDLbepHxIfEzjAlwruU4K7rpQBjNlwe7i38OVqscw/9hk7IBwMRCClX+JhyysiIId
	CCn5w6Tmp81SkL8xe3Q3i9B0/buL7Szp61whPMcfibr03vuuW0RvIJQ1hsBmgm9W9mG1LaOSUQN
	fWRXH2rksRF14bLIsQlFjEkygZMJaQkWhl/lc/WNX7TZv9ohkzTRXLPsrXrvMCu9cU74qxaSNQD
	HTHopDaTWPHUBUumEz4lQ2pg1RvS/jd44AQBkLgwR856b5dMpWBjQxQ=
X-Received: by 2002:a17:902:f547:b0:2f0:60c4:9d1b with SMTP id d9443c01a7336-2f060c4a58dmr104313945ad.62.1795489052233;
        Mon, 23 Nov 2026 18:57:32 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm60823275ad.9.2026.11.23.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:57:31 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH v2 2/2] mtd: mtdchar: use mtd_alloc_buf() for the read/write bounce buffers
Date: Tue, 24 Nov 2026 10:57:22 +0800
Message-Id: <20261124025722.1476247-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124025722.1476247-1-leeonion.muyu@gmail.com>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
 <20261124025722.1476247-1-leeonion.muyu@gmail.com>
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

mtdchar_read() and mtdchar_write() so far rely on
mtd_kmalloc_up_to(), which halves the requested size until the
allocation succeeds.  Under heavy memory fragmentation a
multi-megabyte read()/write() thus silently degrades into many
small mtd_read()/mtd_write() calls, which is visible when the
low-level driver cost scales with the number of transactions
(e.g. drivers forwarding each call to a remote controller).

Use mtd_alloc_buf() instead.  Devices whose driver did not opt
into vmalloc'd buffers keep the current behaviour; vmalloc-safe
drivers keep the requested size.  Also update the comment above
mtdchar_read(), which still described the old mitigation.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/mtdchar.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac72931..0142cad65aee3 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -111,10 +111,12 @@ static int mtdchar_close(struct inode *inode, struct file *file)
  *   FIXME: This _really_ needs to die. In 2.5, we should lock the
  *   userspace buffer down and use it directly with readv/writev.
  *
- * The implementation below, using mtd_kmalloc_up_to, mitigates
+ * The implementation below, using mtd_alloc_buf(), mitigates
  * allocation failures when the system is under low-memory situations
- * or if memory is highly fragmented at the cost of reducing the
- * performance of the requested transfer due to a smaller buffer size.
+ * or if memory is highly fragmented.  Devices whose driver did not
+ * opt into vmalloc'd buffers get a reduced buffer size, while
+ * vmalloc-safe drivers keep the requested size, so large transfers
+ * are not degraded into many small ones.
  *
  * A more complex but more memory-efficient implementation based on
  * get_user_pages and iovecs to cover extents of those pages is a
@@ -148,7 +150,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	kbuf = mtd_alloc_buf(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -192,7 +194,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 		if (!ret || mtd_is_bitflip_or_eccerr(ret)) {
 			*ppos += retlen;
 			if (copy_to_user(buf, kbuf, retlen)) {
-				kfree(kbuf);
+				mtd_free_buf(kbuf);
 				return -EFAULT;
 			}
 			else
@@ -204,13 +206,13 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 				count = 0;
 		}
 		else {
-			kfree(kbuf);
+			mtd_free_buf(kbuf);
 			return ret;
 		}
 
 	}
 
-	kfree(kbuf);
+	mtd_free_buf(kbuf);
 	return total_retlen;
 } /* mtdchar_read */
 
@@ -237,7 +239,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	kbuf = mtd_alloc_buf(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -245,7 +247,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		len = min_t(size_t, count, size);
 
 		if (copy_from_user(kbuf, buf, len)) {
-			kfree(kbuf);
+			mtd_free_buf(kbuf);
 			return -EFAULT;
 		}
 
@@ -292,12 +294,12 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 			buf += retlen;
 		}
 		else {
-			kfree(kbuf);
+			mtd_free_buf(kbuf);
 			return ret;
 		}
 	}
 
-	kfree(kbuf);
+	mtd_free_buf(kbuf);
 	return total_retlen;
 } /* mtdchar_write */
 
-- 
2.34.1

