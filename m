Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635350;
	b=jWihOK82Y4yLhrUTlBO/mSnofGSHCLsk7KfhhYYt/meiCttW7dfs3lL6PnDnXcZpLPm2
	 rw+LEAjdCLX242+Ba3YuqxgF8wpQGmV03PwHSVvK32YgFev2rgZWSAoMoTXaB5XI74KoL
	 29M01dWbnCQNHZWqoBsDK55tCC5UeBQOfx3vpws28yLSvQZiu+ImiCXWw0TNcD7C0BfQB
	 G0cSZ2DuXf1//8rTcku4FvygCe2+veHG6+c4M3JF2QmmRh/WG1f6A2mMcwiZezxXJGnzR
	 w7pqZ+d9/ZnkVgQNfBFkYGhHt7BZRiK1zMLYuYUkrjeEjvMOgLgByPDkd0wreagy/zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635350;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7RnKuGHXbcjROOB843xfx2NqlII83H4tFfUxJAZ3o/k=;
	b=FmaUcJVoTk3KwX663gRdA5z0NNRsmTy+fo4K+e1nSDM47ZD8ah4qz5UZAXC7rTRYnVRt
	 n9fz0Sco81nbUvsBXvHK7VkKJYqZLH44p8VvE8klcNIWtv5TieK4s5cJMNw0aEYcy2kq/
	 03MTaPV/vItxNS3L1nMLE2iGpo7Fs7/zB/eXQAoGrslNqH3v5BHm2fVMspg4tieAXERU3
	 cGA2i817NoBVC/L3f/d5NqhLY370DQkv+iwpMwU78bZYDOcWDGNRBBy7X+Nnhz1AGtful
	 VutL072SCVdUgTsTCrb0D4sDT8pUeHt0MB5DvP222ynIvuQV7A2ES3nw9/eNjpZBLyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xg/ObpAc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B67606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xg/ObpAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0071F000CF;
	Wed, 25 Nov 2026 19:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795635350;
	bh=7RnKuGHXbcjROOB843xfx2NqlII83H4tFfUxJAZ3o/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xg/ObpAcsvbaM3LzMQBoGpkUsNyyuXwh7u4dtOczWFJpS5vHWZ/tFGwxceZPICMWs
	 zGztd1W7WPrqE/5gK+q7EG4yz0I3j5YLJrAhCBW19LAocOsDDDotVM6xTXpseEpnGp
	 1i2jn4Prf7Ywp9sJ/b6yRo8+PRUFev9SudT7e2iYn2QCC2DLfbDpzot6xBqiJQVoY4
	 IOagaOjUWL9MlE3madKKryoOTBSgnbkfUBO236YN4iH86CfDd0knUV8F3NnhIUs1RC
	 3nEvxIZeuLzFKN+gg0YvaNzTXfeVi59kHg2fme3Ho0nUn92m2D4Aivc0EsuPyqUGmC
	 3dLv4j5zddQCg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 25 Nov 2026 20:35:14 +0100
Subject: [PATCH 3/3] mm/slab: document that local node allocations can use
 sheaves
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
Message-Id: <20261125-sheaf-doc-update-v1-3-4a579abaf0b8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=neHwOM1VlnyNi5ABTykKOG49HCJ+vaQthdyKZl4EJzA=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrBzh4lgMGh/iGY0flnmQCxHAq24mqaj7v12Gog
 O2MROnuCU+JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawc4eAAKCRD6UCkIqsW9
 0DQxD/92stFHcb2XJRr1vITcoR/9yftHSzgXnMWB6MjhxO2uiqnrwHl2eg58uAuyuO53R33sKEV
 9Azv6zzCeXAcaRx8RhO20/H9Or0xUCnlAcoXw7LZg5b8emN7tJQzmuPLzAfqxBYGGszxZH8+66e
 G7InZkRX8ZMzTI4AE+L6H0okocza17P2grdG2xoxsJO8TfUa2z++f6xjhMDMNgBXW+d61C4FMhD
 Ks53rSLJDLFg/QbCUegJVv6AO41EhQbx+GYwPoNMYWIQX1UTn4C5CUEHdw3nY6pfQQPX7rQbA9m
 hfbdbcA6InhMAQkjT9kJKP0LFuePtxWwkiocc9EyP2/Ee49TlZNPbsVrtPXw2xgvXeepkQZV/0X
 glCSj2rfNN7cn0kXJN9Fr1HK8FEK10b9mJuWa1PxClossfVkwmU7Uv7ZhDbei9+3bJmhyFT5G9G
 rgDgTBtciURCNRVDYHvuuP9+z74d06vD3XQG+5oDMZcxaPCX/4e/ywPfkU2XV3AvsztK8SbphD7
 5XY/nw96zCfL7YrX4QxNI5zp8bc1pkGWyIZC0z1aJR8iSuH0XoY/LkVSNU/5grgWnc7Dc6pWMF9
 mR57psJ1EDIZN8pM5Y3+oRzHA3fIc/KUp/cBeKGiz0aYUeVopFOPm0qb0eoaTSe2XNFnHlV0zBC
 lN4tfQwmT/Zt0NQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The documentation of the sheaf_capacity member of struct kmem_cache_args
states that allocations via kmem_cache_alloc_node() with a node specified
other than NUMA_NO_NODE bypass the sheaves.

This has not been the case since commit 4ec1a08d2031 ("slab: allow NUMA
restricted allocations to use percpu sheaves"). alloc_from_pcs() only
bypasses the sheaves when the requested node is not the local node. A
request for the local node is served from the sheaves if the object found
there is from that node.

Update the documentation to match.

Fixes: 4ec1a08d2031 ("slab: allow NUMA restricted allocations to use percpu sheaves")
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 include/linux/slab.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 8f484e1edcd2..ae9f305db9ea 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -369,7 +369,9 @@ struct kmem_cache_args {
 	 *
 	 * The sheaves do not enforce NUMA placement of objects, so allocations
 	 * via kmem_cache_alloc_node() with a node specified other than
-	 * NUMA_NO_NODE will bypass them.
+	 * NUMA_NO_NODE or the local node will bypass them. When the local node
+	 * is specified, an object from the sheaves is used only if it is from
+	 * that node.
 	 *
 	 * Bulk allocation and free operations also try to use the cpu sheaves
 	 * and barn, but fallback to using slab pages directly.

-- 
2.54.0


