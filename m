Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976159;
	b=sevpvaL0KxPhyaCEXmfZlrdgxK6Hh1bBthCkldDaT9H4Oplm9GcFxxtv7T3caLURrbX9
	 tvUx2d4E9PMfT3luZAhX48OvK8tGOg5exzgpUMpEHEZKGK0X2XzI60zliJ7TDnzvYmhwH
	 aL6zIkqOi3GS5MBbo5mKvAOfsiZtxXWvlm1VagqMVJZDfidnJHQ+bBg9xWX8BqFEPI8wd
	 R7bUuUcSU7y0uGrjvtMPThRTerahAIy1ANopK35Huu/OTkDvoBcfiuE6VjfPGhJSP1Vc7
	 pNC/pMHN528KZeuBgBndr+HXZsZAv7w6bUnPbAMh7jR94BFidV0PECzRs/7x0sUb4UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XNCJHjpXg7H4M22PhQ2BeTDOHza1Veqicyx+ercmKMo=;
	b=zXH4Js5Pqw/VP7/y0VxQJixsV4cvVBKhUeukVvJeAxJ1Bvv12l2Ejsg27h+gD09HipJm
	 quXBv8ofGQUkjCEOhC8B+w6eSa+SipRKSLLZmHj/vRY9WwYOhMEox4zQWrcuxLfheTErj
	 HWbhAZGa7cGwLASAeBoc92hdO/eYyztWMyy0hjcr+KaQ4Z/KvdtG3ZwgWrBbKpXiQ5F+8
	 N37fENHLcp7GdL6sKxdCXRh21ukdLC7S8ixaNkZr82QB6k3JEEzwUtiTsv4GCmePU8+9J
	 ySyOYGpV2XboaFwDpO/2ZbwvJYTGh5vdnwFOBg3nOReujLZSw3ssPbSz08X7+O3yt9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kJDoBRsr;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Oa54y1wt;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE3606A883
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECCE3606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kJDoBRsr;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=Oa54y1wt
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1Xr903395507
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XNCJ
	HjpXg7H4M22PhQ2BeTDOHza1Veqicyx+ercmKMo=; b=kJDoBRsrB/NsQEyhmLQQ
	PFL9HGbSbHNl5vTvWdwadua3igPUVS/Ewb8z8UJ4bDc38Xz69efN5F2+Me9D2ZDs
	+zfAJcvLAfU7xizj2s2M7KoI0avhpmTsjPLUKgpv+3HZcPaJADJrnhzHQ/PZ4Wu+
	VnI0qFH20vL0qCXDe4pqDsAVfHQQUphZXepiyexiIXaW54cUX3AHU04/x+9JKhuQ
	1FppTPTe6CKRWMK56/+SH0b3RlIJ+gbetTSCAkp7wkEv2cDxSw3J1jcGemVV0eZ9
	ghEqPF7bMwMaSc+rG12SRkOnbVS3qG7a+t+nNWXp1oglg27yy0mrNqawvVxVMo/e
	AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu5sf2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:16 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495dd0f07eso127069185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976156; x=1795580956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNCJHjpXg7H4M22PhQ2BeTDOHza1Veqicyx+ercmKMo=;
        b=Oa54y1wt5JQntImlXWdeQqrx8MFYW/MkN3a8V3HsC4nyKq1i2ESSRCSkQe2dvZ3Dry
         cPZHD/EwnT3j8V/VsH0i1NENQyfTUXxqih+fkr4e6D82GxCMjC/3DUTHogNNKlrKeM/f
         jI0+q51oxYtf1XOGv1/CJ26npcUMYKCQuQKnBenIZ7ly5xD/VqTo5yL5vtNWWG52rLEQ
         j7wQczzcjL4SVguDOZfMFMaAyv+/I4uUcisHcRFA9L1okqO/BLcKc6Guyim1UyraMAUo
         HwokZNTYhOQZTJWcmrCYPe8BWyzRI822l4Lfs6bISHWNJXlePaWvOMpgK7vg0otzjFKo
         5YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976156; x=1795580956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNCJHjpXg7H4M22PhQ2BeTDOHza1Veqicyx+ercmKMo=;
        b=HjL9Ri7ywtOuOQCvR40jDr9L0LM3KQiP/liETfhusvQnN8raAkD8jvTBBQK86sZXuM
         Q2gLeSRVd+Pvjh7i701TZt98/GS5M60orWYIztPy58yJPc+tSU9RdacvGQtjH2pR1fE0
         5Wlyu6r0vsHauYw3HjjnUVW93+INzGEgabh63rt2i9v+XK711wsBz8Nd1lRy2f8i58EV
         2LZehSll5lIEie8lfJCYPBJghBMBkfj4MsFKYAjuILL+PqaYu18optewSzwoN+LaUQ3U
         4OoAOtao83CKWkJfmiyYvmGI451CecHstPLQzzcuGCGx+crQOWVI3XHN3u4ASG01RDN/
         frsA==
X-Forwarded-Encrypted: i=1; AL+hErFA15V0Tptvp9skTnzfQjzSSEE38k/JK2kXhReGjCnVLBd1e90/2I5BHyRv4e4oAETkoPCxtlwcy2HmLSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NYpzZHeGrJKCWhuEboh3t1J7+0ri7+dHAuJ6Ntk9SlfeJNUhK
	b839tdPsYj8vwqQPvllTGPcR4gljIeizj02VGe4w/NcMK4WIT/C9M+04brDFXQn7D+Pf4YaillJ
	35NL2dAFdo9zmcvXu9RuaKN+dJV0W7RT7auzT4ZenuRVplAH/sGn8oLveugRtrQ==
X-Gm-Gg: AYBFou0qt7go9BDrSZaBF3GEfBzmrGjOfwRvj9eUm0vCsthSmk0Dxs0NFnRfmElU/sK
	CO5n7+TZbmPhrT2StB7lBNDigy/jQ9zux+YDAezeU3uPVle+Laz8736JfV5RoyHAmpDtLBVOhZU
	DIg64NrNAwaaQpZK/KfheINFr1aPXzM4A58o6lDq+vwusboIZJk51ACUqmJ6ryVt012Yrk1PTrN
	roxTKyau6dKFetDtciLC8yt6QQiWMTJ5OM5K+Hy3+p+lYRZKFZ9SmqcfkLq56ANzbO7HAaVh15C
	glRMpVzYTUiyQjD+4I+penqbxCtptu3fxvRgDgjmRsuNQItA5tY3Iec9MGckbPDGQWsuSdIFdSF
	PWbPqtNuy7vXmL/KkJskigQ5AwU51yeHXaM0JG1DdG83BNQqyd7dZt2+JWelD6NEoOdRjr1+CAU
	tSSDado15EYpW2klP1ew==
X-Received: by 2002:a05:620a:45a8:b0:93c:a468:2db1 with SMTP id af79cd13be357-949995ede97mr298863385a.58.1794976156042;
        Tue, 17 Nov 2026 20:29:16 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:93c:a468:2db1 with SMTP id af79cd13be357-949995ede97mr298858585a.58.1794976155607;
        Tue, 17 Nov 2026 20:29:15 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:15 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:45 -0500
Subject: [PATCH v3 5/9] fs/proc/task_mmu: write-protect device-private THPs
 in PAGEMAP_SCAN
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
Message-Id: <20261117-uffd-state-fixes-v3-5-b617009d1a4a@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=1768;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=EbKRPYoieoskQJpDqKg81gaW0G+NGTy5Bx6z8CnRsZs=;
 b=JSvYpX+oNnE9o4AKjWB2SyEOkImkawA7l35QLPhKkNybQH+XWVtVGXLK1uHIiS1KH05UxY9AL
 YTzUS6cnrjrCH+UqKgDA/2iXJ6Q8CFL1GAG8f2ZUA2gqL8yCRvg3lo6
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: huUkO7RSU360FzNBKSNEPWlznvE-e18q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX4syer7cKqQl7
 BhR7BhFofUYOYsaDsD5kOuQ90tjzYSaBQLqFPoWO4AoOLwZe4OBEH1DjENHMlZPkEb4a2pEsKM3
 hNPU8jZnGrCTfni3Zzjuj8BL+jgJReb2pzoR4v/EVdc0gSf+gNRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXzhy2bAFS6D2Y
 QJMQ24htLOQ7JMi2DUY6UHQeWd/atFtudUDWgbR3nDTvLzReyhVEcUZFkJDJvz4WIUHEH7PDIS1
 bYnBd2MlUSi4fHndNR5s2AapCCfd/68ooV9XthyyDF6oJWLkkdslNAD7QmwuWsugM3QpXdL0pw9
 X9hAijRxwfK0IBWtTEP8LL6euWBmyhZ5jVqon+xnn+z3LAVGqwfv72vWD2G1enp0RTqfeS+xSE2
 Mihb/wqCBYRnlxrjRJq6RqvxsCeE+s780vjp/OfPFKcihEbxK4bpZMvwb+4XTplGUaCzsZAYo21
 hOxU41vGxMuUg17g5RmdMyDgsAxlsuS4ZIyTC0K7xKMqlfiDh1cPTdLYkw4Axj6o7ydrTYPuNBj
 GNsAanf+ZXhlP+LldEFFbA6TXnZwfTraY7pbGxbxBXtauJhuZO4NnSESwhBteQkO19Y9IssxE2Y
 bhdq0xQDkEtYVa0yhvA==
X-Proofpoint-GUID: huUkO7RSU360FzNBKSNEPWlznvE-e18q
X-Authority-Analysis: v=2.4 cv=e7ST2qp/ c=1 sm=1 tr=0 ts=6afd299c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=tHa68p0SAAAA:8 a=VwQbUJbxAAAA:8 a=RyLRxA_qM0uo8G8YelwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=10 bulkscore=10 clxscore=1015 priorityscore=1501
 impostorscore=10 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180017

PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects a huge PMD through
make_uffd_wp_pmd(), which handles a present THP and a migration entry
but does nothing for a device-private THP. The PMD never gets the uffd
bit.

pagemap_thp_category() reports a non-present PMD without the uffd bit as
written. A user tracking writes with async uffd-wp therefore sees every
page of a device-private THP as written on every scan, whether it was
written to or not. This requires a driver that migrates THPs to device
memory.

A device-private PMD must be write-protected like any other huge PMD. To
fix it, pass any valid PMD softleaf entry to set_uffd_wp_softleaf_pmd(),
not only a migration entry. It downgrades a writable entry and sets the
uffd bit. When the THP migrates back, set_pmd_migration_entry() carries
the uffd bit over to the migration entry, so the write protection is
kept.

Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 0127bf9c3f77..15cb65c3ab94 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2510,7 +2510,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		old = pmdp_invalidate_ad(vma, addr, pmdp);
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_valid_softleaf(pmd)) {
 		pmd = set_uffd_wp_softleaf_pmd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}

-- 
2.39.5

