Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407138;
	b=IKPvT+wzl9QIkwo/FVryPneYyEX9gAWnsJ5kRj7rvgHi3ztDQLITM+veb93swkoY0BM3
	 ySKA/sF6utc6SJIXdU+ItJ+7fcOdp7PhRdvXflOefu7jz87L5fZE3MSya1nLu9dFqftUr
	 pm980F5T5YqrD1ie8+8Q2e5yS85A2jpPKuLVThBKG5xOeB/zRvLzMPC4WTzR6Q+Q65fMk
	 w0MJXblCdINxtrEF24k7UQCVCojZYz7ltg3gH0gcwSWqKGjHwV5/jpueNMOOgia/C7i0i
	 lu78EQeYVW9xgalsZZE6L5FJnJkX0oxd0W8+hpaRgHmdokS6mDppqEQ6nC05ksWFUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LOCdAV3cJyqL6wWWxU6d+kY0++FuazKUY9a33GDOhyg=;
	b=IwwgoEb2+9OluDhP01SzGCQJTZwdLV33LjSD+HQdmearPpcmhzp8i5eq96tUn1xj6mWr
	 feGvyg8rR87r8yRKvk73AXaJ3JpUZua/LONNU6SSCJ0sGvEzVy8qnHQ34YWwh4t61ZUZU
	 9jHhzHWGKSX7PzA4aSPagzVdnC9f3ulfVsJT6WsX5SaPw0JuVaHFew030F3BiQqqkU0Im
	 atnSPIMg66tNUckatN7Im3whuoKlcoHgmppKXAGwg8lxdgdMA72tlnhHPMneACbkPdhmN
	 f3qLeiPiqVbPIxFNq2EFsegTy0XfCkHoFFmUJh6MAfKQYgDzPRyGIrAccbfdi10QJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hORTNcnJ;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D86606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hORTNcnJ
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so2121118b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795407137; x=1796011937; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOCdAV3cJyqL6wWWxU6d+kY0++FuazKUY9a33GDOhyg=;
        b=hORTNcnJSrdywBiEMIRQvmPi7xqe8lu6VyZO73XIE3pIS68eM+i1Vbjdkk0+5vQbVC
         Tw0uQAwECvngN21YNTyw42D3g4fzy+VWxXjNuWt1RKdFGmo4Vcm0vhHdQ7kPQ4ZQR+fe
         r0mChloXNJ800GTxe7VbBScUhKmjKOc5Enjfs/CM2/b3nzbdy7JmwFmhJrroc9GgzgDQ
         A4tGJNqIkM9Q9IksGkck7NZ8moj9bCeyrcNLkzXIinB3HFvkNKx/L2bP4DwDEt6tcfDy
         HUaIEr/RERx9Ki8CcQEIT0W4Pm8P7s7DTyCmKJDkbKVGCTZ1aD4NX3vRk887ChnD/PMB
         FPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407137; x=1796011937;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOCdAV3cJyqL6wWWxU6d+kY0++FuazKUY9a33GDOhyg=;
        b=0K6UlBUQqiiXCMUpMAvntkKGX+qdKKl4dAJRow9zjZKF9K4cejK0e6iuPOW8LRMfjU
         lwqdC3Znncl6pE7du0o82/4pHQUW2A0jXUlRz6vg6IDMcH7srnui9MgXxegQoUd4rQkk
         mCWDEkIfvc0FhtrctJeop9UZ0WJAbKJtFt6WhcMv2Kzr+wppdBWqcspAdnZTtO13j0ox
         YDX+b/O4q9v5CNZMlhHmH1u3R1KUtHiPzUMMQY0+4/ng1yonH954bzDypqYyIYSiXRU/
         LI2TCUyBCq4TAS2Bj5E6PuKLHzaTXvRaabVEqyeGPE2i01XgJYjqLSWOm/1tGapIAk2T
         ZbTA==
X-Forwarded-Encrypted: i=1; AL+hErH1aJGBXumzVmhSN4Q3KtgWJgeE9VlOzU102Y79if8/jg0hXInI67VibMmm6icB/U16Pd05YM3hL/oVn/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dap2WKXsAQ/OhlBD2w6Z3QuDJac70vbHqQ6tGRKr25+WNzCB3
	06SbXfWw8Ja1F9qpO4aoyHgwXPA1NBPraJKMm9lDuRW0d54IKYVwx6DqEAiORBX5WGj4YXDgsnv
	VfBVZwD9qZjMaGHOf9ukORQ==
X-Received: from pgbj25-n1.prod.google.com ([2002:a05:6a02:61d9:10b0:cc7:8e37:71bc])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a08:b0:3f9:3f64:9b9f with SMTP id adf61e73a8af0-4014d2549c0mr11025809637.25.1795407136652;
 Sun, 22 Nov 2026 20:12:16 -0800 (PST)
Date: Sun, 22 Nov 2026 20:12:00 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123041200.3239570-1-nilayvaish@google.com>
Subject: [PATCH] mm/util: fix off-by-one in snapshot_page() retry check
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shivank Garg <shivankg@amd.com>, Luiz Capitulino <luizcap@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

snapshot_page() computes ps->idx, the index of @page within the folio
it appeared to belong to, and nr_pages, the size of that folio as read
from a copy of its head page. Because the folio can be split
concurrently, the two can disagree, in which case the snapshot is
retried and finally marked as unfaithful.

Valid indices are 0 to nr_pages - 1, but the check only catches
ps->idx > nr_pages. If the folio is split such that ps->idx equals
nr_pages, @page is no longer part of the folio that was copied, yet the
snapshot is returned as faithful with an out-of-range index.

Use >= so that this case is retried as well.

The race can be hit from userspace. On a kernel with a debug-only check
for this condition, one thread repeatedly faulted in a PMD-sized THP and
split it to order 0 through the split_huge_pages debugfs file, while
three threads read the /proc/kpageflags entry of the THP's second page.
In 90 seconds (about 181,000 splits), 14 snapshots of that page were
returned as faithful with idx 1 and nr_pages 1. With this change, a
second 90-second run (about 138,000 splits) hit the idx == nr_pages case
41 times; each one was retried, and no snapshot was returned with an
out-of-range index.

This issue was found by an AI coding assistant (Gemini) while reviewing
snapshot_page(). The fix and the reproducer were written with its help.

Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 mm/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 80f6c714844f..f2c23e4551a8 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1444,7 +1444,7 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 		set_ps_flags(ps, foliop, page);
 	}
 
-	if (ps->idx > nr_pages) {
+	if (ps->idx >= nr_pages) {
 		if (loops-- > 0)
 			goto again;
 		clear_compound_head(&ps->page_snapshot);
-- 
2.56.1.750.gf70dc682cf-goog

