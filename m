Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809473;
	b=hQCphxtvWEIX5/OA7xajjYz03HJyG6Zz4HNK7oPSJ31GEl8j9IJMxuKJHEGmL2KgIZXw
	 SwZ8Rkq7HjQDMuiha3arEGMBE6S3GNtPy6f9q+OKFqLmNVNSIo9RPm0YaEBh9SX1Thmny
	 sQJt35IxG7ee94a7QBYkIKcFy6Ad9q27NfqXFW98rYmubrsJCtl0hWTcGD1v4pdcljoKC
	 XpnLlc9aM9/wi1tmo87ro1JC6FVBInCK848tsy9zZhtCcxlpLAKNr7RfRNUidddAEto4T
	 z9kzU7+HfQTWPnSvAHFfUaqFkdwZRT1yBJG+3T3rvtcwTIKJzrMynwpLgFU8eSFa9fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DKhxkouREdShkbsP32oI8I/JmnZ5RYJQqIltZSuf8yc=;
	b=EOwh0DryvzIylQgNIgM2uGPk0H+oj2vddxx0AQHI2Z/aajFICRK0DDkUEl/QHR3WSiIk
	 2r27y/xgn6sY3ezRsLHc65TH4+vpGfASRETpGHzSu7nnmEHGuTZmB6rHvaKdk+YWJsvTg
	 87at7C2AQsjjUeHnN/FjArcdJv/A1QAyvP+9cGL9sKVtyMJhOgFA8p88zR9YBJPKWvonL
	 j0zLGANciWFS1YCbKcXeSDDyp7sUOo2xzQHfUJdpYJlhil98yoWmWKLBfcDjpx2TmKqb4
	 ozc0APth/1fun8cPXp5pt+VHiTaN0oVfr+ZHwKAbPG9uswAD6d2BmwI863oPIBaxuww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f9+AR4QE;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F91606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F91606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f9+AR4QE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795809472; x=1827345472;
  h=date:from:to:cc:subject:message-id;
  bh=Bm48KcmOFvBPjD1SFAjyhjW7FIN0F9kLhYfmTIzYeks=;
  b=f9+AR4QEvCIFOvlB61k/BSbD34vHqek34MXFbZq/yiRDtYcBJpmDfhhY
   9xF8jufwj3fX9GXaS3ed3gogOiTiRsgJIwzL3EIwUubxWGJkk6ST3BWDm
   D7t9Ab7oX5u/mCp8dpUYZtTZhGyT0OLu8UaakVK9HFR1OVFyPI3iQVPUk
   JuuyMNhQc81bRvfC/MoFTrxFdMZfP2EN+8zaa5szVnRk1pOXNkx9pN4/0
   iL989j7kVlYlaNTCyGD4VoeiyBrj3NNpdSkSPpvIU0VHnID8C5RCXjAd7
   q332KlWyzivGgnhM1N/atQEsQ/x0Nc7jXCdW5QA3eu9VJwEKrE0FhP+FY
   w==;
X-CSE-ConnectionGUID: Qp6afbdkTsq9SDYMhCfG/g==
X-CSE-MsgGUID: qe7hfNLXSPSuzkRVinbA1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4736811"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4736811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 11:57:51 -0800
X-CSE-ConnectionGUID: 4ZrOt5smTuugyyE1dlMrjQ==
X-CSE-MsgGUID: DOy3/5aQTp6MKHmybUJmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12476195"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2026 11:57:49 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX24o-000000000L0-2NJj;
	Fri, 27 Nov 2026 19:57:46 +0000
Date: Fri, 27 Nov 2026 20:57:32 +0100
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fenghua Yu <fenghuay@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Ben Horgan <ben.horgan@arm.com>
Subject: drivers/resctrl/mpam_devices.c:127:35-38: WARNING:
 Suspicious code. resource_size is maybe missing with msc_res
Message-ID: <20261127205221.92qYTzCE-lkp@intel.com>
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
head:   822ba3a89c7896b26e4beb70e2ebffb881924dfe
commit: f04046f2577a5c76167333ca99d3903ee5331ba0 arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
date:   1 year ago
config: arm64-randconfig-r2111-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127205221.92qYTzCE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3a9f981aab0cc32f74ffac36a87891cda8889c37)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127205221.92qYTzCE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/resctrl/mpam_devices.c:127:35-38: WARNING: Suspicious code. resource_size is maybe missing with msc_res

vim +127 drivers/resctrl/mpam_devices.c

    79	
    80	static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
    81	{
    82		int err;
    83		u32 tmp;
    84		struct mpam_msc *msc;
    85		struct resource *msc_res;
    86		struct device *dev = &pdev->dev;
    87	
    88		lockdep_assert_held(&mpam_list_lock);
    89	
    90		msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
    91		if (!msc)
    92			return ERR_PTR(-ENOMEM);
    93	
    94		err = devm_mutex_init(dev, &msc->probe_lock);
    95		if (err)
    96			return ERR_PTR(err);
    97	
    98		err = devm_mutex_init(dev, &msc->part_sel_lock);
    99		if (err)
   100			return ERR_PTR(err);
   101	
   102		msc->id = pdev->id;
   103		msc->pdev = pdev;
   104		INIT_LIST_HEAD_RCU(&msc->all_msc_list);
   105		INIT_LIST_HEAD_RCU(&msc->ris);
   106	
   107		update_msc_accessibility(msc);
   108		if (cpumask_empty(&msc->accessibility)) {
   109			dev_err_once(dev, "MSC is not accessible from any CPU!");
   110			return ERR_PTR(-EINVAL);
   111		}
   112	
   113		if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
   114			msc->iface = MPAM_IFACE_MMIO;
   115		else
   116			msc->iface = MPAM_IFACE_PCC;
   117	
   118		if (msc->iface == MPAM_IFACE_MMIO) {
   119			void __iomem *io;
   120	
   121			io = devm_platform_get_and_ioremap_resource(pdev, 0,
   122								    &msc_res);
   123			if (IS_ERR(io)) {
   124				dev_err_once(dev, "Failed to map MSC base address\n");
   125				return ERR_CAST(io);
   126			}
 > 127			msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
   128			msc->mapped_hwpage = io;
   129		} else {
   130			return ERR_PTR(-EINVAL);
   131		}
   132	
   133		list_add_rcu(&msc->all_msc_list, &mpam_all_msc);
   134		platform_set_drvdata(pdev, msc);
   135	
   136		return msc;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
