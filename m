Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102331;
	b=yXofwLV7VI1B0Q23bD7hz/F3fW+uD7vBn9omlsrmvVhfxMg92zv7xSDlB264KcbCvyad
	 akILOzh1O1MVrLGAzdRefiEGN+/GGjacP+2CIClyWCqctaefOcFvS7FyrCa3UZ5HatjJp
	 gEyWsSujSwNrWhZOL8BTC7MuGNwNguQ/cBgqIBHgylTppYLxQV1bIF35v+rMIxUmKYFKQ
	 dbtXtXQZG+Ng+5BrmeNf9a02Z8B7VJtO5v26SjuBg23u840y2lF3FUPNRNhDd1ZMk7BvT
	 uOlBJN4XTHFUTdvnyd3xVkujkf1tOowa7fo7Yy2TpY+HXSbnr99mLUwPzrJK4nkgahA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fcWwNEHkYlUPLQ8a1nsTOUqqcSFaeduCjApaxkKfvSQ=;
	b=3wBt3b3blc0Meaoqsf9hc07U82a0gc1uYx3smHAYHU86S8egb35CuaiQEBcJQI3f+DCd
	 hIS10wVhRRtgkUGZIiExZ5nJ6yw5R6FKHlq+Hf2URobjLKFNuA7DEm6f/8p/gypglVv6p
	 N5aUJmEoeiv5kd0HLVyhlQDBraJp2c9gyJ98KHEAYBo0mh0MyQWx+G2QsdoN8qOjAPmFW
	 4COl6L1RzcL0Vph7wrUAxUdl6MXPyQJrN0ju075Wc74YM7qXVbXsrXPwz4086zdrvTl+S
	 BkZn8XxzTqrgp2KExvF828kica7/uPTbf+EAvmTBoBhWQRWfdQk80+Al7nfPrB36kbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t7nirtXX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A460A3817
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568A460A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t7nirtXX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so1714576f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102330; x=1795707130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcWwNEHkYlUPLQ8a1nsTOUqqcSFaeduCjApaxkKfvSQ=;
        b=t7nirtXX+Qk2YzYWrk1ivUi7QTEyBOyA6PU9i9js/JgIF9hZokMJ//ESbSbigj3RTL
         aandCUDlyEbnzcojSbGxQX4ux28+5u+vQFXvrsd7tt3UZtxTEZrP+oQlvr2ZYVuw9LXx
         JfRGx8AMWFR2wOce0vspglvYPjUygkRc9Fd0ej1Un6aiKqsx9oALrTMyPET5E7JACdSn
         +7T19wG+A+OyBTEc2sVngu60ESEdbLbUB9R5kS/KA01MC6skbAdQauzWjqrw/bwMkjKI
         HCvgNCohoqasmOxKpPpeHtdZ3ObXicsILncJqSi1mtyy4a7eI1PGB4nXIjlkoyNyEdjN
         h44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102330; x=1795707130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcWwNEHkYlUPLQ8a1nsTOUqqcSFaeduCjApaxkKfvSQ=;
        b=XWD55czCZgoDhHkI0NbJo7UF8LJF/n4xArRHVfNPYMKips9RHlcF7IdmfG59UHTep0
         5+KuIEVSe4hK+U+HuKavbINemstqwEaJJZugadafvJ/rzCQhXeUjoA5FA00UBBLm4KTk
         t6AjqYYv/chhM5zG1h3Is5QnzDxU9ZAZHde4Hu2Ukf5720UPWFykXISuGmqnUwd98sQu
         HtMlzYIiGAORCcX8Zn1l2Q0ZHnOqA67OPl/Fvrfi1qAvz0Kd58iQ5CFzcSu9At69O+PS
         1lZwV3E+YZAhwxilga41+PXP484US0RP1uGRmobCtuO5fVg2RRz6ja9bjd/lvV52l3Aa
         Raaw==
X-Forwarded-Encrypted: i=1; AL+hErEnbx5RNI3or8q9QG/Q3G0PvQzaLJibWuhcplXwqGGs51T4x6SIcX4lVQOFLc/w4IzNKa29+m3PXScgxZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X1lPSW1H8g2PpkO8zXNFE21kO5lN46TgQ8mHJLfA02hvcFrIm
	h3isj1J2P7j5OZIPJ21UYteVwE/Sh4MXQBnbymSpmjw4DbTkyxK9vM3CXQjVyFMCups=
X-Gm-Gg: AZFdTZfgNJWHiVfGjD54iBJU6MDXGoUbfb4M1ByszEhpJicY2EU4lyMR9f1UbVnw+mG
	fYVy8Vpqz3fspsAxQzl54REiVtuW4w27JpV5JVHmPpFnppmDa6O3Af/9gm7f07WeFEm9PrsTfUC
	OOvUEsVx94f+1f3+3MrMUsMR4S7KXUWgEMJ8Q/rwGiJY+hjBQAGDLN1d/ZJ3TkfMddgLbgz5gxV
	yoeeZO/W3RPgn8ptEjr+hbavJ55127ojhOvbFlLP6B8gmHkwOMHAMvCfOi0yUBt+B5DY3fhvs4e
	8mIUXQ/ZuGUmfCG+oWNNsrauR1aERMtWKw9FmbC1t9DQlPN/C1jWbQ+aMJhX7H/kpIkymf42LTb
	vFRIcrGPGUeK1dMjdL0al5I3+65d0K5tZfwUowuWe3XslDPNqoa/QVx3xfOB5TiwJOU6PdVDIYU
	pkNVGWzxMaPDu5s2h+QndkxZCH3Q0VTY+WaZHUPNIb22jqTIV3K5iewm2gH0+tg8q1AroNttls9
	I32+HK9UIdMsPHxvxWMkpcVV7K++SrkuXNmTEDO+ICuzFPxTsFN6Md6MUq/+tx1Cp1PQgz9AhDI
	mQujsQESxSKOP1G3AFfqcGvv8ytoGw/g
X-Received: by 2002:a05:6000:2382:b0:4a6:bc53:2466 with SMTP id ffacd0b85a97d-4a6bc626983mr11814917f8f.16.1795102329755;
        Thu, 19 Nov 2026 07:32:09 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:09 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 06/10] mm/page_owner: Read stack traces with stack_depot_fetch_into()
Date: Thu, 19 Nov 2026 15:31:39 +0000
Message-ID: <20261119153143.4099483-7-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153143.4099483-1-matt@readmodwrite.com>
References: <20261119153143.4099483-1-matt@readmodwrite.com>
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

From: Matt Fleming <mfleming@cloudflare.com>

stack_print() reads stack_record->entries directly. A later patch
stores compressed frames inside struct stack_record, so rather than
decompressing those frames let's use stack_depot_fetch_into().

Copy the trace with stack_depot_fetch_into() into a stack-local buffer
with PAGE_OWNER_STACK_DEPTH elements, which is the maximum number of
frames page_owner saves.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/page_owner.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index cfc31c92d765..16429e70e00d 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -1068,8 +1068,8 @@ static int stack_print(struct seq_file *m, void *v)
 {
 	int i, nr_base_pages;
 	struct stack *stack = v;
-	unsigned long *entries;
-	unsigned long nr_entries;
+	unsigned long entries[PAGE_OWNER_STACK_DEPTH];
+	unsigned int nr_entries;
 	struct stack_record *stack_record = stack->stack_record;
 	struct stack_print_ctx *ctx = m->private;
 
@@ -1083,8 +1083,8 @@ static int stack_print(struct seq_file *m, void *v)
 		return 0;
 
 	if (ctx->flags & STACK_PRINT_FLAG_STACK) {
-		nr_entries = stack_record->size;
-		entries = stack_record->entries;
+		nr_entries = stack_depot_fetch_into(stack_record->handle.handle,
+						    entries, ARRAY_SIZE(entries));
 		for (i = 0; i < nr_entries; i++)
 			seq_printf(m, " %pS\n", (void *)entries[i]);
 	}
-- 
2.43.0

