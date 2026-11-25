Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625284;
	b=W21vsdcXTcXbdWmliFOBGo9SezZ/IotzkY2XH8ATRGVFsaFm8AzX2N9DMgls0VPrUko3
	 UlWemXIv9GEJEnwQI1CmTCXnwJZibgdMT6rSpMHvZnDcRXg2HyeqQYV/mJSXaKP1+98JP
	 LNnKW6WUrt6/ivUYbIglYFAqAJCXBn7idDYgsdtsuTdxE4bpdfeN5HD/HnK+yLUGmBXlu
	 5ooXOgOAC1PDTG2hle6ub7tGbTs6I3CAwmJxloAamEImzGlBYOIhIFzC9tYjf5kL9mr0B
	 FxYUJEV8AFq1Mnb9+yjfPy2E2E6kd4Gc7vvrmDVsYtNbAhkBkQH1BqhAsWbTA7K9/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625284;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QJeZ+x3eJhTkGIcjnbTwbrh2IeIwne5CDHxBAKQWjVQ=;
	b=TbzLhiV0e/5eXGbbF789tf6vrxXdRlCZSQNwDdPQ6ALvQJ8expXj0LtXtoAVLYjxHkRH
	 i9tDNDp8mjM+oczetnyRt574HJ9GSVsJtXBYUsUtyJKgfs9uR5+kBiFencjLcL+7jQJo3
	 mnou6c2hilR7u+7YURU5cKsZlcLfqBq3QgiyPHkbBiGx+N5yKmqQLC/HCf11nmi1YAgTx
	 s673ZOQoUN3v++1UdGHXkg7eakvEiAoUDnNthUF3680ilwpjVRYXW1SKroDdjOVoeoExA
	 yc7syLViA9SWfn8uP0sFWZRwMjZuBg1OT/g4detX0lhblAcMjQUcbw6TUAcocuwxQAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OA794E2x;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE98606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE98606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OA794E2x
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F2BD2F;
	Wed, 25 Nov 2026 08:48:00 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6B0C3F632;
	Wed, 25 Nov 2026 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795625283; bh=1l1PZPFyRE7lWMzszYVAfyjxkf3TcpnGd4yb/Gqlgfg=;
	h=From:To:Cc:Subject:Date:From;
	b=OA794E2xaDuyzx++pztQ5ogUD6MTTCKkAPls9kbscCtBXRSGtPrBpzU7OsTo38qm4
	 CzIrF6ve8us2ShNUaEVG7Ee6v3krCfWYtQ5s/0o82Li/dg352VBX8f+kMe3iH03Yb/
	 10kVONmTNZI8rLqFRaqN2V8B68slzFl4t5x+HkcY=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	fenghuay@nvidia.com,
	bp@alien8.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] fs/resctrl: Use kvzalloc_objs() for large allocations
Date: Wed, 25 Nov 2026 16:47:50 +0000
Message-ID: <20261125164753.3759904-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
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

When running an MPAM model with lots of PARTIDs and PMGs I hit an allocation
failure in rmid_ptrs[].  Such failures are unlikely to be seen on a real system
but addressing them helps testing. Patch 3 open codes a kvzalloc_objs() based
allocation of a bitmap as I didn't think this was sufficient justification to
add the proper helpers in the bitmap code. Please let me know if this is the
right way to go. I made this the last patch so that it doesn't need to hold up
the other two patches.

Changes since v2:
Patch 1 unchanged
Pathes 2 and 3 are new to address other large allocations (Reinette)

v2: https://lore.kernel.org/lkml/20260911160608.1091121-1-ben.horgan@arm.com/

Ben Horgan (3):
  fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
  fs/resctrl: Allocate the arrays in struct rdt_l3_mon_domain using
    kvzalloc_objs()
  fs/resctrl: Allocate rdt_l3_mon_domain::rmid_busy_llc using
    kvzalloc_objs()

 fs/resctrl/monitor.c  |  4 ++--
 fs/resctrl/rdtgroup.c | 18 ++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

