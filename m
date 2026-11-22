Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348629;
	b=y9aX+810V8HXVOsKYBG6TsrB472KAsuDlzEqbjeD1HUeI4x20tjtNcRUbsWJqpfvBPMZ
	 Ux0OzozItcKX0pkIsXv03p8pYIRk2e25JvTOS7UDMRP29ootUpwIufLN2n2uODj946HVb
	 DpftoK3Lu5T00TGaFKPs8frBqTC79GstPjfbSBr+rGSaP2vChzNmtR9rSnnSgFRzpXe3W
	 h9FqDLL9tTsg1kvXYe5bE95v+T5k8nUSOdcctHlpwGmZqK8xGtgYO/GJt9mSd/00l6rfB
	 fTce3hMF97Clk4xKs1IxKlt5aZhl7VU/joN3M0sr6p+Yf8SY9vPAbx8g1gYXPViV3Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348629;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YPCAfZkl/VqU6hRR+iJpGXoDbiuH3r0An+aBhqpsDF8=;
	b=BjsFyXFlcCXN7aX0YZjJJrZw1+8Hzs0T5YLO0fnxDGqr109aW1H2L5mFL8G/85qnzi1h
	 SwjpLZuWafGMfLLxrx3gzwThpJjU84Y5r/sLeSEvwYTZYko0dRq69WX15bvcB0QO7hdgB
	 TnBwaUkRNFsj0gOJfwzQUWhHKfqAQHF8svP4GlRNOHWnFtljG4Yv/FKrMa3r4EkmiFp3F
	 J+IMRPRenkTMDXa0aYf/dyaFlnSrbAXT7CknEmgbjXKW54c2UWPebwBjsk/K2c8C48Knv
	 2wN7ej7rLY33jGoRjvsJT8sChI0d3DBy9o05q/3a6++3Xn8rJjokPLyfMu34buS2Ozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C102VK84;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADF606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76ADF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C102VK84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795348629; x=1826884629;
  h=date:from:to:cc:subject:message-id;
  bh=o3O/KsOG+UIEshke3Si7D9+gwU4DTYejRXg7r0bbisw=;
  b=C102VK84XmQG1YWj1gxFhjHgkzJi4S23YgmAbijS+pp/jvzystznv3Y8
   v5rk1FdmC6yDA7z93prLrPvys+EkZwQfCpDY5/ivd+p2DxlAPYNrLZAku
   9P2txALbc04zAO8o22mzeD3G0wdjWiSyLyQ2PBq9skDww5J/GVqwgc4Ef
   VnEgfzDXEKB20sBqCT5GnmPY/BAmi0SZhxFtoQ3Gs8DC88Gax+lA0ltOL
   y99efpSgkwqvtabqWUagq3cC8MZV+ux95URUsqVryKJA5Eue2Q/kjTKcv
   iCELNUcbWef1GM472Y62MHkvcoSq1SFLzJh4OgjUE6cce9aStnHXMVf1T
   A==;
X-CSE-ConnectionGUID: TUmXDWh9RDmvxmEAryUP+g==
X-CSE-MsgGUID: ShMPn1fUQ1O+/5zMIYp2yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4213155"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4213155"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:57:08 -0800
X-CSE-ConnectionGUID: To+Sy5S2TvaFQ6iiUSGWHw==
X-CSE-MsgGUID: 3J9S7/buSiS8O/iAML/vCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12891424"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 22 Nov 2026 03:57:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV6Br-000000004YH-2obF;
	Sun, 22 Nov 2026 11:57:03 +0000
Date: Sun, 22 Nov 2026 12:56:19 +0100
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: __efistub_cmdline.c:undefined reference to
 `__efistub___ashldi3'
Message-ID: <20261122125352.gAcg5yLx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 9a4580db6e9f83428813f671a79486469684069f lib: fix memparse() to handle overflow
date:   6 months ago
config: loongarch-randconfig-r2100-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122125352.gAcg5yLx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122125352.gAcg5yLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a4580db6e9f ("lib: fix memparse() to handle overflow")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L47':
>> __efistub_cmdline.c:(.init.text+0x258): undefined reference to `__efistub___ashldi3'
>> loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x268): undefined reference to `__efistub___lshrdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
