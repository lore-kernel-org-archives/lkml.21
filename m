Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794438;
	b=HOplG3tzPb9inOywfrM2yktgsGn1L9RAks8qWi4QDKY+ceFBX2AvV7t+AQhzOs5LMhO9
	 IXYMJtKXbaVDh+nVPYFKWfHYR2Tas1jq+UDKkLQQrizPgb10/lxmSfW+l4i0/HBEREg3m
	 Fwsw9/MDcK4CnyD2/0Z/bwXmSwajhh8PUlYiOfXXDFO5MOawMUc2/TKq9gM+cnU5QxEM7
	 048EO/bdTLZzpGjsoRMmzgjC5oipt1xSbGKqsg5mrm4gSAwKolb+ThYFrF8oXPL0V5uaN
	 9ixWSJtqa4xSrrgJDsAKqqPGNT+S7hYGMzKIzm+a5Ta4U+91rcX+QCuZLszLEiO5m6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794438;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=xT45iqmn7XkfzEnsB+ayMAuJFThUwN/c5yJ57J+EwXI=;
	b=oO+wkwuQlcwZznknzW6A9xy/6qUnYtbpXJW2oyPGzLaCVfugNUP9i43ds7ZEMhkgdUNF
	 TNtkR2qBS/IjEPbxjh/rKxqsvlWC2uFDgR0Q0mC18rMvYjRf+Ux79y9cJ/ReWKedCetgD
	 GX0uebRvm9LgnhhHg+sGd5iwcfD4krA8MTQN/U0OtBKPxMsPnwVdJgs8hAko4ZhW8iCcD
	 3lTn4mEYhFVKK7GTwQt6aBCSEBraT4I4wZkn5KTZEF4sFHHJh6kc+8a26joGbRrW6tpaH
	 DKGlJTT/JVBqd7tQrEET5ePrC9J2gP0vlyGgNfW3u7hjHLhNzdwZ4njPlkFy4M8fZ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83EC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B83EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 14BA724545C;
	Fri, 27 Nov 2026 16:47:16 +0100 (CET)
Date: Fri, 27 Nov 2026 16:47:14 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Subject: [git pull] IOMMU Fixes for Linux v7.4-rc4
Message-ID: <awml8VcCjRQKHVXi@8bytes.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f:

  Linux 7.4-rc4 (2026-11-22 14:57:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git tags/iommu-fixes-v7.4-rc4

for you to fetch changes up to 10bcc637f7a657725dd8bbcc2b30d027acee6f2d:

  iommu/amd: Mark v2 page tables incoherent on Cezanne (2026-11-27 12:18:30 +0100)

----------------------------------------------------------------
IOMMU Fixes for Linux 7.4-rc4:

Including:

  - AMD IOMMU:
    - Fix DMA failures on AMD Cezanne by flushing CPU cache lines for IOMMU v2
      page tables.

  - VeriSilicon IOMMU:
    - Keep runtime PM callbacks available without CONFIG_PM_SLEEP, fixing an
      SError on the RK3588 AV1 decoder. Avoid sleeping in hard IRQ context,
      balance runtime PM references during TLB invalidation, and flush the TLB
      on resume.
    - Fix domain-switch locking and out-of-bounds access when attaching or
      resuming an identity domain. Drop the unsupported disable write on
      suspend and unprepare clocks if IRQ lookup fails during probe.

  - Hyper-V IOMMU:
    - Keep paging domains, their IDs, and their page tables allocated if the
      hypervisor fails to delete the domain, including during cleanup after a
      configuration failure.

----------------------------------------------------------------
Arun Iyengar (6):
      iommu/vsi: Don't leak a runtime PM reference in the TLB flush
      iommu/vsi: Don't resume the IOMMU in its interrupt handler
      iommu/vsi: Don't write the enable register on suspend
      iommu/vsi: Don't use the identity domain as a paging domain
      iommu/vsi: Unlink the IOMMU from its old domain under that domain's lock
      iommu/vsi: Unprepare the clocks when getting the IRQ fails

Daniel Golle (1):
      iommu/vsi: keep the runtime PM callbacks without PM_SLEEP

Vasant Hegde (1):
      iommu/amd: Mark v2 page tables incoherent on Cezanne

Yuho Choi (2):
      iommu/hyperv: Don't free a paging domain the hypervisor did not delete
      iommu/hyperv: Keep a new domain's page tables if it cannot be deleted

 drivers/iommu/amd/iommu.c             | 16 +++++++++
 drivers/iommu/hyperv/hv-iommu-guest.c | 34 ++++++++++++++----
 drivers/iommu/vsi-iommu.c             | 67 ++++++++++++++++++++---------------
 3 files changed, 83 insertions(+), 34 deletions(-)

Please pull.

Thanks,

	Joerg
