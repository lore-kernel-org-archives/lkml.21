Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016373;
	b=KStdiiTcujBrSPoV5yVQ3ezLrbqKaa1eThgtUnXi0X5HcK/iTg2ofO2WXKEWci9DpW2V
	 X2BdaYQo2K1A2lmJpoA57rdCEp1kh7OAUGKxJswB5hUKz1Yl2YpwF6UPrEmoR1YtGWu/O
	 OFiaXjhu37Eqrt3sQk+TQtQ1ReOV/PiIxwOKpkS8U/ZCBjL/av03EEoW/7jKnx8iFmC3d
	 RT8Pzdg/RGGOR/okEA5gSYVkXE9jOpJ7awd7XX6sgeXtGQkx0V9DZgui4o6hHNSKCQvDt
	 Hx/6THT9Ve5R+J8qUIrPGAtU97WvcCVSxbehpJSC7ew5QvaFrZtTuZ4SpCmjzGdHdNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016373;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=XSFLB3x5cg4Qq9AhX900ctXiU2ys0/PVB2JmwFmlE1g=;
	b=h9aemTXw8YXVfJjseCUWI4kgBZxtOo9Eh3TIs3XhO/MPMP3rMK9O/gXOZkt7GGtj0AEr
	 0iz9O+jw30wOh10gFH2+1CzrHhyaQfRJh2wJPi6ET1SyDaGSy1/gbShwUnHEvdolcDGrh
	 DpBJfL3WRlJBEJsF+kIqoNuhtOnUZsKjC1NmGSngTysWYknWWJGkXutBckIYLAQVUmqL1
	 AYkleQubh+tgLxDDUwyMSxyDEdTpB78odyXLPR41N1u234Vru9t1eBtfp8IF1WiuhjgPc
	 6LOUKy6+wJprrzoRB09arHEer7JZqr3Cub2wOMb8bLm09eWYih+8/MJdaWdYb5pMNxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GLaLwY0a;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281BF60A2615
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281BF60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GLaLwY0a
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wUWWwiodN86g+paMqAUcRxyaftQCwMM005OvWBKzt2E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795016369; v=1; x=1795621169;
 b=GLaLwY0aS1PLPVQ5UQtgNzy7ZUeKFAQ7FuEmrpiri9k3rxSwFzrhf9vn+TkC5j86ltZj7QfW
 E5xlNZrNKOXlzgbXGj7CHWRl8kuQVNW8WTkGqjnAtrMmRHPy5D+gcIRVk7R8N86ttxKxNV28zJN
 UyIfVTJU+Jx9tSDAN3b7gBak=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68c2d5c81287a1c0;
	Wed, 18 Nov 2026 15:39:29 +0000
X-Mizu-Trace-ID: 68c2d5c81287a1c0
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v4 0/2] nvme-multipath: requeue work fixes
Date: Wed, 18 Nov 2026 10:39:17 -0500
Message-Id: <20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAKXG/WoC/43Nyw6CMBCF4VchXTum0wsXV76HcSF0Ck0ATQuNh
 vDuFlfEjWZW/yy+s7BA3lFgp2xhnqIL7j6mUIeMNd1tbAmcSc0EFzkicqjnFsY4EAyP29RBoAl
 6FwmCb2ZoalNWubaodMES8fBk3fPDX66pOxemu3991iJu3z/hiJDO6rJWXNfclufejfPzaCiyD
 Y5ij+EPTAAH2xSFqFAZUclvTO4x9QOTCTOlyjUayqVUe2xd1zdrY1HkYgEAAA==
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.13.0

Patch 1 applies a new delayed_removal_secs to a head removal that is
already pending, so that clearing it fails the I/O queued without a
path right away instead of when the old delay expires.

Patch 2 stops nvme_mpath_set_live() from waiting for an SRCU grace
period per namespace, which makes an ANA change with many namespaces
take tens to hundreds of milliseconds.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V3 -> V4:
- Don't requeue the head removal in patch 1 if a path came back before
  nvme_init_ns_head() cancelled it, drop the module reference it held
  instead, as Nilay asked (race reported by Sashiko)
- Rebase onto v7.4-rc3-178-g20eef29b7c84 and update the numbers of
  patch 1 from a new run

V2 -> V3:
- Requeue a pending head removal with the new delayed_removal_secs
  instead of only kicking the requeue work when it is cleared, as Nilay
  suggested
- Rebase onto v7.4-rc2-470-g7e1392a42ea2 and update the numbers from a
  new run
- Don't carry Hannes's Reviewed-by on the v2 patch 1, which is rewritten

V1 -> V2:
- Add patch 1
- Take the SRCU cookie under head->lock in patch 2 (Sashiko)
- Rerun the tests

v3: https://lore.kernel.org/r/20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev
v2: https://lore.kernel.org/r/20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev
v1: https://lore.kernel.org/r/20261110-bug-nvme-mpath-set-live-srcu-v1-1-1f58b405b0f8@linux.dev

---
Qiliang Yuan (2):
      nvme-multipath: apply delayed_removal_secs changes to a pending removal
      nvme-multipath: don't wait for a grace period in nvme_mpath_set_live()

 drivers/nvme/host/multipath.c | 26 +++++++++++++++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)
---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261110-bug-nvme-mpath-set-live-srcu-cbd8965f1457

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

