Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425168;
	b=n2KpBVXKHBLjtwgq/LKFCHZl9Q8kNs/aEJnlqTP1zVpk8WxIS1qNNBGabFPZHeMxaQUG
	 22UCNnkApHVkJztoiybqdrYCcK2RwgfkIqtqLB0aTOwYK1Zn8PQeUltTwJMiICLe1FTAG
	 C/MXUu907TIs+fg6ieHQOZ8nG50pApWQS2Zp22ya2eTJfD4kFeK1yXLe34P0lglscdTJa
	 Z/DkQ+byAZqAD1XikYPcTgqsfYjKAoduZ6yCWDIA0RRJ+vswumeEYr3agwM6OhudOHCqP
	 P4AC/w5nMthmBfs5xs64gvdlaGTtJ3bjnhnccCc6qsPCYTR4kBEW8jJgh3fvJslsXGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425168;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s2D8/uPavo4B+52xkN7mqbyVWLZbzJO0+0fmiMvwH0A=;
	b=lgoBpkeHDnz5b3H7BPAzoY7hB+BpsPXo5W9g0o2uZZpzdmcgWp8VTzEwKdyDnFGgRxVZ
	 Ms0fpttd/eBatPx1nbDC6ABeNxH/vHKYOM9acwez5tE23e/BRoTQTVkWbJ2xn6RfSjEMo
	 Yx6qxy8uyKdpCZn++81dSSY6b0pkxLQSTAin/iqRDP+TnzVTA5tWCDhJLt7GbPrt7gSRl
	 H4UwX55pwlA4pVTnDVqJFS/o6EbCEpjKSu+CTy6qlcmRH4BX8d4ISQS49zo/hjDnI1uAR
	 R/QqmltNruPtH8GSyvS6UVTcnzX20YveMwVYy9qKIlOwnaviTLRsGGr4HMvNP7K3QOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NaQcinoX;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06000606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06000606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NaQcinoX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795425166; x=1826961166;
  h=date:from:to:cc:subject:message-id;
  bh=GnUaR2Z3EFJAi6+5M2NKiAroJF/deNAMwEzBEUTVAUc=;
  b=NaQcinoXKfayhA0fv/KgVZkthL+DOsQX7NVozl0Apf3vvC5aW05Vk+MR
   gwXLiLiHo8PLX+L0F/Q+BByaALEuyXVTJhxD+AUGQ+fAwz8Dkf04d+Qk6
   1eGNnJkHmzxHGGdlNQ1T2JElv8gxNdckyu219nMNPSkQhDvVA+J7QrdMm
   yVyvR+HTQyI2cp/nz91eRWjZo7hvpK+Gmz2InWQIz/kJ35tDyy7MmzbId
   PSyZ5BVTHT+hY7EeIi+tfCqITyX82GaRphDCrHI7+nehAeItmB0b9SyA5
   HN2luMwIYtbgYXf01qpg1KsdxqS/Bt2MzFXlnfHUXG+fmYvmohtHUCLfq
   A==;
X-CSE-ConnectionGUID: Fn2ybhCDQOmfA/cO3bp7wQ==
X-CSE-MsgGUID: 7+J3g8plRumNBthIBNBkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4250825"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4250825"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:12:39 -0800
X-CSE-ConnectionGUID: dv9uLq7ET1uoeU0KHsrqwg==
X-CSE-MsgGUID: UQyqrKe/RaqMmbyhTqRq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11662022"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Nov 2026 01:12:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVQ6F-00000001MuQ-2TDH;
	Mon, 23 Nov 2026 09:12:35 +0000
Date: Mon, 23 Nov 2026 17:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core:msr] BUILD SUCCESS
 26a8aea295613ed60e5999fa6017c62097a51ed5
Message-ID: <20261123171234.hg98OMWk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/msr
branch HEAD: 26a8aea295613ed60e5999fa6017c62097a51ed5  x86/msr: Switch native_wrmsrq() from macro to inline function

elapsed time: 951m

configs tested: 587
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261122    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261123    gcc-12.5.0 smatch
alpha                randconfig-r2100-20261122    gcc-15.3.0 cocci
alpha                randconfig-r2102-20261122    gcc-15.3.0 cocci
alpha                randconfig-r2103-20261123    gcc-14     cocci
alpha                randconfig-r2104-20261122    gcc-8.5.0  cocci
alpha                randconfig-r2109-20261123    gcc-16.2.0 cocci
alpha                randconfig-r2302-20261123    clang-24   sparse
alpha                randconfig-r2304-20261123    clang-24   sparse
alpha                randconfig-r2305-20261123    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                         nsim_700_defconfig    clang-24
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261123    clang-17
arc                   randconfig-1001-20261123    clang-17
arc                   randconfig-2000-20261122    gcc-9.5.0
arc                   randconfig-2000-20261123    gcc-12.5.0
arc                   randconfig-2001-20261122    gcc-9.5.0
arc                   randconfig-2001-20261123    gcc-12.5.0
arc                   randconfig-2002-20261122    gcc-9.5.0
arc                   randconfig-2002-20261123    gcc-12.5.0
arc                   randconfig-2003-20261122    gcc-9.5.0
arc                   randconfig-2003-20261123    gcc-12.5.0
arc                   randconfig-2004-20261122    gcc-9.5.0
arc                   randconfig-2004-20261123    gcc-12.5.0
arc                   randconfig-2005-20261122    gcc-9.5.0
arc                   randconfig-2005-20261123    gcc-12.5.0
arc                   randconfig-2200-20261122    gcc-9.5.0  smatch
arc                   randconfig-2200-20261123    gcc-12.5.0 smatch
arc                  randconfig-r2105-20261122    gcc-14.4.0 cocci
arc                  randconfig-r2106-20261122    clang-22   cocci
arc                  randconfig-r2106-20261123    gcc-16.2.0 cocci
arc                  randconfig-r2111-20261122    clang-22   cocci
arc                  randconfig-r2307-20261123    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261123    gcc-8.5.0  sparse
arc                  randconfig-r2310-20261123    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.2.0
arm                          at91_dt_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    clang-24
arm                       jornada720_defconfig    clang-24
arm                             mmp2_defconfig    clang-24
arm                        multi_v4t_defconfig    clang-24
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20261123    clang-17
arm                   randconfig-1001-20261123    clang-17
arm                   randconfig-1002-20261123    clang-17
arm                   randconfig-1003-20261123    clang-17
arm                   randconfig-2000-20261122    gcc-15.3.0
arm                   randconfig-2000-20261123    gcc-8.5.0
arm                   randconfig-2001-20261122    gcc-15.3.0
arm                   randconfig-2001-20261123    gcc-8.5.0
arm                   randconfig-2002-20261122    gcc-15.3.0
arm                   randconfig-2002-20261123    gcc-8.5.0
arm                   randconfig-2200-20261122    clang-19   smatch
arm                   randconfig-2200-20261123    gcc-8.5.0  smatch
arm                  randconfig-r2100-20261122    gcc-16.2.0 cocci
arm                  randconfig-r2100-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261123    gcc-8.5.0  cocci
arm                  randconfig-r2105-20261122    gcc-15.3.0 cocci
arm                  randconfig-r2302-20261123    clang-24   sparse
arm                  randconfig-r2303-20261122    clang-24   sparse
arm                  randconfig-r2309-20261123    gcc-8.5.0  sparse
arm                  randconfig-r2311-20261122    gcc-15.3.0 sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                            stm32_defconfig    clang-24
arm                          wpcm450_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261123    clang-17
arm64                 randconfig-1001-20261123    clang-17
arm64                 randconfig-1002-20261123    clang-17
arm64                 randconfig-1003-20261123    clang-17
arm64                 randconfig-2000-20261122    gcc-15.3.0
arm64                 randconfig-2000-20261123    gcc-8.5.0
arm64                 randconfig-2001-20261122    gcc-15.3.0
arm64                 randconfig-2001-20261123    gcc-8.5.0
arm64                 randconfig-2002-20261122    gcc-15.3.0
arm64                 randconfig-2002-20261123    gcc-8.5.0
arm64                 randconfig-2200-20261122    gcc-10.5.0 smatch
arm64                 randconfig-2200-20261123    clang-17   smatch
arm64                randconfig-r2100-20261123    gcc-14     cocci
arm64                randconfig-r2102-20261122    gcc-8.5.0  cocci
arm64                randconfig-r2105-20261123    gcc-14.4.0 cocci
arm64                randconfig-r2108-20261123    gcc-16.2.0 cocci
arm64                randconfig-r2303-20261122    clang-24   sparse
arm64                randconfig-r2303-20261123    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261123    clang-17
csky                  randconfig-1001-20261123    clang-17
csky                  randconfig-2000-20261122    gcc-9.5.0
csky                  randconfig-2000-20261123    gcc-12.5.0
csky                  randconfig-2001-20261122    gcc-9.5.0
csky                  randconfig-2001-20261123    gcc-12.5.0
csky                  randconfig-2200-20261122    gcc-9.5.0  smatch
csky                  randconfig-2200-20261123    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261122    gcc-8.5.0  cocci
csky                 randconfig-r2300-20261123    gcc-13.5.0 sparse
csky                 randconfig-r2307-20261122    gcc-11.5.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261123    gcc-8.5.0
hexagon               randconfig-1001-20261123    gcc-8.5.0
hexagon               randconfig-2000-20261122    gcc-9.5.0
hexagon               randconfig-2000-20261123    gcc-12.5.0
hexagon               randconfig-2001-20261122    gcc-9.5.0
hexagon               randconfig-2001-20261123    gcc-12.5.0
hexagon               randconfig-2200-20261122    clang-24   smatch
hexagon               randconfig-2200-20261123    clang-24   smatch
hexagon              randconfig-r2101-20261123    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261122    gcc-8.5.0  cocci
hexagon              randconfig-r2300-20261122    clang-24   sparse
hexagon              randconfig-r2303-20261123    clang-24   sparse
hexagon              randconfig-r2311-20261122    gcc-12.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261123    clang-22
i386        buildonly-randconfig-1001-20261123    clang-22
i386        buildonly-randconfig-1002-20261123    clang-22
i386        buildonly-randconfig-1003-20261123    clang-22
i386        buildonly-randconfig-1004-20261123    clang-22
i386        buildonly-randconfig-1005-20261123    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261123    clang-22
i386                  randconfig-1001-20261123    clang-22
i386                  randconfig-1002-20261123    clang-22
i386                  randconfig-1003-20261123    clang-22
i386                  randconfig-1004-20261123    clang-22
i386                  randconfig-1005-20261123    clang-22
i386                  randconfig-1006-20261123    clang-22
i386                  randconfig-1007-20261123    clang-22
i386                  randconfig-1008-20261123    clang-22
i386                  randconfig-1009-20261123    clang-22
i386                  randconfig-1010-20261123    clang-22
i386                  randconfig-1011-20261123    clang-22
i386                  randconfig-1012-20261123    clang-22
i386                  randconfig-1013-20261123    clang-22
i386                  randconfig-2000-20261122    clang-22
i386                  randconfig-2000-20261123    gcc-14
i386                  randconfig-2001-20261122    clang-22
i386                  randconfig-2001-20261123    gcc-14
i386                  randconfig-2002-20261122    clang-22
i386                  randconfig-2002-20261123    gcc-14
i386                  randconfig-2003-20261122    clang-22
i386                  randconfig-2003-20261123    gcc-14
i386                  randconfig-2004-20261122    clang-22
i386                  randconfig-2004-20261123    gcc-14
i386                  randconfig-2005-20261122    clang-22
i386                  randconfig-2005-20261123    gcc-14
i386                  randconfig-2100-20261122    clang-22   cocci
i386                  randconfig-2100-20261123    clang-22   cocci
i386                  randconfig-2101-20261122    clang-22   cocci
i386                  randconfig-2101-20261123    clang-22   cocci
i386                  randconfig-2102-20261122    clang-22   cocci
i386                  randconfig-2102-20261123    clang-22   cocci
i386                  randconfig-2103-20261122    clang-22   cocci
i386                  randconfig-2103-20261123    clang-22   cocci
i386                  randconfig-2104-20261122    clang-22   cocci
i386                  randconfig-2104-20261123    clang-22   cocci
i386                  randconfig-2105-20261122    clang-22   cocci
i386                  randconfig-2105-20261123    clang-22   cocci
i386                  randconfig-2200-20261122    gcc-14     smatch
i386                  randconfig-2200-20261123    gcc-14     smatch
i386                  randconfig-2300-20261122    clang-22   sparse
i386                  randconfig-2300-20261123    gcc-14     sparse
i386                  randconfig-2301-20261122    clang-22   sparse
i386                  randconfig-2301-20261123    gcc-14     sparse
i386                  randconfig-2302-20261122    clang-22   sparse
i386                  randconfig-2302-20261123    gcc-14     sparse
i386                 randconfig-r2100-20261122    gcc-8.5.0  cocci
i386                 randconfig-r2101-20261122    gcc-16.2.0 cocci
i386                 randconfig-r2102-20261123    gcc-8.5.0  cocci
i386                 randconfig-r2105-20261122    gcc-16.2.0 cocci
i386                 randconfig-r2105-20261123    gcc-14     cocci
i386                 randconfig-r2107-20261123    clang-22   cocci
i386                 randconfig-r2107-20261123    gcc-16.2.0 cocci
i386                 randconfig-r2109-20261122    clang-22   cocci
i386                 randconfig-r2302-20261122    clang-24   sparse
i386                 randconfig-r2308-20261122    gcc-15.3.0 sparse
i386                 randconfig-r2310-20261122    gcc-12.5.0 sparse
i386                 randconfig-r2310-20261123    clang-24   sparse
i386                 randconfig-r2311-20261123    gcc-8.5.0  sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261123    gcc-8.5.0
loongarch             randconfig-1001-20261123    gcc-8.5.0
loongarch             randconfig-2000-20261122    clang-24
loongarch             randconfig-2000-20261123    gcc-16.2.0
loongarch             randconfig-2001-20261122    clang-24
loongarch             randconfig-2001-20261123    gcc-16.2.0
loongarch             randconfig-2200-20261122    clang-24   smatch
loongarch             randconfig-2200-20261123    clang-24   smatch
loongarch            randconfig-r2106-20261123    clang-22   cocci
loongarch            randconfig-r2109-20261122    gcc-16.2.0 cocci
loongarch            randconfig-r2111-20261122    gcc-8.5.0  cocci
loongarch            randconfig-r2309-20261123    clang-24   sparse
loongarch            randconfig-r2310-20261123    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261122    gcc-12.5.0 smatch
m68k                  randconfig-2200-20261123    gcc-8.5.0  smatch
m68k                 randconfig-r2107-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2108-20261123    clang-22   cocci
m68k                 randconfig-r2110-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2111-20261122    gcc-16.2.0 cocci
m68k                 randconfig-r2305-20261122    clang-24   sparse
m68k                 randconfig-r2305-20261123    gcc-13.5.0 sparse
m68k                 randconfig-r2308-20261123    clang-24   sparse
m68k                            sun3_defconfig    clang-24
m68k                            virt_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261122    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261123    gcc-16.2.0 smatch
microblaze           randconfig-r2101-20261122    gcc-8.5.0  cocci
microblaze           randconfig-r2105-20261123    gcc-8.5.0  cocci
microblaze           randconfig-r2109-20261123    clang-22   cocci
microblaze           randconfig-r2301-20261123    clang-24   sparse
microblaze           randconfig-r2309-20261122    gcc-15.3.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath25_defconfig    gcc-16.2.0
mips                           ath79_defconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    clang-24
mips                  randconfig-2000-20261122    gcc-15.3.0
mips                  randconfig-2000-20261123    gcc-10.5.0
mips                  randconfig-2001-20261122    gcc-15.3.0
mips                  randconfig-2001-20261123    gcc-10.5.0
mips                  randconfig-2002-20261122    gcc-15.3.0
mips                  randconfig-2002-20261123    gcc-10.5.0
mips                  randconfig-2200-20261122    gcc-11.5.0 smatch
mips                  randconfig-2200-20261123    gcc-14.4.0 smatch
mips                 randconfig-r2101-20261123    gcc-14     cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261123    gcc-8.5.0
nios2                 randconfig-1001-20261123    gcc-8.5.0
nios2                 randconfig-2000-20261122    clang-24
nios2                 randconfig-2000-20261123    gcc-16.2.0
nios2                 randconfig-2001-20261122    clang-24
nios2                 randconfig-2001-20261123    gcc-16.2.0
nios2                 randconfig-2200-20261122    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261123    gcc-8.5.0  smatch
nios2                randconfig-r2102-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2105-20261122    gcc-8.5.0  cocci
nios2                randconfig-r2108-20261122    gcc-16.2.0 cocci
nios2                randconfig-r2304-20261122    clang-24   sparse
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261122    gcc-15.3.0
openrisc              randconfig-2000-20261123    gcc-10.5.0
openrisc              randconfig-2001-20261122    gcc-15.3.0
openrisc              randconfig-2001-20261123    gcc-10.5.0
openrisc              randconfig-2002-20261122    gcc-15.3.0
openrisc              randconfig-2002-20261123    gcc-10.5.0
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc              randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc             randconfig-r2100-20261122    gcc-8.5.0  cocci
openrisc             randconfig-r2101-20261122    gcc-14.4.0 cocci
openrisc             randconfig-r2103-20261122    gcc-8.5.0  cocci
openrisc             randconfig-r2104-20261122    gcc-16.2.0 cocci
openrisc             randconfig-r2308-20261123    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261123    clang-24
parisc                randconfig-1001-20261123    clang-24
parisc                randconfig-2000-20261122    clang-24
parisc                randconfig-2000-20261123    gcc-16.2.0
parisc                randconfig-2001-20261122    clang-24
parisc                randconfig-2001-20261123    gcc-16.2.0
parisc                randconfig-2200-20261122    gcc-8.5.0  smatch
parisc                randconfig-2200-20261123    gcc-14.4.0 smatch
parisc               randconfig-r2101-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2103-20261122    gcc-14.4.0 cocci
parisc               randconfig-r2103-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2103-20261123    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261122    gcc-15.3.0 cocci
parisc               randconfig-r2108-20261122    gcc-8.5.0  cocci
parisc               randconfig-r2304-20261122    clang-24   sparse
parisc               randconfig-r2306-20261122    gcc-11.5.0 sparse
parisc               randconfig-r2311-20261122    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                    motionpro_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    clang-24
powerpc               randconfig-1000-20261123    clang-24
powerpc               randconfig-1001-20261123    clang-24
powerpc               randconfig-2000-20261122    clang-24
powerpc               randconfig-2000-20261123    clang-21
powerpc               randconfig-2001-20261122    clang-24
powerpc               randconfig-2001-20261123    clang-21
powerpc               randconfig-2002-20261122    clang-24
powerpc               randconfig-2002-20261123    clang-21
powerpc               randconfig-2200-20261122    gcc-16.2.0 smatch
powerpc               randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc              randconfig-r2301-20261123    clang-24   sparse
powerpc                     sam440ep_defconfig    clang-24
powerpc64                         alldefconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261123    clang-24
powerpc64             randconfig-1001-20261123    clang-24
powerpc64             randconfig-2000-20261122    clang-24
powerpc64             randconfig-2000-20261123    clang-21
powerpc64             randconfig-2001-20261122    clang-24
powerpc64             randconfig-2001-20261123    clang-21
powerpc64             randconfig-2002-20261122    clang-24
powerpc64             randconfig-2002-20261123    clang-21
powerpc64             randconfig-2200-20261122    clang-24   smatch
powerpc64             randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64            randconfig-r2100-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2102-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2103-20261123    gcc-14.4.0 cocci
powerpc64            randconfig-r2104-20261123    gcc-14.4.0 cocci
powerpc64            randconfig-r2110-20261123    clang-22   cocci
powerpc64            randconfig-r2110-20261123    gcc-16.2.0 cocci
powerpc64            randconfig-r2300-20261123    clang-24   sparse
powerpc64            randconfig-r2301-20261122    clang-24   sparse
powerpc64            randconfig-r2302-20261123    gcc-13.5.0 sparse
powerpc64            randconfig-r2305-20261122    clang-24   sparse
powerpc64            randconfig-r2306-20261123    gcc-8.5.0  sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261123    clang-17
riscv                 randconfig-1001-20261123    clang-17
riscv                 randconfig-2000-20261122    gcc-14.4.0
riscv                 randconfig-2000-20261123    gcc-11.5.0
riscv                 randconfig-2001-20261122    gcc-14.4.0
riscv                 randconfig-2001-20261123    gcc-11.5.0
riscv                 randconfig-2002-20261122    gcc-14.4.0
riscv                 randconfig-2002-20261123    gcc-11.5.0
riscv                 randconfig-2003-20261122    gcc-14.4.0
riscv                 randconfig-2003-20261123    gcc-11.5.0
riscv                 randconfig-2004-20261122    gcc-14.4.0
riscv                 randconfig-2004-20261123    gcc-11.5.0
riscv                 randconfig-2005-20261122    gcc-14.4.0
riscv                 randconfig-2005-20261123    gcc-11.5.0
riscv                 randconfig-2200-20261122    gcc-8.5.0  smatch
riscv                 randconfig-2200-20261123    clang-17   smatch
riscv                randconfig-r2106-20261122    gcc-8.5.0  cocci
riscv                randconfig-r2108-20261122    clang-22   cocci
riscv                randconfig-r2307-20261122    gcc-15.3.0 sparse
riscv                randconfig-r2307-20261123    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261123    clang-17
s390                  randconfig-1001-20261123    clang-17
s390                  randconfig-2000-20261122    clang-17
s390                  randconfig-2000-20261123    clang-20
s390                  randconfig-2001-20261122    clang-17
s390                  randconfig-2001-20261123    clang-20
s390                  randconfig-2002-20261122    clang-17
s390                  randconfig-2002-20261123    clang-20
s390                  randconfig-2003-20261122    clang-17
s390                  randconfig-2003-20261123    clang-20
s390                  randconfig-2004-20261122    clang-17
s390                  randconfig-2004-20261123    clang-20
s390                  randconfig-2005-20261122    clang-17
s390                  randconfig-2005-20261123    clang-20
s390                  randconfig-2200-20261122    gcc-8.5.0  smatch
s390                  randconfig-2200-20261123    clang-24   smatch
s390                 randconfig-r2110-20261122    clang-22   cocci
s390                 randconfig-r2111-20261123    clang-22   cocci
s390                 randconfig-r2302-20261122    clang-24   sparse
s390                 randconfig-r2304-20261123    gcc-13.5.0 sparse
s390                 randconfig-r2308-20261122    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261123    clang-17
sh                    randconfig-1001-20261123    clang-17
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2000-20261123    gcc-16.2.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2001-20261123    gcc-16.2.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2002-20261123    gcc-16.2.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2003-20261123    gcc-16.2.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2004-20261123    gcc-16.2.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2005-20261123    gcc-16.2.0
sh                    randconfig-2200-20261122    gcc-13.5.0 smatch
sh                    randconfig-2200-20261123    gcc-16.2.0 smatch
sh                   randconfig-r2102-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2102-20261123    gcc-14.4.0 cocci
sh                   randconfig-r2104-20261122    gcc-14.4.0 cocci
sh                   randconfig-r2106-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2109-20261122    gcc-8.5.0  cocci
sh                   randconfig-r2301-20261122    clang-24   sparse
sh                   randconfig-r2309-20261122    gcc-11.5.0 sparse
sh                           rsk7269_defconfig    clang-24
sh                            sh2007_defconfig    gcc-16.2.0
sh                    sh7770_generic_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261123    gcc-14
sparc                 randconfig-1001-20261123    gcc-14
sparc                 randconfig-2000-20261122    clang-21
sparc                 randconfig-2000-20261123    gcc-9.5.0
sparc                 randconfig-2001-20261122    clang-21
sparc                 randconfig-2001-20261123    gcc-9.5.0
sparc                 randconfig-2200-20261122    gcc-16.2.0 smatch
sparc                 randconfig-2200-20261123    gcc-12.5.0 smatch
sparc                randconfig-r2103-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2107-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2306-20261122    gcc-12.5.0 sparse
sparc                randconfig-r2306-20261122    gcc-15.3.0 sparse
sparc                randconfig-r2306-20261123    gcc-8.5.0  sparse
sparc                randconfig-r2307-20261123    clang-24   sparse
sparc                randconfig-r2308-20261122    gcc-12.5.0 sparse
sparc                randconfig-r2309-20261123    gcc-8.5.0  sparse
sparc                randconfig-r2310-20261122    gcc-11.5.0 sparse
sparc                randconfig-r2311-20261123    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261123    gcc-14
sparc64               randconfig-1001-20261123    gcc-14
sparc64               randconfig-2000-20261122    clang-21
sparc64               randconfig-2000-20261123    gcc-9.5.0
sparc64               randconfig-2001-20261122    clang-21
sparc64               randconfig-2001-20261123    gcc-9.5.0
sparc64               randconfig-2200-20261122    clang-20   smatch
sparc64               randconfig-2200-20261123    clang-22   smatch
sparc64              randconfig-r2107-20261122    clang-22   cocci
sparc64              randconfig-r2301-20261123    gcc-13.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261123    gcc-14
um                    randconfig-1001-20261123    gcc-14
um                    randconfig-2000-20261122    clang-21
um                    randconfig-2000-20261123    gcc-9.5.0
um                    randconfig-2001-20261122    clang-21
um                    randconfig-2001-20261123    gcc-9.5.0
um                    randconfig-2200-20261122    gcc-14     smatch
um                    randconfig-2200-20261123    clang-21   smatch
um                   randconfig-r2100-20261123    gcc-14.4.0 cocci
um                   randconfig-r2101-20261123    gcc-14.4.0 cocci
um                   randconfig-r2306-20261123    clang-24   sparse
um                   randconfig-r2311-20261123    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261123    clang-22
x86_64      buildonly-randconfig-1001-20261123    clang-22
x86_64      buildonly-randconfig-1002-20261123    clang-22
x86_64      buildonly-randconfig-1003-20261123    clang-22
x86_64      buildonly-randconfig-1004-20261123    clang-22
x86_64      buildonly-randconfig-1005-20261123    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261123    gcc-14
x86_64                randconfig-1001-20261123    gcc-14
x86_64                randconfig-1002-20261123    gcc-14
x86_64                randconfig-1003-20261123    gcc-14
x86_64                randconfig-1004-20261123    gcc-14
x86_64                randconfig-1005-20261123    gcc-14
x86_64                randconfig-1006-20261123    gcc-14
x86_64                randconfig-1007-20261123    gcc-14
x86_64                randconfig-1008-20261123    gcc-14
x86_64                randconfig-1009-20261123    gcc-14
x86_64                randconfig-1010-20261123    gcc-14
x86_64                randconfig-1011-20261123    gcc-14
x86_64                randconfig-1012-20261123    gcc-14
x86_64                randconfig-1013-20261123    gcc-14
x86_64                randconfig-1014-20261123    gcc-14
x86_64                randconfig-1015-20261123    gcc-14
x86_64                randconfig-1016-20261123    gcc-14
x86_64                randconfig-1017-20261123    gcc-14
x86_64                randconfig-2000-20261122    clang-22
x86_64                randconfig-2000-20261123    gcc-14
x86_64                randconfig-2001-20261122    clang-22
x86_64                randconfig-2001-20261123    gcc-14
x86_64                randconfig-2002-20261122    clang-22
x86_64                randconfig-2002-20261123    gcc-14
x86_64                randconfig-2003-20261122    clang-22
x86_64                randconfig-2003-20261123    gcc-14
x86_64                randconfig-2004-20261122    clang-22
x86_64                randconfig-2004-20261123    gcc-14
x86_64                randconfig-2005-20261122    clang-22
x86_64                randconfig-2005-20261123    gcc-14
x86_64                randconfig-2100-20261122    clang-22   cocci
x86_64                randconfig-2100-20261122    gcc-14     cocci
x86_64                randconfig-2100-20261123    clang-22   cocci
x86_64                randconfig-2101-20261122    gcc-14     cocci
x86_64                randconfig-2101-20261123    clang-22   cocci
x86_64                randconfig-2102-20261122    gcc-14     cocci
x86_64                randconfig-2102-20261123    clang-22   cocci
x86_64                randconfig-2103-20261122    clang-22   cocci
x86_64                randconfig-2103-20261122    gcc-14     cocci
x86_64                randconfig-2103-20261123    clang-22   cocci
x86_64                randconfig-2104-20261122    gcc-14     cocci
x86_64                randconfig-2104-20261123    clang-22   cocci
x86_64                randconfig-2105-20261122    clang-22   cocci
x86_64                randconfig-2105-20261122    gcc-14     cocci
x86_64                randconfig-2105-20261123    clang-22   cocci
x86_64                randconfig-2200-20261122    clang-22   smatch
x86_64                randconfig-2200-20261123    gcc-14     smatch
x86_64                randconfig-2300-20261122    clang-22   sparse
x86_64                randconfig-2300-20261123    gcc-14     sparse
x86_64                randconfig-2301-20261122    clang-22   sparse
x86_64                randconfig-2301-20261123    gcc-14     sparse
x86_64                randconfig-2302-20261122    clang-22   sparse
x86_64                randconfig-2302-20261123    gcc-14     sparse
x86_64               randconfig-r2104-20261123    gcc-14     cocci
x86_64               randconfig-r2304-20261123    clang-24   sparse
x86_64               randconfig-r2309-20261122    gcc-12.5.0 sparse
x86_64               randconfig-r2310-20261122    gcc-15.3.0 sparse
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
xtensa                        common_defconfig    clang-24
xtensa                randconfig-1000-20261123    gcc-14
xtensa                randconfig-1001-20261123    gcc-14
xtensa                randconfig-2000-20261122    gcc-9.5.0
xtensa                randconfig-2000-20261123    gcc-12.5.0
xtensa                randconfig-2001-20261122    gcc-9.5.0
xtensa                randconfig-2001-20261123    gcc-12.5.0
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa                randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa               randconfig-r2102-20261123    gcc-14     cocci
xtensa               randconfig-r2110-20261122    gcc-16.2.0 cocci
xtensa               randconfig-r2111-20261123    gcc-16.2.0 cocci
xtensa               randconfig-r2300-20261122    clang-24   sparse
xtensa               randconfig-r2300-20261123    clang-24   sparse
xtensa               randconfig-r2307-20261122    gcc-12.5.0 sparse
xtensa                     smp_lx200_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
