Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697258;
	b=Bv2tjfUPTyF1fdmuSO0vMHe82IZSNYyATNda4RNre9r4CU2+6kj1Wj1lon+xYhDouKbM
	 RNUBu9W+jpb6tMI4O/YX1lr/4AYYvcgEIhyPOZ/xHv+3w+7q2ASUOZp5XwNlngxopztMc
	 i5pxCSoud/8GJTGT1EP0gzKWt1rWFHktj6a0vP4XUQLG4XkZQmtkfLQ5yQ1Q4qHpmpRWH
	 /AjO1S/de9oWBjWhQ6EOC84/PBNSKhq6EkjdE0P6mU37QrpCmm+pfpgFfyv9IzxFZ1AFk
	 fiVo+rBnRQJ2awOSpBYWZPkW+fEY+OZgmICMz9DPvTTYjq47O/GtSVQdKt8bRCQKJsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697258;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2ZGj3d9V5w+hajDEv0Cv6Jml5Dg7lC8xu0EU1vzAw6M=;
	b=aQVYKZNm4MnDriKlIouVbS3SdjQ5nonSOYAn1VoM05tv0jh1EbA8Xv+dN/e5y99x0z/V
	 MBrsFU//iGMauLXy0urdX2bVE1Lp0BguRxRwEKELQqtqfaL9qgOjucbNQQJ3nwt+tDOu0
	 nZWP0pySHLhlXQhgtnAmg65LE+2oyR+S1tDQmgu+JPFYcVFga9c0H6gnOneO6Q8EYUGs2
	 VY6Wq6fa+ceQnMA0fovHcJ1NjACxPNKjpYiKwFS4XOJ9HBpDGj9wKpBGdoKXBGACNh74x
	 aiTSZYrMe0ye8ZBPrIul5+zuDgGUhQhLw2tWdvO86j5fXRIwsjuJ4cpzjvvyuaPUIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lf0gOSOx;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C41A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C41A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lf0gOSOx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795697258; x=1827233258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/qc0v+9VWibpDBssMT0Yeyn++IiypOZSdHoUAYd2qJw=;
  b=Lf0gOSOxRpmzrxHIDxhk3ossXpRhkvCnNDYR+Qrcm8zJOioD3LyLBZWm
   wLu0zn7RFdmPuvWJXEVhHNOCxmiA5QZ9UmlvNYsHfFRFb8Lnx1OrP5uKb
   LHL8SA2CLleKyXLQwOdYFyO150GjQhAqXPcZ4Vc2+1CPnJcHXWy4MuALl
   o/gJY8icOrZEqSs46foLdrs6307y7eRcFewg8v99sdpfwcrMvBGhjuSAH
   1xw6Pro3Q+BgpmMOrpluyuBQq44OabHJW/oHbKgjnPu4ibyEGXsC3nyHH
   EXnLLncLGwVT0QC7DgmsVqhuEa6Hmuhi39jfaA3+WSK7VBZSHfe66qoSC
   w==;
X-CSE-ConnectionGUID: QHbvDSElQ3iaLgleaNMAJA==
X-CSE-MsgGUID: 0CRZvohhRAyVT6D/OuemOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4560074"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4560074"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:47:37 -0800
X-CSE-ConnectionGUID: R5s9+8Z3STCOHSM9JioJqw==
X-CSE-MsgGUID: zO+IOfXAQku7bN1FpMd+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12056236"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 04:47:33 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWYsr-00000001U6u-2Cvp;
	Thu, 26 Nov 2026 12:47:29 +0000
Date: Thu, 26 Nov 2026 20:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Abhash Kumar Jha <a-kumar2@ti.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	devarsht@ti.com, u-kumar1@ti.com, sjakhade@cadence.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, s-jain1@ti.com,
	y-d@ti.com, tomi.valkeinen@ideasonboard.com,
	benjamin.robin@bootlin.com
Subject: Re: [PATCH v4] drm/bridge: cdns-mhdp8546: Add suspend resume support
 to the bridge driver
Message-ID: <20261126201120.k0T1Wvok-lkp@intel.com>
References: <20261126060532.2379444-1-a-kumar2@ti.com>
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
Content-Disposition: inline
In-Reply-To: <20261126060532.2379444-1-a-kumar2@ti.com>

Hi Abhash,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.4-rc4 next-20261125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhash-Kumar-Jha/drm-bridge-cdns-mhdp8546-Add-suspend-resume-support-to-the-bridge-driver/20261126-113532
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261126060532.2379444-1-a-kumar2%40ti.com
patch subject: [PATCH v4] drm/bridge: cdns-mhdp8546: Add suspend resume support to the bridge driver
config: csky-randconfig-1001-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126201120.k0T1Wvok-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126201120.k0T1Wvok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126201120.k0T1Wvok-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp_resume':
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2322:26: error: 'struct cdns_mhdp_device' has no member named 'no_hpd'
    2322 |                 if (!mhdp->no_hpd)
         |                          ^~


vim +2322 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

  2259	
  2260	static int cdns_mhdp_resume(struct device *dev)
  2261	{
  2262		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
  2263		unsigned int keep_alive, keep_alive_inc;
  2264		unsigned long rate;
  2265		int ret;
  2266	
  2267		ret = clk_prepare_enable(mhdp->clk);
  2268		if (ret)
  2269			return ret;
  2270	
  2271		rate = clk_get_rate(mhdp->clk);
  2272		writel(rate % 1000000, mhdp->regs + CDNS_SW_CLK_L);
  2273		writel(rate / 1000000, mhdp->regs + CDNS_SW_CLK_H);
  2274		writel(~0, mhdp->regs + CDNS_APB_INT_MASK);
  2275	
  2276		ret = phy_init(mhdp->phy);
  2277		if (ret) {
  2278			dev_err(mhdp->dev, "Failed to initialize PHY: %d\n", ret);
  2279			goto disable_clk;
  2280		}
  2281		ret = phy_power_on(mhdp->phy);
  2282		if (ret < 0) {
  2283			dev_err(mhdp->dev, "Failed to power on PHY: %d\n", ret);
  2284			goto phy_exit;
  2285		}
  2286	
  2287		/*
  2288		 * The KEEP_ALIVE register is incremented at every scheduler loop of the
  2289		 * firmware. If it changes between reads, the firmware is still running
  2290		 * (e.g. the suspend was aborted) and only needs to be activated. If it
  2291		 * does not change, the bridge lost power and the firmware must be loaded
  2292		 * again.
  2293		 */
  2294		keep_alive = readl(mhdp->regs + CDNS_KEEP_ALIVE) & CDNS_KEEP_ALIVE_MASK;
  2295		ret = readl_poll_timeout(mhdp->regs + CDNS_KEEP_ALIVE, keep_alive_inc,
  2296					 (keep_alive_inc & CDNS_KEEP_ALIVE_MASK) != keep_alive,
  2297					 2000, 2 * CDNS_KEEP_ALIVE_TIMEOUT);
  2298		if (ret) {
  2299			ret = cdns_mhdp_load_firmware(mhdp);
  2300			if (ret)
  2301				goto phy_off;
  2302	
  2303			ret = wait_event_timeout(mhdp->fw_load_wq,
  2304						 mhdp->hw_state == MHDP_HW_READY,
  2305						 msecs_to_jiffies(1000));
  2306			if (ret == 0) {
  2307				dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
  2308					__func__);
  2309				ret = -ETIMEDOUT;
  2310				goto phy_off;
  2311			}
  2312		} else {
  2313			ret = cdns_mhdp_set_firmware_active(mhdp, true);
  2314			if (ret) {
  2315				dev_err(mhdp->dev, "Failed to activate firmware (%pe)\n",
  2316					ERR_PTR(ret));
  2317				goto phy_off;
  2318			}
  2319	
  2320			spin_lock(&mhdp->start_lock);
  2321			mhdp->hw_state = MHDP_HW_READY;
> 2322			if (!mhdp->no_hpd)
  2323				cdns_mhdp_bridge_hpd_enable(&mhdp->bridge);
  2324			spin_unlock(&mhdp->start_lock);
  2325		}
  2326	
  2327		return 0;
  2328	
  2329	phy_off:
  2330		phy_power_off(mhdp->phy);
  2331	phy_exit:
  2332		phy_exit(mhdp->phy);
  2333	disable_clk:
  2334		clk_disable_unprepare(mhdp->clk);
  2335	
  2336		return ret;
  2337	}
  2338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
