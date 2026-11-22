Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339266;
	b=3nNSkHcaategMux2Vu0GhjfaaSCQa4M2Ta99bgHdZNi+gg3jeMGPBpaqU7tjszmdN/jv
	 R+Px1unutWRDChNA3OeFDIlHwWSetPbsZYKKY9yV8cNaOaFuwib/UeNQLM5e8b/A8hxz0
	 +kqnf0Vw8iBzLalRUIO2UcckUwNzTqGLUhQKL9NpBmA5Vf0BVBUhUbUChGlb/Zj71uJVd
	 WY6w5VfagHDDqGihzpDHsUXoqEvy2pxyap7/56a3GPvXSI/036q6G7FNMzaoMsOU/Yg69
	 tQZfXdLBl1BWaOQUc9vZRrg9AaRczOVi8szXX7GXsgHTX0mCatcSS1ryEOWriETPxBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339266;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=J3JIjxWZTLtHsKUUgjgxsilfdDZisTYzRtT+DclHXIw=;
	b=abuW4+gMSv6LtjjpXrHRrpZiOoxKuWUFNokol7ICv+/QQ8GT+q7j84vbYQ+qanVsEfv5
	 y9zr4Y7e9bQMtC9fsz3s5q+UNCnGON4P5uc/D3nmyvObB9/VZdlkEGqRDfx4v664M26Qw
	 xAKrxvsHtEF1lyi7+sDHEyVEsyGJruS46nEMlW/cOyIbDKwAQbQtdt5gbPZ7TWpBX7+I0
	 NeDEHRo0lV4KKucUAcgdDWrvJ1HS2XqNEqPfz2zEaOMVEkMruNIxW8INsysh36EfgC2yy
	 e3zKDZtsxOrfjei2+2NS+UNEBs+WJTGqRyUUOjdgFOHm6w3dvKUxDhatmnRRYaOUaog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCWDDJE2;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AE606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723AE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCWDDJE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795339264; x=1826875264;
  h=date:from:to:cc:subject:message-id;
  bh=mwTTQqwJH4q6aNZ4ibpzgy7g7H+nWYDbsGcsoJZK4rs=;
  b=NCWDDJE2LP5+NXwxk5l+pkWRRFScP5jLa0zQkhQOIGI/fProzdyFZgMm
   1/yd6Hqf2BPKm5TM7awI5R5c7Or0+lfNNJirl4Y41lt/t1R0eJvM5Rak8
   VstQMDqFPswz/ZW8nepXiacpXICMQWP1LAIcvmX2eIAWVpKkqZ0oZN3h9
   15VNqwq23WJdrourwkjhAqbRLEPWmAe44bdFN2wxKull53Y0BK7vS76FF
   w/p1prLI9WfQmtDQuPGRVa81e3Wx2k7sEo5o+qna4mSuk0PpZ/wT9kX7P
   Kr1h3eDOxpYUyDI+d3m4Hwh5iY7O38TUARlPjw4OSVsQ4nTYvxjdkoQys
   A==;
X-CSE-ConnectionGUID: yHDGooA9TJeUcYONugyT4A==
X-CSE-MsgGUID: m0iGfLySSNKdVhuCk4a13A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4151387"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4151387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:21:03 -0800
X-CSE-ConnectionGUID: Tg5wTkgbSSmbbaIgt6CXjA==
X-CSE-MsgGUID: VCeFAOsvQ0qDiYaZudMjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11064366"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2026 01:21:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV3kq-00000001LH4-0XUa;
	Sun, 22 Nov 2026 09:21:00 +0000
Date: Sun, 22 Nov 2026 17:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:urgent] BUILD SUCCESS
 ae3398a7da224e1cb14a04ce8e9da66fc2948121
Message-ID: <20261122172040.ZxCfXQHv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: ae3398a7da224e1cb14a04ce8e9da66fc2948121  x86/Kconfig: Enable ROX also when STRICT_KERNEL_RWX is present

elapsed time: 745m

configs tested: 559
configs skipped: 188

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261121    gcc-14.4.0
alpha                 randconfig-2000-20261122    gcc-8.5.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                 randconfig-2001-20261122    gcc-8.5.0
alpha                 randconfig-2200-20261121    gcc-10.5.0 smatch
alpha                 randconfig-2200-20261122    gcc-8.5.0  smatch
alpha                randconfig-r2100-20261121    gcc-16.2.0 cocci
alpha                randconfig-r2302-20261121    gcc-8.5.0  sparse
alpha                randconfig-r2303-20261121    gcc-8.5.0  sparse
alpha                randconfig-r2304-20261122    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261122    clang-17
arc                   randconfig-1001-20261122    clang-17
arc                   randconfig-2000-20261121    gcc-8.5.0
arc                   randconfig-2000-20261122    gcc-9.5.0
arc                   randconfig-2001-20261121    gcc-8.5.0
arc                   randconfig-2001-20261122    gcc-9.5.0
arc                   randconfig-2002-20261121    gcc-8.5.0
arc                   randconfig-2002-20261122    gcc-9.5.0
arc                   randconfig-2003-20261121    gcc-8.5.0
arc                   randconfig-2003-20261122    gcc-9.5.0
arc                   randconfig-2004-20261121    gcc-8.5.0
arc                   randconfig-2004-20261122    gcc-9.5.0
arc                   randconfig-2005-20261121    gcc-8.5.0
arc                   randconfig-2005-20261122    gcc-9.5.0
arc                   randconfig-2200-20261121    gcc-14.4.0 smatch
arc                   randconfig-2200-20261122    gcc-9.5.0  smatch
arc                  randconfig-r2100-20261122    gcc-16.2.0 cocci
arc                  randconfig-r2301-20261122    clang-21   sparse
arc                  randconfig-r2301-20261122    gcc-12.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                        multi_v4t_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261122    clang-17
arm                   randconfig-1001-20261122    clang-17
arm                   randconfig-1002-20261122    clang-17
arm                   randconfig-1003-20261122    clang-17
arm                   randconfig-2000-20261121    clang-24
arm                   randconfig-2000-20261122    gcc-15.3.0
arm                   randconfig-2001-20261121    clang-24
arm                   randconfig-2001-20261122    gcc-15.3.0
arm                   randconfig-2002-20261121    clang-24
arm                   randconfig-2002-20261122    gcc-15.3.0
arm                   randconfig-2200-20261121    clang-19   smatch
arm                   randconfig-2200-20261122    clang-19   smatch
arm                  randconfig-r2104-20261122    gcc-9.5.0  cocci
arm                  randconfig-r2105-20261122    gcc-14     cocci
arm                  randconfig-r2109-20261122    clang-22   cocci
arm                  randconfig-r2109-20261122    gcc-15.3.0 cocci
arm                  randconfig-r2110-20261122    gcc-16.2.0 cocci
arm                  randconfig-r2300-20261121    gcc-8.5.0  sparse
arm                  randconfig-r2301-20261121    gcc-8.5.0  sparse
arm                  randconfig-r2302-20261122    clang-21   sparse
arm                  randconfig-r2304-20261121    gcc-8.5.0  sparse
arm                  randconfig-r2305-20261121    gcc-8.5.0  sparse
arm                  randconfig-r2308-20261122    gcc-15.3.0 sparse
arm                  randconfig-r2310-20261122    gcc-15.3.0 sparse
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261122    gcc-8.5.0
arm64                 randconfig-1001-20261122    gcc-8.5.0
arm64                 randconfig-1002-20261122    gcc-8.5.0
arm64                 randconfig-1003-20261122    gcc-8.5.0
arm64                 randconfig-2000-20261121    clang-24
arm64                 randconfig-2000-20261122    gcc-15.3.0
arm64                 randconfig-2001-20261121    clang-24
arm64                 randconfig-2001-20261122    gcc-15.3.0
arm64                 randconfig-2002-20261121    clang-24
arm64                 randconfig-2002-20261122    gcc-15.3.0
arm64                 randconfig-2200-20261121    clang-22   smatch
arm64                 randconfig-2200-20261122    gcc-10.5.0 smatch
arm64                randconfig-r2102-20261121    gcc-8.5.0  cocci
arm64                randconfig-r2106-20261122    gcc-15.3.0 cocci
arm64                randconfig-r2303-20261122    clang-21   sparse
arm64                randconfig-r2306-20261122    clang-24   sparse
arm64                randconfig-r2306-20261122    gcc-15.3.0 sparse
arm64                randconfig-r2310-20261121    gcc-14     sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261122    gcc-8.5.0
csky                  randconfig-1001-20261122    gcc-8.5.0
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2000-20261122    gcc-9.5.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2001-20261122    gcc-9.5.0
csky                  randconfig-2200-20261121    gcc-16.2.0 smatch
csky                  randconfig-2200-20261122    gcc-9.5.0  smatch
csky                 randconfig-r2105-20261121    gcc-16.2.0 cocci
csky                 randconfig-r2304-20261122    clang-24   sparse
csky                 randconfig-r2308-20261122    gcc-15.3.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261122    gcc-8.5.0
hexagon               randconfig-1001-20261122    gcc-8.5.0
hexagon               randconfig-2000-20261121    gcc-16.2.0
hexagon               randconfig-2000-20261122    gcc-9.5.0
hexagon               randconfig-2001-20261121    gcc-16.2.0
hexagon               randconfig-2001-20261122    gcc-9.5.0
hexagon               randconfig-2200-20261121    clang-24   smatch
hexagon               randconfig-2200-20261122    clang-24   smatch
hexagon              randconfig-r2102-20261121    gcc-16.2.0 cocci
hexagon              randconfig-r2104-20261121    gcc-16.2.0 cocci
hexagon              randconfig-r2104-20261122    gcc-14.4.0 cocci
hexagon              randconfig-r2110-20261122    clang-22   cocci
hexagon              randconfig-r2111-20261122    clang-22   cocci
hexagon              randconfig-r2301-20261122    clang-24   sparse
hexagon              randconfig-r2305-20261122    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261122    gcc-14
i386        buildonly-randconfig-1001-20261122    gcc-14
i386        buildonly-randconfig-1002-20261122    gcc-14
i386        buildonly-randconfig-1003-20261122    gcc-14
i386        buildonly-randconfig-1004-20261122    gcc-14
i386        buildonly-randconfig-1005-20261122    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261122    gcc-14
i386                  randconfig-1001-20261122    gcc-14
i386                  randconfig-1002-20261122    gcc-14
i386                  randconfig-1003-20261122    gcc-14
i386                  randconfig-1004-20261122    gcc-14
i386                  randconfig-1005-20261122    gcc-14
i386                  randconfig-1006-20261122    gcc-14
i386                  randconfig-1007-20261122    gcc-14
i386                  randconfig-1008-20261122    gcc-14
i386                  randconfig-1009-20261122    gcc-14
i386                  randconfig-1010-20261122    gcc-14
i386                  randconfig-1011-20261122    gcc-14
i386                  randconfig-1012-20261122    gcc-14
i386                  randconfig-1013-20261122    gcc-14
i386                  randconfig-2000-20261121    gcc-14
i386                  randconfig-2000-20261122    clang-22
i386                  randconfig-2001-20261121    gcc-14
i386                  randconfig-2001-20261122    clang-22
i386                  randconfig-2002-20261121    gcc-14
i386                  randconfig-2002-20261122    clang-22
i386                  randconfig-2003-20261121    clang-22
i386                  randconfig-2003-20261121    gcc-14
i386                  randconfig-2003-20261122    clang-22
i386                  randconfig-2004-20261121    gcc-14
i386                  randconfig-2004-20261122    clang-22
i386                  randconfig-2005-20261121    gcc-14
i386                  randconfig-2005-20261122    clang-22
i386                  randconfig-2100-20261121    clang-22   cocci
i386                  randconfig-2100-20261122    clang-22   cocci
i386                  randconfig-2101-20261121    clang-22   cocci
i386                  randconfig-2101-20261122    clang-22   cocci
i386                  randconfig-2102-20261121    clang-22   cocci
i386                  randconfig-2102-20261122    clang-22   cocci
i386                  randconfig-2103-20261121    clang-22   cocci
i386                  randconfig-2103-20261122    clang-22   cocci
i386                  randconfig-2104-20261121    clang-22   cocci
i386                  randconfig-2104-20261122    clang-22   cocci
i386                  randconfig-2105-20261121    clang-22   cocci
i386                  randconfig-2105-20261122    clang-22   cocci
i386                  randconfig-2200-20261121    clang-22   smatch
i386                  randconfig-2200-20261122    gcc-14     smatch
i386                  randconfig-2300-20261121    gcc-14     sparse
i386                  randconfig-2300-20261122    clang-22   sparse
i386                  randconfig-2301-20261121    gcc-14     sparse
i386                  randconfig-2301-20261122    clang-22   sparse
i386                  randconfig-2302-20261121    gcc-14     sparse
i386                  randconfig-2302-20261122    clang-22   sparse
i386                 randconfig-r2102-20261122    gcc-9.5.0  cocci
i386                 randconfig-r2106-20261122    clang-22   cocci
i386                 randconfig-r2107-20261122    clang-22   cocci
i386                 randconfig-r2300-20261121    gcc-8.5.0  sparse
i386                 randconfig-r2300-20261122    clang-24   sparse
i386                 randconfig-r2303-20261122    clang-24   sparse
i386                 randconfig-r2304-20261122    clang-24   sparse
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261122    gcc-8.5.0
loongarch             randconfig-1001-20261122    gcc-8.5.0
loongarch             randconfig-2000-20261121    clang-22
loongarch             randconfig-2000-20261122    clang-24
loongarch             randconfig-2001-20261121    clang-22
loongarch             randconfig-2001-20261122    clang-24
loongarch             randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch             randconfig-2200-20261122    clang-24   smatch
loongarch            randconfig-r2105-20261121    gcc-8.5.0  cocci
loongarch            randconfig-r2111-20261122    gcc-8.5.0  cocci
loongarch            randconfig-r2304-20261122    clang-21   sparse
loongarch            randconfig-r2304-20261122    gcc-8.5.0  sparse
loongarch            randconfig-r2310-20261122    gcc-15.3.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261121    gcc-14.4.0
m68k                  randconfig-2000-20261122    gcc-8.5.0
m68k                  randconfig-2001-20261121    gcc-14.4.0
m68k                  randconfig-2001-20261122    gcc-8.5.0
m68k                  randconfig-2200-20261121    gcc-8.5.0  smatch
m68k                  randconfig-2200-20261122    gcc-12.5.0 smatch
m68k                 randconfig-r2104-20261121    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20261122    gcc-9.5.0  cocci
m68k                 randconfig-r2107-20261121    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2110-20261122    gcc-8.5.0  cocci
m68k                 randconfig-r2309-20261122    gcc-15.3.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261121    gcc-14.4.0
microblaze            randconfig-2000-20261122    gcc-8.5.0
microblaze            randconfig-2001-20261121    gcc-14.4.0
microblaze            randconfig-2001-20261122    gcc-8.5.0
microblaze            randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261122    gcc-8.5.0  smatch
microblaze           randconfig-r2101-20261121    gcc-16.2.0 cocci
microblaze           randconfig-r2101-20261121    gcc-8.5.0  cocci
microblaze           randconfig-r2103-20261122    gcc-9.5.0  cocci
microblaze           randconfig-r2105-20261122    gcc-14.4.0 cocci
microblaze           randconfig-r2108-20261122    gcc-15.3.0 cocci
microblaze           randconfig-r2109-20261122    gcc-8.5.0  cocci
microblaze           randconfig-r2303-20261122    gcc-12.5.0 sparse
microblaze           randconfig-r2307-20261122    gcc-11.5.0 sparse
microblaze           randconfig-r2311-20261122    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm47xx_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261121    gcc-16.2.0
mips                  randconfig-2000-20261122    gcc-15.3.0
mips                  randconfig-2001-20261121    gcc-16.2.0
mips                  randconfig-2001-20261122    gcc-15.3.0
mips                  randconfig-2002-20261121    gcc-16.2.0
mips                  randconfig-2002-20261122    gcc-15.3.0
mips                  randconfig-2200-20261121    clang-21   smatch
mips                  randconfig-2200-20261122    gcc-11.5.0 smatch
mips                 randconfig-r2102-20261122    gcc-14     cocci
mips                 randconfig-r2103-20261122    gcc-14.4.0 cocci
mips                 randconfig-r2107-20261122    gcc-15.3.0 cocci
mips                 randconfig-r2110-20261122    gcc-15.3.0 cocci
mips                 randconfig-r2110-20261122    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261121    gcc-8.5.0  cocci
mips                 randconfig-r2111-20261122    gcc-16.2.0 cocci
mips                 randconfig-r2305-20261122    clang-24   sparse
mips                 randconfig-r2310-20261122    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261122    gcc-8.5.0
nios2                 randconfig-1001-20261122    gcc-8.5.0
nios2                 randconfig-2000-20261121    clang-22
nios2                 randconfig-2000-20261122    clang-24
nios2                 randconfig-2001-20261121    clang-22
nios2                 randconfig-2001-20261122    clang-24
nios2                 randconfig-2200-20261121    gcc-10.5.0 smatch
nios2                 randconfig-2200-20261122    gcc-11.5.0 smatch
nios2                randconfig-r2101-20261122    gcc-16.2.0 cocci
nios2                randconfig-r2106-20261122    gcc-16.2.0 cocci
nios2                randconfig-r2306-20261122    gcc-11.5.0 sparse
nios2                randconfig-r2307-20261122    gcc-15.3.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261121    gcc-16.2.0
openrisc              randconfig-2000-20261122    gcc-15.3.0
openrisc              randconfig-2001-20261121    gcc-16.2.0
openrisc              randconfig-2001-20261122    gcc-15.3.0
openrisc              randconfig-2002-20261121    gcc-16.2.0
openrisc              randconfig-2002-20261122    gcc-15.3.0
openrisc              randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc             randconfig-r2105-20261122    gcc-16.2.0 cocci
openrisc             randconfig-r2106-20261121    gcc-8.5.0  cocci
openrisc             randconfig-r2108-20261122    gcc-16.2.0 cocci
openrisc             randconfig-r2300-20261122    gcc-8.5.0  sparse
openrisc             randconfig-r2302-20261122    clang-24   sparse
openrisc             randconfig-r2307-20261122    gcc-15.3.0 sparse
openrisc             randconfig-r2309-20261121    gcc-14     sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261122    clang-24
parisc                randconfig-1001-20261122    clang-24
parisc                randconfig-2000-20261121    clang-22
parisc                randconfig-2000-20261122    clang-24
parisc                randconfig-2001-20261121    clang-22
parisc                randconfig-2001-20261122    clang-24
parisc                randconfig-2200-20261121    gcc-16.2.0 smatch
parisc                randconfig-2200-20261122    gcc-8.5.0  smatch
parisc               randconfig-r2100-20261121    gcc-8.5.0  cocci
parisc               randconfig-r2103-20261122    gcc-14     cocci
parisc               randconfig-r2108-20261122    gcc-8.5.0  cocci
parisc               randconfig-r2303-20261122    clang-24   sparse
parisc               randconfig-r2311-20261121    gcc-14     sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261122    clang-24
powerpc               randconfig-1001-20261122    clang-24
powerpc               randconfig-2000-20261121    clang-24
powerpc               randconfig-2000-20261122    clang-24
powerpc               randconfig-2001-20261121    clang-24
powerpc               randconfig-2001-20261122    clang-24
powerpc               randconfig-2002-20261121    clang-24
powerpc               randconfig-2002-20261122    clang-24
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc               randconfig-2200-20261122    gcc-16.2.0 smatch
powerpc              randconfig-r2300-20261122    clang-21   sparse
powerpc              randconfig-r2301-20261122    clang-24   sparse
powerpc              randconfig-r2303-20261122    clang-24   sparse
powerpc              randconfig-r2303-20261122    gcc-8.5.0  sparse
powerpc              randconfig-r2304-20261122    gcc-12.5.0 sparse
powerpc              randconfig-r2305-20261122    clang-24   sparse
powerpc              randconfig-r2305-20261122    gcc-12.5.0 sparse
powerpc64             randconfig-1000-20261122    clang-24
powerpc64             randconfig-1001-20261122    clang-24
powerpc64             randconfig-2000-20261121    clang-24
powerpc64             randconfig-2000-20261122    clang-24
powerpc64             randconfig-2001-20261121    clang-24
powerpc64             randconfig-2001-20261122    clang-24
powerpc64             randconfig-2002-20261121    clang-24
powerpc64             randconfig-2002-20261122    clang-24
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
powerpc64             randconfig-2200-20261122    clang-24   smatch
powerpc64            randconfig-r2100-20261122    gcc-14.4.0 cocci
powerpc64            randconfig-r2107-20261122    clang-22   cocci
powerpc64            randconfig-r2108-20261122    clang-22   cocci
powerpc64            randconfig-r2302-20261121    gcc-8.5.0  sparse
powerpc64            randconfig-r2303-20261121    gcc-8.5.0  sparse
powerpc64            randconfig-r2309-20261122    clang-24   sparse
powerpc64            randconfig-r2310-20261122    clang-24   sparse
powerpc64            randconfig-r2311-20261122    gcc-15.3.0 sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261122    gcc-9.5.0
riscv                 randconfig-1001-20261122    gcc-9.5.0
riscv                 randconfig-2000-20261121    gcc-9.5.0
riscv                 randconfig-2000-20261122    gcc-14.4.0
riscv                 randconfig-2001-20261121    gcc-9.5.0
riscv                 randconfig-2001-20261122    gcc-14.4.0
riscv                 randconfig-2002-20261121    gcc-9.5.0
riscv                 randconfig-2002-20261122    gcc-14.4.0
riscv                 randconfig-2003-20261121    gcc-9.5.0
riscv                 randconfig-2003-20261122    gcc-14.4.0
riscv                 randconfig-2004-20261121    gcc-9.5.0
riscv                 randconfig-2004-20261122    gcc-14.4.0
riscv                 randconfig-2005-20261121    gcc-9.5.0
riscv                 randconfig-2005-20261122    gcc-14.4.0
riscv                 randconfig-2200-20261121    clang-24   smatch
riscv                 randconfig-2200-20261122    gcc-8.5.0  smatch
riscv                randconfig-r2100-20261122    gcc-9.5.0  cocci
riscv                randconfig-r2103-20261121    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261122    gcc-16.2.0 cocci
riscv                randconfig-r2106-20261122    gcc-8.5.0  cocci
riscv                randconfig-r2110-20261122    clang-22   cocci
riscv                randconfig-r2305-20261121    gcc-8.5.0  sparse
riscv                randconfig-r2311-20261122    gcc-15.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261122    gcc-9.5.0
s390                  randconfig-1001-20261122    gcc-9.5.0
s390                  randconfig-2000-20261121    clang-22
s390                  randconfig-2000-20261122    clang-17
s390                  randconfig-2001-20261121    clang-22
s390                  randconfig-2001-20261122    clang-17
s390                  randconfig-2002-20261121    clang-22
s390                  randconfig-2002-20261122    clang-17
s390                  randconfig-2003-20261121    clang-22
s390                  randconfig-2003-20261122    clang-17
s390                  randconfig-2004-20261121    clang-22
s390                  randconfig-2004-20261122    clang-17
s390                  randconfig-2005-20261121    clang-22
s390                  randconfig-2005-20261122    clang-17
s390                  randconfig-2200-20261121    gcc-8.5.0  smatch
s390                  randconfig-2200-20261122    gcc-8.5.0  smatch
s390                 randconfig-r2109-20261122    clang-22   cocci
s390                 randconfig-r2308-20261122    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261122    gcc-9.5.0
sh                    randconfig-1001-20261122    gcc-9.5.0
sh                    randconfig-2000-20261121    gcc-16.2.0
sh                    randconfig-2000-20261122    gcc-13.5.0
sh                    randconfig-2001-20261121    gcc-16.2.0
sh                    randconfig-2001-20261122    gcc-13.5.0
sh                    randconfig-2002-20261121    gcc-16.2.0
sh                    randconfig-2002-20261122    gcc-13.5.0
sh                    randconfig-2003-20261121    gcc-16.2.0
sh                    randconfig-2003-20261122    gcc-13.5.0
sh                    randconfig-2004-20261121    gcc-16.2.0
sh                    randconfig-2004-20261122    gcc-13.5.0
sh                    randconfig-2005-20261121    gcc-16.2.0
sh                    randconfig-2005-20261122    gcc-13.5.0
sh                    randconfig-2200-20261121    gcc-10.5.0 smatch
sh                    randconfig-2200-20261122    gcc-13.5.0 smatch
sh                   randconfig-r2102-20261122    gcc-16.2.0 cocci
sh                   randconfig-r2108-20261122    clang-22   cocci
sh                   randconfig-r2109-20261122    gcc-8.5.0  cocci
sh                   randconfig-r2111-20261122    clang-22   cocci
sh                   randconfig-r2111-20261122    gcc-15.3.0 cocci
sh                   randconfig-r2301-20261122    gcc-8.5.0  sparse
sh                   randconfig-r2302-20261122    clang-24   sparse
sh                   randconfig-r2306-20261121    gcc-14     sparse
sh                           rsk7203_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261122    clang-24
sparc                 randconfig-1001-20261122    clang-24
sparc                 randconfig-2000-20261121    gcc-8.5.0
sparc                 randconfig-2000-20261122    clang-21
sparc                 randconfig-2001-20261121    gcc-8.5.0
sparc                 randconfig-2001-20261122    clang-21
sparc                 randconfig-2200-20261121    gcc-8.5.0  smatch
sparc                 randconfig-2200-20261122    gcc-16.2.0 smatch
sparc                randconfig-r2102-20261122    gcc-14.4.0 cocci
sparc                randconfig-r2104-20261122    gcc-14     cocci
sparc                randconfig-r2109-20261121    gcc-8.5.0  cocci
sparc                randconfig-r2109-20261122    gcc-16.2.0 cocci
sparc                randconfig-r2305-20261122    gcc-8.5.0  sparse
sparc                randconfig-r2311-20261122    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261122    clang-24
sparc64               randconfig-1001-20261122    clang-24
sparc64               randconfig-2000-20261121    gcc-8.5.0
sparc64               randconfig-2000-20261122    clang-21
sparc64               randconfig-2001-20261121    gcc-8.5.0
sparc64               randconfig-2001-20261122    clang-21
sparc64               randconfig-2200-20261121    clang-20   smatch
sparc64               randconfig-2200-20261122    clang-20   smatch
sparc64              randconfig-r2103-20261122    gcc-16.2.0 cocci
sparc64              randconfig-r2106-20261122    clang-22   cocci
sparc64              randconfig-r2106-20261122    gcc-8.5.0  cocci
sparc64              randconfig-r2107-20261122    gcc-16.2.0 cocci
sparc64              randconfig-r2108-20261121    gcc-8.5.0  cocci
sparc64              randconfig-r2108-20261122    gcc-8.5.0  cocci
sparc64              randconfig-r2300-20261122    clang-24   sparse
sparc64              randconfig-r2301-20261121    gcc-8.5.0  sparse
sparc64              randconfig-r2302-20261122    gcc-12.5.0 sparse
sparc64              randconfig-r2302-20261122    gcc-8.5.0  sparse
sparc64              randconfig-r2309-20261122    gcc-11.5.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261122    clang-24
um                    randconfig-1001-20261122    clang-24
um                    randconfig-2000-20261121    gcc-8.5.0
um                    randconfig-2000-20261122    clang-21
um                    randconfig-2001-20261121    gcc-8.5.0
um                    randconfig-2001-20261122    clang-21
um                    randconfig-2200-20261121    gcc-14     smatch
um                    randconfig-2200-20261122    gcc-14     smatch
um                   randconfig-r2304-20261121    gcc-8.5.0  sparse
um                   randconfig-r2305-20261122    clang-21   sparse
um                   randconfig-r2306-20261122    gcc-15.3.0 sparse
um                   randconfig-r2307-20261121    gcc-14     sparse
um                   randconfig-r2307-20261122    clang-24   sparse
um                   randconfig-r2308-20261122    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261122    gcc-14
x86_64                randconfig-1001-20261122    gcc-14
x86_64                randconfig-1002-20261122    gcc-14
x86_64                randconfig-1003-20261122    gcc-14
x86_64                randconfig-1004-20261122    gcc-14
x86_64                randconfig-1005-20261122    gcc-14
x86_64                randconfig-1006-20261122    gcc-14
x86_64                randconfig-1007-20261122    gcc-14
x86_64                randconfig-1008-20261122    gcc-14
x86_64                randconfig-1009-20261122    gcc-14
x86_64                randconfig-1010-20261122    gcc-14
x86_64                randconfig-1011-20261122    gcc-14
x86_64                randconfig-1012-20261122    clang-22
x86_64                randconfig-1013-20261122    clang-22
x86_64                randconfig-1014-20261122    clang-22
x86_64                randconfig-1015-20261122    clang-22
x86_64                randconfig-1016-20261122    clang-22
x86_64                randconfig-1017-20261122    clang-22
x86_64                randconfig-2000-20261121    gcc-14
x86_64                randconfig-2000-20261122    clang-22
x86_64                randconfig-2001-20261121    gcc-14
x86_64                randconfig-2001-20261122    clang-22
x86_64                randconfig-2002-20261121    gcc-14
x86_64                randconfig-2002-20261122    clang-22
x86_64                randconfig-2003-20261121    gcc-14
x86_64                randconfig-2003-20261122    clang-22
x86_64                randconfig-2004-20261121    gcc-14
x86_64                randconfig-2004-20261122    clang-22
x86_64                randconfig-2005-20261121    gcc-14
x86_64                randconfig-2005-20261122    clang-22
x86_64                randconfig-2100-20261121    gcc-14     cocci
x86_64                randconfig-2100-20261122    gcc-14     cocci
x86_64                randconfig-2101-20261121    gcc-14     cocci
x86_64                randconfig-2101-20261122    gcc-14     cocci
x86_64                randconfig-2102-20261121    gcc-14     cocci
x86_64                randconfig-2102-20261122    gcc-14     cocci
x86_64                randconfig-2103-20261121    gcc-14     cocci
x86_64                randconfig-2103-20261122    gcc-14     cocci
x86_64                randconfig-2104-20261121    gcc-14     cocci
x86_64                randconfig-2104-20261122    gcc-14     cocci
x86_64                randconfig-2105-20261121    gcc-14     cocci
x86_64                randconfig-2105-20261122    gcc-14     cocci
x86_64                randconfig-2200-20261121    gcc-14     smatch
x86_64                randconfig-2200-20261122    clang-22   smatch
x86_64                randconfig-2300-20261121    gcc-14     sparse
x86_64                randconfig-2300-20261122    clang-22   sparse
x86_64                randconfig-2301-20261121    gcc-14     sparse
x86_64                randconfig-2301-20261122    clang-22   sparse
x86_64                randconfig-2302-20261121    gcc-14     sparse
x86_64                randconfig-2302-20261122    clang-22   sparse
x86_64               randconfig-r2101-20261122    gcc-14     cocci
x86_64               randconfig-r2103-20261121    gcc-16.2.0 cocci
x86_64               randconfig-r2110-20261121    gcc-8.5.0  cocci
x86_64               randconfig-r2308-20261121    gcc-14     sparse
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
xtensa                randconfig-1000-20261122    clang-24
xtensa                randconfig-1001-20261122    clang-24
xtensa                randconfig-2000-20261121    gcc-16.2.0
xtensa                randconfig-2000-20261122    gcc-9.5.0
xtensa                randconfig-2001-20261121    gcc-16.2.0
xtensa                randconfig-2001-20261122    gcc-9.5.0
xtensa                randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa                randconfig-2200-20261122    gcc-11.5.0 smatch
xtensa               randconfig-r2100-20261122    gcc-14     cocci
xtensa               randconfig-r2101-20261122    gcc-14.4.0 cocci
xtensa               randconfig-r2101-20261122    gcc-9.5.0  cocci
xtensa               randconfig-r2300-20261122    gcc-12.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
