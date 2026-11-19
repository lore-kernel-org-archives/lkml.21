Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064687;
	b=nuF0Prj/m2kmQI/1u/q486GxN0x831I5BLdz0fQBqDvheenU0EXu5eDkgOnhd5GhSrXK
	 vEhqZrSDr9bNRxCXocRCrigGF4/oW5N1zieYRfmEZxcuG73HWhTCL8tGZiEjS9R2sCMDx
	 AIAAOOpg1oTSAcUPeNm4iuGD9Xdzrs9IQmFHMv6bLwQOM31osHcygDKRUYhuUxjZ4tUTJ
	 d9VvL8EzpLI2S3NmxCO98YXjvLlezsb9V7D1hth87sBVQfCe4Ho0OjHiDDfDK+oCnRESc
	 PgE48RXHy/Bh2ST2epizQ4esjbt+RV9X5Y1kv6by3rtFXe0bQCiD1JSX9mErCUkEbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064687;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z46ZwabXBcpTEJRysA4syBAZyQggGPY6SIVcMl/gSzA=;
	b=mKphRYvDzHPbxAitUczqthpeL4cDRrbZ+Jv7Ss/CzXzwtBdO1tAvRCzsmAIZ5ppPOXS5
	 dRFoy6T2nzpgzY3epEoV+TDY7SaIczFiJEP9hn8ZO2B2YVXOpLf1/8Li3HHwVt4av7cSB
	 d+n5Ta4LcDOgfqnP55NvnP6ySgP9ZQBLQK2wQdDOnKxWISGsdBOEDq3x/YlmTtn5XN/fo
	 yG/OZ0vG9mDff6AIaLvo+i/SIFqmNk1jlDTSI28kEFYegdaqFDm68D+7vbAuFRwlENfQz
	 1oNdWzIwoiZh4qMvmPDyJxsiEnPebeTTgi3IbbvjeLV4uQ6LW5o9d9D1h+Ei8ia9K7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jw8sxUCR;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADF606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AADF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jw8sxUCR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=z46ZwabXBcpTEJRysA4syBAZyQggGPY6SIVcMl/gSzA=; b=jw8sxUCRZV2mnC/1yKDJLOx/HJ
	881fBMn/0DnhOvuaERrcQvPtBSn+Zep2vUuIjI5T5+0JzhfjoQ6m32FBZTAZc6BQTJPWu6Nhw9HqN
	xC+9+rEiPgaP0RsRDNYhETDLFWpx9/LGhr0XYL4dBQYyjLIafd/k74ZJxYY+H/Ixrrc4KIz8Mtyu2
	qQ4iFkRpFuN5NfytEsOAYjka8jVylbXTaaHmEwTOpOf3wWyLLXf7CEyD9GVsjtNNrcmNR+trK7J39
	n3LMO73Ipqwxgd9zSQXhUXZgkQ4OWFvHzCne6Q3nNZAbYyyW3Q0oqA3TU34f+jmHw+/UZE4H6yRFA
	n1FXjczA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuKD-0000000ArIo-3pDj;
	Thu, 19 Nov 2026 05:04:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 01/12] docs: ioctl-number: update MM entries
Date: Wed, 18 Nov 2026 21:04:26 -0800
Message-ID: <20261119050444.249752-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119050444.249752-1-rdunlap@infradead.org>
References: <20261119050444.249752-1-rdunlap@infradead.org>
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

Add ioctl number entries for test_hmm_uapi and gup_test.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

[Since having multiple maintainers trying to merge these would
cause some conflicts, it would be more manageable for Jon to
take all of these through the docs-next tree.]

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: linux-mm@kvack.org

 Documentation/userspace-api/ioctl/ioctl-number.rst |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20261111.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20261111/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -147,6 +147,8 @@ Code  Seq#    Include File
 'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                              conflict!
 'H'   00-7F  linux/hiddev.h                                            conflict!
 'H'   00-0F  linux/hidraw.h                                            conflict!
+'H'   00-0F  lib/test_hmm_uapi.h                                       conflict!
+                                                                       <mailto:linux-mm@kvack.org>
 'H'   01     linux/mei.h                                               conflict!
 'H'   02     linux/mei.h                                               conflict!
 'H'   03     linux/mei.h                                               conflict!
@@ -252,6 +254,8 @@ Code  Seq#    Include File
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
 'g'   20-2F  linux/usb/g_printer.h
+'g'   01-0F  mm/gup_test.h                                             conflict!
+                                                                       <mailto:linux-mm@kvack.org>
 'h'   00-7F                                                            conflict! Charon filesystem
                                                                        <mailto:zapman@interlan.net>
 'h'   00-1F  linux/hpet.h                                              conflict!
