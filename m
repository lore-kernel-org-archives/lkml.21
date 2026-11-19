Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086429;
	b=ml1wMA9y7K/lxGb3oNGzhM0W1tupbix/0/qlxpC2tCgypi76FNdRt7AJJDdjVtppArD0
	 v4IELNH01lGKfHBkfwWbUnKp+9nua50dl9QaThFry2AUcnAONdU9IbgCRntnWOyKLe3hI
	 2h5e2pqHD0+bK9zOoEEXZijyFkFFfIRyMDex28al8XIjX3XLfHuGqXuceGyemfvRPh+eq
	 7vfL6Muk4ni+tFxWVlF0/WHqiP0wNpIJ5LM72yW+nYRFGhqYAM0ZxFzXagaz7Dq/+I0B7
	 x9UZrF/zSAQE5ezhSRHAHRI9HchswASTswxR34vzq3hY01smV9IDrl/5DTct51FhNHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086429;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=RS9OuHr1dxcqz7WXLuJ9jvyk4W3FJXhyR6I3+QSBSRk=;
	b=KfxO6qtBxSQEOsaJfx3/zKq1XGpDp1A9wOn5UXk406GOoehra061FZIVEcWfZPWI6xJB
	 jFODEQpeb2S0dI+ZFqdOUAB+MySUltIh0AvU64gr/fO6ohd0vMaJqFl9jiYcqzAoIDbz2
	 n4JT6IlyOcahvzyDdzHPBTXgUPScvuIx840lO/O9icv7fg5WMkZUb2MzPRJOjnK6HxcG/
	 L//cCfZrmI30KW0EK48Haa+mv9m/LFqiRqZzB9ZM4K9V0wae+pV7HjPR6jRvU2a6kRYD5
	 FIuoVZIcWhECJtdCSAurxnxnbymIR7JMs25QDS34Gi1b8G4VN5Kd4jYoHHGb/uhYDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MMblfEVv;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2BD606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A2BD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MMblfEVv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JsHAg6d6Cqa/NH83H8PlasuyEv2XvEqbyZiTKCMiSGU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795086426; v=1; x=1795691226;
 b=MMblfEVvZWR/EGEysiTwmEwLlupqu07FWJbz7D6lGgpumJXw8BlCc3jXGroGBz3iec9So7N3
 GUEHGV7MUyAvb8VHbvdVHQFCJNglYLuv52zyadd/aRi/5pdRBknEUFb8ABVyt87fR3+cKQsCPfG
 jdFVrlZ4V+Lk7hKeWtiNKoIQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5d0a2c69608c45af;
	Thu, 19 Nov 2026 11:07:06 +0000
X-Mizu-Trace-ID: 5d0a2c69608c45af
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v5 0/2] nvme-multipath: requeue work fixes
Date: Thu, 19 Nov 2026 06:06:59 -0500
Message-Id: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAFPY/moC/43NPY7CMBCG4asg1zsrj//iUHEPREHsMbEECbITC
 4Ry9zVUEU1WU71TPN+LZUqRMtvvXixRiTmOQw39s2OuPw8XguhrM8GFQUQO3XyBodwIbvfz1EO
 mCa6xEOTkZnCdt63RAZVuWCXuiUJ8fPjjqXYf8zSm52et4Pv7T7gg1Avadorrjgd7uMZhfvx6K
 uwNF7HGcAMTwCG4phEtKi9a+Y3JNaY2MFkxb5XR6MlIqb4xtcbsBqYqJjBIY2VjnHVrbFmWP0j
 oVhWvAQAA
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
V4 -> V5:
- Cancel the pending head removal under subsys->lock in
  nvme_init_ns_head() and drop the list_empty() check and module_put()
  from delayed_removal_secs_store() (Nilay Shroff)
- Rebase onto v7.4-rc3-230-g4405c18c95d2 and update the numbers of
  patch 1 from a new run

V3 -> V4:
- Don't requeue the head removal in patch 1 if a path came back before
  nvme_init_ns_head() cancelled it, drop the module reference it held
  instead (race reported by Sashiko)
- Rebase onto v7.4-rc3-178-g20eef29b7c84 and update the numbers of
  patch 1 from a new run

V2 -> V3:
- Requeue a pending head removal with the new delayed_removal_secs
  instead of only kicking the requeue work when it is cleared
- Rebase onto v7.4-rc2-470-g7e1392a42ea2 and update the numbers from a
  new run
- Don't carry Hannes's Reviewed-by on the v2 patch 1, which is rewritten

V1 -> V2:
- Add patch 1
- Take the SRCU cookie under head->lock in patch 2 (Sashiko)
- Rerun the tests

v4: https://lore.kernel.org/r/20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev
v3: https://lore.kernel.org/r/20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev
v2: https://lore.kernel.org/r/20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev
v1: https://lore.kernel.org/r/20261110-bug-nvme-mpath-set-live-srcu-v1-1-1f58b405b0f8@linux.dev

---
Qiliang Yuan (2):
      nvme-multipath: apply delayed_removal_secs changes to a pending removal
      nvme-multipath: don't wait for a grace period in nvme_mpath_set_live()

 drivers/nvme/host/core.c      |  7 +++++--
 drivers/nvme/host/multipath.c | 21 ++++++++++++++++++++-
 drivers/nvme/host/nvme.h      |  1 +
 3 files changed, 26 insertions(+), 3 deletions(-)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261110-bug-nvme-mpath-set-live-srcu-cbd8965f1457

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

