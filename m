Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468599;
	b=NIgzKDizzK2YWk1wH9346WuFR0Ha+eUPmmFTobA7sIkMzETK/G6PSo5m0cIiErnFNW+0
	 Pda9159lKc2qUZj12Ohdj1/dfywcLD9EuTFHx7p1M0/n1R/0NltO9ot+Oul6KouvqcKIT
	 9dI7g3dX6dM3cNX4/tLDrKzYOELt541Sqd0HlLjLYo3xvH3oznG4LYkPGncnNDyLBlutj
	 t3ddNnX5J76SoIJDD20fQUPATA2XRuRjEe5wkpSuRQgRbVtcFBa+QM1gYYkcK8a67wSp+
	 5mdhoRt7+TrYcTGYxIy6Cqh4HAQLZV3dip57R+nnlYme7bFqeU6KSHyfuSupIF4CmFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cOHmfGiQDDFXwPEvJuicOv35Sz4amfi8yGUp0mZgPFI=;
	b=EJu7eX6RjAmyh2Sa6AnKs7+qdBfwsPVSse4QCpv6JVYCL4l/mRblTJzq4UOhWwOnv04p
	 1ZFyUruLeGAlEA0QJ5tA7PBdV6cHHKCWWSPFRU0o5KVBP9cDVlNziL+MyiZzIznKx0eQ5
	 FCtOIUcYFkh4Cbbcn+WYt8ensQG4jvZhKYlcGdypwm7xe83S/3ntWaEuB1v4AU98A0Eeg
	 0Z7jp+BRQSIwM5CMxxZcgckUSK3SEoen1SgZSLCPrFg1D4Kk4qKPMNEM6tDUhQkLmlhNT
	 SmgjndvK21BubtEMwm1mSMGY1Xq9FjpoBr2Hi4kSxKHmt5YBm49yWdNnkQpEv1i4R9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMXFXRZ7;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BC606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77BC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMXFXRZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795468599; x=1827004599;
  h=date:from:to:cc:subject:message-id;
  bh=9b5Q9QlwMRWLcwSGjF+cXdllX/QVkkkJ7uWxMKLC7Rk=;
  b=JMXFXRZ7cd44KCc62oAM5BTz4cHuhKAbu2SmXvNhJhf6+tNilUmte+jE
   DDl6inRlO63L5gxDCcpivGmujmvv92qldV2Kl/OcZNBoKsoAX+Z63jz+P
   1AFlSLNgDiFg4a6U0U42D8R0QFnguSTkbq6G2KeWgedbJKELBRXLei8JN
   LN4CqjNa1PWbLZD5JiVmjWt9UOX8Fp0MCOjXq0Q2vmsYJaQ4gB4POhzQx
   J3aHXJXEi1A7sJZRzW9mmwWyXbjazxvuRnitBwycFjSw/XXeRfc1YrKFf
   3eQgL1IcQZpc7Yc2tTJb3f1nUI3w0OA/1KDq83dwqEyRtiUnPRnYqr60M
   w==;
X-CSE-ConnectionGUID: RdJMG2oMSxSemGEaFUQSKQ==
X-CSE-MsgGUID: UEJwBkWOQm+mY2lKdQei4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4189299"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4189299"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 13:16:39 -0800
X-CSE-ConnectionGUID: WIgzDaW9TjqMVp3dnz6NeA==
X-CSE-MsgGUID: aprfRypQRRubitB2ObmypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11731590"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Nov 2026 13:16:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVbOs-00000001Nw0-3iqI;
	Mon, 23 Nov 2026 21:16:34 +0000
Date: Tue, 24 Nov 2026 05:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2026.11.12c] BUILD SUCCESS
 ee469e7372b729a8eecfafa72947c79dedd1390a
Message-ID: <20261124051612.Jxgnpq6U-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.11.12c
branch HEAD: ee469e7372b729a8eecfafa72947c79dedd1390a  srcu: Validate ___srcu_struct_ptrs entries against the module range

elapsed time: 2897m

configs tested: 149
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        randconfig-2000-20261121    gcc-16.2.0
alpha        randconfig-2001-20261121    gcc-14.4.0
alpha        randconfig-2200-20261121    gcc-10.5.0 smatch
alpha       randconfig-r2300-20261121    gcc-8.5.0  sparse
arc          randconfig-2000-20261121    gcc-8.5.0
arc          randconfig-2001-20261121    gcc-10.5.0
arc          randconfig-2002-20261121    gcc-16.2.0
arc          randconfig-2003-20261121    gcc-14.4.0
arc          randconfig-2004-20261121    gcc-12.5.0
arc          randconfig-2005-20261121    gcc-8.5.0
arc          randconfig-2200-20261121    gcc-14.4.0 smatch
arc         randconfig-r2310-20261121    gcc-10.5.0 sparse
arm          randconfig-2000-20261121    clang-17
arm          randconfig-2001-20261121    clang-24
arm          randconfig-2002-20261121    clang-24
arm          randconfig-2200-20261121    clang-19   smatch
arm64        randconfig-2000-20261121    gcc-15.3.0
arm64        randconfig-2001-20261121    gcc-13.5.0
arm64        randconfig-2002-20261121    clang-24
arm64        randconfig-2200-20261121    clang-22   smatch
csky         randconfig-2000-20261121    gcc-16.2.0
csky         randconfig-2001-20261121    gcc-16.2.0
csky         randconfig-2200-20261121    gcc-16.2.0 smatch
csky        randconfig-r2309-20261121    gcc-9.5.0  sparse
hexagon      randconfig-2000-20261121    clang-24
hexagon      randconfig-2001-20261121    clang-24
hexagon      randconfig-2200-20261121    clang-24   smatch
hexagon     randconfig-r2303-20261121    clang-24   sparse
hexagon     randconfig-r2307-20261121    clang-18   sparse
i386         randconfig-2000-20261121    gcc-14
i386         randconfig-2001-20261121    gcc-14
i386         randconfig-2002-20261121    gcc-14
i386         randconfig-2003-20261121    clang-22
i386         randconfig-2004-20261121    gcc-14
i386         randconfig-2005-20261121    gcc-14
i386         randconfig-2100-20261121    gcc-14     cocci
i386         randconfig-2101-20261121    clang-22   cocci
i386         randconfig-2102-20261121    gcc-13     cocci
i386         randconfig-2103-20261121    clang-22   cocci
i386         randconfig-2104-20261121    gcc-14     cocci
i386         randconfig-2105-20261121    gcc-14     cocci
i386         randconfig-2200-20261121    clang-22   smatch
i386         randconfig-2300-20261121    clang-22   sparse
i386         randconfig-2301-20261121    gcc-14     sparse
i386         randconfig-2302-20261121    gcc-13     sparse
i386        randconfig-r2102-20261121    gcc-14     cocci
i386        randconfig-r2105-20261121    clang-22   cocci
i386        randconfig-r2304-20261121    clang-22   sparse
i386        randconfig-r2309-20261121    gcc-14     sparse
loongarch    randconfig-2000-20261121    clang-22
loongarch    randconfig-2001-20261121    gcc-16.2.0
loongarch    randconfig-2200-20261121    gcc-16.2.0 smatch
loongarch   randconfig-r2307-20261121    clang-24   sparse
loongarch   randconfig-r2310-20261121    gcc-12.5.0 sparse
m68k         randconfig-2000-20261121    gcc-13.5.0
m68k         randconfig-2001-20261121    gcc-8.5.0
m68k         randconfig-2200-20261121    gcc-8.5.0  smatch
m68k        randconfig-r2107-20261121    gcc-10.5.0 cocci
microblaze   randconfig-2000-20261121    gcc-8.5.0
microblaze   randconfig-2001-20261121    gcc-10.5.0
microblaze   randconfig-2200-20261121    gcc-8.5.0  smatch
microblaze  randconfig-r2308-20261121    gcc-10.5.0 sparse
mips         randconfig-2000-20261121    clang-24
mips         randconfig-2001-20261121    gcc-8.5.0
mips         randconfig-2002-20261121    clang-24
mips         randconfig-2200-20261121    clang-21   smatch
mips        randconfig-r2111-20261121    gcc-8.5.0  cocci
mips        randconfig-r2306-20261121    gcc-9.5.0  sparse
nios2        randconfig-2000-20261121    gcc-11.5.0
nios2        randconfig-2001-20261121    gcc-8.5.0
nios2        randconfig-2200-20261121    gcc-10.5.0 smatch
nios2       randconfig-r2311-20261121    gcc-8.5.0  sparse
openrisc     randconfig-2000-20261121    gcc-12.5.0
openrisc     randconfig-2001-20261121    gcc-14.4.0
openrisc     randconfig-2002-20261121    gcc-16.2.0
openrisc     randconfig-2200-20261121    gcc-14.4.0 smatch
openrisc    randconfig-r2106-20261121    gcc-16.2.0 cocci
openrisc    randconfig-r2302-20261121    gcc-13.5.0 sparse
openrisc    randconfig-r2306-20261121    gcc-9.5.0  sparse
parisc       randconfig-2000-20261121    gcc-10.5.0
parisc       randconfig-2001-20261121    gcc-16.2.0
parisc       randconfig-2200-20261121    gcc-16.2.0 smatch
powerpc      randconfig-2000-20261121    clang-24
powerpc      randconfig-2001-20261121    gcc-15.3.0
powerpc      randconfig-2002-20261121    clang-24
powerpc      randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc     randconfig-r2311-20261121    gcc-12.5.0 sparse
powerpc64    randconfig-2000-20261121    clang-24
powerpc64    randconfig-2001-20261121    gcc-10.5.0
powerpc64    randconfig-2002-20261121    gcc-8.5.0
powerpc64   randconfig-r2308-20261121    gcc-11.5.0 sparse
riscv        randconfig-2000-20261121    gcc-9.5.0
riscv        randconfig-2001-20261121    gcc-11.5.0
riscv        randconfig-2002-20261121    clang-17
riscv        randconfig-2003-20261121    gcc-11.5.0
riscv        randconfig-2004-20261121    gcc-8.5.0
riscv        randconfig-2005-20261121    clang-17
riscv        randconfig-2200-20261121    clang-24   smatch
s390         randconfig-2000-20261121    clang-24
s390         randconfig-2001-20261121    clang-24
s390         randconfig-2002-20261121    clang-22
s390         randconfig-2003-20261121    clang-20
s390         randconfig-2004-20261121    gcc-9.5.0
s390         randconfig-2005-20261121    gcc-15.3.0
s390         randconfig-2200-20261121    gcc-8.5.0  smatch
sh           randconfig-2000-20261121    gcc-12.5.0
sh           randconfig-2001-20261121    gcc-10.5.0
sh           randconfig-2002-20261121    gcc-16.2.0
sh           randconfig-2003-20261121    gcc-16.2.0
sh           randconfig-2004-20261121    gcc-16.2.0
sh           randconfig-2005-20261121    gcc-10.5.0
sh           randconfig-2200-20261121    gcc-10.5.0 smatch
sparc        randconfig-2000-20261121    gcc-16.2.0
sparc        randconfig-2001-20261121    gcc-14.4.0
sparc        randconfig-2200-20261121    gcc-8.5.0  smatch
sparc       randconfig-r2100-20261121    gcc-16.2.0 cocci
sparc       randconfig-r2103-20261121    gcc-14.4.0 cocci
sparc       randconfig-r2109-20261121    gcc-8.5.0  cocci
sparc64      randconfig-2000-20261121    gcc-9.5.0
sparc64      randconfig-2001-20261121    gcc-8.5.0
sparc64      randconfig-2200-20261121    clang-20   smatch
sparc64     randconfig-r2104-20261121    gcc-13.5.0 cocci
sparc64     randconfig-r2108-20261121    clang-20   cocci
sparc64     randconfig-r2305-20261121    gcc-13.5.0 sparse
um           randconfig-2000-20261121    clang-17
um           randconfig-2001-20261121    clang-24
um           randconfig-2200-20261121    gcc-14     smatch
x86_64       randconfig-2000-20261121    clang-22
x86_64       randconfig-2001-20261121    clang-22
x86_64       randconfig-2002-20261121    clang-22
x86_64       randconfig-2003-20261121    gcc-14
x86_64       randconfig-2004-20261121    gcc-14
x86_64       randconfig-2005-20261121    clang-22
x86_64       randconfig-2100-20261121    clang-22   cocci
x86_64       randconfig-2101-20261121    gcc-14     cocci
x86_64       randconfig-2102-20261121    gcc-14     cocci
x86_64       randconfig-2103-20261121    clang-22   cocci
x86_64       randconfig-2104-20261121    clang-22   cocci
x86_64       randconfig-2105-20261121    gcc-14     cocci
x86_64       randconfig-2200-20261121    gcc-14     smatch
x86_64       randconfig-2300-20261121    clang-22   sparse
x86_64       randconfig-2301-20261121    gcc-14     sparse
x86_64       randconfig-2302-20261121    gcc-13     sparse
x86_64      randconfig-r2110-20261121    gcc-14     cocci
x86_64      randconfig-r2301-20261121    clang-22   sparse
xtensa       randconfig-2000-20261121    gcc-8.5.0
xtensa       randconfig-2001-20261121    gcc-12.5.0
xtensa       randconfig-2200-20261121    gcc-12.5.0 smatch
xtensa      randconfig-r2101-20261121    gcc-13.5.0 cocci

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
