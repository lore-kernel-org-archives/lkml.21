Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033737;
	b=JNwOHFSW6D8eeK0XeOPOX7cAQE+49ylfptY1oPSzFUvKEWppR4/zA7IfAvAMs/xx+qIp
	 SGoNJfrW9bNcURxM8nPjxh7EiGThb8/wbh/oGZlATfF64d0IO1xi4Uj0XCShaCS/zy62E
	 YAR4yxpoU3hQhsjcI8PiFogufZhJqNvapbUKqQQcIWnTHSiXcrtzN+2jPIzhtNjRPqbjC
	 ji1AVAWojhHgCLGrmA0u97FRHo/Jv5Sw5RDWs3polOt5PpW/f4gK+pFgBX+kezszSt9GB
	 OPjjRonMVoXNAd1w+JDasSTgtKhvb+BGdMwwPRKktYrDLLWuafzrQQFUDMQNphbEe9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033737;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8sftw5l/DhRq72nNXbEWzstEP0Vk5phUAbJeve/CP2c=;
	b=LHjxxFSPALzIbzPo5ah8/ilagEMb16VPFX4uzMvPWoXHqmky1nCRexDLLcPNjxKm3m6J
	 NCVnGG2OVo73KbNM+57lmHpS/hjsSA/JfHaLOo/SwfyOwc2GDt34LpMXsGSpI4+gUcg4D
	 VUQEjC4wc6Z++RbYCB7gc82HQdG4hIRWs17iydXgfC1+FMuWPbpooDcXimVxJMY2pMUFI
	 UUoOJHk+/dyICazep/t18W6YGOTF1LzZOA/a/nkh4K7NNLLRUnobpaGO87QK+dE5RIZmJ
	 CetIvFyDGD4bU4TrGVSxzJ/e1ZHnNiFLGROiIpNbE4HBnKBoInNlLjbsbUcX500F0/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ip7aDBio;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ip7aDBio
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795033737;
	b=sUBGmXkpwu5t3RHZ9CxghERqQfYqANNDi4NcOKB7egKzQMXJnX/+mDeaapjBb4X+ZlZc
	 mb4VmL85cV/PQ7nKl9JQPSuGHh1GiX+tKSypm9cb4mvh7md+W+hwCTxtl/2K+8r/myT7o
	 ifARm86YLgBCFGv5Ez4XUmVfC745UKXiJRi2xsjyNS8yIuhoh41gr6SEoTJINydmRmGFD
	 24kfTfQX0KU8X+3C94wNPdUnMvKhz0WMGyqFuXrQyxCmSCbB/cWC7TZt2S4lRFvHxj1OP
	 MhkWDxrRzKSs/kuqOfHh20WGm3TegKqW0h1ztySbDDD2ZZ10Y0IXHCBzzyJmefDYtuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795033737;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8sftw5l/DhRq72nNXbEWzstEP0Vk5phUAbJeve/CP2c=;
	b=KxSJ37DOK0kARX7pCiq68lBhoKESJxP1brqXxh+9Njn2vSoE3XxDwA1csYOMDDbuTcI8
	 69zGTLoKqw4qs79jCdCbcbVmuHur7n33EeT/Uy4jnNXLB2B0rIJFTgSSe0Yx5zlmPFAF4
	 8Ymq3YKPBAbDqDu4RNOox51vQSqe9sUEIq7oD1wOqvwes4eIlmoblsz9aTZD/J2YV8iig
	 Xa+ggvnIxJS0aB+xTFYB6QZQ5H+lkHydvRju4WMTwoUG6SQexQHAoJ8M5lvvPjyzD7+Yj
	 1ARzMLCSDDTbvzauSRUjzmjRG8dF5m1pWmWVLobjyZOmYJoqQ+cvuyJiIRXbAKVGCwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A5731F000C4;
	Wed, 18 Nov 2026 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033737;
	bh=8sftw5l/DhRq72nNXbEWzstEP0Vk5phUAbJeve/CP2c=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ip7aDBioQyVz/tQ2ktPhmvHwcW6EAz/wmE6d77VI7cFU6IoQGfEH1S+gDt/jcZ7Lu
	 mAyyz2UM/s4jxoq39KxeP9fZKQDpFs9QBm5SLC3KkjxHlu3DTzeVVRtzIqKZTSKRL4
	 +u4C2kSx19cZNuMBkv0wDy+oKTY9S1HuFffUuqBA3eFPaT5bgOCVWVBFiHhq6nEdRv
	 EyTYO9Vpbs0ZZv7k3exaLU+WoXDRNYP3dxuEKc1qC1bJEA4I65s8Z+nMgNkvcz5zhO
	 QCO/L0MBsnOeCkzxse/Cxp1w//k/nb4/l2AZRh0JVacBrKYdC1fZqoCzQooUX9L7OL
	 A1gunDRDGv8jw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9F0D64AF6A;
	Wed, 18 Nov 2026 20:28:56 +0000 (UTC)
From: Samridh via B4 Relay <devnull+samridh.modal.com@kernel.org>
Date: Wed, 18 Nov 2026 20:28:49 +0000
Subject: [PATCH v2] mm/shmem: avoid zeroing new folios twice with
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
Message-Id: <20261118-samridh-shmem-send-v2-1-f2ea01bfc178@modal.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32NzQrCMBCEX6Xs2YiJ2B9Pvof00HY3ZsU0kq1FK
 Xl303qXOX0wM98CQpFJ4FwsEGlm4TBmMLsCBteNN1KMmcEcTKm1rpR0PjI6Jc6TV0Ijqsaiwdo
 cNdUEefiMZPm9nV7bH8urv9MwrU9rw7FMIX4266zX3l/BrFVOXzeVtafSYHPxAbvHfgge2pTSF
 2SIYJnGAAAA
X-Change-ID: 20261117-samridh-shmem-send-9fd2d8231e8e
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Samridh <samridh@modal.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795033736; l=2467;
 i=samridh@modal.com; s=20261117; h=from:subject:message-id;
 bh=+TIZt89c6fPFtjTdzvaMfsLmhIUPC+6pbbVMTGgDYV4=;
 b=igkKsRBXifpqSlPGt8MqjeyP+wyHxMr7aac5YwvrqjKI+QWIAvd2E2nkRUZ3pMYuOpGgp0asb
 6X2llXHSRtoAcgb4nlN/NqqYHCfBn/kDjcDnf/E3XZh08nNqJZ3w7cL
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

Skip the clear for a folio that was just allocated when
user_alloc_needs_zeroing() says it is not needed, like anonymous memory
does. Folios that are already in the page cache but not uptodate, such
as those left by fallocate(), are still cleared, and so is every folio
on CPUs with cache aliasing.

Time to write one byte to each page of a new 4 GiB memfd mapping, with
shmem_enabled=always and init_on_alloc=1 (median of 24 runs on 6.18.55,
x86_64 VMs):

                  before   after
  Xeon 6975P-C    0.625s   0.420s
  EPYC 9R14       0.216s   0.160s

With 4K folios the times change by 3% or less, and init_on_alloc=0 is
not affected. We found this while running gVisor, which keeps sandbox
memory in a memfd.

I wrote this patch with help from an AI coding assistant (Claude Code),
then reviewed and tested it.

Signed-off-by: Samridh <samridh@modal.com>
---
Tested on 6.18.55 with this change backported, on Intel and AMD x86_64
VMs, and build-tested on mm/core for-next. A simple test fills memory
with data, frees it, and then checks that new memfd pages read as zero,
with MADV_HUGEPAGE and MADV_NOHUGEPAGE on the fault and fallocate paths.
It passes on both machines with init_on_alloc=1.
---
Changes in v2:
- Use user_alloc_needs_zeroing() instead of __GFP_ZERO (Baolin).
- Link to v1: https://patch.msgid.link/20261117-samridh-shmem-send-v1-1-1b897ff562d9@modal.com
---
 mm/shmem.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index c769d0bc7df9..1a78d15a768e 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2810,8 +2810,11 @@ static int shmem_get_folio_gfp(struct inode *inode, pgoff_t index,
 	if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
 		long i, n = folio_nr_pages(folio);
 
-		for (i = 0; i < n; i++)
-			clear_highpage(folio_page(folio, i));
+		/* init_on_alloc already zeroed a new folio. */
+		if (!alloced || user_alloc_needs_zeroing()) {
+			for (i = 0; i < n; i++)
+				clear_highpage(folio_page(folio, i));
+		}
 		flush_dcache_folio(folio);
 		folio_mark_uptodate(folio);
 	}

---
base-commit: f7d95bf74091373fad7273db4557df9b5a902335
change-id: 20261117-samridh-shmem-send-9fd2d8231e8e

Best regards,
--  
Samridh <samridh@modal.com>


