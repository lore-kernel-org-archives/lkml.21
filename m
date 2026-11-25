Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602400;
	b=Rqfd/ZeP7tBbWQGeqCHXl6SCOgnx1AyBK6gCD3XqATLExuwcE9kQqB3S9OH27Ue0p1KD
	 MVOFBr/gtWsakKqJ48Ui0zr81JwDetEErTBzXZVfcv9xx7NJ5nIbbfT0TlZXOVHp4O76E
	 e8nS0KgPqIwMWG9vSuSJT+NxuEnyzEyCsLP6ZD5qo2A43wm5ahC6C6gFDhzeFzNqSSlbw
	 WL+OAgxLFSYRswCBvlVez59YAlRqXYCWU4QH5/YZiBjfv+TqJd9vEOr9/jNlrsSTz3hlk
	 gtAq8xipPdz4/VtoKs98BiERWf7ctHn0k6VG9IzPjWopN2OejlgSDo2nhPb4po1Hyjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602400;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=zuE4J4l0qg09OFRCXhQ9L/aabV4WTGQ8Y3ktg05Mo94=;
	b=ofcvQrlVCg2DeMpC/ZU5FlkNU0AqoN6rp8rAvrX0sHajT9mo9ORxVDbF4VwZEFf1FAqZ
	 mmL2gOla9fWQ5T5GHm52y/Mozjam3Lb8svz+k9TzGQ0LezKh7RXrovP1AXy1vO+id0QX6
	 pY523bEOH2suAD/nDJpg+lkBLAgwd+58O3FAo1s/1GZ3wXwN69nPFHKt0EroDfqZkexW/
	 37G8c0UT3p5C6KC98fpvEYGYTBrI4y8ofQha0Obho1Xxncu9UyESU8EcfzQPtAG9nDPB2
	 77QbND6JXH0+pWtYdIdblvjZ4SPYmMSgK9TxuXxiLxGhZDWrcUkAJ+/2iAwCygcD+pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxhKHvxE;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A4E606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A4E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxhKHvxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795602400; x=1827138400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+au8qRldkgPRV24KTZEaaIK3iE3Avcm18aW46N1flo=;
  b=OxhKHvxEYrDH39lsPfvhaMGYgmMzVuDQUM3FCjYelgjHMpwXAkO94I4f
   0zh8EdbFjauPJOGEqd7hgyfwkQvki8eioRnGnqTamI2LlUBhWBnSJG2o3
   7UW1Jlrggyh+9CdMNXb0lMzbolWlwrxcLqZi1T/Mn1H1ju82a7LKDyDUM
   LMkxqlPj2VrGmQjSQIGt0Fb0chndktYeSfzmT/8MOTedmU97MgCtcuhOC
   v19nSFrydSZWw4zzuZUCRvz02Jtkv6MxAzbfxDtH5Ut7mwQMmGTvj8Pwd
   Tgeou/DZL0O12xuSBSnesu9BP/9KUDrx9G/dZ0p7saJoFT2ngfXxAFPjy
   Q==;
X-CSE-ConnectionGUID: SQE4JhcPQUiiCoCVTqS1qg==
X-CSE-MsgGUID: WBEuDawzSTS4o+O0soThqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4364084"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4364084"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 02:26:40 -0800
X-CSE-ConnectionGUID: gVRl3oTGSEW/vZelTwrw+g==
X-CSE-MsgGUID: cv7+69coRj+Q/EBnw9ALsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11958543"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2026 02:26:38 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWACw-0000000006p-3McR;
	Wed, 25 Nov 2026 10:26:34 +0000
Date: Wed, 25 Nov 2026 11:26:30 +0100
From: kernel test robot <lkp@intel.com>
To: "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>
Subject: drivers/pci/rebar.c:142:31: warning: implicit conversion
 from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from
 140737488355328 to 0
Message-ID: <20261125112105.GGL4bTAX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: 48f014356698a3525959a9eb343dc67b5a5c6842 PCI: Validate pci_rebar_size_supported() input
date:   1 year ago
config: s390-randconfig-r2101-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125112105.GGL4bTAX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125112105.GGL4bTAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 48f014356698 ("PCI: Validate pci_rebar_size_supported() input")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125112105.GGL4bTAX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/rebar.c:142:31: warning: implicit conversion from 'unsigned long long' to 'u32' (aka 'unsigned int') changes value from 140737488355328 to 0 [-Wconstant-conversion]
     142 |         if (size < 0 || size > ilog2(SZ_128T) - ilog2(PCI_REBAR_MIN_SIZE))
         |                                ~~~~~~^~~~~~~~
   include/linux/sizes.h:70:20: note: expanded from macro 'SZ_128T'
      70 | #define SZ_128T                         _AC(0x800000000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +142 drivers/pci/rebar.c

   128	
   129	/**
   130	 * pci_rebar_size_supported - check if size is supported for BAR
   131	 * @pdev: PCI device
   132	 * @bar: BAR to check
   133	 * @size: encoded size as defined in the PCIe spec (0=1MB, 31=128TB)
   134	 *
   135	 * Return: %true if @bar is resizable and @size is supported, otherwise
   136	 *	   %false.
   137	 */
   138	bool pci_rebar_size_supported(struct pci_dev *pdev, int bar, int size)
   139	{
   140		u64 sizes = pci_rebar_get_possible_sizes(pdev, bar);
   141	
 > 142		if (size < 0 || size > ilog2(SZ_128T) - ilog2(PCI_REBAR_MIN_SIZE))
   143			return false;
   144	
   145		return BIT(size) & sizes;
   146	}
   147	EXPORT_SYMBOL_GPL(pci_rebar_size_supported);
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
