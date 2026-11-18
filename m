Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976161;
	b=X2LBh+ps8mmMo/i72gjphyfpsrjHguFDnkKO9tMjFInICCPrVqb9Cxhw/y40x9Bes813
	 yWPg05yremhk5xIL/5VFE/r+hMEcaIakQmxZnQII8ppbHjVle22LjAVlmUGXpWxXggzEG
	 0Ms5mK8yj01nV+V2VIknIlRtF01bJe7AMpOBJ7PE4HF/cBFJHrsT6LHCY8Hs18nCB3sdJ
	 KQRqO2eW+b2cGBtWQhAnxEwUOuBkmRSivcvzbbtDQMCD5yLRsCFaDBg3lFRxqihMgoYln
	 iVf+WqUX/BZQdHLUwLbBJOzQY3mmuPcAbo1vPbszmXdeclSsKGUTpIJoQrF7Z06lRbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7289YXaM//7fO3vmjy0krlSMq7JNI/I55b1Tqrw8TVE=;
	b=LNbjQLtQzGjY2ig/XywoceZclmbQdRqVSxtUL2fz/Xl2uUB9uTdaHCiKZiB529NTKg3Y
	 xwUxRzWT63vWHz0K8POVKfC/yS9YhC01VqJprZtFggrqL+f5QUHmgORXQAy0r0/bv/yUy
	 IIWOlqsmsuVE097d0oiWEk2WzMIMENZq0qWH2345p79zIwVZPxaRMYmDb7Fl/yDlBqq4q
	 +qWj79H7zieullxD3kGITFFWBvk627j59xqsct/jW6sATEiOwBgNDQqX2xp+hQVy1s+hV
	 pb0vlWgEzeGJ9Hu+z9rjRVn5Nv0A2XX+CbuslB59qMt4vF9jNE3LoX7M2MiFCPsL2JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=D+tgjc3n;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SYZlEQmO;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9D60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D9D60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=D+tgjc3n;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SYZlEQmO
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1XPI93917853
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7289
	YXaM//7fO3vmjy0krlSMq7JNI/I55b1Tqrw8TVE=; b=D+tgjc3n5T9eWM1dnAI8
	vg/1W/rALeZZWof3IhNmi7Qs0A9z81k3nfwgwKFoomptRfUvp3966Milx5QG5Fkn
	0RIYkB68ie15ZAXwrzvEk9ZoyNTU1w2rYiIUqscHDmOVemogrQM4IoSUkjfrftTi
	q0+ZUlMpXiUgZ6Y503fUScF4XkAR7inxnzHIragKKjuNUXpuhfk2lW3QO8plWbk/
	UGKIXAFV0UP3PN31BPX0u/Pq6KMoFrCoTxSs6067IUDImCgai0XA5ZMVELxYPzT1
	lMdOYG99AiCwLbzfKziBzXg+bMDS9ej5ILKWoRYMtEzMV9rt5wTF8wjIaiyheI5X
	kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu99f18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:13 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso115015485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976153; x=1795580953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7289YXaM//7fO3vmjy0krlSMq7JNI/I55b1Tqrw8TVE=;
        b=SYZlEQmOh73L0F9rwoBDMxVf9/DNvCZMzrQGK/aJt/Sqjznm6G9wCBCmrL93SWhL9L
         fkELmNpHuE5a3RaaTma9CbpHNmAAkXJK1t7HQ0ANBHwlIDIA8jCl8kN/fFm7NCrB5lWK
         us+p+idA67FFVOZ2Amq1DU/yea+K/rkjsSIH2PymePVvJEClntvA695C5mWCqTmuuLrT
         Udxm44ET+rCvREaw6rkYiTPUB2H1RJ0d8zpLgHUaFGvrlsA1wXcqzoV5I5VfoXw7PiBl
         ++zVSKBSEQcZFZLMpRRXaKjGgcpUMX5qPa0bebj7w74xA7I/Wp3WlgRMFBLH4aw3SbPH
         Bwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976153; x=1795580953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7289YXaM//7fO3vmjy0krlSMq7JNI/I55b1Tqrw8TVE=;
        b=T/gLHjt2gVR/K+hlq3NhoYB3gDb17kDGdSDhy1neeas8VAif7WQUlP7RHRalYUdIZA
         QXRVz4CGNz4azUZ72TuUVYUowgom/WarYz6muh5fjnOTkm+LbU5XVojfJC6mvK0N2kBa
         ixp8eAgTvn+Maiiv0ARG5EXDiAajTqCUspvmyGIq1JM4ayBTtt/DUf/Abqoam3gTqXMY
         Kh0X3XUHOiJkyRT1jNIxzmVuoF7ogHlvUnQmwgAEOyorix4CpzQDql27KTCPTl7MANgm
         MKjQoJDr/6i6oOlWK0/bOz/5AvuFGFRny3gdlnNsJIeLEsvPMepCX+QGu19mSBoONLrt
         5zMg==
X-Forwarded-Encrypted: i=1; AL+hErEIwFIfVAeCVs+a13kaCdghKOmL99b70P9VNKOyrjDzRosJ0u66jHPN9lwZgI5Ihs5gPTuE0YaWpDEj4oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FPskBML2cYME2+TNx7PMfknLQSuZV3r15oSAg76eAs9QSb/Nl
	Hc4p6bLJ3Spf0fBKrVmY61uWrSCLpRETsA11PBlDa/Q1Cs5/ndAcFDCF9KYZgGaWXyNwl74hVYA
	PgxbSXIypQj031sKcLI6KaJ2MncRoLb85wKWWAqts7F2Z+XNTLxsqdCePufpCCg==
X-Gm-Gg: AYBFou2NIouI9m8o/TdIQobfrwVrPKpGsFUMUt67i3/UDHiijd9LTfNbEDnVCEe23oT
	ricCyKjOcwehT8qyfT52QsC/Zf6Vxr9xso6Od7BbctBZvMgkUNYwr72qJANprg/bPbW88Dxmur1
	fBzydh/ti2DeLOi7/1UJdIKO1YL5cMH4sXsPNomirZRi7P/a/oSwOdjrG6AimAOGmLWGZ7rRJQK
	rkyZ/CZFOcRUfbUgXvnvlOaPFTUB+h9OxrPL2Fwqsu59DGlTnA7S3TzKmqy8fGd7ixzLi8Folbu
	WS4TG3G/svWm9k/Ym7TyashjSkHci03TdDBp3R6Niw+PyIfClrOlwudC9EuxbdpkQ04YXKPjA4J
	gx0QGItNeKRbp9fdcGPa5yKX6aHyPrW/EL+pX3uNeR7N+58xg8ZYHeA2bTj711j5yGj/bA9DQCf
	Q2EldJoTzKBo9cTOr5Jw==
X-Received: by 2002:a05:620a:648c:b0:949:7118:47e3 with SMTP id af79cd13be357-949997ae5aamr287926385a.58.1794976153356;
        Tue, 17 Nov 2026 20:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:648c:b0:949:7118:47e3 with SMTP id af79cd13be357-949997ae5aamr287923485a.58.1794976152909;
        Tue, 17 Nov 2026 20:29:12 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:12 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:43 -0500
Subject: [PATCH v3 3/9] fs/proc/task_mmu: downgrade writable migration
 entries in PAGEMAP_SCAN write-protect
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
Message-Id: <20261117-uffd-state-fixes-v3-3-b617009d1a4a@columbia.edu>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
In-Reply-To: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Breno Leitao <leitao@debian.org>,
        stable@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=6398;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Z0rU5WQNPjJ3mHksKsJWDJfedbCcJMJetTMLG2vLB2w=;
 b=XRNKM1Ps7CsF2NIY2cPR/5N7gPAIoUgLViuopj/ZmKmBllYfk7tlQClC7AC3NNR5wpkG8MLS8
 LI2kMb+hAcEBcaRAuWV9rfWeSrlnYobKmxBRbHlHaNma8CQAC3tZJq7
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=S6FMU4sP c=1 sm=1 tr=0 ts=6afd2999 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=tHa68p0SAAAA:8
 a=lA3VTUfxpHkutY0wpvIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX8n32ulcOAXxL
 sv7F/MrbbXqdlA/8KUnBJaIIv3ahojpPNsAebokAtd6i29LG2BWYvDjrj3dtS2c1TS4836s0f45
 SoU/4DkaWtTb4F174Hzdx6ZbuySYguthoD0Btj6dj1nV/o55CYBiOQN1h5leCgMeWjnId1ZSmw9
 3mBfiu17aGHzLcmT1kTZNtP79sjMdZR/hEbqdPQC+9Ex1HclumoiE4SxS9BaziiUQ5vPyh+/f5I
 GsifceDiwRCEeNOXM+tt1sszVFy7H9C2yMDVI9ldIq9I1JBv/iBbcYGll44Km9HgdxqZ1MYdy7N
 iBfLLQVOsYeK5EBy+QpHMo/xgocsPZKmVlPxF/yRSDlr6sbmOBIoVWG5sUqXk2rJJuJyEslyK+f
 kAha9NViLKeRicoRHBWZfUgij/pIjfkWst5ZwCUU49TlAfYlmoCGpMEVfoHUo91/6bCKoFcnL+G
 TwCXZpkksCsQVl2DIJw==
X-Proofpoint-ORIG-GUID: ZITeZPhIe3qeITn6g4VNvFGU_c2HE4eU
X-Proofpoint-GUID: ZITeZPhIe3qeITn6g4VNvFGU_c2HE4eU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX8uQD9OW1DD+m
 qtPSsCzSYrHdZP4nzLI1FowH/99Ym0naNRSLHwZKZ9fietQW1a3x8rdjtFyMW9m0UM+QEoWX8gM
 j4X5RIK++rqhcpZktnphAUf+FuY037+7RyLNXqZRLnbyW8wij2gv
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=10
 spamscore=0 lowpriorityscore=10 priorityscore=1501 adultscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180017

PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects pages in a VMA
registered for async uffd-wp, and sets the uffd bit on non-present
entries as they are. An entry with the uffd bit set must not be
writable, so that the page is write-protected once it is mapped again.
change_protection() therefore downgrades writable migration and
device-private entries to readable ones first, but PAGEMAP_SCAN does
not.

For a writable migration entry at the PTE level,
remove_migration_pte() restores a writable PTE without the uffd bit. So
if a page is under migration while PAGEMAP_SCAN write-protects it, the
write protection is lost. A user tracking writes with async uffd-wp
sees the page reported as written on the next scan although nothing
wrote to it.

With CONFIG_PAGE_TABLE_CHECK, setting the uffd bit on a writable
non-present PTE or PMD also triggers a warning.

To fix it, downgrade writable migration and device-private entries
before setting the uffd bit, as change_protection() does, at the PTE,
PMD, and hugetlb levels.

Add softleaf_is_writable() and softleaf_mkreadable() to leafops.h for
the downgrade. The open-coded copies in change_protection() can be
converted to them separately.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Reported-by: Breno Leitao <leitao@debian.org>
Closes: https://lore.kernel.org/all/avNEgmvYdoukt6MS@gmail.com/
Cc: stable@vger.kernel.org
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/proc/task_mmu.c      | 40 +++++++++++++++++++++++++++++++++++---
 include/linux/leafops.h | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 22361607020d..0127bf9c3f77 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2395,6 +2395,25 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
 	return categories;
 }
 
+/*
+ * An armed entry must not come back writable, so downgrade a writable
+ * migration or device-private entry before giving it the bit, as
+ * change_softleaf_pte() does.
+ */
+static pte_t set_uffd_wp_softleaf_pte(pte_t pte)
+{
+	softleaf_t entry = softleaf_from_pte(pte);
+	pte_t newpte;
+
+	if (!softleaf_is_writable(entry))
+		return pte_swp_mkuffd(pte);
+
+	newpte = softleaf_to_pte(softleaf_mkreadable(entry));
+	if (pte_swp_soft_dirty(pte))
+		newpte = pte_swp_mksoft_dirty(newpte);
+	return pte_swp_mkuffd(newpte);
+}
+
 static void make_uffd_wp_pte(struct vm_area_struct *vma,
 			     unsigned long addr, pte_t *pte, pte_t ptent)
 {
@@ -2408,7 +2427,7 @@ static void make_uffd_wp_pte(struct vm_area_struct *vma,
 		set_pte_at(vma->vm_mm, addr, pte,
 			   make_pte_marker(PTE_MARKER_UFFD_WP));
 	} else {
-		ptent = pte_swp_mkuffd(ptent);
+		ptent = set_uffd_wp_softleaf_pte(ptent);
 		set_pte_at(vma->vm_mm, addr, pte, ptent);
 	}
 }
@@ -2467,6 +2486,21 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
 	return categories;
 }
 
+/* Same as set_uffd_wp_softleaf_pte(), for a PMD. */
+static pmd_t set_uffd_wp_softleaf_pmd(pmd_t pmd)
+{
+	softleaf_t entry = softleaf_from_pmd(pmd);
+	pmd_t newpmd;
+
+	if (!softleaf_is_writable(entry))
+		return pmd_swp_mkuffd(pmd);
+
+	newpmd = softleaf_to_pmd(softleaf_mkreadable(entry));
+	if (pmd_swp_soft_dirty(pmd))
+		newpmd = pmd_swp_mksoft_dirty(newpmd);
+	return pmd_swp_mkuffd(newpmd);
+}
+
 static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 			     unsigned long addr, pmd_t *pmdp)
 {
@@ -2477,7 +2511,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	} else if (pmd_is_migration_entry(pmd)) {
-		pmd = pmd_swp_mkuffd(pmd);
+		pmd = set_uffd_wp_softleaf_pmd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
 }
@@ -2547,7 +2581,7 @@ static void make_uffd_wp_huge_pte(struct vm_area_struct *vma,
 
 	if (softleaf_is_migration(entry)) {
 		set_huge_pte_at(vma->vm_mm, addr, ptep,
-				pte_swp_mkuffd(ptent), psize);
+				set_uffd_wp_softleaf_pte(ptent), psize);
 	} else {
 		pte_t old_pte, new_pte;
 
diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 4c1476ae3234..4c016fc28690 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -434,6 +434,57 @@ static inline struct folio *softleaf_to_folio(softleaf_t entry)
 	return folio;
 }
 
+/**
+ * softleaf_is_writable() - Is this leaf entry writable?
+ * @entry: Leaf entry.
+ *
+ * Returns: true for a writable migration or device private entry.
+ */
+static inline bool softleaf_is_writable(softleaf_t entry)
+{
+	return softleaf_is_migration_write(entry) ||
+	       softleaf_is_device_private_write(entry);
+}
+
+/**
+ * softleaf_migration_mkreadable() - Downgrade a writable migration entry to a
+ * readable one.
+ * @entry: Leaf entry, softleaf_is_migration_write(@entry) must return true.
+ *
+ * Returns: A readable migration entry for the same PFN, which is exclusive if
+ * the folio is anonymous.
+ */
+static inline softleaf_t softleaf_migration_mkreadable(softleaf_t entry)
+{
+	const pgoff_t offset = swp_offset(entry);
+
+	VM_WARN_ON_ONCE(!softleaf_is_migration_write(entry));
+
+	/* A writable anon migration entry implies AnonExclusive. */
+	if (folio_test_anon(softleaf_to_folio(entry)))
+		return make_readable_exclusive_migration_entry(offset);
+	return make_readable_migration_entry(offset);
+}
+
+/**
+ * softleaf_mkreadable() - Downgrade a writable leaf entry to a readable one.
+ * @entry: Leaf entry.
+ *
+ * Returns: A readable entry if @entry is a writable migration or device
+ * private entry, otherwise @entry unchanged.
+ */
+static inline softleaf_t softleaf_mkreadable(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_DEVICE_PRIVATE_WRITE:
+		return make_readable_device_private_entry(swp_offset(entry));
+	case SOFTLEAF_MIGRATION_WRITE:
+		return softleaf_migration_mkreadable(entry);
+	default:
+		return entry;
+	}
+}
+
 /**
  * softleaf_is_poison_marker() - Is this leaf entry a poison marker?
  * @entry: Leaf entry.

-- 
2.39.5

