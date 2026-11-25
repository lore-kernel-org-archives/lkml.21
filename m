Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635343;
	b=xOZXA1DRM3YfBwN6YeZBX/12G132UCfWnNgqtV+/vqGo/b7rzMneYtCmxOncTJ11VrDn
	 YGqyhY8G9G11AxEooxImEuMVRGkhswQ1Gj+he71xVeej7ESn3Kft7XhgRAQJx6CbXtMT/
	 qH+Fw67sLjYvRbXiGDI8//yeSrGwlAXUQkKsBkjO9phBTJDfALOPV3/25x+IKEVwh9LkT
	 7UI6lxbR5wFJI2MQy7lqG9DwQJybPo4fVwWmXgSkMIUC+LOunZovxjCVhr53PJPeLoPRt
	 7ReB6EMJJ/H1BJkHVTMhP1YsFT3z/lVolnAZeGB7GEn0alOiB3NIjcS9QzykzyTdH/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635343;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bl6ud81CkF4X8slN2gxlMoZUcM+itrD3ts59TVh3d9s=;
	b=czqSZOg/nx29VFIfzF6vw/3YUXqUYcPJEGpNSa/a7yVz6ljKR5/Syk66rmE/wmsmEn4K
	 yVti2d1SdQ9hU6RdeFVkfCPyy+p2pRqQimBXw4kS7rLGFi4gSjWLyaBxazDiFnBivW/9u
	 nSCxiOzI8zQ57teptf6UEQUyim7X83cwEYCaO9OAgSEvPCrcPB4J6E6LsNpP0wKnpsg/L
	 RNDV7i0vWCJ8Q5ebIQlAC03ZTABIXf5VX3I/yFlz4pRUAmXJKjECKwJXaRaK0IPsyHwDV
	 mOBZT0vSVpOGcMYyDuFYnyDwRZWrLQy5C4xEoL6SjE/J9qelHXMJdCizCLB44t88Pjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCvThTcf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471A606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCvThTcf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5341F000CF;
	Wed, 25 Nov 2026 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795635342;
	bh=bl6ud81CkF4X8slN2gxlMoZUcM+itrD3ts59TVh3d9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UCvThTcfkLqcNquO62sVbpRnRFnDeJcWYrDOsYdGdggtj1XDXUgpHJjSyrrmNWyGK
	 F7RXOgsMh7v3en8oiH1q5NzhjJKTP4AXozUjeYGEw/cSKe6Vq6EWLhTALocukOHRED
	 TU0QbBIdrhuHYEqpKms3adX//ZLqJjlpIzD6wICAs4emB/vWbNXrjftj80Q/GATZy1
	 pGvrbH4lH1r7Ep5sP6ypHZusLswB519SxJNEaMC5c47FWmdtEpGivWXlTB7K42KK0G
	 3+4vbSHZ0aySjr5Zck4Gde5gWT4h6Rx42X8ItdMaJLiiGhTH49orBiJWS9qmwzzl9c
	 KNeNjKO6TNxRA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 25 Nov 2026 20:35:12 +0100
Subject: [PATCH 1/3] mm/slab: update the documentation of sheaf_capacity
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
Message-Id: <20261125-sheaf-doc-update-v1-1-4a579abaf0b8@kernel.org>
References: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
In-Reply-To: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, stable+noautosel@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3596; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=yG94NeQum/ZZ+SaP0cht5yNDs6BMPBqt7GNNKhBTgdk=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrBzh2XxhN3+C6LXD8CUKJRMBrrroDfZlOzxAkQ
 8d4TqnJJdWJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawc4dgAKCRD6UCkIqsW9
 0PDcD/9k6HWaWfLUXNtskwy1Gw5C/zatYSwV2CabQM1kk9PROCn3kF+jJJyhdRiuLpfCRWLirSX
 WugN4/H637U0FbxheHgJWF4bxhC9Qzt9LbqrplDVRQwxdwhbKQZYaz5ma6wd2ruDc/0WwnWsltG
 BLxjY2u5qViAeOA/nA4NIpjegYZF33nDAdtNwh4ZtgJ9L0J7fHugwXDKGNKJyoyn4h34CLvnqSL
 d/C8PMD79yD/jsgK0l02cLjETsx+NlpRDfrVwdPfXRfppT7MTa2ZuIT1irACx2yDuwrbFZEmhkE
 a85WIML4Rr4kwX9bu26hA0osBR03jBEBZPHvFHxP5iUifDInmwElJPNXAD2AVJM5BXPdHvKwh4P
 fTBD4RO6GMY/19gpu+jYaZANIgzidVlb0jzDwO3uCeMEKZR10gPeuy2fCU2vPDjV2rblA7fMw7b
 dPt2AUHjNa4j3WHbj1xPumo5iHb1qBSOugZx+36iHaFH+W6f5lj9p5fFSAknUlKuLJd1NIR4UyO
 uIo6rajWET4VAWknZMrdzuA6zdoKZaWqcckF54rjzlr9Z0P+3yh9sQDJIcMf4rX/GoOzz6jTVA5
 SD1wKI9J4ttitEIqz7IRXnA5j5iRzlwZ0zrMfp2oVik3sXDHU1G+OXrks9QbxggrRe++8rlQoaX
 pgZMD5vGuPcyFAw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The documentation of the sheaf_capacity member of struct kmem_cache_args
describes sheaves as an opt-in feature: a non-zero value enables sheaves of
the given capacity, and zero means that no sheaves are created.

This has not been the case since sheaves were added to most caches.
calculate_sheaf_capacity() now calculates a capacity from the object size
for all caches and returns the larger of that and the requested capacity.
The requested capacity is thus a minimum, and zero selects the calculated
capacity, as pointed out in [1].

Update the documentation to match. While at it, mention that a non-zero
value makes the cache unmergeable, that the requested capacity is also not
used when slab_tiny is enabled, and refer to the debugging parameter by its
current name, slab_debug.

The updated text refers to the slab_tiny boot parameter, which older
kernels do not have, so exclude the patch from stable autoselection.

Fixes: e47c897a2949 ("slab: add sheaves to most caches")
Cc: <stable+noautosel@kernel.org> # slab_tiny is not in older kernels
Link: https://lore.kernel.org/r/8a73da1c-0167-4aa5-a62c-4190327685cd@kernel.org [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 include/linux/slab.h | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index ad645967a3ee..64daeb239f78 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -351,13 +351,12 @@ struct kmem_cache_args {
 	 */
 	void (*ctor)(void *);
 	/**
-	 * @sheaf_capacity: Enable sheaves of given capacity for the cache.
+	 * @sheaf_capacity: Minimum capacity of the sheaves of the cache.
 	 *
-	 * With a non-zero value, allocations from the cache go through caching
-	 * arrays called sheaves. Each cpu has a main sheaf that's always
-	 * present, and a spare sheaf that may be not present. When both become
-	 * empty, there's an attempt to replace an empty sheaf with a full sheaf
-	 * from the per-node barn.
+	 * Allocations from the cache go through caching arrays called sheaves.
+	 * Each cpu has a main sheaf that's always present, and a spare sheaf
+	 * that may be not present. When both become empty, there's an attempt
+	 * to replace an empty sheaf with a full sheaf from the per-node barn.
 	 *
 	 * When no full sheaf is available, and gfp flags allow blocking, a
 	 * sheaf is allocated and filled from slab(s) using bulk allocation.
@@ -375,10 +374,19 @@ struct kmem_cache_args {
 	 * Bulk allocation and free operations also try to use the cpu sheaves
 	 * and barn, but fallback to using slab pages directly.
 	 *
-	 * When slub_debug is enabled for the cache, the sheaf_capacity argument
-	 * is ignored.
+	 * The allocator selects a default capacity for the sheaves based on the
+	 * size of the objects in the cache, with larger objects giving a lower
+	 * capacity. With a non-zero value, the capacity is at least the given
+	 * value. Use this to match the expected maximum size passed to
+	 * kmem_cache_prefill_sheaf(), to avoid low-performance oversize
+	 * sheaves. A cache created with a non-zero value is not merged with
+	 * other caches.
 	 *
-	 * %0 means no sheaves will be created.
+	 * When slab_tiny is enabled, or when slab_debug is enabled for the
+	 * cache, no percpu sheaves are created and the requested capacity is
+	 * not used. A non-zero value still prevents merging of the cache.
+	 *
+	 * %0 means the calculated capacity is used.
 	 */
 	unsigned int sheaf_capacity;
 };

-- 
2.54.0


