Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655797;
	b=4YsCxn7O0cKtBf161oUUP32sF3B24g+mnsHkt3ZOutC2eAcQz21OmeqNtjIUJYd9+CqF
	 LmahnSxE459uY0/+brTvC7ua7NutscUTMUbZLnD2NnGbknP/YouoWNXZy9iWOTMg3jRbo
	 EUQCwn+WYvgFuSMS/RWU0eZ/lZfI+UsMYDHMSzerYt+4qP5ruShwjjRLqPY1ZrVvbE35h
	 e8tBHini6X++UPodicKPdoLy/bjVjI/AAWvCwlYMSg3hx0cegPmjkNCZvInW0hmbe6/wK
	 Fqi9toBum6horH5aJIbQkqdkVFMv5GL18EcPaNTOagBnKkgM+1yWrVlTvjOgxt2BB6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655797;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kGkpHSPUPV5CUyV1od9kzaCcYXVPJFOcarbWhABwVRI=;
	b=a/aR3oPxTj/s8R/0Ynay2VpRXQ+oDoIouYxiycKInYal+WSZ+Z/pocB3ytUxqg33lVBA
	 A6ZvFzZRJy/pCNTaPGsK2cyqpDmU9OcdVoQ/HnhMq6SlpHe41HpJO0qIAsO7FbZinY8ni
	 bvYagTxBlg827nJzgge9Kz74iqah6dZKwUqAhswQ6tsugvGUfcMrR/nam6efCVZBIQRS+
	 BzTE1JqEaqyXUVw7iRBvemx3u4In11ObTqakCPFThRZoNVv4cVptLAV/K6mKn0gZjFJvH
	 +4YZT3S+gHUpW0xwzZ6ci4XLM20AefQPRkyGe4Um0gNJtAjMoQxQA8sx95hQnCod/8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FnsDG8pu;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E8606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E3E8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FnsDG8pu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795655796; x=1827191796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVFTqBo+CJwzxoZI7Biy1XZPco1nvpzQl5ITb3ynK6I=;
  b=FnsDG8pu20D0AimuDbb1qnB4Uxo5+5m2sbfaYiw9O0oZgBQMg0mj5s7Y
   zFoiNFN6wmJddOJtcbMPz6dcIOhqV0jRkLJgPXy0mrGWka3pZwli9GuRK
   g/nZ35kizVLgHwaDJEckbFF7z7D3x096Ps10cWS3fUMgs0FF06Kbfb5fo
   6pqtzabsz5WosPcA3NncfRFO5tU73RlqqsUZd9Z6cRKC5qKpYBOx+gGfs
   neP4j/nLzk1oWm1e7QU9JwRbZ9kb2+Fox6OTLsDHRAh9osHWef/wBUjFm
   l8X36rniRY1nNIfCtcepQJ3YWIf7n+2k1tMtsZviwBfoXQqOWU3wNIqwL
   w==;
X-CSE-ConnectionGUID: LKJe6BjTRASS3/PCnmHTDA==
X-CSE-MsgGUID: x4tPCb55SX6yFHjx+ntY1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4397878"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4397878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 17:16:35 -0800
X-CSE-ConnectionGUID: LqTCoUBlQUOS/SHgfyex9g==
X-CSE-MsgGUID: gZ8/MW6fTzuWPfQ5eMAQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12159304"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2026 17:16:27 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWO63-00000001T2U-3AGp;
	Thu, 26 Nov 2026 01:16:23 +0000
Date: Thu, 26 Nov 2026 09:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/32] drm/display: bridge-connector: use a dynamic
 connector
Message-ID: <20261126090631.mLSCvuCb-lkp@intel.com>
References: <20261125-drm-bridge-hotplug-v4-9-822722850492@bootlin.com>
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
In-Reply-To: <20261125-drm-bridge-hotplug-v4-9-822722850492@bootlin.com>

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 479e381e77dcde0dfcc9d51e89ff3273da199804]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-display-hdmi-cec-helper-use-drmm_-prefix-for-drmm-action/20261125-185014
base:   479e381e77dcde0dfcc9d51e89ff3273da199804
patch link:    https://lore.kernel.org/r/20261125-drm-bridge-hotplug-v4-9-822722850492%40bootlin.com
patch subject: [PATCH v4 09/32] drm/display: bridge-connector: use a dynamic connector
config: sh-randconfig-1001-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126090631.mLSCvuCb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126090631.mLSCvuCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126090631.mLSCvuCb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/display/drm_bridge_connector.c:138 struct member 'has_cec_notifier' not described in 'drm_bridge_connector'
>> Warning: drivers/gpu/drm/display/drm_bridge_connector.c:138 struct member 'has_cec_notifier' not described in 'drm_bridge_connector'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
