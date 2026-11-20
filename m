Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215735;
	b=TFoGl8imqjlVZVLYhW2T1DhhI+k0nTPwI4ecHIb2CG1C5s4R/53dL3fh6FTfg5rBiPCJ
	 nyN/dMVFSQ/cK/aZ5sm4eqY7FEALxjFXW65EgJdT2+NJQ+pqY1jCJXGH126a2eln9h7jg
	 GbLxI204ZTlRFzaS/zfENMBDZqejOWIezryFVy9kT+IOsH6U/zxY2zojSsz2v9Xi4BPKU
	 7FHvDB8d8wkGTtmkrZd7DXrIAQLXNke36BxFakwbtiuIM+Y6D4L/S4Vr0XiB9xc3pCaPc
	 xfbzzX3d6dhXowg0IGGobhyHaaJTGLCqVIvl6VtuIPpO+ZW8+GpFUsJHqUcm2Mx3cNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215735;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SpYRkC//f5GJ9/rWZMRNWMEty5haJUeipoEFRGk9v1c=;
	b=PkQyarX7phHwisMSkFnDW5ersWfY3vXA+QouohsxD31xLXS0rhHS9JV27III/3ON49yF
	 MwMNov5Ae0FIPtQAolOzBxkjqxH4353PhaOAoBRYC740n9ppPYQ1+iKsULxj8YQBdwaiK
	 VD0q5+qTH76bHLB7TYfgyfNLxuBydfyHz8esK1bDrJccVykX48zOfx8+AOjBOUufeBz0U
	 tI+d73KnrGAMRQFQVHF1cMYhFyy2xQCaiDWY7swdt/ZzFt7ws5bqbruEdnupCMbV/+OjN
	 UOp3W3a/ecvghLw0FiSA0Ig3t+RWWM4D6WT+ZkbEAjoLkhESsRsf2MEfZd5j9c8BMSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W8bpcbEI;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA115606A69A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA115606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W8bpcbEI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795215729; x=1826751729;
  h=date:from:to:cc:subject:message-id;
  bh=m5rZDKHe1SDpY76OHTEio7imMYpPw+oIdU3JDHzYTmg=;
  b=W8bpcbEIvxyQ5ZWzXh2n2HATQ8FdKhpNk40pkI4rP+cQDoTSQHvLFfJP
   3K60F2bb9ZDtjQkrmL32u5ug5z63t4ikPa3hKbg48Y97skyNEe+YRFsmC
   KjUVj+WzlCwepRXS3bYtmmpoW2xJ65GvjxGtMHH9Hj4M02nGCxhOQIg7b
   AnIkbvKGLr23bw2GzMlAsfTjbRqKPoZR+ovy/pEZ/yY/0/bAdBks9GT3i
   RSiU43fSnd0JUCRlRgxjZSe/hVULFxdTjAoFv52UTkKHjWSB7SMW59TD5
   FYeOxrnToSBKLlo6i3TGnUXBspwZ/ETP8AuEa4DwhBO2gqAVWVGx9UuCf
   A==;
X-CSE-ConnectionGUID: d6vj2ZaaT/q31GBtUKTMUw==
X-CSE-MsgGUID: YfphqkfZRrCdlzKtAU6png==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4108544"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4108544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:02:08 -0800
X-CSE-ConnectionGUID: 8Y+m9hxsS3W0EYJK4pf76Q==
X-CSE-MsgGUID: UB6qRHt/QtCgQ3nol60Cxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10934175"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2026 15:02:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUXcI-00000001IrF-25DW;
	Fri, 20 Nov 2026 23:02:02 +0000
Date: Sat, 21 Nov 2026 07:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:master] BUILD SUCCESS
 d86a29916a6154696f56acbc2d28bf06cbb76985
Message-ID: <20261121070153.nL3muts3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
branch HEAD: d86a29916a6154696f56acbc2d28bf06cbb76985  Merge branch into tip/master: 'x86/sev'

elapsed time: 1072m

configs tested: 716
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261120    gcc-15.3.0
alpha                 randconfig-2001-20261120    gcc-15.3.0
alpha                 randconfig-2200-20261120    gcc-15.3.0 smatch
alpha                randconfig-r2103-20261120    gcc-12.5.0 cocci
alpha                randconfig-r2106-20261120    gcc-16.2.0 cocci
alpha                randconfig-r2108-20261120    clang-22   cocci
alpha                randconfig-r2108-20261120    clang-24   cocci
alpha                randconfig-r2111-20261120    clang-24   cocci
alpha                randconfig-r2300-20261120    clang-22   sparse
alpha                randconfig-r2303-20261120    clang-17   sparse
alpha                randconfig-r2306-20261120    gcc-13.5.0 sparse
alpha                randconfig-r2307-20261120    gcc-16.2.0 sparse
alpha                randconfig-r2307-20261120    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261120    clang-17
arc                   randconfig-1000-20261121    clang-24
arc                   randconfig-1001-20261120    clang-17
arc                   randconfig-1001-20261121    clang-24
arc                   randconfig-2000-20261119    gcc-14.4.0
arc                   randconfig-2000-20261120    gcc-11.5.0
arc                   randconfig-2001-20261119    gcc-14.4.0
arc                   randconfig-2001-20261120    gcc-11.5.0
arc                   randconfig-2002-20261119    gcc-14.4.0
arc                   randconfig-2002-20261120    gcc-11.5.0
arc                   randconfig-2003-20261119    gcc-14.4.0
arc                   randconfig-2003-20261120    gcc-11.5.0
arc                   randconfig-2004-20261119    gcc-14.4.0
arc                   randconfig-2004-20261120    gcc-11.5.0
arc                   randconfig-2005-20261119    gcc-14.4.0
arc                   randconfig-2005-20261120    gcc-11.5.0
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                  randconfig-r2101-20261120    gcc-16.2.0 cocci
arc                  randconfig-r2102-20261120    gcc-8.5.0  cocci
arc                  randconfig-r2103-20261120    gcc-16.2.0 cocci
arc                  randconfig-r2105-20261120    gcc-8.5.0  cocci
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                           collie_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    clang-17
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                           pxa168_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261120    clang-17
arm                   randconfig-1000-20261121    clang-24
arm                   randconfig-1001-20261120    clang-17
arm                   randconfig-1001-20261121    clang-24
arm                   randconfig-1002-20261120    clang-17
arm                   randconfig-1002-20261121    clang-24
arm                   randconfig-1003-20261120    clang-17
arm                   randconfig-1003-20261121    clang-24
arm                   randconfig-2000-20261119    gcc-16.2.0
arm                   randconfig-2000-20261120    gcc-8.5.0
arm                   randconfig-2001-20261119    gcc-16.2.0
arm                   randconfig-2001-20261120    gcc-8.5.0
arm                   randconfig-2002-20261119    gcc-16.2.0
arm                   randconfig-2002-20261120    gcc-8.5.0
arm                   randconfig-2200-20261119    clang-24   smatch
arm                   randconfig-2200-20261120    clang-17   smatch
arm                  randconfig-r2100-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2101-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2104-20261120    clang-24   cocci
arm                  randconfig-r2105-20261120    gcc-16.2.0 cocci
arm                  randconfig-r2108-20261120    gcc-14.4.0 cocci
arm                  randconfig-r2302-20261120    clang-22   sparse
arm                  randconfig-r2302-20261120    clang-24   sparse
arm                  randconfig-r2303-20261120    gcc-15.3.0 sparse
arm                  randconfig-r2307-20261120    gcc-15.3.0 sparse
arm                  randconfig-r2309-20261120    clang-22   sparse
arm                  randconfig-r2310-20261120    gcc-15.3.0 sparse
arm                  randconfig-r2311-20261120    clang-22   sparse
arm                              rpc_defconfig    gcc-16.2.0
arm                         shmobile_defconfig    gcc-16.2.0
arm                         spear3xx_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261120    clang-18
arm64                 randconfig-1000-20261121    gcc-8.5.0
arm64                 randconfig-1001-20261120    clang-18
arm64                 randconfig-1001-20261121    gcc-8.5.0
arm64                 randconfig-1002-20261120    clang-18
arm64                 randconfig-1002-20261121    gcc-8.5.0
arm64                 randconfig-1003-20261120    clang-18
arm64                 randconfig-1003-20261121    gcc-8.5.0
arm64                 randconfig-2000-20261119    gcc-16.2.0
arm64                 randconfig-2000-20261120    gcc-8.5.0
arm64                 randconfig-2001-20261119    gcc-16.2.0
arm64                 randconfig-2001-20261120    gcc-8.5.0
arm64                 randconfig-2002-20261119    gcc-16.2.0
arm64                 randconfig-2002-20261120    gcc-8.5.0
arm64                 randconfig-2200-20261119    clang-17   smatch
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                randconfig-r2102-20261120    gcc-16.2.0 cocci
arm64                randconfig-r2103-20261119    gcc-12.5.0 cocci
arm64                randconfig-r2103-20261120    clang-24   cocci
arm64                randconfig-r2104-20261119    gcc-12.5.0 cocci
arm64                randconfig-r2107-20261120    clang-24   cocci
arm64                randconfig-r2109-20261120    clang-24   cocci
arm64                randconfig-r2111-20261119    gcc-14     cocci
arm64                randconfig-r2111-20261120    clang-24   cocci
arm64                randconfig-r2300-20261120    gcc-11.5.0 sparse
arm64                randconfig-r2301-20261120    gcc-15.3.0 sparse
arm64                randconfig-r2302-20261120    clang-22   sparse
arm64                randconfig-r2302-20261120    clang-24   sparse
arm64                randconfig-r2304-20261120    clang-22   sparse
arm64                randconfig-r2309-20261120    gcc-14     sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261120    clang-18
csky                  randconfig-1000-20261121    gcc-8.5.0
csky                  randconfig-1001-20261120    clang-18
csky                  randconfig-1001-20261121    gcc-8.5.0
csky                  randconfig-2000-20261120    gcc-16.2.0
csky                  randconfig-2001-20261120    gcc-16.2.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                 randconfig-r2103-20261120    gcc-14     cocci
csky                 randconfig-r2104-20261120    gcc-12.5.0 cocci
csky                 randconfig-r2106-20261120    gcc-8.5.0  cocci
csky                 randconfig-r2110-20261120    clang-24   cocci
csky                 randconfig-r2300-20261120    clang-24   sparse
csky                 randconfig-r2301-20261120    gcc-11.5.0 sparse
csky                 randconfig-r2304-20261120    gcc-16.2.0 sparse
csky                 randconfig-r2305-20261120    clang-24   sparse
csky                 randconfig-r2311-20261120    clang-24   sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261120    gcc-10.5.0
hexagon               randconfig-1000-20261121    gcc-11.5.0
hexagon               randconfig-1001-20261120    gcc-10.5.0
hexagon               randconfig-1001-20261121    gcc-11.5.0
hexagon               randconfig-2000-20261120    gcc-16.2.0
hexagon               randconfig-2001-20261120    gcc-16.2.0
hexagon               randconfig-2200-20261119    clang-17   smatch
hexagon               randconfig-2200-20261120    clang-17   smatch
hexagon              randconfig-r2104-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2111-20261120    gcc-14.4.0 cocci
hexagon              randconfig-r2111-20261120    gcc-8.5.0  cocci
hexagon              randconfig-r2301-20261120    clang-24   sparse
hexagon              randconfig-r2303-20261120    gcc-16.2.0 sparse
hexagon              randconfig-r2310-20261120    gcc-16.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261120    clang-22
i386        buildonly-randconfig-1000-20261121    gcc-13
i386        buildonly-randconfig-1001-20261120    clang-22
i386        buildonly-randconfig-1001-20261121    gcc-13
i386        buildonly-randconfig-1002-20261120    clang-22
i386        buildonly-randconfig-1002-20261121    gcc-13
i386        buildonly-randconfig-1003-20261120    clang-22
i386        buildonly-randconfig-1003-20261121    gcc-13
i386        buildonly-randconfig-1004-20261120    clang-22
i386        buildonly-randconfig-1004-20261121    gcc-13
i386        buildonly-randconfig-1005-20261120    clang-22
i386        buildonly-randconfig-1005-20261121    gcc-13
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261120    clang-22
i386                  randconfig-1001-20261120    clang-22
i386                  randconfig-1002-20261120    clang-22
i386                  randconfig-1003-20261120    clang-22
i386                  randconfig-1004-20261120    clang-22
i386                  randconfig-1005-20261120    clang-22
i386                  randconfig-1006-20261120    clang-22
i386                  randconfig-1007-20261120    clang-22
i386                  randconfig-1007-20261121    gcc-14
i386                  randconfig-1008-20261120    clang-22
i386                  randconfig-1008-20261121    gcc-14
i386                  randconfig-1009-20261120    clang-22
i386                  randconfig-1009-20261121    gcc-14
i386                  randconfig-1010-20261120    clang-22
i386                  randconfig-1010-20261121    gcc-14
i386                  randconfig-1011-20261120    clang-22
i386                  randconfig-1011-20261121    gcc-14
i386                  randconfig-1012-20261120    clang-22
i386                  randconfig-1012-20261121    gcc-14
i386                  randconfig-1013-20261120    clang-22
i386                  randconfig-1013-20261121    gcc-14
i386                  randconfig-2000-20261119    gcc-14
i386                  randconfig-2000-20261120    clang-22
i386                  randconfig-2001-20261119    gcc-14
i386                  randconfig-2001-20261120    clang-22
i386                  randconfig-2002-20261119    gcc-14
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2003-20261119    gcc-14
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2004-20261119    gcc-14
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2005-20261119    gcc-14
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2100-20261119    clang-22   cocci
i386                  randconfig-2100-20261120    gcc-14     cocci
i386                  randconfig-2101-20261119    clang-22   cocci
i386                  randconfig-2101-20261120    gcc-14     cocci
i386                  randconfig-2102-20261119    clang-22   cocci
i386                  randconfig-2102-20261120    gcc-14     cocci
i386                  randconfig-2103-20261119    clang-22   cocci
i386                  randconfig-2103-20261120    gcc-14     cocci
i386                  randconfig-2104-20261119    clang-22   cocci
i386                  randconfig-2104-20261120    gcc-14     cocci
i386                  randconfig-2105-20261119    clang-22   cocci
i386                  randconfig-2105-20261120    gcc-14     cocci
i386                  randconfig-2200-20261119    gcc-14     smatch
i386                  randconfig-2200-20261120    clang-22   smatch
i386                  randconfig-2300-20261120    clang-22   sparse
i386                  randconfig-2301-20261120    clang-22   sparse
i386                  randconfig-2302-20261120    clang-22   sparse
i386                 randconfig-r2100-20261120    gcc-14     cocci
i386                 randconfig-r2101-20261120    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261120    clang-22   cocci
i386                 randconfig-r2110-20261119    gcc-14     cocci
i386                 randconfig-r2301-20261120    clang-22   sparse
i386                 randconfig-r2303-20261120    clang-22   sparse
i386                 randconfig-r2307-20261120    gcc-14     sparse
i386                 randconfig-r2308-20261120    gcc-13.5.0 sparse
i386                 randconfig-r2311-20261120    gcc-15.3.0 sparse
i386                 randconfig-r2311-20261120    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261120    gcc-10.5.0
loongarch             randconfig-1000-20261121    gcc-11.5.0
loongarch             randconfig-1001-20261120    gcc-10.5.0
loongarch             randconfig-1001-20261121    gcc-11.5.0
loongarch             randconfig-2000-20261119    gcc-8.5.0
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2001-20261119    gcc-8.5.0
loongarch             randconfig-2001-20261120    clang-24
loongarch             randconfig-2200-20261119    clang-24   smatch
loongarch             randconfig-2200-20261120    clang-18   smatch
loongarch            randconfig-r2100-20261120    gcc-12.5.0 cocci
loongarch            randconfig-r2100-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2101-20261120    gcc-12.5.0 cocci
loongarch            randconfig-r2104-20261120    gcc-16.2.0 cocci
loongarch            randconfig-r2105-20261119    gcc-12.5.0 cocci
loongarch            randconfig-r2107-20261120    clang-24   cocci
loongarch            randconfig-r2107-20261120    gcc-14.4.0 cocci
loongarch            randconfig-r2109-20261120    clang-22   cocci
loongarch            randconfig-r2110-20261120    gcc-8.5.0  cocci
loongarch            randconfig-r2300-20261120    clang-17   sparse
loongarch            randconfig-r2302-20261120    clang-24   sparse
loongarch            randconfig-r2303-20261120    clang-24   sparse
loongarch            randconfig-r2307-20261120    clang-22   sparse
loongarch            randconfig-r2308-20261120    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.2.0
m68k                        m5275evb_defconfig    clang-17
m68k                        m5275evb_defconfig    clang-24
m68k                        m5275evb_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
m68k                         mvme16x_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261120    gcc-15.3.0
m68k                  randconfig-2001-20261120    gcc-15.3.0
m68k                  randconfig-2200-20261119    gcc-9.5.0  smatch
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
m68k                 randconfig-r2102-20261120    gcc-13.5.0 cocci
m68k                 randconfig-r2103-20261120    gcc-8.5.0  cocci
m68k                 randconfig-r2104-20261120    gcc-13.5.0 cocci
m68k                 randconfig-r2105-20261120    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20261120    clang-22   sparse
m68k                 randconfig-r2300-20261120    gcc-16.2.0 sparse
m68k                 randconfig-r2301-20261120    clang-17   sparse
m68k                 randconfig-r2303-20261120    clang-22   sparse
m68k                 randconfig-r2305-20261120    gcc-16.2.0 sparse
m68k                 randconfig-r2306-20261120    clang-22   sparse
m68k                 randconfig-r2306-20261120    gcc-14     sparse
m68k                 randconfig-r2306-20261120    gcc-8.5.0  sparse
m68k                 randconfig-r2307-20261120    clang-22   sparse
m68k                 randconfig-r2310-20261120    gcc-14     sparse
m68k                 randconfig-r2311-20261120    gcc-14.4.0 sparse
m68k                         stmark2_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261120    gcc-15.3.0
microblaze            randconfig-2001-20261120    gcc-15.3.0
microblaze            randconfig-2200-20261119    gcc-12.5.0 smatch
microblaze            randconfig-2200-20261120    gcc-11.5.0 smatch
microblaze           randconfig-r2101-20261120    gcc-14     cocci
microblaze           randconfig-r2105-20261120    clang-24   cocci
microblaze           randconfig-r2107-20261119    gcc-14     cocci
microblaze           randconfig-r2110-20261120    clang-24   cocci
microblaze           randconfig-r2301-20261120    gcc-16.2.0 sparse
microblaze           randconfig-r2305-20261120    clang-17   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      cu1000-neo_defconfig    gcc-16.2.0
mips                          db1xxx_defconfig    clang-24
mips                 econet_en751221_defconfig    clang-17
mips                 econet_en751221_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip30_defconfig    clang-24
mips                            ip32_defconfig    clang-17
mips                      loongson2k_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261120    gcc-9.5.0
mips                  randconfig-2001-20261120    gcc-9.5.0
mips                  randconfig-2002-20261120    gcc-9.5.0
mips                  randconfig-2200-20261120    clang-24   smatch
mips                 randconfig-r2100-20261120    gcc-13.5.0 cocci
mips                 randconfig-r2100-20261120    gcc-16.2.0 cocci
mips                 randconfig-r2103-20261120    gcc-13.5.0 cocci
mips                 randconfig-r2106-20261120    clang-24   cocci
mips                 randconfig-r2106-20261120    gcc-14.4.0 cocci
mips                 randconfig-r2108-20261120    gcc-8.5.0  cocci
mips                 randconfig-r2301-20261120    clang-24   sparse
mips                 randconfig-r2302-20261120    gcc-16.2.0 sparse
mips                 randconfig-r2304-20261120    clang-24   sparse
mips                 randconfig-r2307-20261120    gcc-13.5.0 sparse
mips                 randconfig-r2310-20261120    gcc-8.5.0  sparse
mips                          rt305x_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261120    gcc-10.5.0
nios2                 randconfig-1000-20261121    gcc-11.5.0
nios2                 randconfig-1001-20261120    gcc-10.5.0
nios2                 randconfig-1001-20261121    gcc-11.5.0
nios2                 randconfig-2000-20261119    gcc-8.5.0
nios2                 randconfig-2000-20261120    clang-24
nios2                 randconfig-2001-20261119    gcc-8.5.0
nios2                 randconfig-2001-20261120    clang-24
nios2                 randconfig-2200-20261119    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
nios2                randconfig-r2103-20261120    gcc-16.2.0 cocci
nios2                randconfig-r2104-20261120    gcc-8.5.0  cocci
nios2                randconfig-r2105-20261120    gcc-12.5.0 cocci
nios2                randconfig-r2105-20261120    gcc-14     cocci
nios2                randconfig-r2108-20261120    gcc-16.2.0 cocci
nios2                randconfig-r2110-20261120    gcc-16.2.0 cocci
nios2                randconfig-r2303-20261120    gcc-11.5.0 sparse
nios2                randconfig-r2305-20261120    clang-22   sparse
nios2                randconfig-r2309-20261120    clang-22   sparse
nios2                randconfig-r2310-20261120    gcc-13.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    clang-17
openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261120    gcc-9.5.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2200-20261119    gcc-16.2.0 smatch
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc             randconfig-r2100-20261119    gcc-12.5.0 cocci
openrisc             randconfig-r2104-20261120    gcc-14     cocci
openrisc             randconfig-r2109-20261120    gcc-16.2.0 cocci
openrisc             randconfig-r2109-20261120    gcc-8.5.0  cocci
openrisc             randconfig-r2110-20261120    clang-24   cocci
openrisc             randconfig-r2111-20261120    clang-24   cocci
openrisc             randconfig-r2300-20261120    gcc-15.3.0 sparse
openrisc             randconfig-r2304-20261120    clang-22   sparse
openrisc             randconfig-r2304-20261120    gcc-11.5.0 sparse
openrisc             randconfig-r2305-20261120    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                 generic-64bit_defconfig    clang-17
parisc                randconfig-1000-20261120    gcc-11.5.0
parisc                randconfig-1000-20261121    gcc-10.5.0
parisc                randconfig-1001-20261120    gcc-11.5.0
parisc                randconfig-1001-20261121    gcc-10.5.0
parisc                randconfig-2000-20261119    gcc-8.5.0
parisc                randconfig-2000-20261120    clang-24
parisc                randconfig-2001-20261119    gcc-8.5.0
parisc                randconfig-2001-20261120    clang-24
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc               randconfig-r2100-20261120    gcc-8.5.0  cocci
parisc               randconfig-r2102-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2104-20261120    clang-24   cocci
parisc               randconfig-r2107-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2107-20261120    gcc-8.5.0  cocci
parisc               randconfig-r2109-20261120    clang-24   cocci
parisc               randconfig-r2111-20261120    gcc-16.2.0 cocci
parisc               randconfig-r2300-20261120    clang-24   sparse
parisc               randconfig-r2305-20261120    clang-24   sparse
parisc               randconfig-r2311-20261120    gcc-13.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    gcc-16.2.0
powerpc                       chrp32_defconfig    gcc-16.2.0
powerpc                       ep88xc_defconfig    gcc-16.2.0
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                      mpc5200_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                     mvme5100_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261120    gcc-11.5.0
powerpc               randconfig-1000-20261121    gcc-10.5.0
powerpc               randconfig-1001-20261120    gcc-11.5.0
powerpc               randconfig-1001-20261121    gcc-10.5.0
powerpc               randconfig-2000-20261119    gcc-15.3.0
powerpc               randconfig-2000-20261120    clang-24
powerpc               randconfig-2001-20261119    gcc-15.3.0
powerpc               randconfig-2001-20261120    clang-24
powerpc               randconfig-2002-20261119    gcc-15.3.0
powerpc               randconfig-2002-20261120    clang-24
powerpc               randconfig-2200-20261119    gcc-13.5.0 smatch
powerpc               randconfig-2200-20261120    clang-17   smatch
powerpc              randconfig-r2103-20261120    clang-24   cocci
powerpc              randconfig-r2304-20261120    clang-17   sparse
powerpc              randconfig-r2305-20261120    clang-22   sparse
powerpc              randconfig-r2306-20261120    gcc-16.2.0 sparse
powerpc              randconfig-r2307-20261120    gcc-14.4.0 sparse
powerpc              randconfig-r2310-20261120    gcc-14.4.0 sparse
powerpc              randconfig-r2311-20261120    clang-22   sparse
powerpc                      skiroot_defconfig    clang-24
powerpc                      taishan_defconfig    gcc-16.2.0
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261120    gcc-11.5.0
powerpc64             randconfig-1000-20261121    gcc-10.5.0
powerpc64             randconfig-1001-20261120    gcc-11.5.0
powerpc64             randconfig-1001-20261121    gcc-10.5.0
powerpc64             randconfig-2000-20261119    gcc-15.3.0
powerpc64             randconfig-2000-20261120    clang-24
powerpc64             randconfig-2001-20261119    gcc-15.3.0
powerpc64             randconfig-2001-20261120    clang-24
powerpc64             randconfig-2002-20261119    gcc-15.3.0
powerpc64             randconfig-2002-20261120    clang-24
powerpc64             randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64            randconfig-r2100-20261120    clang-24   cocci
powerpc64            randconfig-r2101-20261120    clang-24   cocci
powerpc64            randconfig-r2101-20261120    gcc-13.5.0 cocci
powerpc64            randconfig-r2102-20261119    gcc-12.5.0 cocci
powerpc64            randconfig-r2102-20261120    gcc-14     cocci
powerpc64            randconfig-r2106-20261120    gcc-8.5.0  cocci
powerpc64            randconfig-r2108-20261120    clang-24   cocci
powerpc64            randconfig-r2109-20261120    gcc-14.4.0 cocci
powerpc64            randconfig-r2111-20261120    gcc-8.5.0  cocci
powerpc64            randconfig-r2305-20261120    gcc-11.5.0 sparse
powerpc64            randconfig-r2306-20261120    clang-24   sparse
powerpc64            randconfig-r2308-20261120    gcc-14.4.0 sparse
powerpc64            randconfig-r2309-20261120    clang-24   sparse
powerpc64            randconfig-r2309-20261120    gcc-15.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261120    gcc-11.5.0
riscv                 randconfig-1000-20261121    clang-17
riscv                 randconfig-1001-20261120    gcc-11.5.0
riscv                 randconfig-1001-20261121    clang-17
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2001-20261120    clang-24
riscv                 randconfig-2002-20261120    clang-24
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2004-20261120    clang-24
riscv                 randconfig-2005-20261120    clang-24
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                randconfig-r2102-20261120    gcc-8.5.0  cocci
riscv                randconfig-r2106-20261120    clang-24   cocci
riscv                randconfig-r2111-20261120    clang-22   cocci
riscv                randconfig-r2302-20261120    clang-22   sparse
riscv                randconfig-r2303-20261120    clang-22   sparse
riscv                randconfig-r2303-20261120    clang-24   sparse
riscv                randconfig-r2307-20261120    clang-24   sparse
riscv                randconfig-r2308-20261120    gcc-14     sparse
riscv                randconfig-r2309-20261120    gcc-8.5.0  sparse
riscv                randconfig-r2310-20261120    clang-22   sparse
riscv                randconfig-r2310-20261120    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261120    gcc-11.5.0
s390                  randconfig-1000-20261121    clang-17
s390                  randconfig-1001-20261120    gcc-11.5.0
s390                  randconfig-1001-20261121    clang-17
s390                  randconfig-2000-20261120    clang-24
s390                  randconfig-2001-20261120    clang-24
s390                  randconfig-2002-20261120    clang-24
s390                  randconfig-2003-20261120    clang-24
s390                  randconfig-2004-20261120    clang-24
s390                  randconfig-2005-20261120    clang-24
s390                  randconfig-2200-20261120    clang-17   smatch
s390                 randconfig-r2102-20261120    clang-24   cocci
s390                 randconfig-r2105-20261120    gcc-13.5.0 cocci
s390                 randconfig-r2106-20261119    gcc-14     cocci
s390                 randconfig-r2106-20261120    gcc-16.2.0 cocci
s390                 randconfig-r2107-20261120    gcc-8.5.0  cocci
s390                 randconfig-r2108-20261120    clang-24   cocci
s390                 randconfig-r2300-20261120    clang-24   sparse
s390                 randconfig-r2304-20261120    gcc-15.3.0 sparse
s390                 randconfig-r2305-20261120    gcc-15.3.0 sparse
s390                        zfcpdump_defconfig    gcc-16.2.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                                j2_defconfig    gcc-16.2.0
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                           r7785rp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261120    gcc-11.5.0
sh                    randconfig-1000-20261121    clang-17
sh                    randconfig-1001-20261120    gcc-11.5.0
sh                    randconfig-1001-20261121    clang-17
sh                    randconfig-2000-20261119    gcc-12.5.0
sh                    randconfig-2000-20261120    gcc-11.5.0
sh                    randconfig-2001-20261119    gcc-12.5.0
sh                    randconfig-2001-20261120    gcc-11.5.0
sh                    randconfig-2002-20261119    gcc-12.5.0
sh                    randconfig-2002-20261120    gcc-11.5.0
sh                    randconfig-2003-20261119    gcc-12.5.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2004-20261119    gcc-12.5.0
sh                    randconfig-2004-20261120    gcc-11.5.0
sh                    randconfig-2005-20261119    gcc-12.5.0
sh                    randconfig-2005-20261120    gcc-11.5.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                   randconfig-r2101-20261119    gcc-12.5.0 cocci
sh                   randconfig-r2104-20261120    gcc-16.2.0 cocci
sh                   randconfig-r2110-20261120    gcc-16.2.0 cocci
sh                   randconfig-r2111-20261120    gcc-16.2.0 cocci
sh                   randconfig-r2302-20261120    gcc-15.3.0 sparse
sh                   randconfig-r2306-20261120    gcc-14.4.0 sparse
sh                   randconfig-r2308-20261120    clang-22   sparse
sh                   randconfig-r2308-20261120    gcc-15.3.0 sparse
sh                   randconfig-r2309-20261120    gcc-13.5.0 sparse
sh                   randconfig-r2309-20261120    gcc-16.2.0 sparse
sh                            se7780_defconfig    clang-17
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261120    clang-24
sparc                 randconfig-1000-20261121    gcc-14
sparc                 randconfig-1001-20261120    clang-24
sparc                 randconfig-1001-20261121    gcc-14
sparc                 randconfig-2000-20261119    clang-21
sparc                 randconfig-2000-20261120    gcc-8.5.0
sparc                 randconfig-2001-20261119    clang-21
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc                 randconfig-2200-20261119    gcc-8.5.0  smatch
sparc                 randconfig-2200-20261120    gcc-11.5.0 smatch
sparc                randconfig-r2100-20261120    clang-24   cocci
sparc                randconfig-r2101-20261120    gcc-8.5.0  cocci
sparc                randconfig-r2105-20261120    clang-24   cocci
sparc                randconfig-r2108-20261119    gcc-14     cocci
sparc                randconfig-r2110-20261120    gcc-14.4.0 cocci
sparc                randconfig-r2110-20261120    gcc-8.5.0  cocci
sparc                randconfig-r2302-20261120    gcc-11.5.0 sparse
sparc                randconfig-r2304-20261120    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261120    clang-24
sparc64               randconfig-1000-20261121    gcc-14
sparc64               randconfig-1001-20261120    clang-24
sparc64               randconfig-1001-20261121    gcc-14
sparc64               randconfig-2000-20261119    clang-21
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261119    clang-21
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64              randconfig-r2107-20261120    clang-22   cocci
sparc64              randconfig-r2109-20261120    clang-24   cocci
sparc64              randconfig-r2109-20261120    gcc-16.2.0 cocci
sparc64              randconfig-r2110-20261120    clang-22   cocci
sparc64              randconfig-r2301-20261120    clang-22   sparse
sparc64              randconfig-r2302-20261120    clang-17   sparse
sparc64              randconfig-r2311-20261120    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261120    clang-24
um                    randconfig-1000-20261121    gcc-14
um                    randconfig-1001-20261120    clang-24
um                    randconfig-1001-20261121    gcc-14
um                    randconfig-2000-20261119    clang-21
um                    randconfig-2000-20261120    gcc-8.5.0
um                    randconfig-2001-20261119    clang-21
um                    randconfig-2001-20261120    gcc-8.5.0
um                    randconfig-2200-20261120    clang-24   smatch
um                   randconfig-r2102-20261120    gcc-12.5.0 cocci
um                   randconfig-r2103-20261120    gcc-8.5.0  cocci
um                   randconfig-r2108-20261120    gcc-16.2.0 cocci
um                   randconfig-r2301-20261120    clang-24   sparse
um                   randconfig-r2304-20261120    clang-22   sparse
um                   randconfig-r2306-20261120    clang-22   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261120    clang-22
x86_64      buildonly-randconfig-1000-20261121    clang-22
x86_64      buildonly-randconfig-1001-20261120    clang-22
x86_64      buildonly-randconfig-1001-20261121    clang-22
x86_64      buildonly-randconfig-1002-20261120    clang-22
x86_64      buildonly-randconfig-1002-20261121    clang-22
x86_64      buildonly-randconfig-1003-20261120    clang-22
x86_64      buildonly-randconfig-1003-20261121    clang-22
x86_64      buildonly-randconfig-1004-20261120    clang-22
x86_64      buildonly-randconfig-1004-20261121    clang-22
x86_64      buildonly-randconfig-1005-20261120    clang-22
x86_64      buildonly-randconfig-1005-20261121    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261120    clang-22
x86_64                randconfig-1000-20261121    clang-22
x86_64                randconfig-1001-20261120    clang-22
x86_64                randconfig-1001-20261121    clang-22
x86_64                randconfig-1002-20261120    clang-22
x86_64                randconfig-1002-20261121    clang-22
x86_64                randconfig-1003-20261120    clang-22
x86_64                randconfig-1003-20261121    clang-22
x86_64                randconfig-1004-20261120    clang-22
x86_64                randconfig-1004-20261121    clang-22
x86_64                randconfig-1005-20261120    clang-22
x86_64                randconfig-1005-20261121    clang-22
x86_64                randconfig-1006-20261120    clang-22
x86_64                randconfig-1007-20261120    clang-22
x86_64                randconfig-1008-20261120    clang-22
x86_64                randconfig-1009-20261120    clang-22
x86_64                randconfig-1010-20261120    clang-22
x86_64                randconfig-1011-20261120    clang-22
x86_64                randconfig-1012-20261120    clang-22
x86_64                randconfig-1013-20261120    clang-22
x86_64                randconfig-1014-20261120    clang-22
x86_64                randconfig-1015-20261120    clang-22
x86_64                randconfig-1016-20261120    clang-22
x86_64                randconfig-1017-20261120    clang-22
x86_64                randconfig-2000-20261119    clang-22
x86_64                randconfig-2000-20261120    clang-22
x86_64                randconfig-2001-20261119    clang-22
x86_64                randconfig-2001-20261120    clang-22
x86_64                randconfig-2002-20261119    clang-22
x86_64                randconfig-2002-20261120    clang-22
x86_64                randconfig-2003-20261119    clang-22
x86_64                randconfig-2003-20261120    clang-22
x86_64                randconfig-2004-20261119    clang-22
x86_64                randconfig-2004-20261120    clang-22
x86_64                randconfig-2005-20261119    clang-22
x86_64                randconfig-2005-20261120    clang-22
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261120    gcc-14     cocci
x86_64                randconfig-2104-20261120    gcc-14     cocci
x86_64                randconfig-2105-20261120    gcc-14     cocci
x86_64                randconfig-2200-20261119    clang-22   smatch
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64                randconfig-2300-20261120    clang-22   sparse
x86_64                randconfig-2301-20261120    clang-22   sparse
x86_64                randconfig-2302-20261120    clang-22   sparse
x86_64               randconfig-r2101-20261120    clang-24   cocci
x86_64               randconfig-r2102-20261120    clang-24   cocci
x86_64               randconfig-r2107-20261120    clang-24   cocci
x86_64               randconfig-r2109-20261119    gcc-14     cocci
x86_64               randconfig-r2304-20261120    clang-24   sparse
x86_64               randconfig-r2305-20261120    clang-22   sparse
x86_64               randconfig-r2309-20261120    gcc-14.4.0 sparse
x86_64               randconfig-r2310-20261120    clang-22   sparse
x86_64               randconfig-r2311-20261120    gcc-14     sparse
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
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   cadence_csp_defconfig    gcc-16.2.0
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261120    clang-24
xtensa                randconfig-1000-20261121    gcc-14
xtensa                randconfig-1001-20261120    clang-24
xtensa                randconfig-1001-20261121    gcc-14
xtensa                randconfig-2000-20261120    gcc-16.2.0
xtensa                randconfig-2001-20261120    gcc-16.2.0
xtensa                randconfig-2200-20261119    gcc-14.4.0 smatch
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa               randconfig-r2105-20261120    gcc-16.2.0 cocci
xtensa               randconfig-r2107-20261120    gcc-16.2.0 cocci
xtensa               randconfig-r2108-20261120    gcc-8.5.0  cocci
xtensa               randconfig-r2300-20261120    clang-22   sparse
xtensa               randconfig-r2306-20261120    gcc-15.3.0 sparse
xtensa               randconfig-r2308-20261120    clang-22   sparse
xtensa               randconfig-r2308-20261120    clang-24   sparse
xtensa               randconfig-r2308-20261120    gcc-8.5.0  sparse
xtensa                     xip_kc705_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
