Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113939;
	b=Y2qDNU13zdA0s+TTr0J3rAC5mjqDV3KU0NNuG0Orh5zMpuNG2O6syUdBGaVQtgoZZSc/
	 gpunMLQePlhGDzvKL6E1oTqy+u2EzqTXyDtIgo6i3yGQ8o/7E2LYMROo7cr+7sJ4z4U4q
	 tmPklOqoeFra54+aa30SWnfY7t+9D3RbMACnV+yijEUUYPOVd+pxj0rCSwn0y+VmZM9FD
	 zeUtCBy1LN8HgiiWoG5K5pBvRSXQ7pBqdKNHkMqZ3+i9MRJ2aF8LFTSyxDXmejwJv9LvB
	 zveq0iMjm8KjnX4RIBalR5ecFSdkx9QxwAj/eq+7NTRiNwdgNPHEykCP/PRa8FFLS2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113939;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=irCiZAu30yZFxb8dTqSOTg+RM86kBDl2zI66vyFsxDw=;
	b=eGIpwRwMZWK5lvDawR0KWMFVc/EVtk3/d9NUK4gSuzCPCUZMGSmdtVyi6UNBuH/Aj9HX
	 TK4Cjelb64l+JD8/30Qc3sIXiG1GqKIV+938LGAEPg5mKky326T0Xt+fTvZJHbG535M3e
	 3f7qz8SHWiRujU40qCdviup49vgyUK+qq5eiuysUrXp/bsez1SLT8yAdwQlntGPcX50vT
	 zFpvJ/TJT1giV5+ueuUTWFn4pDa+ueeLkpQbEE6DBNhM+nfqU7ibWkVQZbAhPW+Zg7mHp
	 P+GKceU0zsUX0OK2S28ksDpwvCxVr8lJGMHjlvb3TsJBPf+kIGRiY1faVijJybEjhuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OPNlH7zO;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7FB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OPNlH7zO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795113939; x=1826649939;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YSmIHT3wHFEvU0PrNYevo0+CrXmVy0Ad1eCiGP9zAjA=;
  b=OPNlH7zOj8ZODhn0F6QWKgqynZsr4zJpzrMKt37PCxdjB7JNbmLdDIGb
   GpWobWKP7De3uQpFqlCjaVx9DUKZNceH+Yd508ppBZ1PSrm4u/SHUCxpx
   aafnlhV3Qlds/AY10sEjuQ0PAckAzyOPVCSYDlYjmLA8oDT5/K5sySyZh
   D8nSh+tk+EMtfD2M2bhsOot1PdIEPWETMme9IIX2I4qquGld3d0fLCIcQ
   eaquzaODxZLCiKWkaMO3u5OUWW3pWZvuVNTzbxH6VKrJ9Tx2zgLLmRvhO
   7iUaVar5Ajoa3Og3AjB1/2vaYhczI7Y/BBG+meL2QCsYQrp3rYrQlKQRf
   A==;
X-CSE-ConnectionGUID: x0iiEYk+RTSDOAnsVLLnZw==
X-CSE-MsgGUID: idJ+ZzZbQYyHkNbOuccFsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3981812"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3981812"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:45:38 -0800
X-CSE-ConnectionGUID: BKvh0bKITXOXmzXGb9wAmQ==
X-CSE-MsgGUID: bePDBXrqS4avuFPbz2K6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10513040"
Received: from spandruv-desk1.amr.corp.intel.com (HELO agluck-desk3.intel.com) ([10.124.223.213])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:45:38 -0800
From: Tony Luck <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Chen Yu <yu.c.chen@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH] x86/resctrl: Add SNC support for Granite Rapids "D" CPU
Date: Thu, 19 Nov 2026 10:45:24 -0800
Message-ID: <20261119184524.12846-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.56.0
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

Sub-NUMA Cluster (SNC) mode divides available RMID counters between
NUMA nodes that share an instance of an L3 cache.

Granite Rapids "D" CPUs can enable SNC mode, so Linux must adjust
when SNC is enabled.

Update the table of SNC capable CPU models.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a6a9090c4808..eee76570cf6a 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -381,6 +381,7 @@ static const struct x86_cpu_id snc_cpu_ids[] __initconst = {
 	X86_MATCH_VFM(INTEL_GRANITERAPIDS_X, 0),
 	X86_MATCH_VFM(INTEL_ATOM_CRESTMONT_X, 0),
 	X86_MATCH_VFM(INTEL_ATOM_DARKMONT_X, 0),
+	X86_MATCH_VFM(INTEL_GRANITERAPIDS_D, 0),
 	{}
 };
 
-- 
2.56.0

