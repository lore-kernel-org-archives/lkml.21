Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037833;
	b=QHdNuEoXRq+bxZzlvhre59fULdHSergcAYCQTYogoNTWEiGXYqryhHCVSHQl6wPTN1pc
	 2fx4F/iMn1KPbY/EIvxOZKhY73mMSL2ILR2OeOsbYREOyuxA/CFsD3YXYFsxNEE7JI+ws
	 p7U8AxWmyd1BJGNu8Tifm4riehM8EQ+yMqYwU/F7Y0rm3dA/xcX7d2zIfpuGM7wQkKKgD
	 aix1uLgXrO3aWYhidUx5bsNwb7hr4noE8P5v30X1p2dn23vgu3UeBk/O3gqc7cwxCD+wf
	 1VRB/pQUDOGJbv495CTzubaft8PjNuvDZRl/xNHUCrwRk9QFOSeb1+OiGF0lo7d7MbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vnbJtG27pIY995fyqbhJH3BDZH2+CKUmjSvhuUbO5lA=;
	b=GnSRmL5B9FLsPUAi9/nnlr3GXiLMNgArByKvcpqKYD3BYN8LmFvWqlvEpdY4E9wYduWt
	 1/kIB1RLNSTs17Gl7bvsXOAp4k5qZtShYTmnrpBlulwzF5ruZMiwe0EnfoSOHaUxh3x5L
	 mttxo30qaGoExvJpxv9K3CI0/jdqJsjpDSkHbQpq7aVtuTDkld/2ja+SFNOwmhkM5TPmR
	 1Y6AdjvnHanTU3Vfvil3mYZOZmfMqHPWoL1995m9ezdF4pfk2VJfAqce0OmiN60/Ejd3R
	 UHr1eYsnFfOZ43eXqOup55lIEXWmYj2M+OOJifK9LHZUkoYdmGSrNGsCjdgNYjYhkcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCEIiHK1;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CF3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCEIiHK1
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4e04eda5aso13528817b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795037832; x=1795642632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnbJtG27pIY995fyqbhJH3BDZH2+CKUmjSvhuUbO5lA=;
        b=rCEIiHK1j+9F+/7njnTEtrXp0zGyIP9MO667HkATGBYY//stBY4Nddtg87xJ/errRL
         LmNSNNg9qUTodUPHGJlbcwYe8UR3qL9JA8CEAj7EsNZbdjH2TVoz3OH2F1XPRJDFUbtc
         NOAZBXfIcWrklLeewObr/5D/UKth1lJnAeiaLuF1bmVaw5ZI8ByrOTf7ZjJEUe7LgEv0
         3k0CfKahU8pl5sUvVyVZXDH1uLJoI4EDl1mnLNuO7zSUDfTOFnyL6t4aSe+A4qmKR9Cu
         IzpL5cndaVmWZkYSvYsn+FqZ5buL2D5QWGv6W7SFXy4CVKPmCXwLcKXkPKNZ/+g5KTLC
         08kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037832; x=1795642632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnbJtG27pIY995fyqbhJH3BDZH2+CKUmjSvhuUbO5lA=;
        b=RMLJvoGllST4Z5p+TMpk+vexTBgWLeTh0lMHXC02CDFNaFbVLsJ5FvuFZWONuXx4ij
         1lf3rvLmwCfFlcsq7aOHHgD4wjKcEqEQYP1MtPKPj7tw13sBngsCD5OK6CRDfLyVyWjN
         VC/JXVLKNjNS/CTIyX6ciEtIZ4B/CswNu3meQYUUrQ7CRqMerALvtjhTF+eqHyvfusLh
         C0L4DFUjhfmP3f7Ne8zKzR6NPhS+bvEwupuZ4MdrCqYmUgskjN8h0YblCoiTKFL+307M
         +DMuaH5Y7SRj5PhCf+6DqRN+2R3b0mWOezjVSIByGo3iqb2l/Xo12P+nytwfAuhkRZhS
         EcVQ==
X-Forwarded-Encrypted: i=1; AL+hErEMVxwkURt80/hmDCowtSf6UJC0gL439O7o2Bnx1Y7KlLj0QW4wBcO/g6rlUkIi5I29ANR6RMVDvNJopk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PHhBJNPzXpuuLEoNSPWD4NJAkmCwLFA4Sg8edJRQ5oxarlBib
	PeRKofj7C0mSjHZq3xfWnJ2qVOLwf21sTZH+cSVgZiTVw95nOEfGOwu+
X-Gm-Gg: AZFdTZeNO1rtXskmvYc2hmq03x51BVXJLRvQIZiA10NCs6eLtbnEqqYGDV6U2LZEyUE
	T9ccVXdl6Ut5yETVqPstYbq3FxssFoem+xBF4FeBNoZL2f4IKQSFdaJW7HYpntZIt2r2iCxj6tt
	QsVMjK3qecFzv7NivwM0YhIyrykwEYu6Tptga+/AmwrFW8zr3Wuc8G8Q4Nfpk0G81gTgmpMzCXH
	3Ax4Tv1LgC5tsC2lY5Q1f9WYcoH2lh6RW28WkXMtiZQj7CvX52qPKmdoK02whdydi7oz+IYJEmI
	/maIIuJ1DUcq8FK33Z8Yl/CZfBJjrPBV59+iB5P80BsshAxLKJfSLhlzyR55Q1bLuUlM8dobaf7
	FTG1c/rO6HGuSejh+J3e6glsNMVLiTIQfIabpk2Z3cwT9MHIxxUu/3mQOhdlknxNH8EDcPIMuJb
	eMCWVQ7IbtU1/EhdEgrqGGsZCgmu3LrPnbgp1VZ210GJaY5QO0pnbIC4mQwD0FTceJEng3GIls1
	TeTJ5jMqNAR2hVzCYGawmLno+xuzsFEjNkFCGl+IBwgq6qwtF1o1cgvxcAGv5SNp9tbN4UJ4eTN
	kciRRj3npVap/OjT5IF0f2q+V96SQUmsscm+4+TURoM1JGOIcGwuynQ=
X-Received: by 2002:a05:690c:7486:b0:8b0:c71d:2b2b with SMTP id 00721157ae682-8b4fedae487mr20653577b3.45.1795037832273;
        Wed, 18 Nov 2026 13:37:12 -0800 (PST)
Received: from 5163NRD-SPrabh2.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030be2sm24565697b3.10.2026.11.18.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:37:11 -0800 (PST)
From: Swarna Prabhu <sw.prabhu6@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	viro@zeniv.linux.org.uk
Cc: linux-mm@kvack.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net,
	riel@surriel.com,
	yeoreum.yun@arm.com,
	hch@lst.de,
	Swarna Prabhu <s.prabhu@samsung.com>
Subject: [PATCH 5/5] iov_iter: extract bvecs of user-backed iters from folio ranges
Date: Wed, 18 Nov 2026 13:34:58 -0800
Message-ID: <20261118213458.377258-6-sw.prabhu6@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118213458.377258-1-sw.prabhu6@gmail.com>
References: <20261118213458.377258-1-sw.prabhu6@gmail.com>
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

From: Swarna Prabhu <s.prabhu@samsung.com>

iov_iter_extract_bvecs() pins a page array placed in the bvec array and
then walks it with get_contig_folio_len() to merge pages that turn out to
belong to the same folio back into one bvec.

For user-backed iterators, have GUP fill folio ranges straight into the
free part of the bvec array instead. A folio range has the same size as
a bvec and becomes exactly one bvec, so each range is converted in its own
slot and trimmed to the requested byte range on the way. This removes the
page array and the merging pass. Ranges that are not converted are still
folio ranges and are unpinned with their exact page count.

Since one range covers many pages, the number of pages pinned per call is
no longer limited to one page per bvec entry; it is bounded by the bvec
array, plus a cap on how many pages a single GUP-fast walk looks at.

Memory that is not backed by folios, such as pages a driver inserted
into a VM_MIXEDMAP vma, makes pin_user_folio_ranges_fast() fail with
-EOPNOTSUPP when no pages were pinned; such iterators fall back to the
page array path.

Each extraction requests at most 1024 pages, bounding the amount of work
performed by a single GUP call.

Block direct I/O picks this up through bio_iov_iter_get_pages() without
any change to the block layer.

Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
---
 lib/iov_iter.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index fa4fe2e92383..457e226c0251 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1919,6 +1919,95 @@ static unsigned int get_contig_folio_len(struct page **pages,
 
 #define PAGE_PTRS_PER_BVEC     (sizeof(struct bio_vec) / sizeof(struct page *))
 
+/*
+ * Upper limit on the number of pages a single GUP-fast walk is asked to look
+ * at to cap spending too much time in the GUP-fast path.
+ */
+#define EXTRACT_MAX_PAGES	1024
+
+/*
+ * Extract bvecs from a user-backed iterator.  GUP fills folio ranges straight
+ * into the free part of the bvec array, one range per run of consecutive pages
+ * of a folio.  A folio range has the same size as a bvec and turns into
+ * exactly one bvec, so each range is converted in its own slot.
+ *
+ * Returns -EOPNOTSUPP, with @iter left untouched, if the memory at the start of
+ * @iter is not backed by folios, so the caller can extract it as pages instead.
+ */
+static ssize_t iov_iter_extract_user_bvecs(struct iov_iter *iter,
+		struct bio_vec *bv, size_t max_size, unsigned short *nr_vecs,
+		unsigned short max_vecs, iov_iter_extraction_t extraction_flags)
+{
+	unsigned short entries_left = max_vecs - *nr_vecs;
+	unsigned int gup_flags = 0, nr_frs = 0, i;
+	unsigned long addr, nr_pages;
+	struct folio_range *frs;
+	size_t offset, left, len;
+	long res;
+
+	max_size = min_t(size_t, min_t(size_t, max_size, iter->count),
+			 MAX_RW_COUNT);
+	if (unlikely(!max_size))
+		return -EFAULT;
+	if (WARN_ON_ONCE(!entries_left))
+		return -ENOMEM;
+
+	if (iter->data_source == ITER_DEST)
+		gup_flags |= FOLL_WRITE;
+	if (extraction_flags & ITER_ALLOW_P2PDMA)
+		gup_flags |= FOLL_PCI_P2PDMA;
+	if (iter->nofault)
+		gup_flags |= FOLL_NOFAULT;
+
+	addr = first_iovec_segment(iter, &max_size);
+	offset = addr % PAGE_SIZE;
+	addr &= PAGE_MASK;
+	nr_pages = min_t(unsigned long,
+			 DIV_ROUND_UP(max_size + offset, PAGE_SIZE),
+			 EXTRACT_MAX_PAGES);
+
+	/*
+	 * Range i is converted into slot *nr_vecs + i, which is the memory it
+	 * lives in, so converting cannot overwrite a range that has not been
+	 * converted yet.
+	 */
+	BUILD_BUG_ON(sizeof(struct folio_range) != sizeof(struct bio_vec));
+	frs = (struct folio_range *)(bv + *nr_vecs);
+
+	res = pin_user_folio_ranges_fast(addr, nr_pages, gup_flags, frs,
+					 entries_left, &nr_frs);
+	if (unlikely(res <= 0))
+		return res ? res : -EFAULT;
+
+	/* We may have pinned fewer pages than asked for. */
+	max_size = min_t(size_t, max_size, res * PAGE_SIZE - offset);
+	iov_iter_advance(iter, max_size);
+
+	for (i = 0, left = max_size; left && i < nr_frs; i++) {
+		/* Copy it out first: bv[*nr_vecs] is the same memory as frs[i]. */
+		struct folio_range fr = frs[i];
+		struct page *page = folio_range_page(&fr);
+
+		if (*nr_vecs > 0 &&
+		    !zone_device_pages_have_same_pgmap(bv[*nr_vecs - 1].bv_page,
+						       page))
+			break;
+
+		len = min(folio_range_size(&fr) - offset, left);
+		bvec_set_folio(&bv[(*nr_vecs)++], fr.folio, len,
+			       folio_range_offset(&fr) + offset);
+		left -= len;
+		offset = 0;
+	}
+
+	/* Not overwritten, so still folio ranges; no-op once i == nr_frs. */
+	if (unlikely(i < nr_frs))
+		unpin_user_folio_ranges(&frs[i], nr_frs - i);
+
+	iov_iter_revert(iter, left);
+	return max_size - left;
+}
+
 /**
  * iov_iter_extract_bvecs - Extract bvecs from an iterator
  * @iter:	the iterator to extract from
@@ -1966,6 +2055,17 @@ ssize_t iov_iter_extract_bvecs(struct iov_iter *iter, struct bio_vec *bv,
 		return -EINVAL;
 	}
 
+	if (likely(user_backed_iter(iter))) {
+		size = iov_iter_extract_user_bvecs(iter, bv, max_size, nr_vecs,
+						   max_vecs, extraction_flags);
+		/*
+		 * Memory that is not backed by folios cannot be pinned as folio
+		 * ranges; fall back to pinning it as an array of pages.
+		 */
+		if (size != -EOPNOTSUPP)
+			return size;
+	}
+
 	/*
 	 * Move page array up in the allocated memory for the bio vecs as far as
 	 * possible so that we can start filling biovecs from the beginning
-- 
2.53.0

