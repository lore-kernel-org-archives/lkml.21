Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077680;
	b=HzkvHdgOY7bsA7gKvs5RuGkhlZAnXoQ4pdxuk2qE1N4yWjUuloPQTxvJq8wHEN/upZld
	 HU5PK/LNUED1qouIFMysVx12zvL1mU36zEGu5agsiwOlwJfxZiiCDpE5DgDJxb6XsSHAr
	 ++SJOb/9hoxco/38+MXqUPkEPi2X+V/37JpuKePyp8RfZEmXeEvkmlw9F9vRtvyn7INwm
	 s9PLsSnphotzMr6ggWxaZ3LbUzWGzGjPpXJ830dKihQz8VbE9SWKdlU2ICq1zBjepp+/9
	 7370X+iwJ7UKsdHJb/aCoZxVL7Wc/rnb9bTkV1mVT3QHuRapDHEgdrnItUXymfW/UDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077680;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xeb9CD9rO2tE9rfmH1/C/gNkKUtqkCGTaZwTcZpzUCs=;
	b=FvePQaR4/3EQWwY0KKfKUW5kye5tJcJQdKrC74Aw47INnOmpzHN5BRkBXfmUfNYYTvTo
	 wZoU9J82djZuL8rCKES8XIbUEN1wjXv1U/7if9hjIH7r39QiPzC7iJYvVSSoRFu5xYrSD
	 ALEtH4qnCuAa6+vE0Ge6l5DymW66WR/ICqF5eTDu0d8VeusSb6iQrpOjZ3bERIg10T9CS
	 0dTs/9NKNiBE+oq55R3WghLZqTDEO77gaTdyDwa/AshrqEc2Klyy4KPwif8dPgzTHUaKk
	 qcqHpr9Nii05fI3mHSTdv0HXckZwHj1Q3SzGH9FghroMSeFNnZRRxllMx0pwHSzektQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Wd7lhLdU;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07946606AEE3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07946606AEE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Wd7lhLdU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Wd7lhLdU1sVDHkkhYxxPudbxV7+r2zeEXfb+Qb/MgjXkksQ9pi6YEoM/jpJi7gRDb7GbmT+ydezEL
	 3G6oUEgEhM9qXLr4AeHMfRhHdv4x5C00Lmy0T48vXcXOQ1CwI06LAk2sseON5zekYVh4a9lrOrhr8x
	 dc5FwACs8VDYil60=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afeb600ed5-5846d;
	Thu, 19 Nov 2026 16:40:33 +0800 (CST)
X-RM-TRANSID:2ee26afeb600ed5-5846d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76afeb5ffb3e-f6799;
	Thu, 19 Nov 2026 16:40:32 +0800 (CST)
X-RM-TRANSID:2ee76afeb5ffb3e-f6799
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Samiullah Khawaja <skhawaja@google.com>,
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com, Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: [PATCH v2 2/2] iommufd: only hold references to files memfd_pin_folios() can pin
Date: Thu, 19 Nov 2026 16:35:31 +0800
Message-ID: <20261119163531.315791-1-xujiahao@cmss.chinamobile.com>
In-Reply-To: <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>
References: <20261119163531.788514-1-xujiahao@cmss.chinamobile.com> <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>
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

iopt_map_file_pages() stores a reference to the file passed to
IOMMU_IOAS_MAP_FILE in the iopt_pages of the new mapping:

	iopt_map_file_pages()
	  iopt_alloc_file_pages()
	    pages->file = get_file(file)

iopt_release_pages() drops that reference only when the iopt_pages is
destroyed, which for a file mapping happens while the iommufd file is
being torn down.  Nothing restricts which file can be passed, so
userspace can map the iommufd file itself, or a vfio device fd bound to
the same iommufd, both of which own an iommufd_ctx reference.  The
reference graph then contains a cycle and the file, the iopt_pages, the
IOAS and the iommufd_ctx are all leaked; kmemleak reports it as
"memory leak in path_openat" with the holder taken through
iopt_map_file_pages().

Reverse the test instead of trying to enumerate the files that own an
iommufd_ctx: accept only the files that memfd_pin_folios() is able to
pin, which is exactly the set of files the mapping can be built from.
file_is_memfd_compatible() reports that set, so the same test can run
here before the reference is handed to iopt_pages.  dma-bufs are
unaffected: they are taken by the dma_buf_get() branch above and never
reach the file branch, and iopt_pages holds the dma_buf there, not a
struct file.

Fixes: f4986a72d6e4 ("iommufd: Add IOMMU_IOAS_MAP_FILE")
Reported-by: syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7666ed2c3d42196bf7e3
Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
---
v2:
 - Call an exported mm helper instead of shmem_file(): shmem_file()
   became an out-of-line function in mm/shmem.c that is not exported, so
   calling it from iommufd.ko failed at modpost with "symbol 'shmem_file'
   undefined!".  Reported by Jason Gunthorpe.
 - Use file_is_memfd_compatible(), renamed from
   memfd_pin_folios_supported() as suggested by David Hildenbrand.
v1: https://lore.kernel.org/all/20261119104417.459962-1-xujiahao@cmss.chinamobile.com/
---
 drivers/iommu/iommufd/io_pagetable.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 5ac736cf5..c9aad275f 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -515,6 +515,18 @@ int iopt_map_file_pages(struct iommufd_ctx *ictx, struct io_pagetable *iopt,
 		if (!file)
 			return -EBADF;
 
+		/*
+		 * iopt_pages keeps a reference to the file until the mapping is
+		 * destroyed, so only accept the files memfd_pin_folios() is able
+		 * to pin.  Any other fd, in particular one that itself owns an
+		 * iommufd_ctx (iommufd, vfio, ...), would put the file into a
+		 * reference cycle with this iommufd and never be released.
+		 */
+		if (!file_is_memfd_compatible(file)) {
+			fput(file);
+			return -EINVAL;
+		}
+
 		pages = iopt_alloc_file_pages(file, start_byte, start, length,
 					      iommu_prot & IOMMU_WRITE);
 		fput(file);
-- 
2.43.0


