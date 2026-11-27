Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800733;
	b=a0wKoadDUbZELvnRxV28IxDvCNW21D1ao9kdQeH2zM3c0B1piBbT2DFQNKcZyndHtr9E
	 Dzr7SoCntYGlZ850O73A/0XFY9Zu5E7W5P2QtKHTLujGV3LiFw2Dvp3rYb7V2AwPK8Mnb
	 6hGImlQgf1aGFRz483sLmpPtTajQVpCzaofeatWFeoZB4OY6VExxc0eIULWmJgtqOh1Mb
	 5tHIhFsd7OWqYJqyaXCrpzZ47TYGVUth8VNht1HYVymO73qp8ghvYQun3bu8x3huDf5Js
	 D9Tuqitmp5zA2lpx7Fi5Gm32E7+CONWRaoyHg1XMg7+UbieHAycdrZHHWgRks6SJF+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800733;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=DE8qELAPDwsQP1/9PzpxtV2e/sU/ChZO2wu9dZLOywo=;
	b=m3DnFE5tspZh5fLOAKAFZNy3+Uo45B5UQYYiv9WObnEQNXpbFP3+hvER9y7+Rb6M3nrs
	 8Rv1cpxkWLCUbgv1gapqqoA6yPG3wa7RDl7ZhmN/1lmNVEVnx5T4Rb2DaKqnbDKarspyn
	 j1TMub4Y3ZLpjL8CURNbplvpNmRxU8IRHKn9rMwpCFvgEUay7vJuy+G4Une6WbSZfMlAQ
	 qSnx95v93EMaVB9S3RW8DHx02cfFmjVLjLrm7mZBqgYyJoH/wvQYEuXcXYd7V4x4WYbrE
	 NtxZA+AK9VQyHzBApt0m1qeALscZXosPKQvkd4+nVyRncH4H0pqllZmXpvN0ikTvbQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsuxdS3n;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB799606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB799606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsuxdS3n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795800733; x=1827336733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=403v+N9r70LKGzybZ6rNfYzloBRGpblAUy5gn8FRqnU=;
  b=nsuxdS3nqaHofg1V4+w9Fk3Z9TNIfuEz3kQmbcWTk8QTTGIOFO/c820p
   0uKI3ter1y4FcAtS20VkjQi7gnXwXc0NcBlACDuxzwlvV8r0SXIFeWzkc
   6BuCT2/NEJpZyqu9Vyv5Ul1/AaP9FRZTm1/xUPQOSo20TtEwWLVlhmtQO
   CB/tDfDOsn2J0Npn6DpPnslotXIqejfFBnEZUFgEhoScCyeklP/EoNotf
   zGOfAjAMcldLAb0E2BznNybAaFAEZ2CRPbIikho/BjSyb5fJsaVd/PaxS
   aWkVNFzlSJBqQzQ3dDRxrEluGrNQ2VaP5loOnNNUm+cAdGcmn+Wm71yt8
   w==;
X-CSE-ConnectionGUID: ykuhnPdYRiOvSu56+F6VIg==
X-CSE-MsgGUID: 0GTEx7VCQ5KHZuYQbEDUhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4682467"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4682467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:32:12 -0800
X-CSE-ConnectionGUID: Qbbi1VmfRVuDKSfk2SwWsQ==
X-CSE-MsgGUID: yccA24n1QYuShnu9zTDLqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12353049"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.172])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:32:07 -0800
Date: Fri, 27 Nov 2026 19:32:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm: panel-backlight-quirks: Add Dell XPS 9315 FHD+
 panel
Message-ID: <awm-k5fend6t5rQw@intel.com>
References: <20261127164332.55148-1-pmenzel@molgen.mpg.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261127164332.55148-1-pmenzel@molgen.mpg.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, Nov 27, 2026 at 05:43:29PM +0100, Paul Menzel wrote:
> The Dell XPS 9315 (BIOS 1.26.0, VBT BDB 253, panel_type 14) has the
> same problem as the XPS 13 9310: the VBT sets the backlight minimum
> level to 15/255, while the other 15 panel entries say 6/255.

I have no idea from that description to see what age machine 
that is so hard to say what applies here, but please try
https://lore.kernel.org/intel-gfx/20261124224621.6506-1-ville.syrjala@linux.intel.com/

The other potentially relevant thing I have is
https://github.com/vsyrjala/linux/tree/bclm_bcm_backlight_remap_2
though I haven't checked to see how the minimum level thing
in the VBT is supposed to be used with that, or in general
these days. As in "what does Windows do with it?"

Please file a bug for this, and attach the boot dmesg with 
drm.debug=0xep passed to the kernel cmdline, and also attach
copies of /sys/kernel/debug/dri/0/i915_vbt and
/sys/class/drm/card0-eDP-1/edid

> With GNOME
> at its lowest slider position (1 % of max_brightness) the PWM duty
> cycle is 6.8 %:
> 
>     $ cat /sys/class/backlight/intel_backlight/{max_brightness,brightness}
>     96000
>     960
>     $ sudo intel_reg read 0xC8254 0xC8258    # BXT_BLC_PWM_FREQ/DUTY(0)
>                                         (0x000c8254): 0x00017700
>                                         (0x000c8258): 0x00001997
> 
> The panel is a Sharp LQ134N1 with a different product code
> (EDID SHP 0x1548) than the one in the XPS 13 9310. Writing the duty
> cycle register directly, 6.8 % is still well readable at the lowest position,
> and even 1 % is a little brighter than wanted; the panel is usable
> down to 0.25 %.
> 
> Add a quirk setting the minimum to 0/255 for this system and panel,
> so that GNOME’s lowest position becomes 1 %. Note that the DMI product
> name is "XPS 9315", without "13".
> 
> Tested on the Dell XPS 9315 (BIOS 1.26.0) with v7.4-rc4 + this series:
> "[CONNECTOR:676:eDP-1] Applying panel backlight quirk, min brightness 0/255
> (VBT 15/255)", GNOME lowest position gives PWM duty 960/96000 (1 %), was
> 6551 (6.8 %). The eye test values (0.25 % wanted) were set with intel_reg.
> 
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> 
> Notes:
>     
>     Prepared with Claude Code (claude-opus-5-5).
> 
>  drivers/gpu/drm/drm_panel_backlight_quirks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> index 85c2ef791d116..1d959a31562e6 100644
> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -62,6 +62,15 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
>  		.ident.panel_id = drm_edid_encode_panel_id('S', 'H', 'P', 0x14f9),
>  		.quirk = { .min_brightness = 1, },
>  	},
> +	/* Dell XPS 9315 FHD+ panel, VBT minimum 15/255 is too bright */
> +	{
> +		.dmi_match.field = DMI_SYS_VENDOR,
> +		.dmi_match.value = "Dell Inc.",
> +		.dmi_match_other.field = DMI_PRODUCT_NAME,
> +		.dmi_match_other.value = "XPS 9315",
> +		.ident.panel_id = drm_edid_encode_panel_id('S', 'H', 'P', 0x1548),
> +		.quirk = { .min_brightness = 1, },
> +	},
>  	/* Steam Deck models */
>  	{
>  		.dmi_match.field = DMI_SYS_VENDOR,
> -- 
> 2.54.0

-- 
Ville Syrjälä
Intel
