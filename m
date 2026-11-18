Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037813;
	b=x/Js3oLtsC68Ga3oSoCQNqUPkBV0gdnwdaKTNLmSIw7CYOre4uTDRzmtD0oUCiL5UC2N
	 aGMwL4jzTACZWbUxKNBA3uS7ci6g2AbaVIP4Ia3kd8y5Yl7VF2GoKE/GqRi7LsAWPM6aC
	 P9PuctHB8aX+RLxc9PhYhWr4ZAxyJaL+TPA8z5ErMCqWIttpCAk2rmoG/vTZ6pJBHNHrO
	 X7lKLRyRHUFfa5hdO+LUu5B0wM2PbUoOydylOhor3vIs0xg/E4XwJ67mE1+M+h/+q61Rx
	 e64R70VswnQUG6z7TzA+2QyqW9r+iYFfIOessaHniGN4Cbu0yeYnG1fCS5jx3tYMzQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oQf5dJ6mZzVBJljDb9w+mCIuacjIbr/Xh81Uvdlgp6U=;
	b=5kPL6R6kPyBDwSJ9T3O9f4o+Lna2/q5QMS7yEw0oaTOWXY9Ygk6lxe8IHsxZWJo7WaY5
	 KXkYkWf8gbF51V9OWotEaT5sW09c3A4L2p4alTj225bYIrTlskPQUuPtknS1wj43Kv14B
	 R/Ze03NpKIQS0y3z0JJrmvDiD6YHoExeXGUPrF4XQhVS/62WOLOD9V09A8oOiVa2M1Gwc
	 mnevLTyxCWV/rHQVfWsWdKURFGGfHhjSH4RIHbOF5Gr7Uey9cbanJ7ndeyWtQGDSdeHd6
	 3asAP4oVkiv0qH9i/Ff2eYjJP4zqpCGHmjGTXPtXx7ITAYlxWkrodtv7ctnFpGiy0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjP3nF7d;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496F9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjP3nF7d
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so10896787b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795037812; x=1795642612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQf5dJ6mZzVBJljDb9w+mCIuacjIbr/Xh81Uvdlgp6U=;
        b=AjP3nF7dzMkdCR6dAy67vTe1U4aTO+n3zhermBnMqV5Z6JXx/N9Ry9NEio9ktG51z5
         VtTojbPiXI83JMjA5bt/YOEto9S13jNZ9jp7onOI4cki0vlbQlQ1tALhOPQlXglFJ+oa
         2H+JP02xZiR3b5KG9MK4dvQbHsOg7976/Wd3eKZliS4tBaobdYmSjx2vJdQhy6p/sO7p
         t1xtwgbKGDsfPzWzNbFUYozvhZFn7PSWGuH4cQx6ob74xcq8kh7RtFxWORQt1LjPkbAD
         jLRc3rM2Jw5OgS8MzbaSq3IwG+3SFzyEiIH/z07mGsTZa5sC5cv/T2U60TZxF3xoDlO4
         DzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037812; x=1795642612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQf5dJ6mZzVBJljDb9w+mCIuacjIbr/Xh81Uvdlgp6U=;
        b=pjW2bU7ojA7XqXWW7FWt8rNhVuL4H2tJGkm510qPiR6le1puTaTqBZGbhOdLAJOnWC
         8xCQRTJCSU3oMlf9MdUzOb4sxoDlfhCvGLsAYh0KY0PYNpYye5FAIh3aaRcdAAnTBFc9
         cjVmaN/vOiCmzEbSMnBx7p+5N6693UGN6amiq7gJNY2IoaIvYCDkdXm63z9O5rzPUeBl
         b6xbW2JKh/S14JPJdbi+2AUuI6cdQdnaLLEiWvBRZgJYovO7vAT6SdNAB2qdf+2f/awO
         wXo746YMiZ+hqm1ZQSMK/qbdly7r8wOx7WVhd/0/R+eLcZI5DjwD3h0afs4IuSsyUpOf
         sX8w==
X-Forwarded-Encrypted: i=1; AL+hErE76yvIrwb7l1WGXqlSiZdKXPiy31RyQzMEBs6DxLFGseo9HoqoKYhEWATlOoVUy9b50vEEZt86Qhzkqa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DNHU70VdVaDyEBtqEE/Zo760QrNOw+wy7ktOsAziuriDHKsPE
	nLH6eHN2AAiNS3LKF7BM4DE7iLz1+mnY3dYWL7kJ0HOsqs/V0oDX+RIX
X-Gm-Gg: AZFdTZcFSlVROmjoYZbS8DXWDI+2D93MVXAF2iAgM75bVieTWPYIMRqT2ErOtF94OhF
	7zs4C04KqYBgsvbzdCdcWcx+G+tMyK4OedrYlevI8jyjo6UifN4vvgnKdtXMVnn06ISzvSBM3QV
	ei9x/xBaXjnip+EO7zw7mo6unAUEPzlq+1jmRDpt3NyLN+krsnMDDHH9CJYwaDn05WY1dUwiyN2
	8ZWHEeiAJBKqXVkghzhrQAZgvSbn/BJuwyuDTbS4lH7FVC73khFxewTQzoBCT7qlHayRTBHEWkk
	Xrrw+Dr5EJy+5RY1eCWuM1FPdCsXUPWKLMvx87Nt8whNArdvbcphtRL66KEpDnYpr4IEaFTbt8f
	PUcXQ92I2+B1tASVZeyUcaILFyXY8xEGlM2q5evhgpjkVraykoQwLJQOCe2UtjYOXrlnPXM2OkG
	PCiGXjjsJcGx+QOEk8qxgGt9WjhzyOwpppuGK/jHbm4955AgvkmemSXl+R2dQQ3UG07Usp8W8Eq
	FBH7SHFQ4F1wAMcyN8lQDXtxfB3G4lCzG7fRMdy68rFi7xfaBjNyA3CVQuMBQZ3SPlsbSkAmTBP
	m9BA+dOVX4zGrLcZDxx0PWYtsJnxxJaujzCZ6lYL7rXLZIZEpoJd19M=
X-Received: by 2002:a05:690c:3181:b0:8b3:5eaf:2a01 with SMTP id 00721157ae682-8b4fed111e5mr16245357b3.10.1795037812257;
        Wed, 18 Nov 2026 13:36:52 -0800 (PST)
Received: from 5163NRD-SPrabh2.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030be2sm24565697b3.10.2026.11.18.13.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:36:51 -0800 (PST)
From: Swarna Prabhu <sw.prabhu6@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	viro@zeniv.linux.org.uk
Cc: linux-mm@kvack.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net,
	riel@surriel.com,
	yeoreum.yun@arm.com,
	hch@lst.de,
	Swarna Prabhu <s.prabhu@samsung.com>
Subject: [PATCH 1/5] mm/gup: add struct gup_out output descriptor
Date: Wed, 18 Nov 2026 13:34:54 -0800
Message-ID: <20261118213458.377258-2-sw.prabhu6@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118213458.377258-1-sw.prabhu6@gmail.com>
References: <20261118213458.377258-1-sw.prabhu6@gmail.com>
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

From: Swarna Prabhu <s.prabhu@samsung.com>

The GUP page table walkers hand the pages they grabbed back through a
pages[] pointer that every level bumps on its own, which ties them to
reporting memory as an array of pages.

Add 'struct gup_out', a descriptor the walkers can append to instead,
along with 'gup_out_add_range()' to record consecutive pages of a single
folio. The descriptor keeps count of the pages recorded so far, so a
walker no longer has to care where in the array it is, no matter how
often it is called for a single GUP request.

The @folio argument of 'gup_out_add_range()' is not used yet, it is
there for describing memory by its folio later in the series.

No functional change.

Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
---
 mm/gup.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 3b3888578a7e..0433579ed618 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -482,6 +482,45 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
 		mm_flags_set(MMF_HAS_PINNED, mm);
 }
 
+/*
+ * Output descriptor of the GUP page table walkers.
+ *
+ * GUP hands the memory it grabbed back to the caller as an array of pages
+ * (@pages).
+ *
+ * @nr_pages is the number of pages recorded so far: the walkers simply keep
+ * appending to the descriptor, no matter how often they are called for a
+ * single GUP request.
+ */
+struct gup_out {
+	struct page **pages;
+	unsigned long nr_pages;
+};
+
+#define GUP_OUT_PAGES(_pages)		((struct gup_out){ .pages = (_pages) })
+
+/**
+ * gup_out_add_range() - record consecutive pages of a single folio
+ * @out: the output descriptor
+ * @folio: the folio @page belongs to
+ * @page: the first page to record
+ * @nr_pages: the number of consecutive pages to record
+ *
+ * The caller must hold a reference (FOLL_GET) or pin (FOLL_PIN) for each of
+ * the @nr_pages pages.
+ */
+static inline void gup_out_add_range(struct gup_out *out, struct folio *folio,
+			      struct page *page, unsigned long nr_pages)
+{
+	struct page **pages = out->pages + out->nr_pages;
+	unsigned long i;
+
+	for (i = 0; i < nr_pages; i++)
+		pages[i] = page + i;
+
+	out->nr_pages += nr_pages;
+}
+
 #ifdef CONFIG_MMU
 
 #ifdef CONFIG_HAVE_GUP_FAST
-- 
2.53.0

