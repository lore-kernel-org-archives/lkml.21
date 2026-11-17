Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943950;
	b=KI/b3C/9rl1K7ga3T9v2NQC6SStyJlFEy6+Gwf5lFLJNhK3LY7IHepg/j1jxeV7vYkRM
	 dXLS2bZcjuZBUzYhuJsF1KpHCeHplsU/hN7nGvySBQSYdBI6fsPvAabGMnIMIk485bMgT
	 7dUE05fKAcX91nHmscYYLiDPlsnhUx+h6Y7nxADxWNb39vlWft7E1UtZKWyNOaVJop9pG
	 kIoSLjT6sFygo2RkesQu5dv1lFpbSzKwud6B1AalETzy1w9IRNl8HU7TgbVS8XZj8gwgH
	 XK8wsHorjBlfGA6SnNnNheEuUdbzpgucCfU/7UrKFL7uoy45UYavLeEOtntkQ8JtQHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943950;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1uOJYUkeTceYDTlatxwLRj1jcM58HxwnlPEOaQ6WvXc=;
	b=0BdVfogp4nf/mvkCzCcp4QVg60w5+TKmIrtbX4J2dhLUX5xO8YeaissqskJTPuTKX2kB
	 +/iLv3F/dh1eG9tU8942dIvZSCzVpVHzgvpZ66uqUTyXHbTGZyynZwn8zB/pCIKkxqcdT
	 TYNzy++2D7ntC9/8fE6PLZz5vAsmDR0HwlrECjvFVo7MrflGrFXEybug4FuKnWT+RbQwp
	 MyGEOtH6XC008pbN20Fnu4Z1zQHXgOazB/A3EgL3LTAlpflBlNMyY1+Yg6hdfR3BG0aAO
	 7g323/B1SCOZ9rCXRp0o3RBMoAEKFhpg/B7CBqWHf6fxwfPvhJn6zQFE7H4a6IrVxfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmtfRbHh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A305606A88A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmtfRbHh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794943950;
	b=d7yHcWOU8HASSIN/e8GI4gYACbYrUovxVeMtm8kQrvG3QlAI7UNSd22OAfnf/aZpQH4Y
	 4oZVpzk0fIY9npKkMWuw2rq5Pm1bC1qNf8TzvNw4dG19OzwD7V1fXtudCtGewdFJ8zhx1
	 3NrHT+p+l4IEmzLtYKN+UWxTPQGenpZyjscThBoLAPFN5JkQFy2HuajO3xKk2T0IFevK2
	 RLAHOEqcge6XRdP41kGF1YKRI+si88+qN+fnfKhgDJL4K0whAorambWg2mSbmyjZEqBJW
	 YA+Xy3tkhpsruPI8fwFWDZDIPSBbj4M3DrksW3LqbsRvJJzmcDY7XwnMPOKxXnYwT/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794943950;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1uOJYUkeTceYDTlatxwLRj1jcM58HxwnlPEOaQ6WvXc=;
	b=gZwmtiykk9MNcgPM/EDD16j1Ha//DnBWppmpzC/LfZJyHUzAUVWRBqmRJf4kkdXUb7Wr
	 ftGHqU71TMMwt4+XjeJO1LNwFcrFGL6sDJzybzHnak/NwLVwAKWe7oCPkgmvTVc46pC4c
	 Mb1WKkIp+sTualPy4FcxfGXdkw5D7wH77bUzYQr684UTBoziUYkeiZkQ6DLJfCYsNGUJv
	 hVko2ikhA2GbxKAL0ph7LLReF0fllGXOZtyIffreUHFUh73WH0tqGDA9JEYCIAQNH72qZ
	 uvmRQ4GBffqelAJ80Dvvd35CuO3daFwVYwesQegnJW4tXQgrUGMCEWJvWhKR8B7vAtQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1FC771F000C4;
	Tue, 17 Nov 2026 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794943950;
	bh=1uOJYUkeTceYDTlatxwLRj1jcM58HxwnlPEOaQ6WvXc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=WmtfRbHhICDEN59TbmhoraiQc7RHSWgdlvSWT3spNDvm6Fiyi1xZH+SEbCGWMgpiA
	 xZNeFwAIcIwL6JVKOkbFs+Py3wKILWOAfobT9qL51jhUvMQxl8JX1qKsYTnh0IteWx
	 tR7f34uVJnFGRrtx85gSxYZGMtCTbMICBz61RMCBhN7nxFdrlITsnb6/m9YkfP6xn0
	 sCdY+mxlIWmW/d4grHkq2XAf3tO4h6X2egYZ66Rk7NYLqp3k0OFAYmpzBNsZUuWUTY
	 x4vBHGAz+go4ZvkkLFqPBbfhk1eP484vtl2dJOhz3gUzklhMdQ1WUWUinjptAo3hru
	 mqq9ELfwGLt6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8E90D4AA65;
	Tue, 17 Nov 2026 19:32:27 +0000 (UTC)
From: Samridh via B4 Relay <devnull+samridh.modal.com@kernel.org>
Date: Tue, 17 Nov 2026 19:32:26 +0000
Subject: [PATCH] mm/shmem: avoid zeroing new folios twice with
 init_on_alloc=1
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
Message-Id: <20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCQAxG4auUrA2YEWz1KuKiNn87EWaUiYpQe
 nfHdvkt3pvJUQxO52amgo+5PXKF7BoaYp8nsGk1hX04ikjL3qdiGtljQmJHVj6NGrQLB0EHquG
 zYLTvOr1cN/v7dsfw+p9oWX7APPb8dgAAAA==
X-Change-ID: 20261117-samridh-shmem-send-9fd2d8231e8e
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Samridh <samridh@modal.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794943947; l=3830;
 i=samridh@modal.com; s=20261117; h=from:subject:message-id;
 bh=a7F7GTEWjxL9C0nNEosbwVj6fkOjYCgTqLb1jXjkir0=;
 b=SGNqaUKOMECCXRZi1l9o3gcwAg9U87xEHWyCYMLVkCloKUFF9Ay+mQBIt7txWMP42l2ju4br2
 9H91UYwZTVYDSc8S3KqW5lzYfQHrgUjv3lPtjx9KAtzYUioODSdQRll
X-Developer-Key: i=samridh@modal.com; a=ed25519;
 pk=+V5ZaIpEMOLG1b2MsSHY0Nm20lIADx5ia//FZeuqVgk=
X-Endpoint-Received: by B4 Relay for samridh@modal.com/20261117 with
 auth_id=1554
X-Original-From: Samridh <samridh@modal.com>
Reply-To: samridh@modal.com
Content-Transfer-Encoding: 7bit

From: Samridh <samridh@modal.com>

shmem_get_folio_gfp() clears a new folio before marking it uptodate.
With init_on_alloc=1 the page allocator has already zeroed it, so the
folio ends up being zeroed twice.

For SGP_CACHE, the only mode that clears a new folio, ask the page
allocator for a zeroed folio with __GFP_ZERO. Folios that are already in
the page cache but not uptodate, such as those left by fallocate(), are
still cleared. With init_on_alloc=0 the zeroing moves into the
allocator, so a folio is zeroed for nothing when the memcg charge, the
page cache insert or the block accounting fails.

Time to write one byte to each page of a new 4 GiB memfd mapping, with
shmem_enabled=always and init_on_alloc=1 (median of 24 runs on 6.18.55,
x86_64 VMs):

                  before   after
  Xeon 6975P-C    0.620s   0.416s
  EPYC 9R14       0.216s   0.158s

With 4K folios, or with init_on_alloc=0, the times change by 3% or
less. We found this while running gVisor, which keeps sandbox memory in
a memfd.

I wrote this patch with help from an AI coding assistant (Claude Code),
then reviewed and tested it.

Signed-off-by: Samridh <samridh@modal.com>
---
Tested on 6.18.55 with this change backported, on Intel and AMD x86_64
VMs, and build-tested on mm/core for-next. I also wrote a simple test.
It fills memory with data, frees it, and then checks that new memfd
pages read as zero. It covers MADV_HUGEPAGE and MADV_NOHUGEPAGE on the
fault and fallocate paths. It passes on both machines with
init_on_alloc/init_on_free at 1/0, 0/0 and 1/1.

The idea came from David's comment on the __GFP_PREZEROED RFC [1].
One thing I'm not sure about is whether flush_dcache_folio() after the
allocator has zeroed the folio is enough on architectures with cache
aliasing, so a second look there would be welcome.

[1] https://lore.kernel.org/all/b258160c-5287-43dd-b56e-268c403b85ea@kernel.org/
---
 mm/shmem.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 5cb628cc9c6b..d2c6781e86a5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2692,6 +2692,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	int error;
 	bool alloced;
 	unsigned long orders = 0;
+	gfp_t zero_gfp = sgp == SGP_CACHE ? __GFP_ZERO : 0;
 
 	if (WARN_ON_ONCE(!shmem_mapping(inode->i_mapping)))
 		return -EINVAL;
@@ -2770,7 +2771,7 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 
 		huge_gfp = vma_thp_gfp_mask(vma);
 		huge_gfp = thp_shmem_limit_gfp_mask(huge_gfp, gfp);
-		folio = shmem_alloc_and_add_folio(vmf, huge_gfp,
+		folio = shmem_alloc_and_add_folio(vmf, huge_gfp | zero_gfp,
 				inode, index, fault_mm, orders);
 		if (!IS_ERR(folio)) {
 			if (folio_test_pmd_mappable(folio))
@@ -2782,7 +2783,8 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 			goto repeat;
 	}
 
-	folio = shmem_alloc_and_add_folio(vmf, gfp, inode, index, fault_mm, 0);
+	folio = shmem_alloc_and_add_folio(vmf, gfp | zero_gfp, inode, index,
+					  fault_mm, 0);
 	if (IS_ERR(folio)) {
 		error = PTR_ERR(folio);
 		if (error == -EEXIST)
@@ -2810,8 +2812,11 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
 		long i, n = folio_nr_pages(folio);
 
-		for (i = 0; i < n; i++)
-			clear_highpage(folio_page(folio, i));
+		/* A folio allocated with __GFP_ZERO is already zeroed. */
+		if (!alloced || !zero_gfp) {
+			for (i = 0; i < n; i++)
+				clear_highpage(folio_page(folio, i));
+		}
 		flush_dcache_folio(folio);
 		folio_mark_uptodate(folio);
 	}

---
base-commit: 0c524518413094607a6178c53a65815762bc9c45
change-id: 20261117-samridh-shmem-send-9fd2d8231e8e

Best regards,
--  
Samridh <samridh@modal.com>


