Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144194;
	b=UDOyS1P1MsHn0ewyl1if5Cl5WGBCOfJwZ0bsrH2ti4iYOQE+7AdR6oWtEc9PmOwggrEr
	 kBt9lnb94Z88wygOtkcw+IMlSkqsMQ9K0/aZO6u9mAJaY37VxEeZbmrp0iEKeFD8orG7l
	 /d2Rpg8zj7EkXl10tGZiPCDFqU1HFiKUVxBZfPiZaKnWVSYOtRV4msFcEmyKSpNgmz4q4
	 PowyBDTsZbhZxtiBeJ69sIwrky3iZO7XcbdvCQOYuZh5SHaHrSqBnJkAVJylKAq9XdL4T
	 jB6mwWE0Fxh8z06F5Mnu6UGQegqB5hNVkibey7On6zeEEGY48Ggvm+nT9WQljMc2FOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xL6v4gSfPCj4oFtcK3rzKCM2DePttIdhJGjKj1DMup4=;
	b=1ZhkiJgg7mRBH7KGmWX0hNCGwTMRwPo+/rCaIKC71A+XJotEYqZ3tdtfFyRlRnhA4X4b
	 aq8J5CadIk7oAtXd4RKz67nCkgshR+qvZt+Gta9FGOKY14QoIh76bwk59x7OiTtZhPNLf
	 D1t9JD7ZK3uJGWHPk/qseRNBDu2bT++VmF8ELbC3tZe9Mktc7oWs+LY1Bji5s1BG+npb1
	 ZjEX5pmY6l0XNL0X4nSe5yfvh4SC2iWrTbrTWjHupNKeEZxDICjCkLTm4H21G3l1/HeVK
	 3G+HKSmwUIB6eivkjbKH1i8Zvi8EvVqd1nhksXBNakcowVx1NOrr7TKiUX55VTfwH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GIhzePGL;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98D1606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GIhzePGL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795144193; x=1826680193;
  h=date:from:to:cc:subject:message-id;
  bh=JJRoSEzKCgTKs6tbXdRfQqFE5LdyVCbKyOV8yhgVsDI=;
  b=GIhzePGLpKo+1HhG435/+sHs/e7gvSYMUEUsCWxvEBnbeN9AaASVra5U
   ewMeBzVpaosx+9/jlCtbBfRUQG4rRpYRUC7dZrQnSG+JEe3/cYnTVwRea
   VxsNZGKldf48tI4WYd1o2TqGI6zG7cQicHIbCSWVUEeh/Vqnrto7UsNkn
   0dHAIySa9bGJ2t+mn2c6mGzC3dxMreC76kmSyfhpz8nk4IhvZoRnK1LyL
   9T828iJEI7B56WHm1YezMr4elg2yr0lApUHIMzI77YTgzLSf/cBNzodMX
   U6uS/+l9HfhktLNpOoEYsBuJDHtRTnXq1jqZgTafu3SbKP6M1q9HinLlZ
   g==;
X-CSE-ConnectionGUID: aWaJMvP0TB+eBkQMkzj2yQ==
X-CSE-MsgGUID: iN5Kv4nQRVOGuhnqnZ9xZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3909075"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3909075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 19:09:52 -0800
X-CSE-ConnectionGUID: KxwyyNHSR2iO77PElcGTJg==
X-CSE-MsgGUID: B/GW54WwRCGo7dyUdYfoDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10936182"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 19:09:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUF0U-000000003w9-1KHw;
	Fri, 20 Nov 2026 03:09:46 +0000
Date: Fri, 20 Nov 2026 04:09:16 +0100
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: {standard input}:3291: Error: operand out of range
 (0xfffffff6 not between 0 and 0x3f) `l.slli r17,r17,-10'
Message-ID: <20261120040830.4RGz3UBQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   65e4fd942f72a9dba0e4e257290c4fa1aa756854
commit: 2727aca4439ee4b9085141a3babadc8de580397f vdso: Add VDSO_UNALIGNED_PACKED config option
date:   11 days ago
config: openrisc-randconfig-2000-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120040830.4RGz3UBQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120040830.4RGz3UBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2727aca4439e ("vdso: Add VDSO_UNALIGNED_PACKED config option")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120040830.4RGz3UBQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:3291: Error: operand out of range (0xfffffff6 not between 0 and 0x3f) `l.slli r17,r17,-10'
   {standard input}:3292: Error: operand out of range (0xfffffff6 not between 0 and 0x3f) `l.slli r19,r19,-10'
   {standard input}:3297: Error: operand out of range (0xfffffff6 not between 0 and 0x3f) `l.slli r6,r21,-10'
   {standard input}:3298: Error: operand out of range (0xfffffff6 not between 0 and 0x3f) `l.slli r7,r25,-10'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
