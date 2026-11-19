Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086319;
	b=e++kndMUtl9YAjquoZZPC+qZUfJihe1UDRTpqxN/RdU0/FPt52i65xiCStoaM5uu0wR1
	 BJEEF4TA3Ux3hOI2A1m2Wo+p1gifStHZzy9wXUxg2U5KfV34RkFKtkgpZ0Nxrgu0GCxi4
	 MpO14Dq+f9ubyTqf3Cf1CHKs/4MN+cg0NSffUKp53E5rzBv8C0maqh9W7j9nXTXDqxIer
	 rFpNsEI7tQWnjWB6TyJRn8YiKIlYaZh0EsHfPvbiJTyyO1H/6ZA7kCCZCAUtesGpMU2KS
	 Vrqeuf1DHbhGKskEWTKsdBxAAzH+HGqZWKcbva9vU5x8BkNPAXAqdq/HPxLxCyAMe+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086319;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=9yy2efd8MRgR21pP9OhK3i1+O8syULk2PKytS7vzEMI=;
	b=Sf7UdTb0obwF2+65kbI0WaZ10uZQLBgO/dOuOSCrjg7Chpvb4/29pDdCrRk2Bid1oIds
	 2Qqpq5UNKc09hUGbSnsFbMmZwt6I5J5TxyY2GrW5cdQbZVHQZDMb7aKNeVNBl47dF+1UG
	 1BQYf/B3gg0dxPTYygMVFe2efhCMD52WrYy8WSCbAQ+23sBnUaNU01sA+/UlIULVcZSS+
	 dACetMiBOljXzkomRFOJdcjGvbSJezOjlWvGzPCCexReryZrZVP3PsGfX7gDpSMDXSiBp
	 sJrYvIN2GyYWUgLBgAhXCPiYVPhQaUb4tj8mmMeg6S7YC/DaCWdFA0/gXel81LctXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NOXTZOyz;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D50606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D50606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NOXTZOyz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P4Y+SlRQH2A9M5O3Hr/bduLBhcl/3bc2nLtBCL3hMXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795086316; v=1; x=1795691116;
 b=NOXTZOyzyrBP1TeUtL8sSSRuS+MFL6KqVOWHgIiaOqSDadMCn4IMrg/g4NClcq41fWrbYepy
 OPrNCgvuV9cNANyuwgb+3VkFkNViaZ3bm8sNja52dp8BhLZCV4VMtVCWfLoJlQQl/4loRmxzHM0
 YuGB+3IIpoNn7N8Nogs7zCRk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b32b83f3dee707fb;
	Thu, 19 Nov 2026 11:05:16 +0000
X-Mizu-Trace-ID: b32b83f3dee707fb
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v3 0/3] dm thin: stop waiting for grace periods when
 activating and removing thins
Date: Thu, 19 Nov 2026 06:05:05 -0500
Message-Id: <20261119-bug-dm-thin-rcu-gp-v3-0-c80ecc475e1e@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAOLX/moC/23NTQqDMBCG4atI1p2SH03arnqP0oU6Uw20URINF
 vHujULBhcv3g3lmZoG8pcBu2cw8RRts51KoU8bqtnQNgcXUTHKphRA5VGMD+IGhtQ58PULTA8o
 r5pXJS15dWDrsPb3stKGPZ+rWhqHz3+1HFOv65/QRFwVwEDmhKrTBUtH9bd04nZEiW7ko98T1k
 JCJ4EWBWhqjVa32xLIsP5qInM33AAAA
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

Activating a thin device waits for an RCU grace period in thin_ctr(),
and removing one waits for another in thin_dtr(). Tools that create and
remove thin snapshots for every container, such as the containerd
devmapper snapshotter, pay for both each time.

Patch 1 drops the grace period from thin_ctr(), which isn't needed.
Patch 2 fixes the pool worker continuing its walk of active_thins from a
thin that thin_dtr() already took off the list, whose successor may have
been freed: thin_dtr() now marks the thin as dying and takes it off the
list only after its last reference is dropped. Patch 3 then lets
thin_dtr() free the thin with kfree_rcu() instead of waiting. Activating
a thin device gets 50% faster and removing one 20%.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V2 -> V3:
- Patch 2: mark the thin as dying in thin_dtr(), take it off
  active_thins after wait_for_completion() instead of in the last
  thin_put(), and skip dying thins in requeue_bios() and
  error_retry_list_with_code() (Benjamin Marzinski)
- Patch 2: correct the Fixes tag to 17181fb7a0c3 (Benjamin Marzinski)
- Patch 3: keep kfree_rcu() out of patch 2, so that the fix can go to
  stable on its own
- Rebase onto current mainline and remeasure

V1 -> V2:
- Add patch 2: keep a thin on active_thins until its last reference is
  dropped, so that the worker never continues from a thin whose
  successor was freed (Benjamin Marzinski)
- Patch 3: rebase onto patch 2, which already skips dying thins, so it
  only replaces the grace period with kfree_rcu()
- Patch 1: add Benjamin's Reviewed-by
- Rebase onto current mainline and remeasure

v2: https://lore.kernel.org/r/20261119-bug-dm-thin-rcu-gp-v2-0-055d627763c3@linux.dev
v1: https://lore.kernel.org/r/20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev

---
Qiliang Yuan (3):
      dm thin: drop the grace period from thin_ctr()
      dm thin: keep a thin on active_thins until its last reference is dropped
      dm thin: free thins with kfree_rcu() instead of waiting in thin_dtr()

 drivers/md/dm-thin.c | 61 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 25 deletions(-)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261114-bug-dm-thin-rcu-gp-d29d4b74a0b8

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

