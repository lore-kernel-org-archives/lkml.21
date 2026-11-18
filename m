Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976164;
	b=kMzlJtn+Ic8/AaF8CavpjDtIKj8/WEtecUuI2P2GghDDlr+ApD80eEJmqAXB2EzflnFa
	 volFzQxZWfmw/IroXuRtSpD8lz9zmiDUgfSNDOREzIUnGLWg6ipxPA2e/EmHmXbjRUgWe
	 wCei2oK9PJcJZo4MRPkgYtaUMpZUPMTaii34SGMh9vNfbIFfghwOvh9vG/FQ/LBhHVrDP
	 JCl6hmQbGSpURDXKu771S82rjUV18Qsh9nwR+IVo7gH0CsnCun5jX/Zw3hjwh8rvuelQY
	 +un0lxkRuEAsKZgqhlBn2U/mau+Cr4dngBaYwGDwyh3HhEQDLIKPqAdP1aYxYFRDFKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i5zpFBIp+1LdT2GGZLD5EjnwLjNrouTOus3Kut6TC8c=;
	b=Ny1hAs6wD9mrZz79v1zSC+CBeahrRShF3r2uh8flvI8rZUCecOt9qj6/WxkRyal29EZb
	 o4oNxh3a2dXwPNcnvbx9OuRyzV6CivxKk6cr88vB27QOe5Tn/TZ6HjT//jxHJljc1GtfZ
	 kblYR+h6HIy3ekhignijwGIj++/v8Lis4z9Nbe/Xv+gO89hPsN72uBFARkjFBXFiejdS6
	 XXyL56SxAgjTodqKcE1x6uEcdsNSqqSYCRxrOi6GG6QLCcoTdRgveisLJBNl7PaVa2CQS
	 GI1LVZp7UR1cIUM9/E6sagfqyvNoCDu2iNwoXoZiabZmo4cnaHehYEYCNgwyjAq4sAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ifCaGtTp;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=yUZUNM85;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1F60A3820
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA1F60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=ifCaGtTp;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=yUZUNM85
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1XpFC465991
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=i5zp
	FBIp+1LdT2GGZLD5EjnwLjNrouTOus3Kut6TC8c=; b=ifCaGtTp+RHPKmxjiwYp
	EhQqRIfb8+M4e/v9xIOPeSPRLvrH6ccqH/QNbR5MXC0mG2x2/ZQml4DTHdtqMm6G
	EnyUsKTHmA+jYG+kmv2zphD/5Qnaz5S7sd1SPPkFKG6J6Urpsyd1kI/FBRP/KjS+
	ZTdBbzic85Gnqwst3K67EvTlgRIAkXAieYWf+WRTQ7f85JXSFZ3GGJT4AoZbf4w4
	QQc+ElIVfaNenz2v8OIodjgk76SpCThp6OCF4C3kHZI11dzm8sLwTYXlO4QvNuve
	z99CdSGJlN7fVewyRMoNqh2J92GGgpSCEG6PCSuHq4nacnXY2iZ1fBiG638z5Sjt
	EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu61g6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:22 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso116466485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976162; x=1795580962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5zpFBIp+1LdT2GGZLD5EjnwLjNrouTOus3Kut6TC8c=;
        b=yUZUNM85r2tCDggczEfG4xe66I1cC3EPCoUfUTMZ9R7+FgejdMLhd1epB/y7sF23vQ
         o7dej7Mi7yIPEQc/VWEUTDsBMSGyQzJ2ButuQV7RZ+Wq1fSrSZ84+N0mZpRyB0/yh0g6
         gB8gdU0PsseXNTd9iMxumGPzL+S27qitd1Gy/y1VJTF9/Hpxx2Shd1+o9WDiRN2I9fWn
         PXFC3JnngpyLbn2+2PWeEYsknbOpB3RlWe4vGQ4J/pCnJU+OK3VH6Hs3y9TdVXWRYliy
         yLfNE9vKpU53A0VA2PITEqnzWd9m9MXm90+uMkwYtLUz/SkK7o5SEc0mnk62npMtxg1D
         bEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976162; x=1795580962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5zpFBIp+1LdT2GGZLD5EjnwLjNrouTOus3Kut6TC8c=;
        b=jq6D+QwE++5ObvjScTJuybNIri1Ew37974W7ZXCODz5/AhqBDJf5rCvuOt+urhpW+5
         Bo5LapQuQsYt8PiSOAdBcHDgjcfvtXw1s8IAF+VWbJNoPuSEbVTBYvq0gmX+oC0H/hiU
         kLA9hlj/s4pGrqzOS7LA8EqX8LkxU3tChee62xbdjXOCPronzaF6qvEUwdbvguocr+ks
         D8wLdODT/RyV14bPq5eipBGoD0B1n4vkvtOA5WBhPdtlye0XeIY84OPEecOoPxzZdVE9
         GuCge0EuOlGLN2p2ijWGxTuoY4FURnXCgHSUoRNCR+r6Tvquz1bRKzZKuxWkcgB57UDU
         sctQ==
X-Forwarded-Encrypted: i=1; AL+hErE1HtCbuCC9Tmd/3OQsGLyQm+xTmm0W/IiECcKfrjGFnwOnoR0cMduleN55N6itzhGtt+j44pPM4r6zlE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JwiKmicS8LKBMmiIPmN/o7P6CRqEJC8D6eBf/Kude+EQbpHDO
	DBQ36CuOBiGLEXPsYRI0SwfQkn4ld8pFZCtCvmqjPhMbA/9CpV4/eKEE6WuUBTmeqQZDQS/PRVa
	+BlFOS6MZTC6f4QHBKP/b80kuLGSZV2QEFlez4S91OPusW0nWwQuvBNo5G80RFw==
X-Gm-Gg: AYBFou2AZWc1bucCo/Uo26fIjWXqbBeLQv8yVIvytvEWxmFeAZrwCm9IvyJgUpkw1tr
	yWuWHQ5TTLBrqfeGL/ttUmRRmulzXp2xw/kE+6OXHJkFl3eBD4HyqiNvg4UHL+o8qaiDDPODCx1
	rF0Val7SKCmXjzSdc12Iq3bzgqaWMsh9+DtYbTgYeWYqgKFr+KU6c/IFqTcAYwAts0J0xluAibr
	ZoRZaeCdjtHzhg6i5HXSzCYOvyTRreYWYKWLDyMCVOzvCYBo1ymt1y5OcuWYfgwGtxqbQEL0Apa
	zaISHDPH1zaNML/ODdeWgglMpL5W6ROggr3fBZgWelYyeWQiYlJB10+Ssrx2gzYp/WlaMCmgX/U
	18Rji+ge3PAd86o5MFc/J0VXo/5q/XZH/+khJeQtnEzp4RlaMVbjRYN3QAkGX9Oi7bNYy8RONY2
	lH9GLULT2Uv9Be4MigHQ==
X-Received: by 2002:a05:620a:2906:b0:945:fcd7:7823 with SMTP id af79cd13be357-949995ee5bdmr310934785a.63.1794976162000;
        Tue, 17 Nov 2026 20:29:22 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:945:fcd7:7823 with SMTP id af79cd13be357-949995ee5bdmr310928285a.63.1794976161125;
        Tue, 17 Nov 2026 20:29:21 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:20 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:49 -0500
Subject: [PATCH v3 9/9] mm/userfaultfd: check the hugetlb alignment of
 every VMA in the pre-scan
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
Message-Id: <20261117-uffd-state-fixes-v3-9-b617009d1a4a@columbia.edu>
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
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=4876;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=EAxjBdGKjmNBZwoH8jlh/pcqgFCSerjkNK/wjow3uGE=;
 b=KUR+7ad8tDe+EylRan8+qSxOeisLzBXY9hPHmeOwVFnG4dxe7Ag2XQ64KOhMu4e5hqw3d5kCe
 +LFkOdORmnhCXD+Pe/H5JBozZJ60NMLg61evwFPO4+4kCv/tJJ5n0m1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6afd29a2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=sktC-jyAyf29sAdH:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=Qm0qsxP7aFY2tkT6R2MF:22 a=VwQbUJbxAAAA:8 a=9qlVvB6YTzTb8WvwRWkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX75jRnvYbdYE+
 8HL5p7AE0TbV2knnf1fxmGz3Ps6b5vQEFOFpQJxAagVE6RxweugZN4dbLVU/kXxFm0211kYQEL6
 sNRNCTaItvqx4/JEPS4NDjfLSUgVyWuR3ndkzzn6FkSQeP+8MpHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX1TPaT1JPkE8p
 zg/txZcZh2eMGoSCWhqtmZVZZL6tTtq5h8eFxRtnZUpkWkTpz0Op88hrrtQt3x264yLl87LCZWN
 GrAgMT0KeBOeRyTyj3EDFVFmtc4ZaO5OYqo9jEIMpBFLnebZ2X2iOYIuNGoCJcPOV2Hjc1yIEjI
 68hu5bRcQ6hvfLUY6fik9NaGgvit2UQMNdz6TOuD9Zqlwwj0Z01QxNiv1LtT3/C7OLh49anFva9
 2CR/F5eK8Q294R72PhccHGNVWAhu9ZpkMDXU0sbcjcWJXpzIFSr+4DU/TGLV4JGo3/rNtN9x5T1
 dl1DR41rk2M0pxBbltE7vRe63LE4VHfC4/WfWfVVBEwV0gEDHb2kf3y8P6VZXIQz/NDbQMNp1kr
 xMXDuXf9uyADZmTdf1LER9CBVWLZhnZ2J36CLxiWGIKNchrfKDOenODWvVk0kLH29fdQ4MOws1L
 dscYy+FweGVAp5DkR3w==
X-Proofpoint-GUID: XZa7RB0OxZA1Hx8VeaiPA5Xil4HW84Ko
X-Proofpoint-ORIG-GUID: XZa7RB0OxZA1Hx8VeaiPA5Xil4HW84Ko
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=10
 clxscore=1015 priorityscore=1501 impostorscore=10 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180017

UFFDIO_REGISTER and UFFDIO_UNREGISTER both scan the VMAs of the range
before changing anything. For a hugetlb VMA, userfaultfd_register()
rejects a range whose start or end is not huge page aligned there.
However, userfaultfd_unregister() only checks the start.

An unaligned end only fails later, when vma_modify_flags_uffd() cannot
split the VMA there. At that point, userfaultfd_clear_vma() already
cleared the WP or RWP protection. The ioctl returns -EINVAL and the VMA
stays registered, but accesses to its pages are no longer reported. This
requires a caller passing a misaligned range.

To fix it, move the alignment checks into vma_uffd_range_aligned() and
call it for every VMA in the pre-scan of both ioctls. UFFDIO_UNREGISTER
still returns -EINVAL for such a range, but no longer unregisters the
VMAs before the misaligned one first.

Checking every VMA the same way also changes the following:

- UFFDIO_UNREGISTER now returns -EINVAL if the end is not huge page
  aligned in a hugetlb VMA that is not registered. It used to skip that
  VMA and succeed.

- Both ioctls now accept a start that is not huge page aligned if it is
  not inside any VMA and the first VMA of the range is a hugetlb one.
  They used to return -EINVAL, although such a range covers that VMA
  from its start, which is always huge page aligned.

- UFFDIO_REGISTER now returns -EINVAL rather than -EPERM if the end is
  not huge page aligned in a hugetlb VMA without VM_MAYWRITE.

Fixes: cab350afcbc9 ("userfaultfd: hugetlbfs: allow registration of ranges containing huge pages")
Fixes: f369b07c8614 ("mm/uffd: reset write protection when unregister with wp-mode")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/userfaultfd.c | 54 ++++++++++++++++++------------------------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index ada841a9cb2a..b80bcc1e03d0 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -3692,6 +3692,20 @@ static __always_inline int validate_range(struct mm_struct *mm,
 	return validate_unaligned_range(mm, start, len);
 }
 
+static bool vma_uffd_range_aligned(struct vm_area_struct *vma,
+				   unsigned long start, unsigned long end)
+{
+	unsigned long size;
+
+	if (!vma_is_hugetlb(vma))
+		return true;
+
+	/* A hugetlb VMA can only be split at a huge page boundary. */
+	size = huge_page_size(hstate_vma(vma));
+	return IS_ALIGNED(max(start, vma->vm_start), size) &&
+	       IS_ALIGNED(min(end, vma->vm_end), size);
+}
+
 static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 				unsigned long arg)
 {
@@ -3770,17 +3784,6 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 	if (!vma)
 		goto out_unlock;
 
-	/*
-	 * If the first vma contains huge pages, make sure start address
-	 * is aligned to huge page size.
-	 */
-	if (vma_is_hugetlb(vma)) {
-		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
-
-		if (start & (vma_hpagesize - 1))
-			goto out_unlock;
-	}
-
 	/*
 	 * Search for not compatible vmas.
 	 */
@@ -3797,6 +3800,8 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 		ret = -EINVAL;
 		if (!vma_can_userfault(cur, vm_flags, wp_async))
 			goto out_unlock;
+		if (!vma_uffd_range_aligned(cur, start, end))
+			goto out_unlock;
 
 		/*
 		 * RWP uses protnone as an access-tracking marker. PROT_NONE
@@ -3820,20 +3825,6 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 		ret = -EPERM;
 		if (unlikely(!(cur->vm_flags & VM_MAYWRITE)))
 			goto out_unlock;
-
-		/*
-		 * If this vma contains ending address, and huge pages
-		 * check alignment.
-		 */
-		if (vma_is_hugetlb(cur) && end <= cur->vm_end &&
-		    end > cur->vm_start) {
-			unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
-
-			ret = -EINVAL;
-
-			if (end & (vma_hpagesize - 1))
-				goto out_unlock;
-		}
 		if ((vm_flags & VM_UFFD_WP) && !(cur->vm_flags & VM_MAYWRITE))
 			goto out_unlock;
 
@@ -3943,17 +3934,6 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 	if (!vma)
 		goto out_unlock;
 
-	/*
-	 * If the first vma contains huge pages, make sure start address
-	 * is aligned to huge page size.
-	 */
-	if (vma_is_hugetlb(vma)) {
-		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
-
-		if (start & (vma_hpagesize - 1))
-			goto out_unlock;
-	}
-
 	/*
 	 * Search for not compatible vmas.
 	 */
@@ -3982,6 +3962,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		 */
 		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
 			goto out_unlock;
+		if (!vma_uffd_range_aligned(cur, start, end))
+			goto out_unlock;
 
 		found = true;
 	} for_each_vma_range(vmi, cur, end);

-- 
2.39.5

