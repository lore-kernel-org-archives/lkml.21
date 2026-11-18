Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976162;
	b=rLy7mhiQHPzzjXFYJ42+YtdM4+WtFjp6e4mDrcKZRYSEFYBUz3tf6QrnbgkXNljix/Xy
	 9ivWSBJq8G/yX8qgCfNhS+8qz+MRXKbivo9dQh2JeXHA++SGqOKrDBx9K5UEfEzazqusD
	 pCLCmtR/67mu+DyZFyGLFskYdSJTyhYu0uKkj/s19qkSLeJgMHMtux+DFAACd7fvJQDxf
	 7LzvXz8T6673aQ+mZ1+FZcpTWrjwv3K/mMeMwTABE93xxqduZZ3xCDa7YzittfxUecpGD
	 zN5k9cTZKzE17TlsanxZ/YRBXfz1mNWfgCuOzd1gYYukz7tUxGNpV8ScZOFQyEOGyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oNP9a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=;
	b=zA6zevsXB8L/SiOXbJA7EQ7u+ZKBoZ7Lcth5/bumuJFgsB31LVzyuZ7qB1EJ6BWE0dct
	 ppMjUa2zgXhNUJ9uN/u4ZJE3E8ywFZYijQz4QVm+Ic3ZDx7bYOWUggZhozickCTfBT4d+
	 e0xwl2DeqTcsUNrPSahJslPEjCYDkBXaWbH8LhLXy+JRwmTRvxPFBfgPGx/sLhjDzBdbp
	 4eNVcUYRM7ypMTNbddzV7GRB36qlhznvAIUMdRGmTIIVFM3/v3fd1UetZ97xUvO7IAaNt
	 QrbZq+f3pXpjleBsTldKnBut1RReUihtb9UsuVzd1Fq8IMcTjvlMAiDa8fgHHrHaumQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=W0M1fBkG;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=nDtTiYdq;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21060A2625
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B21060A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=W0M1fBkG;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=nDtTiYdq
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1XQbl3627207
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=oNP9
	a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=; b=W0M1fBkGR74M9DrJBxNr
	Sy35Rs/B5YmTpzC+TrBM7+r6DY5gyJ7+eaqRnl+tm7543UEpFfUWSpIg4M8KQoXs
	WHOvGW/GBRG6FqJbriLuUUbINLHSwlNj+D/i2tfYh8ZXxHlLFIYloWEk1f1bLd0a
	3sbrZWmN3lwWupdLp6+FOl4iGD90mujCP23YEsk71gxz828lxX3044MrZ14bhkzr
	HpcKOyeUxEkP95yVz4+/TikS4sprev/fsSKvY9f5cZ1eI1U9GPWhay2176YStBXA
	NLf61FGInRcqnbvaesSIvLfD8l+R9I5QC4AZOrRFIq7MzmIQWrXXf8vwNBtbUrN2
	Cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu79gep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:20 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so87559985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976160; x=1795580960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNP9a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=;
        b=nDtTiYdqUiOyXkNG92HmPWxzchk3OaLCcw1XY+9cuZRoYRUNiTZsOS+vpSzpJOO7Dv
         fBvrTnslllyfSCN9s4X3KOiz+9BKIqnTB/zaFcyVyJzSqpU9nFtXqNpfN4lufMmYyO0H
         iJIzUkdrE1mkqXJv2dUFiKNRhNsTXLlP+f54XK0xnYpiBGZlFYsj62X8ukyp8JAzt5lf
         5edoD62DztP/I9RVuJwu9OoEVdR8LBQbtRw3zUjcyMG4b4C60jtsa2w6BSOMosPYHsmm
         lq188HFUSIatTEKkcSsKShUqQUjQ6TXdKAezAqKMl8oD8zt54VtySA2kEaWCBZL0Euxl
         iJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976160; x=1795580960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNP9a6jLUlKCdTaahR8z6VO1PL6EFsLdkPdFbzFnzHQ=;
        b=k63FiouJYeYYZ5wf7T0rCBljPoQ1gxoNO7cNJoiARz+96uL6fd3CBXTMvkiWJAaAgQ
         lprF7/K53AfnI75/c32gtOgOSUPgPVW5e8Lp5oCvWlDF2eerwR67xZKRCHdWWctKf+qX
         lVfBieUXz6Pz/JQxDbIopiUHwBuKotj5hE0jktii7VKwa43L70TH2W+cgkR98QOhukpR
         lMzGzo2xOnIhA4ymfEl4V+1twFL5n5COvhKH/h9sPJfbfjOKkEYM0EsRIXDsplHZ4hQE
         0IjlhLGBBB7Avblq+mqO30dEiiZClzThac79EJJnVcEj+SsPqEm0Eewb+Il2gzwLOQCC
         hAHQ==
X-Forwarded-Encrypted: i=1; AL+hErFZbJgGYEqaoX92wtzpOgVTRkRuaKsMl6hRRpKOvZN/NXD4cjBWxdSCQ0aEjoe7u5rtUDK0oyQsujz0j3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pZmAhgYzUnnL3Iy1T2r6iAbAiGfOsV84+LYru//WAfYgeVxx7
	ua0DYasG4jl78wDw7d1lC07Nan75nXqiK+72iU/cZEQM3wXwNKAiVY17lA065NvxdyEALRA7Em+
	pdii/zUm5nzS9GaDpLUJnQSqbKMWCzTvYh/4t3M8OJqf1VzD0tkdp6l/fqQ90/A==
X-Gm-Gg: AYBFou23NW/x0jCJ7VQC0vDmFiopSHjcKBgMtPOuYPFywrgGxaDN1aFsb7Pbw9WnRf7
	QPibusaZbOq6V0/qtZxL7hyRHnJQRm9Ko0OMdHoUIbnbjF6Q3+n9ZP3LzUSCbwellIdPNUWXg/8
	WU+EfG46jwVqQKsOJI2mLSteiFplUSVEsIhJW7N4eW9kAYpsZ5fz/EGJACI8Jij6d93fNrzpBO8
	h3X4jNh/n2pjSqw3f9t1W1McoqSsznclthzHYM9hFd1sMpeL4LxaIR6TaRft72aLa7skoVxowrS
	nqF4XIuPCMfOB0pWV3PgX2guVYsLR+wW9263AXsp2hedGSNt7ECNO8EUZbJkNbCLgERzJ08pSZ9
	aJPwCsaxtj46J+AEnXiXVrLzgSQBx+Q96DWziaUijbJbHgHHEfgLxWPtfWh3A8uCS7LkPK8xPhh
	w3XWJcKilE3+tg6kar3A==
X-Received: by 2002:a05:620a:6c8a:b0:93f:1f22:96a4 with SMTP id af79cd13be357-94999574eacmr293092985a.29.1794976160341;
        Tue, 17 Nov 2026 20:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:6c8a:b0:93f:1f22:96a4 with SMTP id af79cd13be357-94999574eacmr293089285a.29.1794976159730;
        Tue, 17 Nov 2026 20:29:19 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:19 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:48 -0500
Subject: [PATCH v3 8/9] mm/migrate_device: do not migrate a uffd-protected
 zero page
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-uffd-state-fixes-v3-8-b617009d1a4a@columbia.edu>
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
        linux-fsdevel@vger.kernel.org,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=5760;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yLBeSaScpfcnWP3GTIZB32bGuoptmvLUEbtIcAlGdHM=;
 b=My0spsbuiHMwD39tEUzhalSGpyI1KepnMNGVOGi0pW44BxpyK1b2D+HcpBD6q4XsiHcZ7YUx1
 8Nb13C9ol+0DOkyotphEWf/Xp7KcNWOmkctH3ozT4GAn41fre1wcM22
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=LvgHWXdc c=1 sm=1 tr=0 ts=6afd29a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=9jRdOu3wAAAA:8 a=e5mUnYsNAAAA:8 a=Ikd4Dj_1AAAA:8 a=cMyuK6MtPHKtACrh3PYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ZE6KLimJVUuLrTuGpvhn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ceBn62FffA70YkImStcd5BIOOOQzmZA1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX78xqShQWQOCb
 TeIhmdXtiduW10pVO3j8O3LJaxEMUchL7DtrM1k+CmqizabLgVbWuKLQfPHjTSKKNyWWNBsc6iU
 Z28eKEUy2rmy+nmvSWOByrTBF6sJRWmmDDqPkKyUmDdEPx2p8eSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX+I7tbXWCn8Gg
 SQEiIZUUvzRAJvUMXn+KlBWYAhsmnGI1IaDIO5XJaIog4FhM3eYdQXvBiWoavzYlNrPG3/hbdx1
 nwuIXq/ahQM37WMcGOozsbZcwcnM5E5I3MtLDLXquOUjUgTKOZMhCgubQm3WCIlCYUCqHRMBhPa
 O+4q/Oc0/ZWoiEuJlG6yfdTysnC//U8PwE8LxqZXKdM9oNAu7EKiMiCI5uB3NKc7cAYyXT0tJrb
 jfyuxp9xXt3Ocvi4Wxh26KAFVCCAEcAUuTg1VhYi49xMqlYkxeqQj9InMkh0cpLwY0aRtUmu5EL
 IYBG9lTLcQBXi4DjRXuGpBLDRad7OlDeebOlzvgCH4FQJKMDaGyNROEHEOHxtpeMcYjsCrANeY2
 x18+71aGDfDHcyvit3pb1Xv4dgsapihvfvLrDoUgvD/f2MWPz386T5lTy/s85ild2TUX094JJAo
 +++q1awtMxvZfxyzx+A==
X-Proofpoint-GUID: ceBn62FffA70YkImStcd5BIOOOQzmZA1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 malwarescore=0 phishscore=0 lowpriorityscore=10
 priorityscore=1501 adultscore=0 bulkscore=10 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017

Device migration replaces a PTE that maps the zero page with a new PTE
that is built only from the VMA flags, so its userfaultfd WP or RWP
protection is lost. The same applies to the huge zero PMD. Writes and
accesses to the page are then no longer reported to userfaultfd.

To fix it, do not migrate a uffd-protected zero page. Skip it during
collection, and check again under the page table lock before inserting,
as another thread can protect the page after it was collected.

The alternative would be to carry the uffd state over to the new entry,
but a uffd-protected zero page in a range that a driver migrates should
be rare.

While at it, read the PMD once with pmdp_get() in
migrate_vma_collect_huge_pmd().

Fixes: 292924b26024 ("userfaultfd: wp: apply _PAGE_UFFD_WP bit")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/userfaultfd_k.h | 24 ++++++++++++++++++++++++
 mm/migrate_device.c           | 34 ++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 5768a3902c7c..54850cdabf5e 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -246,6 +246,18 @@ static inline bool userfaultfd_huge_pmd_rwp(struct vm_area_struct *vma,
 	return userfaultfd_rwp(vma) && pmd_uffd(pmd);
 }
 
+static inline bool userfaultfd_pte_protected(struct vm_area_struct *vma,
+					     pte_t pte)
+{
+	return userfaultfd_protected(vma) && pte_uffd(pte);
+}
+
+static inline bool userfaultfd_huge_pmd_protected(struct vm_area_struct *vma,
+						  pmd_t pmd)
+{
+	return userfaultfd_protected(vma) && pmd_uffd(pmd);
+}
+
 static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 {
 	return vma_test_any_mask(vma, __VMA_UFFD_FLAGS);
@@ -390,6 +402,18 @@ static inline bool userfaultfd_huge_pmd_rwp(struct vm_area_struct *vma,
 	return false;
 }
 
+static inline bool userfaultfd_pte_protected(struct vm_area_struct *vma,
+					     pte_t pte)
+{
+	return false;
+}
+
+static inline bool userfaultfd_huge_pmd_protected(struct vm_area_struct *vma,
+						  pmd_t pmd)
+{
+	return false;
+}
+
 static inline bool userfaultfd_armed(struct vm_area_struct *vma)
 {
 	return false;
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9e19fadfa65c..60985e9bec8b 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -142,30 +142,38 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
 	spinlock_t *ptl;
+	pmd_t pmd;
 	int ret;
 	unsigned long write = 0;
 
 	ptl = pmd_lock(mm, pmdp);
-	if (pmd_none(*pmdp)) {
+	pmd = pmdp_get(pmdp);
+	if (pmd_none(pmd)) {
 		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
 	}
 
-	if (pmd_trans_huge(*pmdp)) {
+	if (pmd_trans_huge(pmd)) {
 		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
 			return migrate_vma_collect_skip(start, end, walk);
 		}
 
-		folio = pmd_folio(*pmdp);
+		folio = pmd_folio(pmd);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
+			/*
+			 * Nothing carries the uffd state of the zero page
+			 * over, so skip it if its uffd bit is set.
+			 */
+			if (userfaultfd_huge_pmd_protected(walk->vma, pmd))
+				return migrate_vma_collect_skip(start, end, walk);
 			return migrate_vma_collect_hole(start, end, -1, walk);
 		}
-		if (pmd_write(*pmdp))
+		if (pmd_write(pmd))
 			write = MIGRATE_PFN_WRITE;
-	} else if (!pmd_present(*pmdp)) {
-		const softleaf_t entry = softleaf_from_pmd(*pmdp);
+	} else if (!pmd_present(pmd)) {
+		const softleaf_t entry = softleaf_from_pmd(pmd);
 
 		if (!softleaf_is_device_private(entry) ||
 		    !(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE)) {
@@ -337,6 +345,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn) &&
 			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
+				/* See migrate_vma_collect_huge_pmd(). */
+				if (userfaultfd_pte_protected(vma, pte))
+					goto next;
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
@@ -871,10 +882,14 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 	if (userfaultfd_missing(vma))
 		goto unlock_abort;
 
-	if (is_huge_zero_pmd(*pmdp))
+	if (is_huge_zero_pmd(*pmdp)) {
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_huge_pmd_protected(vma, *pmdp))
+			goto unlock_abort;
 		flush = true;
-	else if (!pmd_none(*pmdp))
+	} else if (!pmd_none(*pmdp)) {
 		goto unlock_abort;
+	}
 
 	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
@@ -1074,6 +1089,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 		if (!is_zero_pfn(pfn))
 			goto unlock_abort;
+		/* The uffd bit can have been set since the collection. */
+		if (userfaultfd_pte_protected(vma, orig_pte))
+			goto unlock_abort;
 		flush = true;
 	} else if (!pte_none(orig_pte))
 		goto unlock_abort;

-- 
2.39.5

