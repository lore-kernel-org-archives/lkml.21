Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635347;
	b=y+qBjS5POzlpSy0yklaVFHhkyhX84ZGndG3uEo6vOhZVTrch3XV3MUrFbD2gGfVHr10E
	 Is7ORN+qCgcWX6OzP+WxO0BDCN/SOtfK9BdZyw7sil9iNPAxQEjdD4fdwBIvO4lGokWnR
	 iGMAMEASlrGc8OsqGFi5an1x0OGwheeQ52yhJSlRDckGWT1jar5PkkEkN4k7GpFNJzlLB
	 Q/kJoeUJXRRVLmP6Sbx4wzm/ZGwNcU7Nbki+tUCXnOfb1Jn/SUkst8sRhmu5+ulLwyZkA
	 B5Y3j3220w6HFlZnnDodRjBfyec/TvZitLwO+zQuvFh2jBuJxBRXuKImEzPPChDCj9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635347;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dozySOraoRh7tHjX6TfMaOwoErXGfJLcHLqqnn8hwK0=;
	b=CTBjhCdR/FRvtyxVo1nGv/JUKvjk1N4QutVJo0nruECmDmIxE16WV3NjybWGl63evNgv
	 v3Jy/XPGmaUPyde6pQB/L2iCq9VMc695Ve6MjD5PxvrGu5hPGBdIQA+QFz2FembGvzd3q
	 mB42g5r0ZvH1HvK6XufmyNuc9V3VDT0VHO+zqCaHerlPrIRhXPBkriQrLhqIVf9rwFvgw
	 JegFuf/3g1YERcBJup75bOLqX+CF+Hr96ec7EvJ8qJh4JZX5RFQN8lCg87uQHAAorOxfJ
	 mMFxjzrHD35fLO7xdGeS9rWiBgXrHq3E6eP/ctrjD3AyL76BAZ1c8stOFnwHv3HI03w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5B+RGOk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC50606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b5B+RGOk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222D51F000EE;
	Wed, 25 Nov 2026 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795635346;
	bh=dozySOraoRh7tHjX6TfMaOwoErXGfJLcHLqqnn8hwK0=;
	h=From:Subject:Date:To:Cc;
	b=b5B+RGOkttFdjhnb05MgU12UGmw7AUUPPnCDqyZW+JEuZBtevCOUi/phCy7VKT9ED
	 nOf05pMt6MajS9JdwbvMFhSBVrIJrruhPKZbE/tfx/Mv0zyL5tIzHoTnu5VKAxaqif
	 qBGQT3N84Hmj4SjeRVdD9pvcBiDvqCu1vYFyNuTAf7o1+bT9XwzL40MPW26QeFUm55
	 /ip4fNCDX9evQ8vA8lhDMXmdQ9dg7vjmJh72J7tAO61dfn4sIdsvo85pIljAxeSFIc
	 amuIp9JO/TqIVxOIr6Er9d4FQPbuVE2i2EO2KOPqURv9iTehOALhN8kCTjemvJkXUe
	 P4XXrHN4d9Lmw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 0/3] mm/slab: update the sheaf documentation in
 kmem_cache_args
Date: Wed, 25 Nov 2026 20:35:11 +0100
Message-Id: <20261125-sheaf-doc-update-v1-0-4a579abaf0b8@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAG84B2sC/yXMMQ6DMAxA0asgz7WUQBVQr1J1CLFDzAAohqoS4
 u6kML7h/x2Us7DCq9oh81dU5qnAPioIyU8Do1Ax1KZ21toWNbGPSHPAbSG/MvauM+HZkCGKULI
 lc5TftXx/buvWjxzW/weO4wSa8zQkdAAAAA==
X-Change-ID: 20261117-sheaf-doc-update-b680c43d0ddf
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 Suren Baghdasaryan <surenb@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, stable+noautosel@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=t6Mq6j8OEQxc1F8IgxRwVwsBIQkzVUMpQPtrRwrlp10=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrBzh1ld19dTE9S3u4oa+7NvtVtl3OY9eEG3QUg
 Ae7yLEmQLmJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawc4dQAKCRD6UCkIqsW9
 0ATZD/9ACQM1mxL4rKBnAWXizlVJGajie8C6RmmyNdP3xEhvWal3C5GCq/EseX88nOLAYyos8FA
 g9q1HF+SqulmWOuPd3uYC1tLxDLU4CE+ZkhnPn0CYAH6noQ5nKdpHZlkc6g7+mb3VegPVQTj8/y
 kmVf8vO7vcEiadpW1PkicAnkIbaTbHdTSzjr2OogHs2cyyDkwfkv1nF1vIjRy/UfybPlLTL0eYe
 D6MeBeJkUYCfdtynF4XgX7uPlvzNXW3dUvZREAoqdwf2pkJNAe2YoXCQe5hbpGtk2SkhqVLOQwC
 P/6dChCI4bOJuu4hWE7DQBhvA36jfU466DldFiSINmDeZ6NOpDlV/TlHZ3olZ7xH+OAWbD36RI1
 Xj6dqM1iTk2SYdK3CxAbI+s9PXCD/+1okNJ6+YBNjiqKSJyS3IkiGGf7UqgBR+Cm4OJA1o6ygq+
 xriKmTqsZ9s7zxlC68KwWbmaJvDegI1LLqbZM3WVYDpQSAt54GEmoCl4Wei1wgF/SDgCy+6ceta
 9UcbDmGgoYNVBOir7VqZVP/RZCLqOL+NvdwzR4PpJatBZWdc7Wo0o5MoU4gb7I1E6Eo8N8Tew/G
 PRBvp40p6vCnh+ZzqYnFEecyRRZI0Z3utYKUEx8yLqdhjteJx0TTqPpcAFupXbmxnKMdSblJPNe
 4nuzFSF296Rql3g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series is a few documentation updates pertaining to how and when
sheaves are enabled. I discovered the inconsistency handled by patch 1
while discussing the Rust abstractions for sheaves [1]. While working on
patch 1 , my robot assistant found the other two inconsistencies updated by
this series:

- Patch 1 documents sheaf_capacity as a minimum capacity, where zero
  selects the calculated capacity, and lists the cases where no sheaves are
  created.
- Patch 2 drops the statement that refilling a sheaf requires gfp flags
  that allow blocking.
- Patch 3 corrects the description of allocations that request a specific
  NUMA node.

The statement fixed by patch 3 has been stale since v6.18, the ones fixed
by patches 1 and 2 since v7.0.

The series only changes documentation.

[1] https://lore.kernel.org/r/8a73da1c-0167-4aa5-a62c-4190327685cd@kernel.org

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (3):
      mm/slab: update the documentation of sheaf_capacity
      mm/slab: document that sheaf refill does not require blocking
      mm/slab: document that local node allocations can use sheaves

 include/linux/slab.h | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 0b0985aeb9979c5fa5c3b872cecdf97ed4ed2b3e
change-id: 20261117-sheaf-doc-update-b680c43d0ddf

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


