Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137915;
	b=RkPAAKlMuWwYn7/CWhWU4Wkan7w6kem+EKXhKOn3iW/+yzbytYwHP2m6eSx5xIid52H0
	 yAGKqrQF2/YMS61x29TQPgnltHyixgg+/ZyK/6GqVOEkLpVFK+m2nYmyRYxs9OL2KGP6J
	 UpWgDYBzBmTVQABAG4mU/hQNxsDM1dBFM7PKafFVTXOwG6P8gyFJTqH5L+oMLzSEKcI9t
	 pVsuVQwM44yxkaQh+x6nbVaFr5z9WEnF3ETEOUQgPMrw5USvteowBoeI7r8pr3pOlvGnO
	 UxpuK/1P/oF5onNGQ3BzEDpkvZl8GiDTPcKHhLgG+7PR8B2jRk4BmBfVIJJjDCLLrVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137915;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=k/SrSoqD0XKlGfHllc4/8SbwU+cxTP9RsCoMnlVdirg=;
	b=hE3OHib8sp9K9vP/SDWvcuWD94KCgtWw1gi3w6CN600tXA4BQRXSw8BujCPQJwltsVg/
	 QpbroCcQb7ZNwXzn+N7rdcQ2RPWhwGAj6k+CRgWibWRvOafGs61s3GBgm6Xoo1y+O+bHX
	 Pe+IykpYKqFcaBm1mzfPUMpyec7DinMO/PykwLSxYL26IpSX4Jqou7Zh3q7cijMGB3j4s
	 sDYyqr5sZv7SRutNV/XLfmTZPIqehuCfdOsly8D0LqrAii3DiRhkv2D2NWZgqARMaEJoa
	 wRcCgA7vUWzOTawrSZWu9h+DwUnLsNl6Ahq5MFUVlqDjVGt+2fjDpEaAYWEZY2c56hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cmnYZStB;
	arc=none smtp.remote-ip=91.218.175.243
Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DA606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cmnYZStB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tnm0JuXY2qIER75j9eVktrXznS7mUHR4O4OAjzn9HFM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795137912; v=1; x=1795742712;
 b=cmnYZStBxAG7w2CJZCtUJ9FcG7+04SQeqe4y3TJ8YzgiPFt1G7ivZP/tMF/4PnO83ejprcRr
 n3XGXbMbiWebZ+GjG7RS89DbZfxWx1OmATxAWXv7d+BeBm4rDPh85xk57KzBEN46S9TNyRtf/Rd
 PNG6REDCi0tXRPH/n/fr65q4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2d3f08acb5ce771;
	Fri, 20 Nov 2026 01:25:11 +0000
X-Mizu-Trace-ID: d2d3f08acb5ce771
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v6 0/3] nvme-multipath: requeue work fixes
Date: Thu, 19 Nov 2026 20:25:00 -0500
Message-Id: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAG2h/2oC/43NsW7DIBDG8VeJmHuVDw6MM/U9qg4xHDFS4kRgo
 1SR370kk+XF1U3/G37fU2ROkbM4Hp4icYk53sYa5uMg3HAazwzR1xaykQYRG+jnM4zlynC9n6Y
 BMk9wiYUhJzeD673tjA5IuhWVuCcO8fHmv39qDzFPt/T7Xiv4+v4TLgj1grY9Nbpvgv26xHF+f
 Hou4gUXucZwB5PQQHBtKzskLzu1xdQaox1MVcxbMho9G6Voi9EaszsYVUxiUMaq1jjrtpheY90
 OpivGSFaxZKI2rLFlWf4Ak2PNr/wBAAA=
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.13.0

Patch 1 keeps a large delayed_removal_secs from wrapping around into a
short delay when it is converted to jiffies.

Patch 2 applies a new delayed_removal_secs to a head removal that is
already pending, so that clearing it fails the I/O queued without a
usable path right away instead of when the old delay expires.

Patch 3 stops nvme_mpath_set_live() from waiting for an SRCU grace
period per namespace, which makes an ANA change with many namespaces
take tens to hundreds of milliseconds.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V5 -> V6:
- Add patch 1: compute the delayed head removal in 64 bits and cap it
  at MAX_JIFFY_OFFSET, so that a large delayed_removal_secs doesn't
  wrap around (Sashiko)
- Patch 2: kick requeue_work when delayed_removal_secs is cleared, so
  that queued bios also fail when paths remain but none is usable, and
  use the capped delay of patch 1 (Sashiko)
- Patch 2: keep Nilay's Reviewed-by, as only these two changes are new
- Update the numbers of patch 2 from a new run

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

v5: https://lore.kernel.org/r/20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev
v4: https://lore.kernel.org/r/20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev
v3: https://lore.kernel.org/r/20261114-bug-nvme-mpath-set-live-srcu-v3-0-d84651de6334@linux.dev
v2: https://lore.kernel.org/r/20261111-bug-nvme-mpath-set-live-srcu-v2-0-fc772914d293@linux.dev
v1: https://lore.kernel.org/r/20261110-bug-nvme-mpath-set-live-srcu-v1-1-1f58b405b0f8@linux.dev

---
Qiliang Yuan (3):
      nvme-multipath: keep a large delayed_removal_secs from wrapping around
      nvme-multipath: apply delayed_removal_secs changes to a pending removal
      nvme-multipath: don't wait for a grace period in nvme_mpath_set_live()

 drivers/nvme/host/core.c      |  7 +++++--
 drivers/nvme/host/multipath.c | 37 +++++++++++++++++++++++++++++++++++--
 drivers/nvme/host/nvme.h      |  1 +
 3 files changed, 41 insertions(+), 4 deletions(-)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261110-bug-nvme-mpath-set-live-srcu-cbd8965f1457

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

