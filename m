Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976161;
	b=MumuYMoarHHTreO744zbUzCqxRFBUatiKgIRcpXpyTqCFhEjb+WhIElC9Z+00/X3XLL7
	 n9kfajMaqgKWxCrdKHBAL4+JNuf1VM3loI9Wr/8KnVzzpFxZacT0oKoRn1IMbKsDgr7G3
	 Ii24Obwg1UBPH+2IrT3VC2IHW/aeW06qxAGORVyK4c8pf8vpASGP057bVXuHW8UZsoXag
	 ImsBTHRVNTa7AO9CdLcympRlLYSy1oFMbtU14p8zP7zNwPYYEybN6P8LCl9uhnfl/R39x
	 e3yKOaY9VJaLvVHb/eUJVctPheJlV4L40HtbUfoeJzX8yN4/J/CA77Vs6GpvyivWaFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HgXEz4EEUSF3chOzr46ucSIK2kqpqdPsjmd0V+NKYGo=;
	b=vnPFkQLY88MIZJiLVef77awec+JBQCJsfS6bOlMsfOUBN2grnUWH01BQpZHvTog3MEcf
	 sT8CsW90U9KJ0wWHb2+NHAMQI0Ncr+R6p69f+iiNr3b1k/FWXtvtiTvnZk1Mm7OThcJBq
	 jeVW6q+YIwpYMRXaWxAx8iSLRsjqPyO1JdDIzzQpyMuwjQYXK72065t5GHPlHQvqzgyeS
	 JTFwoqUxBnbx2DHxKJyW55lwE7hBOHqM86zM/gjRuwfjJfTt7BUdM5W88Lj21U34BHBHw
	 7mfipCUcmSfe1krK9jJ9QHZg5hfeOmdN3QfpWFt8zYkYztjUIkWqG2Eke4zz0biFXuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=UWX+cXEQ;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=hGU47FrT;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E7360A2603
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E7360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=UWX+cXEQ;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=hGU47FrT
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1XiAS3280512
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HgXE
	z4EEUSF3chOzr46ucSIK2kqpqdPsjmd0V+NKYGo=; b=UWX+cXEQpyyGP4xDyBvZ
	qX1ZB/APqCUrs26COMPtlfXk5V7PDsB89t5hQD4138KeHj59e0sEZyKi6XsGS1On
	wD9MWPNjDCxZMR/AiC6hHAyxIZfartyrp7LzGcRCeSkS2I+5GikHUepeCyoUAUCx
	mBkvLFAb2VUbSOqBYsZs5iUbkJwVxXyy32wrbC+cWVHiQt74c7g+LjfK/n+OWT8k
	JjZ6TSCS2R27FzKdniSORbwRQxlVsqbQvw0phyc0+rPPBRYuvE3PrTfTyIwRpPNx
	3mefc/U2j0+vcmQyiZBU/wc5qyiumLwD8Lym/PE5v+8ks3mgBWVTVgqjNmQ2CE5j
	NA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu6sga0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:19 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so121135185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976159; x=1795580959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgXEz4EEUSF3chOzr46ucSIK2kqpqdPsjmd0V+NKYGo=;
        b=hGU47FrTcGz8/ilrGN7RgezYFrsppw+/Any0sByCpRNB72SpWieOCuSPv2CxZIkoIV
         GT1FhPUhBi9VWHVn3rkQXSYtkiBcYc6pjPuE97VKr6w53J1BPF76xNndhKUpfizZfvbU
         EgI528C1yOXvoKeFXy2bqotU8OSbAqOfizE53rAlzQyG9A42uN3MpshUW69BNW7ljjtf
         gIBfEXfzII69w/Mge12DCSDm5OaMIKkKXF8w4seC3NnOcOlzpatrwu7dFw932UVRFy5v
         96WmXkmiWtBlHIQOZoyf6AsSYU/lj8JECKy4x9k154g/iV6POepT1Rdp/7N7vdTQihKv
         bTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976159; x=1795580959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgXEz4EEUSF3chOzr46ucSIK2kqpqdPsjmd0V+NKYGo=;
        b=1U276alsZsFVMxl1gJI9myaLQbDNpd6WQ7bb/2GFz4BNrTJrMb7BMmcNJFDpEZ5iDm
         10+EQTRtrriInXme0vanKH9ZDJQx+tFyWhtEoMROlcyoYIHOQAj+iR74X1DHiiJuobS3
         HcqMBpAA8sLjqcdqnCk6H9fLWWr01mxLc4zsCIec0tbmc/CV4Cs9cj6I5XewJwQu7sqN
         sV5POtM+U08Z+WBSq3oULfeSomHbmQEtkMWTWSJ5YmkbvfZCiwm2dLEZaS2Y7L8pm522
         kvltRfj+DZ2ZDV5zsDaTST2kVRZVC7x7cVhqGlfK5P4VydHn8uw75Rh/ALQJyztvep+1
         gbcw==
X-Forwarded-Encrypted: i=1; AL+hErEgkNAE4in8Uo/Z1EVtdvzBED5fJLZzdr7fQrx+zeg1Se1qGe2PzADtyu4eU5tpbMxN3J1vvmWDErQGttc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DY58dlqARlPfQK2k89JeaDhUikipWdK+YJif4/xPX+GlbKlH+
	7w0aH+8alwRNONX4qXYdt6/A8b7bRLIvBlj22ZOY7ztNvxJ1y4tIXByZXQipuzj9wGLSbEPqt64
	u3zvsj8mYY+xuuzD3jskNm5murTzYWyL6SHGiXX45L8LhKaNZA39tAFUBbfQfjA==
X-Gm-Gg: AYBFou1PcAt+ZNtkCUpPGw7sTjTOkLznl8qj3AnCo1b9sGzj5pWCvEqGjqBNgOsyPLb
	vfLFkT9yISFdLxq2bE/FS+6e0KQ8s+frNK/TQxsKlK7nSp0oCiTmJF5vQ8u8M8kQOP2iYseC5Js
	KTyrAbMfF9bZsnSQh0xi6RnIRcuhn25ov8YSkWCknYdTo7LT9eRQGRx2CMwz7VVTYi+T1Vow3rw
	npVkIP7Gm6Ov4T2TSoDa4yq7TMnOMk9Z4RGGLFN7OJxN3SjDNExtf252bRwaB4e7ae7gMFPqL6n
	fAxVoKk1erAdVg7P6egPpFEzbkuTPxeCY4AhUthsAlagvjQGUcRvdxF7Qc0ODnkqBkWzdcx906L
	XuKuPF61MBVsUte0PZhG/Bh+i7200x9KTZrsFdF9hsDPnp6QqdFu8qt+zDoV0QAu2sTGXu9lL8A
	S9svod/rJXkmixa4I/VA==
X-Received: by 2002:a05:620a:262a:b0:949:75f1:e5fe with SMTP id af79cd13be357-9499962bba7mr272720685a.73.1794976158651;
        Tue, 17 Nov 2026 20:29:18 -0800 (PST)
X-Received: by 2002:a05:620a:262a:b0:949:75f1:e5fe with SMTP id af79cd13be357-9499962bba7mr272718885a.73.1794976158229;
        Tue, 17 Nov 2026 20:29:18 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:17 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:47 -0500
Subject: [PATCH v3 7/9] mm/mremap: resolve uffd state when the context is
 dropped, not during the move
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
Message-Id: <20261117-uffd-state-fixes-v3-7-b617009d1a4a@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=8609;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=b8KcwT4NcH+jLWQ8CssF6BrCCWtvjmBXZMyQ5uv2afg=;
 b=TV3Rmxo28It39xV50wxFOJ9bcVl2vqG3UXWrYKJoVYvCGv6FoZvZnUL6te/z7WqOI/UKBBZOU
 y55fKXTbvSKCAUzDcKn3oRTzcYMIf0ecqqoaK1H9HLRfxEdLg4eGFSB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXwytzgL6J64LX
 DIVxy0VIU8Ei4mtJy+vlMYYor/73LWkLGUn2mj3607W0WTtS4zj5tdJbo7rPETypbz1ErDFxVGL
 PBfj1IGEL54bjnjMmAEL84pqq8Vvn1CTJSOrSB0RaoBiBnl7fv68a4OuyraMlGYNto0Es5A3cJ4
 ONKMBnW6i8YlXH0dnEA53I9MMFl22whS3Zzp48WeTK2BU0YQsirf35axDWHalktPAStQSZlQgNl
 r5KSj5LSB+ET5ftZCF5q0lUv94+gkfwDaYLbWtLtrATv0U5iB++EmSh/T+8Fr0e6GchOW10XH6z
 kOl45X2IUkkRIcg2n12rzeK4BCQR8//ZCfZtrPDLO6ZAskR53uklXuJxD+9IHiHfdJYmtNx1zYe
 P4ghVP5np87WMz33MitJP1f6REEMAb9Ct+jUadG7cwks/t7V8ugqb23vd3AjcfjSBPBi0APVAiW
 HeyvXOrzdiC3vDqBLMA==
X-Proofpoint-GUID: rPyp7VTpTFrYYWwbLBsb1nA92t6UVUV5
X-Proofpoint-ORIG-GUID: rPyp7VTpTFrYYWwbLBsb1nA92t6UVUV5
X-Authority-Analysis: v=2.4 cv=ZIJCCn7b c=1 sm=1 tr=0 ts=6afd299f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=FFitksWucw0zMzmll4cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX+w+cDEcZBkmw
 f2Fk2Z8V8v7piP8I2fah+W2i4BG/7SMxNHoJ55Pm96TeGXst0vCtRHIiSnMws1blVwKO6if3Faf
 iGaubPBsPw3EzrV8pINXgQfH26/ldVjYOuXSvoe9m3w9nHY65eYs
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=10 clxscore=1015 lowpriorityscore=10
 priorityscore=1501 malwarescore=0 impostorscore=10 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017

Without UFFD_FEATURE_EVENT_REMAP, the new VMA of an mremap() is not
registered with userfaultfd, so the uffd state of its entries is cleared
while they are moved. If the move fails halfway, the entries are moved
back into the old VMA, which is still registered, without their uffd
state. Writes and accesses to them are then no longer reported.

To fix it, leave the entries alone during the move and clear the uffd
state of the new VMA in mremap_userfaultfd_prep(), right before dropping
the context, like unregistering does. This walks the page tables of the
new VMA a second time.

This is done with userfaultfd_clear_ptes(), which also makes the PTEs
writable again where that is safe. That removes a spurious write fault
per protected page on private anonymous memory, but adds spurious write
faults on shmem and hugetlb, as change_protection() makes writable pages
that were never protected read-only. UFFDIO_UNREGISTER and
UFFDIO_WRITEPROTECT already behave this way. This will be fixed in
change_protection() separately.

The entries no longer need per-entry handling during the move, so drop
uffd_supports_page_table_move() and clear_uffd_wp_pmd(). Whole page
tables of these VMAs can be moved again.

Fixes: 0cef0bb836e3 ("mm: clear uffd-wp PTE/PMD state on mremap()")
Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 25 -------------------------
 mm/hugetlb.c     | 27 +--------------------------
 mm/mremap.c      | 46 +---------------------------------------------
 mm/userfaultfd.c |  1 +
 4 files changed, 3 insertions(+), 96 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bb7fe695a615..13050a5c0c0f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2616,18 +2616,6 @@ static pmd_t move_soft_dirty_pmd(pmd_t pmd)
 	return pmd;
 }
 
-static pmd_t clear_uffd_wp_pmd(pmd_t pmd)
-{
-	if (pmd_none(pmd))
-		return pmd;
-	if (pmd_present(pmd))
-		pmd = pmd_clear_uffd(pmd);
-	else
-		pmd = pmd_swp_clear_uffd(pmd);
-
-	return pmd;
-}
-
 bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
 {
@@ -2663,19 +2651,6 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
 		}
 		pmd = move_soft_dirty_pmd(pmd);
-		if (vma_has_uffd_without_event_remap(vma)) {
-			/*
-			 * See __copy_present_ptes(): normalise the RWP marker
-			 * so the destination starts accessible instead of
-			 * taking a numa-hinting fault on first access. Only the
-			 * marker (protnone + uffd) needs it; leave other present
-			 * PMDs in the VMA untouched.
-			 */
-			if (pmd_present(pmd) && userfaultfd_rwp(vma) &&
-			    pmd_uffd(pmd))
-				pmd = pmd_modify(pmd, vma->vm_page_prot);
-			pmd = clear_uffd_wp_pmd(pmd);
-		}
 		set_pmd_at(mm, new_addr, new_pmd, pmd);
 		if (force_flush)
 			flush_pmd_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3b7b94012c01..c3d4fdd56647 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5245,7 +5245,6 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 			  unsigned long new_addr, pte_t *src_pte, pte_t *dst_pte,
 			  unsigned long sz)
 {
-	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct hstate *h = hstate_vma(vma);
 	struct mm_struct *mm = vma->vm_mm;
 	spinlock_t *src_ptl, *dst_ptl;
@@ -5256,31 +5255,7 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 	double_pt_lock(dst_ptl, src_ptl);
 
 	pte = huge_ptep_get_and_clear(mm, old_addr, src_pte, sz);
-
-	if (need_clear_uffd_wp && pte_is_uffd_wp_marker(pte)) {
-		huge_pte_clear(mm, new_addr, dst_pte, sz);
-	} else {
-		if (need_clear_uffd_wp) {
-			if (pte_present(pte)) {
-				/*
-				 * See __copy_present_ptes(): normalise the RWP
-				 * marker so the destination starts accessible
-				 * instead of taking a numa-hinting fault on
-				 * first access. Only the marker (protnone + uffd)
-				 * needs it; leave other present PTEs untouched.
-				 */
-				if (userfaultfd_rwp(vma) && huge_pte_uffd(pte)) {
-					pte = huge_pte_modify(pte, vma->vm_page_prot);
-					pte = arch_make_huge_pte(pte, huge_page_shift(h),
-								 vma->vm_flags);
-				}
-				pte = huge_pte_clear_uffd(pte);
-			} else {
-				pte = pte_swp_clear_uffd(pte);
-			}
-		}
-		set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
-	}
+	set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
 
 	double_pt_unlock(dst_ptl, src_ptl);
 }
diff --git a/mm/mremap.c b/mm/mremap.c
index fff0465f5e06..4564416a6994 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -198,7 +198,6 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
 {
 	struct vm_area_struct *vma = pmc->old;
-	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t *old_ptep, *new_ptep;
 	pte_t old_pte, pte;
@@ -290,27 +289,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
 		pte = get_and_clear_ptes(mm, old_addr, old_ptep, nr_ptes);
 		pte = move_pte(pte, old_addr, new_addr);
 		pte = move_soft_dirty_pte(pte);
-
-		if (need_clear_uffd_wp && pte_is_uffd_wp_marker(pte))
-			pte_clear(mm, new_addr, new_ptep);
-		else {
-			if (need_clear_uffd_wp) {
-				if (pte_present(pte)) {
-					/*
-					 * See __copy_present_ptes(): normalise
-					 * RWP PTEs so the destination starts
-					 * accessible instead of taking a
-					 * numa-hinting fault on first access.
-					 */
-					if (userfaultfd_rwp(vma) && pte_uffd(pte))
-						pte = pte_modify(pte, vma->vm_page_prot);
-					pte = pte_clear_uffd(pte);
-				} else {
-					pte = pte_swp_clear_uffd(pte);
-				}
-			}
-			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
-		}
+		set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
 	}
 
 	lazy_mmu_mode_disable();
@@ -334,25 +313,6 @@ static inline bool arch_supports_page_table_move(void)
 }
 #endif
 
-static inline bool uffd_supports_page_table_move(struct pagetable_move_control *pmc)
-{
-	/*
-	 * If we are moving a VMA that has uffd-wp registered but with
-	 * remap events disabled (new VMA will not be registered with uffd), we
-	 * need to ensure that the uffd-wp state is cleared from all pgtables.
-	 * This means recursing into lower page tables in move_page_tables().
-	 *
-	 * We might get called with VMAs reversed when recovering from a
-	 * failed page table move. In that case, the
-	 * "old"-but-actually-"originally new" VMA during recovery will not have
-	 * a uffd context. Recursing into lower page tables during the original
-	 * move but not during the recovery move will cause trouble, because we
-	 * run into already-existing page tables. So check both VMAs.
-	 */
-	return !vma_has_uffd_without_event_remap(pmc->old) &&
-	       !vma_has_uffd_without_event_remap(pmc->new);
-}
-
 #ifdef CONFIG_HAVE_MOVE_PMD
 static bool move_normal_pmd(struct pagetable_move_control *pmc,
 			pmd_t *old_pmd, pmd_t *new_pmd)
@@ -365,8 +325,6 @@ static bool move_normal_pmd(struct pagetable_move_control *pmc,
 
 	if (!arch_supports_page_table_move())
 		return false;
-	if (!uffd_supports_page_table_move(pmc))
-		return false;
 	/*
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have released it.
@@ -434,8 +392,6 @@ static bool move_normal_pud(struct pagetable_move_control *pmc,
 
 	if (!arch_supports_page_table_move())
 		return false;
-	if (!uffd_supports_page_table_move(pmc))
-		return false;
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 0435ceafe750..ada841a9cb2a 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -3161,6 +3161,7 @@ void mremap_userfaultfd_prep(struct vm_area_struct *vma,
 		up_write(&ctx->map_changing_lock);
 	} else {
 		/* Drop uffd context if remap feature not enabled */
+		userfaultfd_clear_ptes(vma, vma->vm_start, vma->vm_end);
 		userfaultfd_reset_ctx(vma);
 	}
 }

-- 
2.39.5

