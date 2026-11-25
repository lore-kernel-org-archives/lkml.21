Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635340;
	b=WDZmQg88NjFMvT4fmzU4vGeAVLSCcoomo+D7byqPajcc5KkaV2h0gp5RILTGLFjeXoxV
	 LBgQTOJzT6u21wq4DuG6PdIdjSqT8PFrdBB/FALiKDuqwQu1aXrl2AOKlI3kIISlqEWta
	 wUQFm2xDd8MUCvZBv0GdALtcMgbE4Nfl7n6yC0NoLKS/YcCufw5igNQifPJ+e9AzV5rMz
	 uMGj8miiN90cVwDBh+r1k8QcuSxIYexcn2a79M4lln4rMFif41k0PPFJvL5KvRCVgtTLX
	 HiSJHTbAoZTvRc553xdc/ZfKfaSRpdjf0kDocxunwL2zTBwn6qdnPfeU0FkawUgdccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635340;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1+q8Ae8jrmk6bl1RZ8HU+lLzzarRDFRRVfcZbA9EG7A=;
	b=gI8S28N3cloIVC+ge1JnfZ0qVvSsgTODFdwCmFP0ZI5eFGT4MecDjBP17vjImCQJXkiq
	 ZQrBJtvHFndas13Ppk48V+FtcvS/fJHMz/JJog/RXy6sVBIUNiIXKfcvS/GYnQtsd76wC
	 IImdyQSufrG32N6U5cQCJPWau+QS/oknhwsXfiy2IZP69DLhjbi+qeepdgiT4qbXOGSK9
	 CQnq2Hyii6FJ7id+5vPtEyW458KvuGzsbkgPab1K+X2QhICr0r8j39JCFt0Cq7ienDrgk
	 xC9m5S/fzr8krhdhNAETLkQLkVkCdsD2XF01GbXr+DUG38FHg9EbUBQ69l0CSLXJpKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/ceNiVh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF1606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/ceNiVh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E451F000C0;
	Wed, 25 Nov 2026 19:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795635339;
	bh=1+q8Ae8jrmk6bl1RZ8HU+lLzzarRDFRRVfcZbA9EG7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P/ceNiVhDJLD3/PE2I5MF5FhfA5XeBvr5g4afuA0grVD9p4t8hiLhiZYCQfuTgXdL
	 VKRHeOcHflA78hCJ45L8CnZIctQN7tsD7U4Pf6z4YMZKOdSs3I/xzfHcWU1VOyacd7
	 RLcRGz4jqFahEksVBHHxvVZ0//JqJuuUCcticaVwPbU6pKbWQbyJ14tmWSVE0mrpOJ
	 AkLmfgKwW7zOAvSJ6rtl3rV/sw7emhNPquB4alY9lYgVs7/13RozydoGSg1YuYvS4o
	 loBYqpVEyWo6GLE6j0/Nt0CN8sWyPzQm4Uti4RXptZk43r5Q3X0R5HUM01+ulg5zZx
	 U0n1LWvIaU25w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 25 Nov 2026 20:35:13 +0100
Subject: [PATCH 2/3] mm/slab: document that sheaf refill does not require
 blocking
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
Message-Id: <20261125-sheaf-doc-update-v1-2-4a579abaf0b8@kernel.org>
References: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
In-Reply-To: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=UUoIQIX/nTFV93t7aBOUbv6O6X4z36KqrPowG4bzXV0=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrBzh3ZRYxLd4WnjeFJADAC4QrbE37PzmR90lE1
 cwPScODTQ+JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawc4dwAKCRD6UCkIqsW9
 0PNoD/93WPS9i0upZdhEO+HxgMQw2zhsyRpd23tKdakOrU87REPm8r+7wyIDV3ela/Mn6erYxe9
 tbiq7/bySizW//XOKq9AziEZ0FULPBtZpZiYE8FvDyFRIwQDXQjXm8s81SabVxsPxMyvoniHtzI
 +8W3FrnIvK5Ptr0GJ8Mh61TAH8FCKTkmRfxIN5X+tjVx4bK65UkQrY/93jw8RQaHwwDFP5gapP/
 L82FzgCNApHmIm1FDB6b1vWr1WJ5uB8tj8PewyF/mpch6kcEtzcu/y5zIOzHzcDkMQYlNHQhkUu
 HGxWil3dIZBpqo2ljiuiIBH/A79J2mlKWW6Njrku08cJVoIdfr62+cQZ9dV7sWMjQtBZu7uvtWF
 TlvUI+HqmHibyGrrAmZEe0Ay2bpiJHp1dILaYVcIFCOBLbbGa3RPVm+ZeeyHjfkz+Du52duScFl
 csulaEIR5dO29Sa01m3N7UYa+1EbYF3TEnulbiDBOaVcXdBXG2duUik8P0TbbLsYxxGCsLtnRZO
 R4Ismylr9lWbil54nN775OBRfIqRa6SxQkPi71dfkVc+NvrH3rgT0qvjO+HWA3PkuY1O2IOhX4B
 T2eBQHC9o/w5He8rMPc7TsVWECnQXGzc6Glfr5rirUA42fsG+RG5/qJqZCP8LjCS3JPHcWWgfGC
 2eb8sTuJRKIhmtg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The documentation of the sheaf_capacity member of struct kmem_cache_args
states that when no full sheaf is available, a sheaf is only allocated and
filled if the gfp flags allow blocking, and that the allocation otherwise
falls back to allocating a single object from a slab.

This has not been the case since commit fb1091febd66 ("mm/slab: allow sheaf
refill if blocking is not allowed"). __pcs_replace_empty_main() now refills
a sheaf whenever spinning is allowed. Only kmalloc_nolock() disallows
spinning, and it allocates from the kmalloc caches, so for caches created
with kmem_cache_create() the refill is attempted regardless of the gfp
flags.

Drop the condition from the documentation, and describe the fallback as
what happens when the sheaf cannot be allocated or filled.

Fixes: fb1091febd66 ("mm/slab: allow sheaf refill if blocking is not allowed")
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 include/linux/slab.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 64daeb239f78..8f484e1edcd2 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -358,10 +358,10 @@ struct kmem_cache_args {
 	 * that may be not present. When both become empty, there's an attempt
 	 * to replace an empty sheaf with a full sheaf from the per-node barn.
 	 *
-	 * When no full sheaf is available, and gfp flags allow blocking, a
-	 * sheaf is allocated and filled from slab(s) using bulk allocation.
-	 * Otherwise the allocation falls back to the normal operation
-	 * allocating a single object from a slab.
+	 * When no full sheaf is available, a sheaf is allocated and filled
+	 * from slab(s) using bulk allocation. If that fails, the allocation
+	 * falls back to the normal operation allocating a single object from
+	 * a slab.
 	 *
 	 * Analogically when freeing and both percpu sheaves are full, the barn
 	 * may replace it with an empty sheaf, unless it's over capacity. In

-- 
2.54.0


