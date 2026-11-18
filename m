Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020035;
	b=az0U0PhXy2khkMGyvi3GSRQFESqFb4DmLhcMGGiemooFpMU2iyW+cBD82hSsiqnMNsax
	 EjWwwcV1+Kk0pQ5k0oYXCOV4M/TXOF7Q0HV8kqaK1mBq5OjLLaiRHF3W70gXgwh7MY0Ay
	 5z1axjgg6MG+tgvXdaTfD70CPcDcR7QAXtnmUpcopq1yDU8EbJAP5uwL5N9nSV+sltZow
	 CJ4boByZU6fHpmfj9RiBN67oPaP1T5fJ/nLIeHIBLJ/eSEtPEmY123Di+Tp76VyxjCYCE
	 RqsWEIPUigZfpQak6isVId4bq43TTvFbtU0zw8U8n79j7YfNNpezbgVkXrbeaiwAeAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U+JDjr70NfmoYuAwDWLUcR7/Nq7waWVnmWm8ckIRrMA=;
	b=0jqy0WMAGZR8wc/FiVsYrvHYDgJMtmeX6XomOG51inILIBBc/uQ8AtgbUQyxRltV52zn
	 eH8q64HwwfdTUv2gvffkFB0M0/nAnp3Ct3N8S4rZfUIEaxvXLHWTlZ/xqM2xYCQ6G+pmz
	 RR5kpxLwk+QuoEf6F5p/b5PsxGqw8A31liEZbsuUvWfXwXZZtzbsWTdiwuLSDDivy/a44
	 jjGgtLlJ8INkJbXawnQ+jWne1yroUgaNt63TleAbyKun8puSFgriYj6a2V+VG8LVqHsLk
	 g6gdvJcQVhKhLAP6N5+/oyuvDYTTfr9h52zL+tEmGY943tkdwk70g99hdGXDRz+iQQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KooeQABl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB8C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KooeQABl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4af52002471so861595e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020034; x=1795624834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+JDjr70NfmoYuAwDWLUcR7/Nq7waWVnmWm8ckIRrMA=;
        b=KooeQABlnsFPB+pXl6aegjdP2HIyyI+1ZhMfztnKdV6MPD+vvhY1z74e1WkkEHV1bu
         nB6jim1X4HzPl+1MhbEhK+2uoM9b0CeSek2GPq9YXiATs1lgYA/rDz37dWFQe+C6AMRK
         Z53B1wOw26IjOQcmJ9wcNvJ7VCfvhxw+5I9w37alTS3nqhvCowgw/IPC1Y7Bm4MaDwlo
         12vF1Be1WvS1ImEcWVQdJ1EHJqaSPNs+RTXQQieXUQZmVIU1HPHpGLLNIg78V0jYcHuG
         rtBJ7dhwpOTGCgJ/bSIts0JvRK9nURv8If47+RCHcQ2njOweAqZYr3TjQ0SwDO5Xd2x2
         K3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020034; x=1795624834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+JDjr70NfmoYuAwDWLUcR7/Nq7waWVnmWm8ckIRrMA=;
        b=tdcN0VwTNasaEMWVQ30MPO0V4LFrECXvySFDqmT7oIQQ73g3+mrflTjSIp7pjJtxi6
         ciUHDqzvv33XAYRsFROFUeoi2By31FC5o456j5R8dRfQroJyH6pkJKoK6O0DgWZPIyiE
         v2Faya1DRNJ7Vy4IuUfoMCrJJ5jayozWv4lBHcIpGtb4i0GOATRhovE06AK4YTGjeG7n
         lzHQ3AOSliNcfExUxP/CD5/5X4I8RLmn8WPAd1Ro1gvKJgCwG5+kNXw6T5sxjB7pw7sF
         4D1y1Pr2ODONA7XVRxm1jcDYNFKLSaiyTzW0eeZva6W3TBVjBui8m4vi5vgKxr78rfmI
         lhUQ==
X-Forwarded-Encrypted: i=1; AL+hErHoELth32Q4ZS2eubuvQwDWkok4fuVwBr8B6KXkDbuCn/gP3/D3FM+3GgankF7fW+A9NOpg9551KUv28e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+AvNuXQuC+O3YfIis/qDuAyVz5j9lemXFQhHgD/0g3bEjUTKr
	+BLd4C5KV47gpO4D7VA1aOlZrxBnwVFjSwNZrhP6Vj8df632md4qZtC/
X-Gm-Gg: AYBFou0rdCNuX9aWh6NosjSdsHbDRFONVbN2oEB43oJ3VLNuAIMG5pi2saeHIyL+Kk5
	zmsY6eZy3SgoCO4c9YkgQB7aydEpYEts51g0pfecoYZlAxDTNQmuE4LaGaHz5k8sFRllopUgxJ6
	rKeQfX932zpeDCMLkgO/AptBD3CvIQ+r7NTt8ecT+whQPAUItSYp25utGhTjPk+eJ79G9ZrnqFz
	ThQOcvH0kK9qg73C9YmLLgddbAsc28AnalEBe0O6e1Oo0bvycEl8hkZfY9t+f+B//JUdOUT8NE0
	DQ78VeJKX2GpfUun+gcv8TnM5PcXfwbmH08Uw+rZ2+dN5z/jx/85rEWhmrUrgiPBmbV+SyTH0qp
	8dqyWaMhavPqQ+fmN49CvkoNZR1AjpqXXAw6qwaUZWn9lOsa1791tyR9+xKGEUYKQS4/iSdWbYA
	si2TU8cOPQUieLGL6dPTGMVfFdMb3NzrvJ0gs2XduuutYbZStpAKV6y0G6c2leln8XvBHdMpcdj
	xN4WAylZggxGxOAyzitrGhJrWdBCzh1AO3rtdZqnu4xvBiylxUQGBgLXTeERpBmKBkmujbpuMQ5
	IWdkGBw2Ra2hwy+Odc4s5AgqJGmx/Q0UloBcmmjoyXuCnPrlR45oRN+R4k+417Z24w3bsLk0FAD
	o7rmZnYtzjgoOIg71
X-Received: by 2002:a05:600c:8012:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb7d7167d1mr54707545e9.1.1795020033418;
        Wed, 18 Nov 2026 08:40:33 -0800 (PST)
Received: from localhost.localdomain ([191.40.25.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8325b779sm623115e9.9.2026.11.18.08.40.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 08:40:32 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommufd: Unmap the failing batch before releasing its pins
Date: Thu, 19 Nov 2026 00:40:26 +0800
Message-ID: <20261118164026.54455-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
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

iopt_area_fill_domains() maps the PFNs of one batch into every domain
and only then moves on to the next batch. If batch_to_domain() fails
for one domain after an earlier domain has already installed the batch,
the unwind path calls pfn_reader_release_pins() at the top of
out_unmap. That unpins the pages of the failing batch while the
domains that did install it still translate those IOVAs, and only the
loop below removes those mappings. For the duration of that loop a
device can DMA to a page that is no longer pinned, so it can be freed
and reused while the translation remains live.

The release also cannot simply be delayed to pfn_reader_destroy():
the last domain in the unwind loop is the only one that unpins, and
the unpin ends in update_unpinned(). When an earlier batch was fully
installed before the failure, pages->npinned still counts the pins
the reader holds, while pages->last_npinned still has its pre-fill
value, so update_unpinned() warns about npinned being above
last_npinned.

Release the pins inside the else branch of the last domain instead,
right before iopt_area_unfill_partial_domain(). No domain maps the
failing batch by then: the earlier domains were just unmapped by this
loop, the failing domain rolled back its partial mapping in
batch_to_domain(), and the later domains never installed the batch.
The release also precedes the last domain's unpin and its
update_unpinned(), so the pin accounting stays consistent. The
single-domain variant iopt_area_fill_domain() already unwinds in this
order.

Fixes: 8d160cd4d506 ("iommufd: Algorithms for PFN storage")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 2f6153108add..a99f4efbffd9 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1962,7 +1962,6 @@
 	return 0;
 
 out_unmap:
-	pfn_reader_release_pins(&pfns);
 	xa_for_each(&area->iopt->domains, unmap_index, domain) {
 		unsigned long end_index;
 
@@ -1982,6 +1981,18 @@
 					area, domain, iopt_area_index(area),
 					end_index - 1);
 		} else {
+			/*
+			 * The last domain is the only one that unpins, so the
+			 * reader's pins must be released before the unpin and
+			 * its update_unpinned(): npinned still counts them
+			 * while last_npinned predates the fill. No domain maps
+			 * the failing batch any more: the earlier domains
+			 * were just unmapped by this loop, the failing domain
+			 * rolled back its partial mapping in
+			 * batch_to_domain(), and the later domains never
+			 * installed it.
+			 */
+			pfn_reader_release_pins(&pfns);
 			iopt_area_unfill_partial_domain(area, pages, domain,
 							end_index);
 		}
-- 
2.54.0 (Apple Git-157)
