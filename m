Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506950;
	b=Oj2n+04cweT5ZJ4FMyDypCjpY+UKluNpaPF02bnJwZdsrKDtGryRtqG4zAuZ6k+/xk2k
	 4AIp03tezMozv8mcwQkjID/+QskYt/Km7zZXE4zM+uhpNHjT2wbOkIPNkeDidp35qq5Da
	 cHUr/YpenKHm6yYBcM66pRQ04ERSO6T7pnVslwZzbM5LPuOyN9oDqvWGiGW1307TfTv5/
	 OuLuaRTJ6Iy28B1xGab+OeNHvXc9HLoPiR90HQiRzn3hFcymnbGRFBlpzQgCMfUVzfgJQ
	 FBIL4iFnWXtI/2TDT8H5Y2wrBxrwZtStlrZzB4VfteRl/dEh3sRlQfRCrL13ZsmWvfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=gjwuNHA4P9N1/0IofpdTJnqxIQb4Kyq6KeXElNI7D/Q=;
	b=qZmV2SMlriu+GyKobab7rJgvGNaxHdhx1a/NYCDo1g6EVK7XNv5+1S1eCymdfqI6Ivbg
	 4hOVUQ9G6oK53nOmoIpYh6zAXy6ulbAQjtSYCa2ypO1dhyIXb8Z5TwtkjeQg7U8rPe8Ct
	 vA87lEETqbTFupzeavp3BCdhT+B+RgSsOqqdUDl4ZZv65v57vPCwmTLX17tdV3kqGezmb
	 r7k14EOKzDqObUFR2HtzCqgx4I0nQMxXFNx2BIQW/aTC+7DYhGOsuyZTQ1OPWmyP+C4bN
	 OerFRy5ks1cugKxbEwUr14+95QFwM2gqD9QnVX10FLdCjHQ0XJ1UARcAL8XzVPGn1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REUOanni;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41F606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A41F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REUOanni
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795506949; x=1827042949;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sTWIz2U9ScWbO18XLlSCi2Jn4fF8raEhY9dQ9U2eUrU=;
  b=REUOanniMXT4GNAQ9rY9LM9yS1kKfafx7PS7k4IgNQQLiW4jwm+rzv5I
   ivCIlF7AMNAEIPI/nBBv5/V4nef99iy5VJbfTupRtqkk6YzM3PwhthiF5
   +4ZAvfPqzsZPt+eHZezlMxTxVTRB8q5P7TdWE5F2FsTmvzFweIIiN+f3/
   n2dkVZQ1P786kdiqvFzzfD44XnPgaHBHc4jLsRWu5WO1QP/JF4BiWvIb1
   uKGFd/4zf7N+m/IFpqunQ4365HExDAXSg1iHLe/RF23XKvrF8bIhlHfNV
   8EOF58qnZMqRqw4UdbigE4hp5rl6xPODe8wWpIG2QaHKlOpjxtp7zYqRg
   g==;
X-CSE-ConnectionGUID: lofQ+V4UQluPX30ktcJCrg==
X-CSE-MsgGUID: PnbTAG9BTGyBN/yS9tDmlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4418952"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4418952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:41:38 -0800
X-CSE-ConnectionGUID: yyFtVKlCQxiJWZhDEEcNEg==
X-CSE-MsgGUID: d2wDGEqvQMeoofYajKgXlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11479259"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 23:41:36 -0800
Date: Tue, 24 Nov 2026 15:41:32 +0800
From: kernel test robot <yi1.lai@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, yi1.lai@intel.com
Subject: [tip:locking/core] [locking/osq]  72c440a4e2:
 will-it-scale.per_thread_ops 40.8% regression
Message-ID: <202611240845.904e8444-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

kernel test robot noticed a 40.8% regression of will-it-scale.per_thread_ops on:

commit: 72c440a4e225879063809c3d0bcdd7e6544069fe ("locking/osq: Save the CPU number for 'prev', not the node address")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_task: 100%
	mode: thread
	test: mmap1
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611240845.904e8444-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261124/202611240845.904e8444-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmap1/will-it-scale

commit: 
  649dd02795 ("locking/osq: Make osq_link_next() use smp_store_release()")
  72c440a4e2 ("locking/osq: Save the CPU number for 'prev', not the node address")

649dd027958996a1 72c440a4e225879063809c3d0bc 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     87444 ±  2%     -40.8%      51808        will-it-scale.192.threads
     27.64 ±  2%    +251.6%      97.18        will-it-scale.192.threads_idle
    455.00 ±  2%     -40.8%     269.33        will-it-scale.per_thread_ops
     87444 ±  2%     -40.8%      51808        will-it-scale.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


