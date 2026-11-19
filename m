Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089766;
	b=ehmwmy+YuCM4HDN0787jC94G5Ie6e0hhwSOzcXHcMm7rRVe88LLt1HY0Y8/qcY4DsQZw
	 pVOpyb2r9NkCEC46n84U4fLsF3+chz3YW0DBThOiD+S2ALfijtboASTqFHEVwzcOADRnT
	 c2Het5PSJHXqngsYfyGQ1eSt1LIuFnf4zsQmXITsQrkFhoGwvjU8cV06H02LKQD2vl8Sr
	 +v7e1RgY3ET17MYuibREOe7y4SvNHoRMJNrDoJC/36D1opRzVCpV7zpF7fYeYrCIaEsyD
	 NHgI2z2HQR+1M4oC9sml8RPZeJFP6XJbilEfa5PiMvclWAYxZ8xuFx6tMtzvNxdLRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089766;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=A4AW+1r5ioYbTqiBhF66CNLfZpJFNCdMJyMeafN4jyY=;
	b=xeQdRZTFPYu5eaqdgXaopK1U1UhzcrGff15hX45+BkH6G5bxPM9VIYL7hV1wm3kL+fPZ
	 f+v2TDHJmTAjLCMjgw6OsxEWvOb59ucM13JBEuu7nFbrcLWrSosudg8ZX2jG/gJGDynJx
	 yo/Q58w+NejQbsZhRoiuATE0G6iT2XNoEAjkNTQi61dH51gtNp4prjtJC9KG3wwEGymlH
	 k+H34xpVKIeAY62TyYWCkiHhCM3jfkjxbgevGHnkqFXljZjv3qc15BLkfC6FBio6Lkl1F
	 ao6mgyj1lrGhfPlYr5P/E9fOAmrFh/6K1ak3obSEU73ZCberIWolNCxmmOleZydFDPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gi1agw5A;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="NL/N4Gaj";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FA606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gi1agw5A;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NL/N4Gaj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4AW+1r5ioYbTqiBhF66CNLfZpJFNCdMJyMeafN4jyY=;
	b=gi1agw5ApvlhZONZ3u/TuG1vqa8Gk+HC2sbIAoguZZ6G+FXsbzSFYOqXZZqhWEc/7pAofi
	LgngcpfpCAMT46GymxiIYEVeA1MOd9N3oP5N6S6DSVblaptEBlt4qlyBPMcSkYtLkKOxKT
	HLyPwtj2Qy3CNQiPlO5IcnSGngaRin0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-OQRqB19aOvivJ_sFRqbXzw-1; Thu, 19 Nov 2026 07:02:42 -0500
X-MC-Unique: OQRqB19aOvivJ_sFRqbXzw-1
X-Mimecast-MFC-AGG-ID: OQRqB19aOvivJ_sFRqbXzw_1795089762
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c505ee610feso182525066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089762; x=1795694562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A4AW+1r5ioYbTqiBhF66CNLfZpJFNCdMJyMeafN4jyY=;
        b=NL/N4GajBCPL0hJK8ZYVRPqrLlxJU90unk9LlspwbUtLV78RxLE8fLQgW9c3bP6TPm
         yAT+Zd0NOwYUOyunhUMFGNSdBE4OZ5gA58nQ4RyCPbr6PmZLwcoEHehTHoTDTMAjDZQw
         ptsFOWsc88YiKLPT9ldD3SAtlNs+Jufrw1JGP0wH6Kz3I73vs49KivJhXl/Rd4CfPaXl
         xgLptsISAj7/lgGenYh1+/OWOWiiURtlcPUgTIf/JQgIHfE5Hp9E2vXa49gNAj1Qbnxk
         NE2EgMAN2Bc2mDZXp7OITTawFi/sQfy0+ymNXyfiVQe4LH5f/GfbTwd0sDIAb9rfGiIY
         XuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089762; x=1795694562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4AW+1r5ioYbTqiBhF66CNLfZpJFNCdMJyMeafN4jyY=;
        b=RyvjnqqHOhaErVpujeSlDGTduosXugvrlVC1NC0a48FZNcbMtnhGqhhALZc91Rpvak
         NWeXIxP5nVKApYCJTwVYCbUFb1JQ2nETSf7ojgO51WIp9Dut8uoPDH1plMCT5anyCrdv
         lzIjcFzPKsRaMX0ialNX24+kzwbEpdMKOBrstO7EtgNjZXM04CWD7J2uMhbwFjyhItxV
         rAp6QwZrTOUW1Nz9yvC+we+8HWHRGqwPe7xrBlJMPkTcP1Vmc5H9SBM0OOfQR79FSlwU
         LbWPTJJQD5YY4DtPL7YA9VTJidWGb6KvuI/MSfdeVIv7Uly2c+SMeXSqS2Ktkhiz5UnL
         tF5A==
X-Gm-Message-State: APuU4Z/ApBjN0CcFVrY0NZY2BXt6OTI9ApeosQalfiT99n2dpRHVffIS
	MxNgXJkh0wrKinUGmnAQp4F3xekhbKI5yHPozj2GcAEC7KteL0VIa+zHSvoq4Mdn7q9u+LWFIlU
	YiuxDCHst5IS6Y8gvAw31KHKvzi49HIOMn5nZvW8TmUylXVTj8l7ppqyygcx9dAgyJfDsLtjBH9
	7kzGXgmNBICVzXfCj1kHEikkpoi3f07LMJBGYZO5IDbSI=
X-Gm-Gg: AYBFou1sfaEmQ//S86Bjh6ZT4ACWzYfx1LnvcA4dHJcQoP3MoDbKwPB02b5KpDYwk69
	tGq/p5jlefYFXofolBRqRWX4ocu5vtx4gp6tHAe7lX0ZkQnsV5UzBuPPkgGVCRJ1J5czSZCuMQ0
	HDk1w3Fuej0iwdOjukSzhlPSmzt7uASe1OvX6BMmMD69tgV6NRx031wQxm87BA19QzhNRdJcQaS
	1Ht/S5Eg1mrFNplt7+ayCmixZqw8ehc4oQoJrlK12Xl6oIP2wbIKhcEgpNA2BV3DISv6AtuvVRA
	DnBwAImsjDnDGP9I+DF27RT1wBkx9iAt8KuovgIozOK50vOZ6xH3aMYnfiJvs9J0gzfQ6HEMsF9
	O2OvAbsd11ExQ693bx98zpesCwNiw+//oQUtD1Aa+0+Y=
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr524868866b.20.1795089761483;
        Thu, 19 Nov 2026 04:02:41 -0800 (PST)
X-Received: by 2002:a17:907:6d1f:b0:c46:8b87:c1f4 with SMTP id a640c23a62f3a-c510e2d4ee1mr524859666b.20.1795089760723;
        Thu, 19 Nov 2026 04:02:40 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm10439162f8f.34.2026.11.19.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:39 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Gregory Price <gourry@gourry.net>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, virtualization@lists.linux.dev,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>
Subject: [PATCH v11 2/7] mm: page_reporting: support host-zeroed reported
 pages
Message-ID: <2ec112cbdde76a60ab235a0df7734a23387f1c86.1795089715.git.mst@redhat.com>
References: <cover.1795089715.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795089715.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Add a host_zeroes_pages flag to page_reporting_dev_info, allowing
page reporting devices to declare that their host zeros reported pages
on reclaim.

On successful reporting by such a device that guarantees zero contents, set
PG_zeroed.

Note, that hosts zero the pages for guests, safely, even on
architectures with aliasing data caches, and even without knowing the
guest user virtual addresses.

Specifically, ARM64 data caches behave as PIPT; KVM handles cache maintenance
around stage-2 mappings and invalidates the whole I-cache when it aliases.
On aliasing MIPS, host unmapping flushes the whole D-cache, and slow GUP
flushes the host aliases of replacement backing pages before KVM maps
them.

Any host that can't handle this, will simply not set the flag in its
page reporting device.

No driver sets host_zeroes_pages yet.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 include/linux/page_reporting.h | 8 ++++++++
 mm/page_reporting.c            | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/include/linux/page_reporting.h b/include/linux/page_reporting.h
index 272b1274efdc1..49adfc5d45804 100644
--- a/include/linux/page_reporting.h
+++ b/include/linux/page_reporting.h
@@ -13,6 +13,14 @@ struct page_reporting_dev_info {
 	int (*report)(struct page_reporting_dev_info *prdev,
 		      struct scatterlist *sg, unsigned int nents);
 
+	/*
+	 * If true, the host zeros reported pages on reclaim.
+	 * This includes any architecture-required cache flushing or
+	 * invalidation, especially on architectures with aliasing data
+	 * caches, so guest accesses observe the zeroed contents.
+	 */
+	bool host_zeroes_pages;
+
 	/* work struct for processing reports */
 	struct delayed_work work;
 
diff --git a/mm/page_reporting.c b/mm/page_reporting.c
index de587be178010..841dcd64777d1 100644
--- a/mm/page_reporting.c
+++ b/mm/page_reporting.c
@@ -127,6 +127,9 @@ page_reporting_drain(struct page_reporting_dev_info *prdev,
 		int mt = get_pageblock_migratetype(page);
 		unsigned int order = get_order(sg->length);
 
+		if (reported && prdev->host_zeroes_pages)
+			__SetPageZeroed(page);
+
 		__putback_isolated_page(page, order, mt);
 
 		/* If the pages were not reported due to error skip flagging */
-- 
MST

