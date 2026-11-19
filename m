Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074480;
	b=0cqBbn5UO56nib64buSDh+HJ0ZFpaeprF/aXk5sZO1eMhawYboQKqyKUgf+A5an/Ubzh
	 I22T8XuYShamOoryI9fErcUIuKDc2juWCav2dy+KM3y8UF8mv4dvzVM3mDJGyEeDHxFmo
	 4aTEqukD0p5/y2fwT35xs6gut8RVOR1/pcH+NIc53DKAPEddvONVh83m8ChS1o8Yo+OCs
	 oK9RNx7q98LEg0r6GGTV0SQ2dBAS+ZPT89OopT9Bj4XP3gQUWbuPOrx0SP5JoKZwf3ktg
	 qFkJHO3I2u3+t3+kJl6pH8ZzPrbf7SnEIHvD+bEWQY2t6xQkVOy8JpMujkRiWwoA9KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074480;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=k8wQn2zrk+SyXNs0qBDPodINcVqTvNgBNDuIN9CZB/M=;
	b=kYvJUI+J6RMAcii4sknN/rv+PFG5kMWqrFGa7vhpFTOGjIEqShG/8SRhviJbwtKpRE1F
	 g1ky8kH2DlTPP1zBiVrg6M/1ermZm2avJX6kr6Qvh6C5y/sUz8YJ9EKAbGx1+NIDwvifp
	 jRxq4IG0gF+C5wBhVyPleIyVOA8gas8Fq8R8eH1SSfNBRaiVcD38KdwhCtEAfW7K4a9Bk
	 wUuf1T+2jeW+3OrXL8bv4i8coRnJUj+l8kri2R09gb3RlkQ132Q93dKzZd2FbpL7SVr7q
	 VDYlBClFofknykYwUIP9dl4WrzgQ+5nDK/FTR2ZI82hTszwqLqB5gHSMnL15qsWPpYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nHZKwaL5;
	arc=none smtp.remote-ip=91.218.175.21
Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB4606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AB4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nHZKwaL5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vqLXCAwRd4aqGkQyYmkFh5Y1lbEweVRVduvoaIh12ao=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074476; v=1; x=1795679276;
 b=nHZKwaL5JkTXmk4KOFz4oTqH+xEKtbqxOjeHd9jS7xYsAyGa6Z076E+79rN8zh42C6hqvTd0
 y5yWCUgtoOR0HMjuMLM2nbNawqV9TxW+MXRTaeoa3ai08wworOR5XAuvYyNznKBJ34lqTulFS70
 7lUQEOtNE2QpB2PMhQFe5+YY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7492e609f4b5f62a;
	Thu, 19 Nov 2026 07:47:56 +0000
X-Mizu-Trace-ID: 7492e609f4b5f62a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/7] KVM: Documentation and comment fixes
Date: Thu, 19 Nov 2026 07:47:45 +0000
Message-ID: <20261119074752.1027729-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1 [1]:
  - Various fixes and rewordings. (Randy, Zenghui)
  - Collected tags from Randy and Zenghui. (thanks!)

This series fixes generic KVM documentation and comments, mostly
references to non-existent functions, structures and constants, plus a
few other one-line fixes and typos.

Patches 1-4 are for Documentation/virt/kvm, and 5-7 for code comments.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261111085448.1130701-1-fuad.tabba@linux.dev/

Fuad Tabba (7):
  Documentation: KVM: Fix references to non-existent identifiers
  Documentation: KVM: Fix lock names and a lock type in locking.rst
  Documentation: KVM: Fix the function that implements halt polling
  Documentation: KVM: Drop the stale number of vCPU request flags
  KVM: Fix comments that refer to non-existent identifiers
  KVM: Fix the range of reserved arch-independent request bits
  KVM: Fix typos in comments

 Documentation/virt/kvm/api.rst              | 40 ++++++++++-----------
 Documentation/virt/kvm/halt-polling.rst     |  2 +-
 Documentation/virt/kvm/locking.rst          | 10 +++---
 Documentation/virt/kvm/review-checklist.rst |  2 +-
 Documentation/virt/kvm/vcpu-requests.rst    |  3 +-
 include/linux/kvm_dirty_ring.h              |  4 +--
 include/linux/kvm_host.h                    | 16 ++++-----
 include/linux/kvm_irqfd.h                   |  4 +--
 include/uapi/linux/kvm.h                    | 10 +++---
 virt/kvm/binary_stats.c                     |  4 +--
 virt/kvm/eventfd.c                          |  4 +--
 virt/kvm/guest_memfd.c                      |  2 +-
 virt/kvm/kvm_main.c                         |  8 ++---
 13 files changed, 54 insertions(+), 55 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

