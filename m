Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976159;
	b=LSfPc7OqzUzbrMeqwoyCAVgtjyaC1i877VFUV4z78uQgJ2Pot37mm7FUShY0LNVZbdXX
	 bPtteg9ucX+evIcHRh9kPjU8IriEXId1RGpyc40acLj6XTkvxjnZgdEmNRi9Vby/PM3Wt
	 WhLJZDAfJWTVeKlQR64MuEhbNe58bpP6arvMalce3FxC1YCQCWVga98IhOjTlpwJaYzPY
	 PcLpZGHDm6Wo3olmufCGUEJwWAL1mH92ATQG0uImjRsR/ErDJsgcb5LDZFT3Qjb/L/kxw
	 Hzy4dTyZm6Sr+4+fNA1IcUh1FkIQOXpcfdSMZFsz1w9zgf4Lg7gMpnKBs7Op9ZxJ7fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rc5CZiGD7tyh48F4lxL78ysIlC6P7Il9CJaGLWhqpm8=;
	b=iuLC/bHho/fZColS6xUDRDT3VxH1BAGDzUWJMIYSEEqaNaE90Ws3UnA7BSpej1E5HgJ8
	 LIIVx4/UpJ9JByyxvQukG/w01vLvml7iS/IF547WGfnx6Y6rGki2vhKSTCLkL8/F8frZr
	 VT6cDBWfS1Anz/VVnRRceVGEuXvri0IVplhuNHURado0WQ8d52+i0hLeU4KIQTocD15sY
	 mtUn4E9+kPqTrDMAwygLmT/FzWsgI/jhWGfaXz7IvtPYa1WsPTZEbg4ejhAsq34KAfBc6
	 p7pFJ2eSsBu2oX6Nud0Z7YxPXadwhIp30ZNyWKz/b/B+qC3O7eR2Z2NL01/mGmmyTWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Z2b5fLvD;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=njcqTyhs;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0A606A8A5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C0A606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Z2b5fLvD;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=njcqTyhs
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1Xi1o3280517
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=rc5C
	ZiGD7tyh48F4lxL78ysIlC6P7Il9CJaGLWhqpm8=; b=Z2b5fLvDdtaRtLT5sxpo
	rB8Si0+hsuAxEnDqVRyAuE5KIbZhsldSqcxjM7VWUSDeVwwKZQUQwbxkS1zecQlu
	7oD7jcKcr3LqzTwFIXBIbSRPoxdXu9BXM4DjQ+uK1YVz+x/QOWe3Mr3sbpavw4A9
	uL9HQZzybTXLdYLC6BabHENLdt0O/t+tpsZxoHGIlTIK5xtqLe/2v6mz25D099Pw
	RjuBPlqQOjMLaiesL9biJ/pz+UscxZHNvJZLLgn5nJcPoPd9Z4Ba7pqzMKeflg//
	yJplaT2/E7DUKCyOkHJUtc1iIme3CggFz+sq7it6xunXRDF8wxjAfceYqn473RxW
	pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu6sg9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:18 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so80160285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976157; x=1795580957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc5CZiGD7tyh48F4lxL78ysIlC6P7Il9CJaGLWhqpm8=;
        b=njcqTyhs8jduMJDOCs70B5lGvti2Zl3/TtPhl72aQI6I2VPy08wDBkE1nOsAMnBB8t
         Yp4piQxtwrOLs9BB02IW6baOljEtOzceW0JJeGOGCbBZYtb75pq7JtP5avQib+ifprEM
         SRZ4w85CDYDMsHEDgMJXRl5uySW64/MIyz5moWM8ijvPBCk7pLRkqbO5vsv2aR/u5OJb
         +Ez07I6fGouxnQahmJ81VnbiDvvwTAa+5+0ZcTSmbFrA9KGJKYR4nMJDCdbZ9OYBo4qF
         RHsIk1aJsaILDiyIS+H8J2lUTpjL5AcsCCzFj/9mjh/rlYgIKj1S8/SfGFTPht31uPRM
         HkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976157; x=1795580957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc5CZiGD7tyh48F4lxL78ysIlC6P7Il9CJaGLWhqpm8=;
        b=e7J+BCaqoyEITLrUTbJBe0UADWf2OxXVQpDZnoqkHu4nd17WxM0zzWpY+vIyj1qIXL
         JABeUHxkl5ZdbtGGC1AlGVI4BZwidChVfZO4HzTlUa5NGmZ9GjgEj6s6YTThSWF3eNVk
         7i9ODycauOLHqg44cmSpZmvCT+ZWvAg4s1QnCpNd5n+sADPXtul0KzorUI5orqgee0sM
         3BzuL7dOmt7IueNVkH6kuGQAI91mIOsT9Tehc0Gthb4cBfd3bc5wKOzT5Zoesnxl6MFb
         ICZln1wmT3g3RXCBaYYqf/UNcjKZSHg7Xnx4tzjmmPm/XgbszVKTM+svKNO/Ghtv2QVH
         +VUw==
X-Forwarded-Encrypted: i=1; AL+hErFW1VQnktXCZrBeblwKU7+wIfHX9t6x7zPMPLx1PT0YAJInjV5+BgRqHx1pzKUPi3fkfEFzemnJ4grcIwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qaLChnMQ2LMeo/bwKTaSRAON0EuxjQtVHFIrgRwWr0pyDfIJU
	818U9FdMNKeG5e5nikmWyhA99Ihaii0l9cRxNr9qsH0k5KC6S/w3J9RmABjg9UqkPeDKoh7HGL0
	85038rXUTVFyWtwdj7Lb58/YLy0x2GMK39KDXZwuwFYTyNDb85AHzwtV53A3GUQ==
X-Gm-Gg: AYBFou1oH3fscfgp+npY2pS9WbnDu/f6VUlojRjQweK4Gja8nCO6fZhHSVMkOpCT4sr
	Tjpyjci4gEyTc34nydvyX/4afkQlKHIkA87mVkkQR3mIQUlpUpJdNNe8zshByLl3Q6wQ+ZAJlOO
	OFNDEkD4x4Da7REkxGu3FSPpPZQEtDg6zz3ZGrComNlHc26MFgKyALVkWJGRALF9UaN3t1Yca5X
	vWPDrFxAZm94Z9DIEBbr3bHbLKNPp+09Cn94kpOxDJY5THj5p2XEsY4QD5C31NWl1JFvPippP/m
	QtI/y8lHvSQtXp3wXWogKTjObmw+xLjE/EPc7+PGWJrCet0t6bTvV2R1mQ+pTig0uWbFXhcOnbK
	RPTffZ5sMg1ub48N/EglLyGBYshPqgxSaCYmvlaHUbbNL3NK0Cq1A4RdlZqmjJXwnEq/i4B55h+
	aeQEBOv6kJRjI4iT3X2A==
X-Received: by 2002:a05:620a:710b:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949996676d3mr314675485a.73.1794976157561;
        Tue, 17 Nov 2026 20:29:17 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949996676d3mr314671185a.73.1794976156873;
        Tue, 17 Nov 2026 20:29:16 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:16 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:46 -0500
Subject: [PATCH v3 6/9] mm/huge_memory: build the moved huge zero PMD from
 the destination VMA
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
Message-Id: <20261117-uffd-state-fixes-v3-6-b617009d1a4a@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=2219;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=QxwfrdfeAZDvxUgLWWnt4K6ra8Mm3m9n0/IIOemncrc=;
 b=Yg+dHnTso+62HA6AwoBYf3rsd8BxbMnxwO9j1plFZMR96k4L5mkWJL/htZVANnb7stvo5K34B
 Y10CwAlkHPqAoHI2SbhOwt/MyAT3gFejZ1/OcrHBeXzZFS7jBY7ybYA
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX9hqTFYh8ARzl
 44b7PNDnCqF0l6DKAOIDPJItnt0atSEujiw63WHNRGbs4jXCrl/TBuySx0HzIH/rHlLoevtoC2T
 PaVQFLlpfBq594cZIMoqFCFXIXhL1FI4VwueNX8k8eJWSoWxySvWBJrtkGoJoVydqxIWs4NeXl6
 xw+gNuRpmfLqf2ufyFn0EH8q9pwEdzlsE4HXpMB6VZnIR8dsxZ8Gw2RWl4iS969s65b6/Uz0Z9J
 MqPl0bO4XE6mpFTJOch934knXeWJbu5t0VmFCdYpKWAWcxvILK2t4jtdqtWCLqd9NmhKiiJl7xa
 2EbzB6Hdq4yC6CRZBLUhe1j7bsScnWfUL5nnqbne742eTV65kpMmS/RQmG1h7E91HSCOJgbCnW0
 PBMYmfZHzda88EFJjMWoIGMvTINIRWAAxXFdrkK0vBkxEQ8Z5hZWuD7A6CP0WuUu6E4syIUDGFx
 8PexmUXRuHSylPjBJXw==
X-Proofpoint-GUID: iJgF_M4y_aN_NQiogJ49kQKxEgHFaEAe
X-Proofpoint-ORIG-GUID: iJgF_M4y_aN_NQiogJ49kQKxEgHFaEAe
X-Authority-Analysis: v=2.4 cv=ZIJCCn7b c=1 sm=1 tr=0 ts=6afd299e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=t9wnRcJLD9wLKarOqGUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXw/+GhJ9FYdBZ
 GX8mF7X+cRyAHxuqPK+kGy8/zgwz/PlvmHaqKBSPawGHi0kVhG0FBiCrz+csoCDyhAQQh5go8bg
 H/t9vojaoE/oZrosI/wtcfagtOR6iNeUglDpeobMjJXuWREwP2SA
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=10 clxscore=1015 lowpriorityscore=10
 priorityscore=1501 malwarescore=0 impostorscore=10 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017

move_pages_huge_pmd() builds the destination PMD for the huge zero page
by copying the source PMD and clearing its uffd bit, so the destination
keeps the protection of the source.

A source VMA registered for RWP can map the huge zero page with a
PAGE_NONE PMD, and UFFDIO_MOVE does not check how the source is
registered. The destination then gets a PAGE_NONE PMD without the uffd
bit, although nothing asked for that in the destination VMA.

The next access fixes it up through the NUMA hinting fault path. Until
then, the first access to the destination takes a spurious fault and GUP
has to take the fault path. The impact on userspace is small.

The moved entry must have the protection of the destination VMA. To fix
it, build the entry from the vm_page_prot of the destination VMA, as
move_zeropage_pte() does for the small zero page, and keep marking it
soft-dirty. A destination VMA registered for RWP still gets its PMD
re-armed afterwards.

Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 4a4e187ae3b1..bb7fe695a615 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2981,9 +2981,9 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 		/* Follow mremap() behavior and treat the entry dirty after the move */
 		_dst_pmd = pmd_mkwrite(pmd_mkdirty(_dst_pmd), dst_vma);
 	} else {
-		src_pmdval = pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
-		_dst_pmd = move_soft_dirty_pmd(src_pmdval);
-		_dst_pmd = clear_uffd_wp_pmd(_dst_pmd);
+		pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
+		_dst_pmd = folio_mk_pmd(huge_zero_folio, dst_vma->vm_page_prot);
+		_dst_pmd = move_soft_dirty_pmd(pmd_mkspecial(_dst_pmd));
 	}
 
 	/* Re-arm RWP on the moved PMD if dst_vma is RWP-registered. */

-- 
2.39.5

