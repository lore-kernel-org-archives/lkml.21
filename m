Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987626;
	b=MQbyIhaYAHpScMiDnSRHwK6OTkPqTRNPcn5sTc7GOOO343LV0LgqEqgNT0Yd+EX+4plj
	 Sjsmw/p8+FmZrYlALNYd1m+0Hy2P9Bmxek8IBHHECz8wix6bM96wHeSLXgxrGJBsPIB0Z
	 BhCrwFtXgQdkleA/aQHumCMrFyAjXFR5iFY7lFhvtkXIjrm2kbIoA9ZPM+yLDQ56ZtQZY
	 yOt4cmRhxjVbErC0KA7ZhJfrARS2LnxSz/hguzPLwU85Y0GvpUM+cD1Hjs8anBPFniSas
	 y3TgvpIOml2GzvXTqLqJX2VPYocL2eYpZDW8pE9YC6en6SHKE4ZYkI2p10/hpTvGK1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=V+Q/b4oQQRcc2ev9VIFrb3ozJoPLTXTZ4ZqHagDQPao=;
	b=efwO6O7QZVvZrufTW3yRUH8q7rhD5kCkDMzRMnT/6RNsruLODMgq1zKD65SnrnFRNjjz
	 V50wKDJq36f2HqkHbMDTGmdXOwjcvnpt6YYw+b3WhqF5JL9yuWOcnvWTVY+2HZ4K2b/Dz
	 R08ahcs1cQNxCZZ76+3QZXOHaczczwFik3CtO4TZX3T6zveh5JABJG+XsTbUo6Yd8SvKJ
	 9GoWJ9kaBD6tMa2S8b6UJgxiYNeM0FnNdTraEy0iFEBF+Zp44t0D7q/HdgvO1J75Ypviw
	 2VSeDSuwi+wjiJgi0hUm0qdw7X3ckDB47B5OLculNhhnFoaMSjdAUFBeh85NGxnwwWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmsdlEyR;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334FF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 334FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmsdlEyR
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2efd4a0bd68so2281805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794987624; x=1795592424; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V+Q/b4oQQRcc2ev9VIFrb3ozJoPLTXTZ4ZqHagDQPao=;
        b=hmsdlEyRDOKtLAM+Eee2n1NL7lJYvjkRJ4ECHxbcZCcvm2l9g90hE8ZXz+Lut2U//P
         xT6bmC8/VO2DXuSSE4UMvMjdbj74otCgWDVZb6L2QJGzUl4Ratcg1xuZ3nKdgjpKnkF4
         eahIeiwtv+1nNteKbd8uqfSMEn1EBqJAUM/F2aJyZKvP8Ug5DvU1iByJkuDtHI3s98PQ
         aGp/8UUYo3Nmn0gMrqqb40JoOscqjjarJgadeADtbNEM1P1or8N9SkNtqNoC6Pi83+a0
         WORS4LFuw+Zw6Kmp4p7GEd3IJUel5LTrm//USan2Uz/cb+p0xLxfwjdr6rhdBMrpW2+E
         fqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987624; x=1795592424;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V+Q/b4oQQRcc2ev9VIFrb3ozJoPLTXTZ4ZqHagDQPao=;
        b=QUmUqKjHBoPNkf7+tV8INDy90fhkxkCkkloEC5sbzZnutJ6W9CmYgTMXtnf9TdKBO0
         Y323jDfaZNS8K5WiWfR+2G610cV3HqXbl3hmB2UmOhu5UvzUUvFRvpKW3ILEHfDhuPTX
         RvV0BOa9vnpxa1AwapHhySGB3b2hi2vU/tiKPlez9Yv6cdCguN9Jgibyi6eaLtLw+rSe
         XgOPlu76pNPHQZ7fP4ivoIJ2mkxSRrmitjz88nrOVNVQHXziSvY76DPa7FIYeCf2wb8g
         8a8DzSWqZQ+ZUB4p8QjhD04E/YtCgCJqS1i6zFo1938y5hgOEi0wJhkR6ky1f7+nVlze
         wkHA==
X-Forwarded-Encrypted: i=1; AL+hErE9icMw/VL2dWYIGzQHRMp1sMORF+qAR6fCxO+L8WbC90sDY/VcaR80AaaVik6nsOjns4IJTvI3uI8Yvx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JfU+ujzWvIGpapEYAlXwfQ1zsg5c0c8XyIJo5D9pw9Aw4NuBU
	lvWe0cpBp238t+JPrnFZ13/bToYmBmSC2tWOGkEM+ECEBfKjc8AcxKj8
X-Gm-Gg: AZFdTZdv4vIQx62SGq+Cs7Zro3N8OZuv68YjBvkYgv5Fd37/5lrVR58uyBeYwwHfrJA
	GD52LTBfKl4ku6I3zSSr0AkINgCnRzwkDuW8bmestY4HwM1HcuFezTVK8pzvBxH9HYNR4m3idEu
	gSS50M8A80vU2bj6tga0ug2Ne+zicgoglka4WTlcZ278hmriek/Q8WPih8Na2QRN1HsIYUE/iOk
	FuIdc0ytJNJ6pXqiGC3GPwoTS8bb9XtYYVDQRtklkhXeOGnFDOWWpHMOC3CeRws6RKIcrl95CNa
	QqP/2RvAdIhC0ruge/9P3k+OA9R2X773aLJVRtHpo1Eptw6CUs3/zfWby2rCQcRReXn/aMnfQmt
	DiqSnVj6rQUdVr/mgxEqSt1tTI5LD1ad3oM7jkpHREEHtuF8xMdWA/MuAtoR0WEO2DPiCuDh/O5
	d1Boc317wJ4iJDkR+os4kkS/5bqud0GYnBSlwWL+mDzbuTvKaH8ieh3xCWmoMvrPKnkT/qqBrT+
	oHRM4Pi/5rxyCzHEjm30vq8tM1HdWZY/g7fkCje3ViaLS48EQ6w/OHj/ofEBHDaE3FjLe53I1BJ
	gmbPebVxz/Y0ZfiTLPl5ZlHesmychSH0N7sZIDWrPWJZ+SeAjFWjuudT19CO96bcu7hY44j1rX5
	KMNj79GwIbsVaarCDKJxRIn9vLp56ioicFuqnm/y/DOR0mq8eW/8RTkwNbotZjg==
X-Received: by 2002:a17:902:d505:b0:2ef:e044:290c with SMTP id d9443c01a7336-2eff75451bdmr16959655ad.25.1794987624447;
        Tue, 17 Nov 2026 23:40:24 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214565sm8667315ad.42.2026.11.17.23.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:40:23 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 03:24:28 +1100
Subject: [PATCH v2] mm/damon/paddr: skip non-LRU folios as a whole in
 pageout
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
Message-Id: <20261118-fix-damon-hugetlb-pageout-20261117-v2-1-547a65a3206e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2N2w6CMBBEf4XssxsBRaO/QnzY0rWtkZb0IiaEf
 7eVhMczmTmzQGBvOMC9WsDzxwTjbIb2UMGgySpGIzNDW7eXpmmu+DRflDQ6izopjm+BEyl2KeJ
 eoTPXJ3mTHXUCsmjynFf/k/6xcUjixUMs5tIQFBiFJzvoEm3+OLvdeRxHtDzDuv4Ap29dr7IAA
 AA=
X-Change-ID: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
X-Mailer: b4 0.16.0

damon_pa_pageout() uses damon_get_folio(), which rejects folios that are
not on the LRU.  For a large non-LRU folio such as a hugetlb folio, the
loop then looks up the same folio once per base page even though
pageout cannot reclaim it.

Use damon_get_monitor_folio() and skip any returned non-LRU folio as a
whole by advancing to its end.  Do this before the filters, the
accounting and the last_applied check, so that adjacent regions within
the same non-LRU folio are not walked by base page either.

In an x86-64 KVM pageout microbenchmark, traversal time dropped by
about 99.7% for regions covering whole 2 MiB hugetlb folios. For
4 KiB regions within hugetlb folios, traversal took about 1 ns more
per region.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Tested in x86-64 KVM guests.  DAMON KUnit tests all passed.  Ordinary-page
and THP controls passed the 3% non-inferiority bound in the microbenchmark.

Changes in v2:
- Drop the redundant hugetlb check and update the subject and description
  as suggested by SJ.
---
 mm/damon/paddr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 5b773012a876..0a205fa8d468 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -268,7 +268,9 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
 
 	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
 	while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
-		folio = damon_get_folio(PHYS_PFN(addr));
+		folio = damon_get_monitor_folio(PHYS_PFN(addr));
+		if (folio && !folio_test_lru(folio))
+			goto put_folio;
 		if (damon_pa_invalid_damos_folio(folio, s)) {
 			addr += PAGE_SIZE;
 			continue;

---
base-commit: 67f3b04b277373438f17300e056306adbd9edf7b
change-id: 20261117-fix-damon-hugetlb-pageout-20261117-a4e03d9d5a5b

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

