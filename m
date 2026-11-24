Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526121;
	b=hc7oyHAfAVh7MqaURnZFtau803vlx+JGz4TG+hatBdvGO9WweaSpsuxhbOa+Yy+mwLUV
	 /xv1aYtxmRuFh01pFasNE2WkkVsj+vH34M6q3T5v8BHLzH9w7Z7R7qI62+17uNkhn5i1s
	 TBRBctcvSi9BRd7kYPLDbJqEhvR2EfD/hJ2ih45Nf2D6zRNF0Fhx+QBD9Z+3qEHce8hiQ
	 tCpEfRCjm0pYzXAD2zrHg+pQbdAyuiTfRk0lB9f0uKZ8XblBJrjY+GzdzZ6BSaYtxqpLh
	 BR9O92C1OGIa8orIYzmfm4DfOnYZ093ZgidWA/3SG4/NDjzBMbpo2WuEOdKoFcM3RKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526121;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=DTrZBE5iwQP7I4LvpTnicbF/Quy7tKQDU+r9P+z282U=;
	b=oOZ9HK3hh2V8YBvtQhi2NYnjTltSmEsPVvo33a5STWytrL8b2CHYU/jhiVKmFo4EXmMM
	 cIXqcbjmVtfKkspQrisqlCNsmzvROTSSBrkjdl3VyKDtRXKexfv12hMHG2Xu2TykNFyQY
	 GMVZfGNpUpRf3Im2v8B2fXywUjp8D4IE2kp2uIIE1JxK/xydBZ8jOt1fo4ElKlOgi+qYC
	 b5Bn6fLZhiy5CKHfXVzDGYHGJVzpMDjRkjD7+fLwDKt+DL4EM+kpdQhEPblTDYyyD9532
	 /MZVaF0r7oUfJqtZB/b9iXjz6h74tnGKt+E9FBJPbG5P1P2FBb+9YP8FkbDTm6+uzFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=HPiF+LXs;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34931606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34931606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=HPiF+LXs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795526121; x=1827062121;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DTrZBE5iwQP7I4LvpTnicbF/Quy7tKQDU+r9P+z282U=;
  b=HPiF+LXsSlS9rUGL3hiIKwCBwrTsPbewJbLufp62EdqeLNz1Hrt95an7
   bROdlwmUVruLI1pcZlUdwp/tU/N198PS5UUt6czUZAIMiXTJ9kaXmmNQ6
   v78SqkFpSMuKtyBnERrSOaN7d9UQr0pA55T3xdsAB6WD+sjsfb0VsRHqe
   VKTilfe645fyN0jWMkGWXjf3pYHkHu7fj6DLgSc69AjJriHR0GEuUCCPd
   x2ECb8NIydMN7cIZZBDbDJ3jy1P8rSeKvBx5oYFVpJJNWRUWLDZHMc3xn
   bh8+2cU8OY7cuYlAFjUs5BbHqKQbtY9sxECvktf9ifsl2TcSx6WT6keg9
   A==;
X-CSE-ConnectionGUID: k5+cpGyEStifwrwTSbZhVw==
X-CSE-MsgGUID: yDnHAcOURESy4kc4+c6tgA==
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="35027412"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 13:15:18 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:31496]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.204:2525] with esmtp (Farcaster)
 id eae5476b-1d01-47a1-9a21-c023e39954fc; Tue, 24 Nov 2026 13:15:18 +0000 (UTC)
X-Farcaster-Flow-ID: eae5476b-1d01-47a1-9a21-c023e39954fc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Tue, 24 Nov 2026 13:15:17 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Tue, 24 Nov 2026
 13:15:14 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zi Yan
	<ziy@nvidia.com>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH v3 0/5] mm, uio: huge PFN mappings for /dev/mem and UIO
Date: Tue, 24 Nov 2026 13:15:05 +0000
Message-ID: <20261124131510.38745-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

/dev/mem and UIO map large physical regions with 4KiB PTEs, even where a
2MiB or 1GiB entry would do. vfio-pci fixed that in commit f9e54c3a2f5b
("vfio/pci: implement huge_fault support") by populating on fault. This
series does the same for /dev/mem and UIO.

Patches 1 and 3 add the two things a driver needs outside vfio-pci: a way
to reserve a range's memory type without populating it, and the order
dispatch vfio-pci open-codes. Patch 2 fixes a window and pfn check in
huge_memory that the new callers reach. Patches 4 and 5 are the users.

Applies on top of Lorenzo Stoakes' fixes for races between huge and
non-huge faults in PFN mappings, queued in mm for 7.5:
https://lore.kernel.org/all/20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org/

Changes in v3:

- Patch 2 is new: the window and pfn checks moved into mm, where every
  caller gets them.
- /dev/mem keeps the eager mapping under CONFIG_IO_STRICT_DEVMEM.
- Renamed pfn_range_track() to track_pfn_range(), and dropped its addr
  and size arguments.
- Shorter commit messages and comments.

Changes in v2:

- vmf_insert_pfn_order() maps a write fault writable at every
  order. (Sashiko)
- COW mappings get their own vm_operations_struct, instead of a COW test
  inside the fault handler. (Sashiko)
- Corrected the L1TF claim in the /dev/mem and UIO patches, and dropped
  the claim that uffd-wp can write-protect such a mapping.

An LLM helped me find corner cases and fix them in the code, write tests
and run them under QEMU. The runs on real hardware are mine.

v1: https://lore.kernel.org/all/20261111113045.35368-1-farbere@amazon.com/
v2: https://lore.kernel.org/all/20261112125638.12209-1-farbere@amazon.com/

Eliav Farber (5):
  mm: add MMAP_TRACK_PFN action and track_pfn_range() for lazy PFN maps
  mm/huge_memory: check the window and the pfn alignment before
    inserting
  mm: add vmf_insert_pfn_order()
  mm/char-mem: implement huge_fault support for /dev/mem
  uio: implement huge_fault support for physical mappings

 drivers/uio/uio.c               |  99 +++++++++++++++--
 include/linux/mm.h              |  18 ++++
 include/linux/mm_types.h        |   1 +
 mm/char-mem.c                   |  81 +++++++++++++-
 mm/huge_memory.c                |  18 +++-
 mm/internal.h                   |   3 +
 mm/memory.c                     | 182 +++++++++++++++++++++++++++-----
 mm/util.c                       |   7 ++
 tools/testing/vma/include/dup.h |   1 +
 9 files changed, 369 insertions(+), 41 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.47.3

