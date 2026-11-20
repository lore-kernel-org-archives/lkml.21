Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192909;
	b=mOKzXxao57sWctK+A9ao7nebPwIFTUyzZPzCYX+vD26NNoW3mMWKmE+0TD9FIQ6bsncC
	 LBsdQ9fF2Dm/jVG7kKGzk/qL/44YSI1OKl3fuVTFajhMMqxdqnkFBxmbZf82zCpJQokGp
	 8vQbxvYJEv5YE98/19vkcI76flwHugmOwRM54oMalWD3EIlIxlAITUhas8sxJLrXWk+Kv
	 m7UDIsydjNXQnIsG0RGTDQ7ad4wtZVgQy55SFGn6EfQB0cioss9YaoJwnCm9OraH/60Jh
	 PyiNLTTYA7W4Tn0VuhfJOo3mw8QR7HExbLS22lIqfp7kA0gdxNy0lutgfIHUUA7s8ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192909;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=6wlmw4As4I8rmN0wK02hXCau5KdxeTaHKwKPRf8LsWg=;
	b=CJcLcENQf0ajF5weH94v5WyKn/YcXSjqa4dvS+ldzfy3VPHg+PUfcIQ2VQfgyECnDCak
	 MSZwJ+G/ktPX+hEnUfctQEi7Uw+GTo8xHArRUXB0rAAAZy0dh5HD5yFm7PD/8qsy8aVa+
	 5K9kCl0fQd3jVC8AigZBOyt3hCExbX7C+agniUi6OL3T9HhN6vi7Wg+TcQciX3aju2DhG
	 wZDGMCaBsQHeCXqtxtpMFlnhn6aBbGu3O0JudyzT+UjUufVR6tHCH8dMpFixSSXZQpK53
	 i2fMliRkaegZCq+X754Dx5LouWDa7SBhLdw5fjUT9/NQTwRy6oGE1DxbkI4B5l8dCeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7If8nFR;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6E606A608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA6E606A608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7If8nFR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795192907; x=1826728907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mt37fmIUELj0xI9G800lQNgzenR8tQzCZwNS3sQls6s=;
  b=a7If8nFRSVt90Mg95CZR+MDVYgGKSOCDTEto/LvGWF2jJITtwHSnhN2u
   2YHGkPk32uB3aZUkuErODjtwRmrduNXf+l+7K8OIZa34LDi10OkMle859
   syIqJb5BuReBi7jxbDXE2r/M8uLcFVUIO6h9HqRsexSweliddvU6MA2Jt
   qheU9eJv9v6pPJ9yyOVlHStZFgn+Bkz6SE+A/OgMLKejRWFbPS9zQV91J
   MKR4Du0Tex26JHYz0Dvdf4WXtz0m43niI/HLqe7nGyRkCO4om7P7+5ghy
   QsoTfAVljKWCLO20rtikk2bzkP8o9FXOeFy2XscoO45Dl4iYcnoknc/Go
   w==;
X-CSE-ConnectionGUID: 6cFO+1YHSWWMca7utkCgMg==
X-CSE-MsgGUID: KDW2ifP2QJWDtCZFZzdm2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3957328"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3957328"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:41:46 -0800
X-CSE-ConnectionGUID: eqDDr+zvTM+bRtypcysw+w==
X-CSE-MsgGUID: 01oe9egoQMy1BFDCeS6wYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11087115"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:41:41 -0800
Date: Fri, 20 Nov 2026 18:41:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Mario Limonciello <superm1@kernel.org>,
	Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 01/12] drm: add connector LUMINANCE property
Message-ID: <awB4Qe83u0l0XPKA@intel.com>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
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
In-Reply-To: <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:
> Panel brightness is a property of a display, and thus of a DRM
> connector. Add an atomic per-connector LUMINANCE range property so
> compositors can manage relative panel luminance together with the rest
> of the display state.
> 
> Keep the core backend-agnostic. Drivers create the property with their
> hardware range and implement connector helper callbacks to set luminance
> or disable panel emission. The atomic helpers sequence those callbacks
> around pipeline enable and disable, including luminance-only commits.
> The panel is left lit when the pipeline enters self refresh, and the
> luminance is only reprogrammed when it changes or a modeset enables the
> pipeline.
> 
> The stored property value is independent of display power. A commit made
> while the connector is inactive is retained and applied on the next
> enable; disabling the pipeline does not overwrite it.
> 
> LUMINANCE values are relative, driver-defined levels rather than
> absolute luminance in cd/m^2. The interface supports emissive panels as
> well as panels with a separate backlight.
> 
> Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> drivers retain their legacy backlight class ABI unless the new interface
> is explicitly selected, allowing the DRM UAPI and legacy compatibility
> policy to remain separate.
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v11:
>  * Don't call .disable_luminance when the CRTC enters self refresh (Sashiko)
>  * Only call .set_luminance when the luminance changes or on a modeset
>    that isn't a self refresh exit (Leo Li, Sashiko)
>  * Fix the .set_luminance self refresh documentation
> v10:
>  * Add tag
> ---
>  drivers/gpu/drm/Kconfig                    | 14 +++++
>  drivers/gpu/drm/drm_atomic_helper.c        | 98 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_atomic_state_helper.c  |  7 +++
>  drivers/gpu/drm/drm_atomic_uapi.c          |  5 ++
>  drivers/gpu/drm/drm_connector.c            | 57 +++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c | 28 +++++++++
>  include/drm/drm_atomic_helper.h            |  3 +
>  include/drm/drm_connector.h                | 16 +++++
>  include/drm/drm_modeset_helper_vtables.h   | 28 +++++++++
>  9 files changed, 255 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 61111d50b1c65..1bbe2c2d7c76f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -33,6 +33,20 @@ endmenu
>  
>  if DRM
>  
> +config DRM_LUMINANCE
> +	bool "DRM connector luminance support"
> +	help
> +	  Expose relative luminance as an atomic DRM connector property. Values
> +	  are driver-defined levels rather than absolute luminance in cd/m^2.
> +	  Drivers provide connector helper callbacks to program their hardware;
> +	  the DRM core does not depend on a particular backend.
> +
> +	  Drivers migrated to this interface will use it instead of registering
> +	  a legacy backlight class device. Leave this disabled to preserve the
> +	  de-facto userspace ABI in /sys/class/backlight.

I don't think this will fly if it breaks the backlight class interface.
No one can actually enable this outside of some niche embedded use
cases where backwards compatibility is not an issue. I think what
you need is a generic backlight class implementation on top of this.

-- 
Ville Syrjälä
Intel
