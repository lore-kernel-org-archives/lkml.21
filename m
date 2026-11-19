Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089757;
	b=QiPm4sNGYBm4U5qYXIWc4fX6yrWlcS1wGTLOLWt1yXCTW8bnisFmGRRjWhynmi2Ya1ge
	 cqRYfowjFoLmu6I3b5m5Y1nxDDpE08269Nbi+ke04Dzy5nKX65sSdy9ZKXo5wcvh21Oz5
	 PxBtYiVJaFioDtzJHc69hMB1hjf73Mx8XRAfKNtqV3ui0U90UsskI2Oa1zQ3qtrISB9iX
	 U0qiANAsFsvcZW8hJi3d3Pe52tdjBW00g3VM6VBo8sqF7TvDFw1Qeh4PWJErAXIwIhiaK
	 dlfAYOK8myHOSW2iI6mPTtLe9t/VnBVo5p9+ZB2Qr3KenlKZL9WT3bUI6c6HPk3hkZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089757;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer:X-Mutt-Fcc;
	bh=8HieDkcA9JIiulz3WEd2PXLQt0iI0kOA0dL+f71dJzo=;
	b=TaWpvfcj6vmi7YByg03lRt+cX7LFVoka+w5Ao8Qo/xVlQ1ngq4bl47U1nrQQVksRpkA2
	 bqd8jaR3MwfCyHoN25wrL3kknaoI6iaT/OOQ6V1Y4H4CgOssjbB4Lxo4y+9f0NJ6W11Ia
	 tGHgr/+NwpYXUhMcgQTnb8LnlCkmgvDATYiPo4NTNLtuPm4DOCBKeU5nCM8/11f2BmTOG
	 1WviTyugglu4kqEcP5Q5Sqf4cjtA5ZQXKpjMpE3o5dKsMp/9TEVug7mjtVv86IfVj4HNE
	 VN8WYgyAUXzaPDY+jCBggSR7anPHUWrZ9Q41pm/0miQIrRW4BjVuKJ2VTz5gEu+3o1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IwTqf+a1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZuBXI2Na;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFEB606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFEB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IwTqf+a1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZuBXI2Na
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8HieDkcA9JIiulz3WEd2PXLQt0iI0kOA0dL+f71dJzo=;
	b=IwTqf+a1CPoAY49dSGVLucb4wOQSHRPdgkbZdvB6XF0SyR+Uh5TiV+UqepGSC5+LmC+2Ov
	dZLEdcPALeCrOpK6MKgPnU3sb8/vmrUoKl6W/ACu56zujwj442BGLu5UTVZ+GV7mnlkzii
	7NYkKM1fSuNM3vFutIuhYdKwRt23M+Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-J7RVcOu0MrOneISnjQqYyg-1; Thu, 19 Nov 2026 07:02:34 -0500
X-MC-Unique: J7RVcOu0MrOneISnjQqYyg-1
X-Mimecast-MFC-AGG-ID: J7RVcOu0MrOneISnjQqYyg_1795089753
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb68a5e792so5979625e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089753; x=1795694553; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HieDkcA9JIiulz3WEd2PXLQt0iI0kOA0dL+f71dJzo=;
        b=ZuBXI2NavEK4khvqorsPTwOD27beh7se/2cWb9DiA7y4tbRc+bGCnTxf4DAveJc+ZI
         jw9dSLNFPAUzHkFDVcrAggDOWb6O8COdVHOf/Jr9zRjw1SjktQ/9ga+blbonNIFBhUV1
         Xz4KZY5wkDjwGHlxeW36o64bMrtxAJrRlQvaKLZp0PZZH0DapxhCyg0lh3Hv+z0hotY0
         RHfwJIPWvECqfiqHCZH5a52320lLw6ySWv+SxLhEcVYF7TdBp3EnEr97Z0bsXDyTHJjF
         rsmGdNdi7CWMd8tiYplNdbaUaOI81DC0/RMGIHMlEmUt0Dy3kySPU3+nwtApDnab4JvY
         MLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089753; x=1795694553;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HieDkcA9JIiulz3WEd2PXLQt0iI0kOA0dL+f71dJzo=;
        b=NEc5XV1W9D6YZc7HYG66/88Dk3uUl3y9elodgx9PsR4hdYxCuvy8XjFDH9ctHjqKEP
         NXwarHgIOnCkK7mYQWpaRX8raTF93XxXlUZGi58Y4FM8XixUgkVfYq+3Uk+Klvof7qZc
         b7p5A3awCN6ULoAjH4oAn5pSMSEOh1qnvwFDo6GPciaNeEDVwX5ylkUvBAhYp2fxXDAd
         hOYWuXRmmUkCn28kaZckK1rjESPH6yYypQxw/wdkkVmoFCCf0QUfFcYVJQxzubt0ZSld
         GdhjixWPJ7ceYLq2OZ11x8ZtkMe0V660mJudJwpb4MIzTKn+9CQnGzpfBxzpzALHrMAO
         oIhA==
X-Gm-Message-State: APuU4Z9DForq3Eh4feJxUShvqUHNVNkjGyYTVRVvR5ru9VBKmSbW+GkT
	JK+NZO6d0mgoF2iXnacLEoO2JNWjONKPOHLSgz+I5kkp9VzGmLJVkLzYs4vZ//v46SAbou1t7D3
	ybfS8Ofb6SoLkDEi2XlEajFvOI5uFkPkAdRyU9N4LdWK4DdWnJsoUo7MjhD+Rd7jZzJvTD81ejc
	cFT9Uyj+bdeplVZLFQCSXFCNNfPLP8+OqrpuaiJ9273ko=
X-Gm-Gg: AYBFou2aV2c8OdDgTs52NeB2mbbkbZOj6q4MS/843msy8SXI2/cJK7VqjKFdWASJLLh
	P/6rzTuDhUw2JSorlhnujfstUoxysWXWw2Nk7rSv4xoFY5xCv0DDQ3W6Dn99bMY5qw4ZD7tGHfc
	VGB+0eU8wm/+9byt273QSbJ5uSP65GjvKNflTa91rRWqgXsqcHJ6QUF8o+WnWF7r24eG32EzO3d
	Bv7w/zBTXp7vJR38tPrS/iYYiBozSazwRxv+LI82CMYuWxCOi6cxilc5TAsu7iNuGZlHzz94xMT
	VcXOMDuDgQdfDGiLssexJdIRK7Gp/5mJcdly9h627u/3eH9iwslZkYRINAvFYe6fzOQ1At60lTC
	NinchX2Y58mrns4ZH+kSv/JkKsm/CMwL3Idh90ZtolpE=
X-Received: by 2002:a05:600c:37c4:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb8611ac9bmr19487075e9.13.1795089752582;
        Thu, 19 Nov 2026 04:02:32 -0800 (PST)
X-Received: by 2002:a05:600c:37c4:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb8611ac9bmr19486165e9.13.1795089751833;
        Thu, 19 Nov 2026 04:02:31 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm37547505e9.11.2026.11.19.04.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:31 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:28 -0500
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
	linux-mm@kvack.org, virtualization@lists.linux.dev
Subject: [PATCH v11 0/7] mm/virtio: skip redundant zeroing of host-zeroed
 reported pages
Message-ID: <cover.1795089715.git.mst@redhat.com>
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
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Many hosts immediately discard each free page guest reports.
This means that re-zeroing them in the guest after allocation
is redundant.

This series lets a page reporting device advertise that its completed
reports guarantee zero contents. It tracks that state through the buddy
allocator and uses it to skip clearing freshly allocated user folios.

The series is based on Linux 7.4-rc3, commit 666539eecdf4d.

This is the first part of the project. Further hugepage support, along with
the init_on_free and FPI_ZEROED additions suggested by Matthew Wilcox,
is left for follow-up work if this series is merged.

Patches 1-2 add PG_zeroed tracking and the page reporting device's zeroing
guarantee.

Patches 3-5 skip redundant zeroing in the PMD THP, order-0 (including
x86), and mTHP anonymous allocation paths.

Patch 6 adds VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED to negotiate this
with host.

Patch 7 adds a flush parameter with an approximate reporting budget for
deterministic testing.

For a 512 MiB anonymous allocation using MADV_POPULATE_WRITE in a 2 GiB,
one-vCPU KVM guest, ten samples per mode gave:

  task-clock              feature off          feature on
  PMD THP                 229.0 +/- 20.0 ms     74.7 +/- 35.8 ms
  order-0                 336.1 +/-  6.5 ms     99.2 +/- 19.3 ms

Assisted-by: LLM

Changes since v10:
- Rewritten along the lines suggested by Matthew Wilcox [1].

[1] https://lore.kernel.org/all/aiePVsiV-w-IZ8A4@casper.infradead.org/

Michael S. Tsirkin (7):
  mm: add PG_zeroed page flag and buddy merge tracking
  mm: page_reporting: support host-zeroed reported pages
  mm: skip zeroing in vma_alloc_anon_folio_pmd for pre-zeroed pages
  mm: skip zeroing of pre-zeroed order-0 user pages
  mm: skip zeroing in alloc_anon_folio for pre-zeroed pages
  virtio_balloon: add DEVICE_INIT_REPORTED feature
  mm: page_reporting: add flush parameter with page budget

 drivers/virtio/virtio_balloon.c     | 33 ++++++++++++++++++++--
 include/linux/highmem.h             | 29 +++++++++++++++++--
 include/linux/mm.h                  | 32 +++++++++++++++++----
 include/linux/page-flags.h          | 15 +++++++++-
 include/linux/page_reporting.h      |  8 ++++++
 include/uapi/linux/virtio_balloon.h |  1 +
 mm/huge_memory.c                    | 11 ++------
 mm/memory.c                         | 10 +------
 mm/page_alloc.c                     | 43 ++++++++++++++++++++++++-----
 mm/page_reporting.c                 | 43 +++++++++++++++++++++++++++++
 10 files changed, 189 insertions(+), 36 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
MST

