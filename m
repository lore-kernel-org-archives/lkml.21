Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067141;
	b=r6gujFFAj0zF6Gi3Ueq+9/IMXmaJ4tueTWxCaEMiExuQ+LnX6NOULCRo9QM84tlRV150
	 fPu4Y40zdnNAeokAYTegBVwdE3WXavYfn8jsabw0zQtx8GUw3M8xWh4bUWfzIsHSgNxaB
	 kOSffvMYVggHOXB5DTK1qaahjW09XV2fJfYAvYfYwM9EkJIcKp6qW+8nZ36hJpcmWNPod
	 qWe5HsJ0xSkVS33WKxx0302hVISUA1uR2t8WSk7PrN+tyH4/4eGgeqMTDOatfG+hPqyzq
	 pam9GSefyCpx12Ao8A5u//XPK3P7mCg5tVulPuwKPDsDtiNeaRcmLGcPXuX7yBZS7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067141;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=/rHP7HRQfrWAkL36StbnHGO+A/QTXMdNPqWVRYja7rw=;
	b=Ty9UWRaCm0zWghCgdHoxM2a8NGcyFSfmkOgRGHwAxbGl/bpYPcaXbRU+e5uCYVaPMUnO
	 6hcdHh6ioLtUTSXuTVuC/Dn6EsykqZ1lWH0iY4Rc1x0+nlITHFw+FZXB471d7AspK+n1k
	 rHv7lvpBxNLkRAbZEtO7RCu6qVOD1Ijkkcr18eLEwHMscd8E3LoGDAxmo4Y4XeCY4MiXh
	 niE9CuHIy54Au1Iv1Kw37BmAF1P0z5jNBLvUR4k4vWNr8R20T1kX2PMfPyQozDDGNwTsx
	 gEzUAx/vhk5ChUWt1BpvjlKEh/uHywXW0o6A6rHKmirI8q6SQUHClbfyOGD3WtNGGIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VJ3vauhY;
	arc=none smtp.remote-ip=91.218.175.169
Received: from mta0.migadu.com (out-169.mta0.migadu.com [91.218.175.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F9606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VJ3vauhY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YUVXxoC/deL+c5GBsjOAuUpWnYP0DxGgXOZrdpfjrEM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795067138; v=1; x=1795671938;
 b=VJ3vauhY+3aOj0BXshP1pXwniVlyS2e/1mk6v2fQ6YLUiAWjo2Xu76qhbhfO06o1N9ieWX9C
 iGQdJ3eLxxapIxsmrdULfM9xqUNJ6dpBZWDhIY/wZG1TqjDx7DkWg2OSrSVJUS08tOCE6A/DBc9
 iL380K5pPJ14ARPphg8ZFkdU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 214b2a300599e75c;
	Thu, 19 Nov 2026 05:45:38 +0000
X-Mizu-Trace-ID: 214b2a300599e75c
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v2 0/3] dm thin: stop waiting for grace periods when
 activating and removing thins
Date: Thu, 19 Nov 2026 00:45:31 -0500
Message-Id: <20261119-bug-dm-thin-rcu-gp-v2-0-055d627763c3@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAPuM/moC/22NQQ6CMBBFr0Jm7RhaKqgr72FYADPCJFpICw2G9
 O5WEncu30v++xt4dsIertkGjoN4GW0CfcigGxrbMwolBp3rUillsF16pBfOg1h03YL9hKQvZNr
 KNHl7hjScHD9k3aP3OvEgfh7de/8I6mt/ufJfLijMURmm4lRW1BR8e4pd1iNxgDrG+AF4tX05t
 AAAAA==
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
been freed: a thin now stays on the list until its last reference is
dropped. Patch 3 then lets thin_dtr() free the thin with kfree_rcu()
instead of waiting. Activating a thin device gets 51% faster and
removing one 19%.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V1 -> V2:
- Add patch 2: keep a thin on active_thins until its last reference is
  dropped, so that the worker never continues from a thin whose
  successor was freed (Benjamin Marzinski)
- Patch 3: rebase onto patch 2, which already skips dying thins, so it
  only replaces the grace period with kfree_rcu()
- Patch 1: add Benjamin's Reviewed-by
- Rebase onto current mainline and remeasure

v1: https://lore.kernel.org/r/20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev

---
Qiliang Yuan (3):
      dm thin: drop the grace period from thin_ctr()
      dm thin: keep a thin on active_thins until its last reference is dropped
      dm thin: free thins with kfree_rcu() instead of waiting in thin_dtr()

 drivers/md/dm-thin.c | 60 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 26 deletions(-)
---
base-commit: 63fdb511c27afcebce797e3db580b3534ddfa639
change-id: 20261114-bug-dm-thin-rcu-gp-d29d4b74a0b8

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

