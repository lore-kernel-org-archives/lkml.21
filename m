Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868781;
	b=KC5O8rWtCLuRzzGnO7ucmaEOWyTOLRijWjBFAByBPcQrqoGRHjFJhCbe/cxuf+Ec7inG
	 6wz0oSFla8xxXlBmpr5+vpN1Qb1P/YMx7xiKsyjxo19J0LOKKogn/OGtrp8sUrySgKGiy
	 n0WlT6NHUpQMHsW2xE6tTA/xgVJsrZgiB38hKqi0n/8V948dWXPw6apEPsqg0mthPdHYs
	 Y1wSfK+fqNmphBtwzcgUAxVN6kfBFrSv6OzWRyAQy6zjJlMM5cAEDeXt+I314mX9J3RL3
	 lu3F0cigUZz5xIxTKmehhWqvSt3UeO4DqBNNhMg+Nos5oVYxNU+F+VzEeTW0OuWCbIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868781;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bjMv1M0j58Gop8/44L5jcoYKoKet1V6JY173gtjrx24=;
	b=kuDqlRl/eel5V6KyUvBd7oUjOqVZy3m/bSenrk0s08sM1LpWdfJxLGtQvZax3OzErItw
	 kYPWqwIxPRx0xqtClsUJMPnhMW6t+96qJ2Pdvp7JkTLC+FQODLpmARK/VKzzfQpmlD6X0
	 aGnK9ZHnFl0tqzQgbjOvcj3OXtEVMIrqX9sDBu/p9DHoVfxZrgkkUVwVekEtuytHEiqrY
	 aWcwwD7o7IjzxepNxFzM59yhOuqtJ4bSv+nZADJ3QcvoQhoRdO7+F8J4MO7oZSv9it2by
	 3GbaujgTLpqJD+NwZjmqcR1tAWQmiNMLdqhmwWFIzSj2GmLI5HskS26cVBTD+MZvQDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2qMabHv;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B25606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B25606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2qMabHv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795868780; x=1827404780;
  h=date:from:to:cc:subject:message-id;
  bh=pB+gXBHwBqEBVesPV7zBA1fK7/CcFURi8nic6gpu3kc=;
  b=P2qMabHv2Suj+2lpPPKDd2JfBanFGYdRB7u6ReYG1RUs/sK41p/Ifv+g
   LNQ+6xL9yZW0khAkcnmWGdF12sCQ1ykfG8ipMz0FB+FX7ZuK0jZnN4Ibf
   VzS2Oek3RUhNKELr/11xHmUYSnxfgIEwr/NFT397PL5KJdhGcLvhf6xGS
   T14vPqtavhmJefK2Uhvm3cu5gs0QELEXw1PqwClijg40fnPxr5kr6Tbgz
   ZV3AhrRQNmf4cAKQfmnCoNj0mrBecJiqBhVIm9VkWj32UruGHyMbKqbNs
   1xDfgJnn2sNfDIboeLhP89Ux2Y16bD3aZTcWqli6ZtsXo0SjJtgYtIKID
   Q==;
X-CSE-ConnectionGUID: WDkMvT4aSgyJqGbo0xlRPQ==
X-CSE-MsgGUID: wEVj/WY1SAmBmWifzhaCbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4663297"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4663297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 04:26:20 -0800
X-CSE-ConnectionGUID: SRm/5KgdQuuCqE4KFycLaA==
X-CSE-MsgGUID: q0WHwrzCTqixQbtrHxvssA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12915412"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Nov 2026 04:26:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXHVP-00000001WtN-1rsL;
	Sat, 28 Nov 2026 12:26:15 +0000
Date: Sat, 28 Nov 2026 20:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:sched:urgent] BUILD SUCCESS
 029fd68a263364583b6f9b34d22761acf0a3940c
Message-ID: <20261128202558.q2T6ymWz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/urgent
branch HEAD: 029fd68a263364583b6f9b34d22761acf0a3940c  sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()

elapsed time: 2408m

configs tested: 402
configs skipped: 22

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261127    gcc-10.5.0
alpha                 randconfig-2000-20261127    gcc-16.2.0
alpha                 randconfig-2001-20261127    gcc-16.2.0
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261127    gcc-12.5.0 smatch
alpha                randconfig-r2102-20261126    gcc-11.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-19
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                   randconfig-1000-20261127    gcc-8.5.0
arc                   randconfig-1001-20261127    gcc-8.5.0
arc                   randconfig-2000-20261126    gcc-11.5.0
arc                   randconfig-2001-20261126    gcc-8.5.0
arc                   randconfig-2002-20261126    gcc-8.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261126    gcc-15.3.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                   randconfig-2200-20261127    gcc-16.2.0 smatch
arm                                allnoconfig    gcc-16.2.0
arm                   randconfig-1000-20261127    gcc-8.5.0
arm                   randconfig-1001-20261127    gcc-8.5.0
arm                   randconfig-1002-20261127    gcc-8.5.0
arm                   randconfig-1003-20261127    gcc-8.5.0
arm                   randconfig-2000-20261126    gcc-8.5.0
arm                   randconfig-2000-20261127    gcc-10.5.0
arm                   randconfig-2000-20261127    gcc-8.5.0
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2001-20261127    gcc-10.5.0
arm                   randconfig-2002-20261127    gcc-10.5.0
arm                   randconfig-2002-20261127    gcc-16.2.0
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                   randconfig-2200-20261127    gcc-10.5.0 smatch
arm                  randconfig-r2305-20261127    gcc-9.5.0  sparse
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261127    gcc-8.5.0
arm64                 randconfig-1001-20261127    gcc-8.5.0
arm64                 randconfig-1002-20261127    gcc-8.5.0
arm64                 randconfig-1003-20261127    gcc-8.5.0
arm64                 randconfig-2000-20261127    clang-24
arm64                 randconfig-2000-20261127    gcc-10.5.0
arm64                 randconfig-2001-20261127    gcc-10.5.0
arm64                 randconfig-2001-20261127    gcc-8.5.0
arm64                 randconfig-2002-20261127    gcc-10.5.0
arm64                 randconfig-2002-20261127    gcc-8.5.0
arm64                 randconfig-2200-20261126    clang-24   smatch
arm64                 randconfig-2200-20261127    clang-24   smatch
arm64                randconfig-r2102-20261127    gcc-16.2.0 cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261127    gcc-8.5.0
csky                  randconfig-1001-20261127    gcc-8.5.0
csky                  randconfig-2000-20261127    gcc-10.5.0
csky                  randconfig-2000-20261127    gcc-12.5.0
csky                  randconfig-2001-20261127    gcc-12.5.0
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
csky                  randconfig-2200-20261127    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261127    gcc-16.2.0 cocci
csky                 randconfig-r2106-20261127    gcc-10.5.0 cocci
csky                 randconfig-r2304-20261127    gcc-9.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-1000-20261127    gcc-9.5.0
hexagon               randconfig-1001-20261127    gcc-9.5.0
hexagon               randconfig-2000-20261127    clang-24
hexagon               randconfig-2000-20261127    gcc-12.5.0
hexagon               randconfig-2001-20261127    clang-17
hexagon               randconfig-2001-20261127    gcc-12.5.0
hexagon               randconfig-2200-20261127    clang-24   smatch
hexagon              randconfig-r2109-20261127    gcc-10.5.0 cocci
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261127    clang-22
i386        buildonly-randconfig-1001-20261127    clang-22
i386        buildonly-randconfig-1002-20261127    clang-22
i386        buildonly-randconfig-1003-20261127    clang-22
i386        buildonly-randconfig-1004-20261127    clang-22
i386        buildonly-randconfig-1005-20261127    clang-22
i386                  randconfig-1000-20261127    clang-22
i386                  randconfig-1001-20261127    clang-22
i386                  randconfig-1002-20261127    clang-22
i386                  randconfig-1003-20261127    clang-22
i386                  randconfig-1004-20261127    clang-22
i386                  randconfig-1005-20261127    clang-22
i386                  randconfig-1006-20261127    clang-22
i386                  randconfig-2000-20261127    gcc-14
i386                  randconfig-2001-20261127    gcc-14
i386                  randconfig-2002-20261127    gcc-14
i386                  randconfig-2003-20261127    gcc-14
i386                  randconfig-2004-20261127    gcc-14
i386                  randconfig-2005-20261127    gcc-14
i386                  randconfig-2100-20261127    clang-22   cocci
i386                  randconfig-2101-20261127    clang-22   cocci
i386                  randconfig-2102-20261127    clang-22   cocci
i386                  randconfig-2102-20261127    gcc-14     cocci
i386                  randconfig-2103-20261127    clang-22   cocci
i386                  randconfig-2104-20261127    clang-22   cocci
i386                  randconfig-2105-20261127    clang-22   cocci
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2200-20261127    gcc-14     smatch
i386                 randconfig-r2301-20261127    gcc-14     sparse
i386                 randconfig-r2302-20261127    gcc-9.5.0  sparse
i386                 randconfig-r2303-20261127    gcc-9.5.0  sparse
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261127    gcc-9.5.0
loongarch             randconfig-1001-20261127    gcc-9.5.0
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2000-20261127    clang-24
loongarch             randconfig-2001-20261126    clang-18
loongarch             randconfig-2001-20261127    clang-24
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2110-20261127    gcc-10.5.0 cocci
loongarch            randconfig-r2302-20261127    gcc-13.5.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                         m5272c3_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261127    gcc-11.5.0
m68k                  randconfig-2000-20261127    gcc-16.2.0
m68k                  randconfig-2001-20261127    gcc-13.5.0
m68k                  randconfig-2001-20261127    gcc-16.2.0
m68k                  randconfig-2200-20261126    gcc-8.5.0  smatch
m68k                 randconfig-r2104-20261127    gcc-16.2.0 cocci
m68k                 randconfig-r2300-20261127    gcc-8.5.0  sparse
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261127    gcc-14.4.0
microblaze            randconfig-2000-20261127    gcc-16.2.0
microblaze            randconfig-2001-20261127    gcc-12.5.0
microblaze            randconfig-2001-20261127    gcc-16.2.0
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze            randconfig-2200-20261127    gcc-16.2.0 smatch
microblaze           randconfig-r2100-20261127    gcc-16.2.0 cocci
microblaze           randconfig-r2108-20261127    gcc-10.5.0 cocci
microblaze           randconfig-r2109-20261127    gcc-12.5.0 cocci
microblaze           randconfig-r2301-20261127    gcc-9.5.0  sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                     maltaup_xpa_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-8.5.0
mips                  randconfig-2000-20261127    gcc-14.4.0
mips                  randconfig-2001-20261126    gcc-15.3.0
mips                  randconfig-2001-20261127    gcc-14.4.0
mips                  randconfig-2002-20261126    gcc-9.5.0
mips                  randconfig-2002-20261127    gcc-14.4.0
mips                  randconfig-2200-20261126    gcc-15.3.0 smatch
mips                  randconfig-2200-20261127    clang-24   smatch
mips                          rt305x_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261127    gcc-9.5.0
nios2                 randconfig-1001-20261127    gcc-9.5.0
nios2                 randconfig-2000-20261126    gcc-11.5.0
nios2                 randconfig-2000-20261127    clang-24
nios2                 randconfig-2001-20261126    gcc-9.5.0
nios2                 randconfig-2001-20261127    clang-24
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                 randconfig-2200-20261127    gcc-8.5.0  smatch
nios2                randconfig-r2101-20261126    gcc-8.5.0  cocci
nios2                randconfig-r2303-20261127    gcc-8.5.0  sparse
nios2                randconfig-r2309-20261127    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2000-20261127    gcc-14.4.0
openrisc              randconfig-2001-20261126    gcc-13.5.0
openrisc              randconfig-2001-20261127    gcc-14.4.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261127    gcc-14.4.0
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc              randconfig-2200-20261127    gcc-12.5.0 smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261127    gcc-12.5.0
parisc                randconfig-1000-20261128    clang-17
parisc                randconfig-1001-20261127    gcc-12.5.0
parisc                randconfig-1001-20261128    clang-17
parisc                randconfig-2000-20261126    gcc-8.5.0
parisc                randconfig-2000-20261127    clang-24
parisc                randconfig-2001-20261126    gcc-8.5.0
parisc                randconfig-2001-20261127    clang-24
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2304-20261127    gcc-13.5.0 sparse
parisc               randconfig-r2305-20261127    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261127    gcc-12.5.0
powerpc               randconfig-1000-20261128    clang-17
powerpc               randconfig-1001-20261127    gcc-12.5.0
powerpc               randconfig-1001-20261128    clang-17
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2000-20261127    gcc-15.3.0
powerpc               randconfig-2000-20261127    gcc-8.5.0
powerpc               randconfig-2001-20261126    clang-17
powerpc               randconfig-2001-20261127    gcc-15.3.0
powerpc               randconfig-2001-20261127    gcc-9.5.0
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2002-20261127    gcc-15.3.0
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc               randconfig-2200-20261127    clang-24   smatch
powerpc              randconfig-r2105-20261127    gcc-16.2.0 cocci
powerpc              randconfig-r2107-20261127    gcc-10.5.0 cocci
powerpc                      tqm8560_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261127    gcc-12.5.0
powerpc64             randconfig-1000-20261128    clang-17
powerpc64             randconfig-1001-20261127    gcc-12.5.0
powerpc64             randconfig-1001-20261128    clang-17
powerpc64             randconfig-2000-20261127    gcc-15.3.0
powerpc64             randconfig-2000-20261127    gcc-8.5.0
powerpc64             randconfig-2001-20261127    gcc-15.3.0
powerpc64             randconfig-2002-20261127    clang-24
powerpc64             randconfig-2002-20261127    gcc-15.3.0
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64             randconfig-2200-20261127    gcc-15.3.0 smatch
powerpc64            randconfig-r2103-20261126    gcc-16.2.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261127    gcc-12.5.0
riscv                 randconfig-1001-20261127    gcc-12.5.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2000-20261127    clang-17
riscv                 randconfig-2001-20261126    clang-24
riscv                 randconfig-2001-20261127    clang-17
riscv                 randconfig-2002-20261126    clang-20
riscv                 randconfig-2002-20261127    clang-17
riscv                 randconfig-2003-20261126    gcc-16.2.0
riscv                 randconfig-2003-20261127    clang-17
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2004-20261127    clang-17
riscv                 randconfig-2005-20261126    clang-24
riscv                 randconfig-2005-20261127    clang-17
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261127    gcc-13.5.0 smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261127    gcc-12.5.0
s390                  randconfig-1001-20261127    gcc-12.5.0
s390                  randconfig-2000-20261126    clang-18
s390                  randconfig-2000-20261127    clang-24
s390                  randconfig-2001-20261126    gcc-8.5.0
s390                  randconfig-2001-20261127    clang-24
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2002-20261127    clang-24
s390                  randconfig-2003-20261126    clang-18
s390                  randconfig-2003-20261127    clang-24
s390                  randconfig-2004-20261126    gcc-10.5.0
s390                  randconfig-2004-20261127    clang-24
s390                  randconfig-2005-20261126    clang-21
s390                  randconfig-2005-20261127    clang-24
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                  randconfig-2200-20261127    clang-18   smatch
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261127    gcc-12.5.0
sh                    randconfig-1001-20261127    gcc-12.5.0
sh                    randconfig-2000-20261126    gcc-16.2.0
sh                    randconfig-2000-20261127    gcc-12.5.0
sh                    randconfig-2001-20261126    gcc-13.5.0
sh                    randconfig-2001-20261127    gcc-12.5.0
sh                    randconfig-2002-20261126    gcc-11.5.0
sh                    randconfig-2002-20261127    gcc-12.5.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2003-20261127    gcc-12.5.0
sh                    randconfig-2004-20261126    gcc-16.2.0
sh                    randconfig-2004-20261127    gcc-12.5.0
sh                    randconfig-2005-20261126    gcc-16.2.0
sh                    randconfig-2005-20261127    gcc-12.5.0
sh                    randconfig-2200-20261127    gcc-16.2.0 smatch
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261127    gcc-14
sparc                 randconfig-1000-20261128    clang-24
sparc                 randconfig-1001-20261127    gcc-14
sparc                 randconfig-1001-20261128    clang-24
sparc                 randconfig-2000-20261127    gcc-13.5.0
sparc                 randconfig-2001-20261127    gcc-13.5.0
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                 randconfig-2200-20261127    gcc-12.5.0 smatch
sparc                randconfig-r2100-20261126    gcc-8.5.0  cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261127    gcc-14
sparc64               randconfig-1000-20261128    clang-24
sparc64               randconfig-1001-20261127    gcc-14
sparc64               randconfig-1001-20261128    clang-24
sparc64               randconfig-2000-20261127    gcc-13.5.0
sparc64               randconfig-2001-20261127    gcc-13.5.0
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
sparc64               randconfig-2200-20261127    clang-20   smatch
sparc64              randconfig-r2103-20261127    gcc-16.2.0 cocci
sparc64              randconfig-r2106-20261127    gcc-8.5.0  cocci
sparc64              randconfig-r2110-20261127    clang-20   cocci
sparc64              randconfig-r2111-20261127    gcc-14.4.0 cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261127    gcc-14
um                    randconfig-1000-20261128    clang-24
um                    randconfig-1001-20261127    gcc-14
um                    randconfig-1001-20261128    clang-24
um                    randconfig-2000-20261127    gcc-13.5.0
um                    randconfig-2001-20261127    gcc-13.5.0
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2108-20261127    gcc-12     cocci
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261127    gcc-14
x86_64      buildonly-randconfig-1000-20261128    gcc-14
x86_64      buildonly-randconfig-1001-20261127    gcc-14
x86_64      buildonly-randconfig-1001-20261128    gcc-14
x86_64      buildonly-randconfig-1002-20261127    gcc-14
x86_64      buildonly-randconfig-1002-20261128    gcc-14
x86_64      buildonly-randconfig-1003-20261127    gcc-14
x86_64      buildonly-randconfig-1003-20261128    gcc-14
x86_64      buildonly-randconfig-1004-20261127    gcc-14
x86_64      buildonly-randconfig-1004-20261128    gcc-14
x86_64      buildonly-randconfig-1005-20261127    gcc-14
x86_64      buildonly-randconfig-1005-20261128    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261127    gcc-14
x86_64                randconfig-1001-20261127    gcc-14
x86_64                randconfig-1002-20261127    gcc-14
x86_64                randconfig-1003-20261127    gcc-14
x86_64                randconfig-1004-20261127    gcc-14
x86_64                randconfig-1005-20261127    gcc-14
x86_64                randconfig-2000-20261127    gcc-14
x86_64                randconfig-2001-20261127    gcc-14
x86_64                randconfig-2002-20261127    gcc-12
x86_64                randconfig-2002-20261127    gcc-14
x86_64                randconfig-2003-20261127    gcc-14
x86_64                randconfig-2004-20261127    gcc-14
x86_64                randconfig-2005-20261127    gcc-14
x86_64                randconfig-2100-20261127    clang-22   cocci
x86_64                randconfig-2101-20261127    clang-22   cocci
x86_64                randconfig-2102-20261127    clang-22   cocci
x86_64                randconfig-2103-20261127    clang-22   cocci
x86_64                randconfig-2104-20261127    clang-22   cocci
x86_64                randconfig-2105-20261127    clang-22   cocci
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2200-20261127    gcc-14     smatch
x86_64               randconfig-r2104-20261126    gcc-14     cocci
x86_64               randconfig-r2111-20261127    gcc-10.5.0 cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261127    gcc-14
xtensa                randconfig-1000-20261128    clang-24
xtensa                randconfig-1001-20261127    gcc-14
xtensa                randconfig-1001-20261128    clang-24
xtensa                randconfig-2000-20261127    gcc-12.5.0
xtensa                randconfig-2000-20261127    gcc-8.5.0
xtensa                randconfig-2001-20261127    gcc-12.5.0
xtensa                randconfig-2001-20261127    gcc-14.4.0
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa               randconfig-r2105-20261126    gcc-14.4.0 cocci
xtensa               randconfig-r2107-20261127    gcc-11.5.0 cocci
xtensa               randconfig-r2300-20261127    gcc-9.5.0  sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
