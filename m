Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549086;
	b=BwelD5MiXEoxwN5PRsJ8Rg2TE+Au5b0Zd2D9UxLmZunP1+/6l+IjX7Agy/OSSGfEuQOm
	 W/y/31+SPsYjiV56qYe+Z0lZ4alkvDG8zXOzekb29TQo/DXnRctFCo+b5bq7Ppj1Wides
	 tiP8SUPhsJh6LZxbKRCqPVJXOQv6/W6o3hyGNJTJX+4sei6cVbyokzyveRLa/r545mjak
	 Tp9IJr79M1SmX/ByxPLnKnY62uMkSvZZ0K6FPp0P9Rs3kWpD/D7gGZhlVfOtPa1OTIMqC
	 wjy3Vxm66mf0xkyeUTFla+2gNCbFl6ASqxyRK8fgBUkbU2P/gFMfpfEWvm9z2u8wl5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7w2aDAAV/9FtBjws8Kq68VWJW7RYLhY7cO3zDPAXeVE=;
	b=d6Os9oXzz8LgvlfM2Scj0g304drPxWvmRbdMu78G7uB3p8Yf7Ix206fMQ402TuzoBxZ+
	 iIegiLNKIUNEkeecdveAJwxW4nPrcBI4sGDlVRvKYEqdhV0AWM6VAmYlXOWkUkHVWTHuh
	 fRxgxV/twxxIQxJ/nrfNHOVZ0RHLFnmLZe81pwFVCBx+VSKY7bnOwefevB1yjmX/XCUyj
	 ngAN9CHbz68MflubBey3B+ZWPViVXNP931B6iQFEeR5UdbzDSkSVCjVh7XG5+pV57/3Jm
	 CD2Tte0glwfh1C0bL4Fvn4zX7+wqfIk2I2YGeYqr3f7dmH3EK45AnCIb2aFcdjkqRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvTb3++2;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3802C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3802C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvTb3++2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795549086; x=1827085086;
  h=date:from:to:cc:subject:message-id;
  bh=hXRhqvkmnQhh0eUoJJQenrUXe3UiC7tS4uixMawqSE0=;
  b=jvTb3++2YdSYk2/QrgsvxbpsnCz+PdMHdhPso7OL9vyn6LxWEQIZTzkl
   wQhuUbgJc1wOr8Iz8+h27hVF090IXm42zadVQcGNiq1tQV0D/CIgnKLz9
   7Twzm9Qxg5/ez0jXPDw74khzRvfXgNilFPcRGRFMHkOEgYnAWr2NPFojR
   v/6nr1BDCPv6a2OmgKuyWYZgP2zimjZefQ/Ngwmq/31opWKnXJChAanFq
   X51kxK/fw5NefT6XcWc08FeMfXNWX5pf6yx1pOeLg4LQbnDWZJh3ZsDGF
   P/lrmxJ8rB3To5/eR1ATvkwg7UTCUV9vDq8TXiadjSyEiiYBHE4l65F03
   A==;
X-CSE-ConnectionGUID: X67rZ+XHTUSJrHhpzZ15sQ==
X-CSE-MsgGUID: DcOG4EFMSH6vquUZHzKXkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4337583"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4337583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 11:38:06 -0800
X-CSE-ConnectionGUID: POxJbFrLR4CZIAlIAzlDBA==
X-CSE-MsgGUID: 9R00VVb+ThW24xEK9X/Eng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12107286"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2026 11:38:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVwL4-000000005Fx-0NVy;
	Tue, 24 Nov 2026 19:38:02 +0000
Date: Tue, 24 Nov 2026 20:37:34 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 run_init_process+0x30 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <20261124203048.gGV9q1RN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
commit: 9a8e296958884b807a02759975170b6559901242 fs: make userspace_init_fs a dynamically-initialized pointer
date:   5 months ago
config: xtensa-randconfig-r2311-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124203048.gGV9q1RN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124203048.gGV9q1RN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a8e29695888 ("fs: make userspace_init_fs a dynamically-initialized pointer")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124203048.gGV9q1RN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: run_init_process+0x30 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
