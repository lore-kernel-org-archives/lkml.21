Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795056771;
	b=vuY3kac/ihh3T0jUz/bslNHF4s32z9K2VcGbSh+VsN0kgy9DBIOt3Qm72XRd1YXD97FM
	 svMVjMk2IdQqGyZMSZez7J0Ov/Nw1fL1oBh0RAFOeTvA0qSPEp42lmmu3UQe57Ljdb230
	 5kQ5wwY8dioGTVpTOT0BNam4EiIIJyyRfzHCFp76miyS6Q4K86jrE9zK5YlKPsIwiOlIO
	 7MpAmNwH/PoZUtpITuHD3xKL/LYv/95bSPjzXhVBtHd/fxUHgLu+jF7kF7SqgF8lLXrAL
	 JsyrxAi858XWqmUDqG8ufrnZ/AoE8LiLvDsjfL0taHAAIXtoPznzeQMAOKyqQc/KnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056771;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0aPRA4hpiTz1kk65aoPPE1Fyhse+uJcCQXxjdxwawZE=;
	b=ivczDox/znoRNCtR1evkygiw5xF4WIvqlSRCEpikpvPLOX1xp+X9H5CeQCqgFDOhcWsC
	 LIvAZw4UXVvHLL5uZcEmVm20vfjfF+yBoY1u932fHQ2BTlRxp5L32wPUIaqoR5gLr5qGB
	 12pDY+e2xhRq34ly6BfXwthaVllEVChBUtBMIfM8QlRLrEb+/09o86FoROk/nkKF30W4l
	 pKVQYPYnHrYdvVLzjnHnePDYo/UUmrCnaHtjwVs5LOLFvmFaZmtKbT1gMQzjpi1uDyt6u
	 eKdE3E8GeiKCcrHNm8CHgObALxcfvthWGftlWR2OhJrlBUOTHJxpLxBJ/NgWQX4Lnpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=exaZl6bG;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398EF606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398EF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=exaZl6bG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=exaZl6bGXPTmhuXRv0ayXIUs5qcodj7bz/4qOEuJ/vC9nqxUfX2E1Df0kJY05Ed7CIfW5b2w9mQd2
	 vGheyZW4ToLKwfHjdVhD699P2SBdMVCgqoC6ohb1hWYLUfmm9n8ZyursfHUqSFRsrNFdDxlzsH49N7
	 k/wp0jR+HoB1iZs0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afe6441f3b-f4a53;
	Thu, 19 Nov 2026 10:51:45 +0800 (CST)
X-RM-TRANSID:2ee16afe6441f3b-f4a53
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afe643e04d-ecf5b;
	Thu, 19 Nov 2026 10:51:45 +0800 (CST)
X-RM-TRANSID:2ee96afe643e04d-ecf5b
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Samiullah Khawaja <skhawaja@google.com>,
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com, Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: [PATCH 1/2] mm/gup: add memfd_pin_folios_supported() helper
Date: Thu, 19 Nov 2026 10:44:17 +0800
Message-ID: <20261119104417.312237-1-xujiahao@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
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

memfd_pin_folios() accepts only shmem and file-hugetlb files and enforces
that inline with shmem_file() and is_file_hugepages().  A caller that has
to know up front whether a file may be handed to memfd_pin_folios()
cannot use those predicates: since d3710111839d ("mm/shmem: make
shmem_file() check the file's inode") shmem_file() is an out-of-line
function in mm/shmem.c which is not exported, so modules cannot call it,
and is_file_hugepages() on its own is not the same question.

Provide the check as an exported helper next to memfd_pin_folios() and
use it inside memfd_pin_folios() itself, so that a single place decides
which files may be pinned.

Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
---
 include/linux/mm.h |  1 +
 mm/gup.c           | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 040cff643..e401edc93 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3600,6 +3600,7 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 		      struct folio **folios, unsigned int max_folios,
 		      pgoff_t *offset);
+bool memfd_pin_folios_supported(struct file *file);
 int folio_add_pins(struct folio *folio, unsigned int pins);
 
 int get_user_pages_fast(unsigned long start, int nr_pages,
diff --git a/mm/gup.c b/mm/gup.c
index 7605da0e0..90ac51207 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3449,6 +3449,22 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 }
 EXPORT_SYMBOL(pin_user_pages_unlocked);
 
+/**
+ * memfd_pin_folios_supported() - check if memfd_pin_folios() can pin a file
+ * @file: the file to check
+ *
+ * memfd_pin_folios() only accepts files backed by shmem or by hugetlb, so
+ * callers that have to validate a file before pinning it, or before taking a
+ * reference to it, can use this helper instead of duplicating the check.
+ *
+ * Return: true if @file may be passed to memfd_pin_folios().
+ */
+bool memfd_pin_folios_supported(struct file *file)
+{
+	return shmem_file(file) || is_file_hugepages(file);
+}
+EXPORT_SYMBOL_GPL(memfd_pin_folios_supported);
+
 /**
  * memfd_pin_folios() - pin folios associated with a memfd
  * @memfd:      the memfd whose folios are to be pinned
@@ -3493,7 +3509,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
 	if (!memfd)
 		return -EINVAL;
 
-	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
+	if (!memfd_pin_folios_supported(memfd))
 		return -EINVAL;
 
 	if (end >= i_size_read(file_inode(memfd)))
-- 
2.43.0


