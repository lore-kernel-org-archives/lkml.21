Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205041;
	b=cSVzG7alIfRLsb2xFPiRNTeMNUKVXjw9MyYjYIwOJor0CRocv7p/uOUyIDbSqBDjEv28
	 3HzYRmmUrVcB+xzirTfJGBCyIgB5AbPNeOoXDeYWLa1H0c7caZmxQNam6EMFRyTND0tEu
	 RpWERrTGDT7ilAEDBOuCwAfL3Hmz4G7L8XRoqSGLbOb7QT4neu9qjvLoQd3zstHkVH7zC
	 JpCENaA6eu6rK+6PUSavYMM2dmQJCA2yxL8ROEMlG9X4k55h8TpYjJuN93IviMfLjsO0k
	 +yyXvg9UGW5aLiWfSoW5SXr42FU+mmmbb/XyTu0Rntw90MBV7QieC7tqTzjHddgTnmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sJNN+wbVdYmGniuurEFfsOta20znKmxlY/TD8nCl7To=;
	b=45uU81E/bGrjP2vTjih+mS/vNUQQ0Hv+KrwebD0QlQVD620nvg95lTgky8A9xaMhlzpM
	 QRMDc4hM1PqeS3J5YeJ10HmRb5s+ymU0XhuCnmE41A2YvNhAy0uugcIZM0rZIQ/1J28J7
	 cJxPA3C45CoXd4Athf5JlNtp1jXJc8Ov1e/ZGbC2muR/+NK8+BQju1t+qJrzCMRLCs31C
	 1ddZBAeBqYbQvY71EyS2Gz/B+Rnrm+xLFFfpwr79uVnYj07IcFkKdGcsNzwjCzHctSlvB
	 Bd3QwgTE/YhjDOGe3AbQZ23E1NBnopNJg0NeUzm9znXlbVC8g51fzthWIWh36SzoiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pCCSpnsn;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18F3606A6E0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18F3606A6E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pCCSpnsn
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9f6a16afcso13195ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205037; x=1795809837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJNN+wbVdYmGniuurEFfsOta20znKmxlY/TD8nCl7To=;
        b=pCCSpnsn5UTeXeLPSQL2V2ebtkoTM8FQgsayaZoK4gFJ9wV7Oi+vrGaHghOxp5zfKD
         QfRk7opgNX486b10C6YZsGyFqmxOzXmmLMxbsoJ1krERbcyeYM9HihYya1b3V9vkpPTn
         /uE9BZDJ4TP3Zo1rmggqPKBItl/5GPt5Yn7ptm2Fzv4nmzFTjOord9Vm/Cc6AozOKH0X
         4ZB0gVHkIfDTiAy2Rz7DPEHbeGDeajheoum9gEUgNY0D4p5FE+KUutKFzscMOFdkD4hK
         DPI8QNaGvEOEAJ6SvDaWN4s71SVEaq0sHSTzsMRQsTcdWL7eHMz7GlAJbO2CGNog58Xu
         RgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205037; x=1795809837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJNN+wbVdYmGniuurEFfsOta20znKmxlY/TD8nCl7To=;
        b=sS4eTo0JbeIWf0MvrTHVVkKzMaDXxlZh35zCbrmQjdJvbeVevrXJ95pZny0FNafUAV
         rOka956oVlxx3JR9in/CAvxs8CPBl97lEVmWAyopZqwcVa0ltG7/fKnXPCPky22SjMWK
         LPU1nE6//5eGOu1Jy7mWX6Vq2gSq8XLE70X/e215UUI40BU9dS66D/dYMgaSTpdkG2uf
         7If4mBSheC20iEJIAGvBEhB96iZxnuGsPHEMrkFI3tSKPaqKXbebBhD9+yZF78EBLxSG
         gOgvos7riDEp7imK/gIoatgO2SndPT0DL+1HNAkkpZBT1f75tMXvfTF+T3JhQG7hIuT5
         RC8g==
X-Forwarded-Encrypted: i=1; AL+hErGAYO25N2PG9Q6MABavEtoHBAOC48NNKmilK/xVFMdOqJXZ3m9SNzC546VAFXqkd5Leuh+MWJBG0XiZtkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89RqjIvAiH8Wy2zt4PwtfSDydGbSNQfunjtFu/6QwGsF/Y9RG4
	rxC/RNLpnUOoakvO52g0eBlKTKRl/a++0Vfnn8QWULjmQdeaCmpcM7aKZTuXVCsKoQ==
X-Gm-Gg: AZFdTZeJ+ZjQDV+sLDrjI4390Ei2ON9aBmvF0T+DBP4wfiP0IiaOMOTT2zkeJvVB2zZ
	UPUlO/SAGMvCirilMnAz5N7x9GUKPgp5DzU5C7qbhNf0Htca2WOnvbv42RBDzlvOLKOcPafLTeJ
	xI4i778ZAWMoheCvxaz7Y/ccse7KKxcCAMxAn5OxNbYTCc73euJaMJ1hYqLVvEKAUObY4n3+i3j
	iRJiVr/GsCq7v7u44FJcc5lz4F8CIl72A7KD/Kth6ij3LVUsdepin3d0ONKF3Cr9fgbDwuyC2/C
	U1m+Wy37BghEibCGdCXgQg8xyaE8++3fthuqy5qghKxsmoNGHkrAvMlhdqoVhftRXh9/W4Eu40c
	poLK1gv3xqDv7GzMxNarT17TZz0+2gzd0wVhvFkIOYwxmgd5nXHM6XfPWiLeldEGjlF25+uLLCI
	HugggJRmbtiE58rDVB7mnBvsbWrm8zLr6krPiUWd5lRIs9biBSTZ0XlhkwFV+yskqnggJEewf/R
	iMaqmzYn2cPQdSFH9301h0Qe2nIOKzQfVXdCn58IdXnT1qdxxcGMlfV4RNRl66kIbQ4Uny2PdK6
	GlonaTbjSgYjY3LXq9sLaXgnPCmvg1q8iALbaa2drND2yVdaBq/uwO3Ajg+IMgK3jzlqkIhE113
	bqrqRLEwXUk0ll9D57i1Z6g==
X-Received: by 2002:a17:902:f70e:b0:2eb:19f0:6e2a with SMTP id d9443c01a7336-2f06242bd5dmr601345ad.8.1795205036492;
        Fri, 20 Nov 2026 12:03:56 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm9122188a91.8.2026.11.20.12.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:03:54 -0800 (PST)
Date: Fri, 20 Nov 2026 20:03:51 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jiahao Xu <xujiahao@cmss.chinamobile.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Subject: Re: [PATCH v2 1/2] mm/gup: add file_is_memfd_compatible() helper
Message-ID: <awCnnKfv64IyriEW@google.com>
References: <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>

On Thu, Nov 19, 2026 at 04:35:31PM +0800, Jiahao Xu wrote:
>memfd_pin_folios() accepts only shmem and file-hugetlb files and enforces
>that inline with shmem_file() and is_file_hugepages().  A caller that has
>to know up front whether a file may be handed to memfd_pin_folios()
>cannot use those predicates: since d3710111839d ("mm/shmem: make
>shmem_file() check the file's inode") shmem_file() is an out-of-line
>function in mm/shmem.c which is not exported, so modules cannot call it,
>and is_file_hugepages() on its own is not the same question.
>
>Provide the check as an exported helper next to memfd_pin_folios() and
>use it inside memfd_pin_folios() itself, so that a single place decides
>which files may be pinned.
>
>Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
>---
>v2:
> - Rename memfd_pin_folios_supported() to file_is_memfd_compatible(),
>   suggested by David Hildenbrand: the predicate asks about the file, not
>   about the memfd interface.
>v1: https://lore.kernel.org/all/20261119104417.312237-1-xujiahao@cmss.chinamobile.com/
>---
> include/linux/mm.h |  1 +
> mm/gup.c           | 23 ++++++++++++++++++++++-
> 2 files changed, 23 insertions(+), 1 deletion(-)
>
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index 040cff643..dffcc0b5a 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -3600,6 +3600,7 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
> long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
> 		      struct folio **folios, unsigned int max_folios,
> 		      pgoff_t *offset);
>+bool file_is_memfd_compatible(struct file *file);
> int folio_add_pins(struct folio *folio, unsigned int pins);
>
> int get_user_pages_fast(unsigned long start, int nr_pages,
>diff --git a/mm/gup.c b/mm/gup.c
>index 7605da0e0..da8a2c29b 100644
>--- a/mm/gup.c
>+++ b/mm/gup.c
>@@ -3449,6 +3449,27 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
> }
> EXPORT_SYMBOL(pin_user_pages_unlocked);
>
>+/**
>+ * file_is_memfd_compatible() - check if a file may be used with
>+ *				memfd_pin_folios()
>+ * @file: the file to check
>+ *
>+ * memfd_pin_folios() only accepts files backed by shmem or by hugetlb.
>+ * This is wider than "is a memfd": every shmem file matches, not only the
>+ * unlinked ones memfd_create() produces, and file-hugetlb files are not
>+ * memfds at all.
>+ *
>+ * Callers that have to validate a file before pinning it, or before taking
>+ * a reference to it, can use this helper instead of duplicating the check.
>+ *
>+ * Return: true if @file may be passed to memfd_pin_folios().
>+ */
>+bool file_is_memfd_compatible(struct file *file)
>+{
>+	return shmem_file(file) || is_file_hugepages(file);
>+}
>+EXPORT_SYMBOL_GPL(file_is_memfd_compatible);
>+
> /**
>  * memfd_pin_folios() - pin folios associated with a memfd
>  * @memfd:      the memfd whose folios are to be pinned
>@@ -3493,7 +3514,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
> 	if (!memfd)
> 		return -EINVAL;
>
>-	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
>+	if (!file_is_memfd_compatible(memfd))
> 		return -EINVAL;
>
> 	if (end >= i_size_read(file_inode(memfd)))
>-- 
>2.43.0
>
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
