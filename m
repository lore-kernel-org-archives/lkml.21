Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196038;
	b=hnPnf/4oqHdSGnKSEiWEF+moTyALcsP/43SDh0eFg0Ea+GTsIM0B+bt9OrytBvO3uEXs
	 ycaOFAdq9yzOCPYAoMjirDAFzJPsoeKUXWpxE4L6YHRtbl2RcdmUn962f31PFSwDN2x6s
	 /yLVva70qUIBelLd1XNQjBO4KQzC2wqbpZ2DYYVXmws8kHE0y7lAnDdrI+IzwSrbIwx9R
	 pnhAFRcQcRerWANsSZCZ8FrYKFeV5vD3OaT+Cdyjf5PXUivLGS6OiebzB6jeQsCKmxz2q
	 H+T1M25IxNg3HGJ/09kenpturXj1eGNW/2DsK7MteJ+oBenJZ7dm5aFhIzM7cM4Ghvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=Wt0FQX8CyvaJk286LBNV7nM8M33Ltcj7IOP6u34RxkQ=;
	b=vEy8/ocyjiGZS+qn3QG6Y/OMxSeS2dMfsLRteOMTBxNT0GTclhyPOEn/g2YrpVHtpMqM
	 eUolQ0+4/cNHtfEy6xvWilleax7GcK4eNQkhKOFXWTQPUNfiWWEc/YdHsL7rou9SwTEWS
	 Yy3r1poh9G+ciPatSNrLgpXq1rj0fNJJCJrVpBl/pGZPWVYqFhrvHiVtEQkzc7S5AEmC8
	 KouqHBTgE2qfYqpiWZcWxNbm4rYY+YgbiPGXcMQ9Y/RokBtrTCvNa4uxbSxdSua689h3S
	 m0LMZFohjj/LeL2nhqwL+rxdh+MtgJQB3RP/ThzJy7pvWWZF7Mu8nlV9o+Uqdd6JoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="dMe4/1w2";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900C606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0900C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dMe4/1w2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795196037; x=1826732037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3kn/TBm5r13PjLLqNwH4i3zSxvyIJNF42nJx7obNvS0=;
  b=dMe4/1w2lMxe5mZoTwZg8pHnWhqAbBJr3Mclgk50M3Bup4tToFJWfSHi
   4KMdZLBND7dWx31epoTzpBmsnwGmQ77581lOea+phCr+h0Kw0Co6MZ3Lx
   Kp2KodTN1J+96yTL1y1eqo8T9Qi4Tndbhvn1Qtj2ildAxcJVQYo9fI0sX
   S2oIFmZxdP163qFzDOepfoeyXtQcaRzj75Jr9WlmpwtA+PrnAHWcHTInC
   GttkIQF4AEAdb14favDd5yAW+X23SEQSwP+2cKGq1eEzgWosJk9UyqRj6
   1hU8S57CtcvjQSJ5DECQ33W5Zm+rFGMzQeC52dkWkx8tm8rOMGukljzpf
   w==;
X-CSE-ConnectionGUID: V1lSm1DZRI+Tns1QPbVKpQ==
X-CSE-MsgGUID: lMBsyyyNS0aIMaVW0/deCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4069126"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4069126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 09:33:56 -0800
X-CSE-ConnectionGUID: 2mQqS+gHRRmMQS3jSM0Fcg==
X-CSE-MsgGUID: 1NhEmZkFTP+jZH6n2s9c9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10655250"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 09:33:50 -0800
Date: Fri, 20 Nov 2026 19:33:47 +0200
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
Message-ID: <awCEezzEIrhWv5sk@intel.com>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com>
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
In-Reply-To: <8713bae1-9782-41d4-b09c-f14031203e88@amd.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
> 
> 
> On 11/20/26 10:41, Ville Syrjälä wrote:
> > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:
> >> Panel brightness is a property of a display, and thus of a DRM
> >> connector. Add an atomic per-connector LUMINANCE range property so
> >> compositors can manage relative panel luminance together with the rest
> >> of the display state.
> >>
> >> Keep the core backend-agnostic. Drivers create the property with their
> >> hardware range and implement connector helper callbacks to set luminance
> >> or disable panel emission. The atomic helpers sequence those callbacks
> >> around pipeline enable and disable, including luminance-only commits.
> >> The panel is left lit when the pipeline enters self refresh, and the
> >> luminance is only reprogrammed when it changes or a modeset enables the
> >> pipeline.
> >>
> >> The stored property value is independent of display power. A commit made
> >> while the connector is inactive is retained and applied on the next
> >> enable; disabling the pipeline does not overwrite it.
> >>
> >> LUMINANCE values are relative, driver-defined levels rather than
> >> absolute luminance in cd/m^2. The interface supports emissive panels as
> >> well as panels with a separate backlight.
> >>
> >> Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> >> drivers retain their legacy backlight class ABI unless the new interface
> >> is explicitly selected, allowing the DRM UAPI and legacy compatibility
> >> policy to remain separate.
> >>
> >> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> ---
> >> v11:
> >>   * Don't call .disable_luminance when the CRTC enters self refresh (Sashiko)
> >>   * Only call .set_luminance when the luminance changes or on a modeset
> >>     that isn't a self refresh exit (Leo Li, Sashiko)
> >>   * Fix the .set_luminance self refresh documentation
> >> v10:
> >>   * Add tag
> >> ---
> >>   drivers/gpu/drm/Kconfig                    | 14 +++++
> >>   drivers/gpu/drm/drm_atomic_helper.c        | 98 +++++++++++++++++++++++++++++-
> >>   drivers/gpu/drm/drm_atomic_state_helper.c  |  7 +++
> >>   drivers/gpu/drm/drm_atomic_uapi.c          |  5 ++
> >>   drivers/gpu/drm/drm_connector.c            | 57 +++++++++++++++++
> >>   drivers/gpu/drm/tests/drm_connector_test.c | 28 +++++++++
> >>   include/drm/drm_atomic_helper.h            |  3 +
> >>   include/drm/drm_connector.h                | 16 +++++
> >>   include/drm/drm_modeset_helper_vtables.h   | 28 +++++++++
> >>   9 files changed, 255 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> >> index 61111d50b1c65..1bbe2c2d7c76f 100644
> >> --- a/drivers/gpu/drm/Kconfig
> >> +++ b/drivers/gpu/drm/Kconfig
> >> @@ -33,6 +33,20 @@ endmenu
> >>   
> >>   if DRM
> >>   
> >> +config DRM_LUMINANCE
> >> +	bool "DRM connector luminance support"
> >> +	help
> >> +	  Expose relative luminance as an atomic DRM connector property. Values
> >> +	  are driver-defined levels rather than absolute luminance in cd/m^2.
> >> +	  Drivers provide connector helper callbacks to program their hardware;
> >> +	  the DRM core does not depend on a particular backend.
> >> +
> >> +	  Drivers migrated to this interface will use it instead of registering
> >> +	  a legacy backlight class device. Leave this disabled to preserve the
> >> +	  de-facto userspace ABI in /sys/class/backlight.
> > 
> > I don't think this will fly if it breaks the backlight class interface.
> > No one can actually enable this outside of some niche embedded use
> > cases where backwards compatibility is not an issue. I think what
> > you need is a generic backlight class implementation on top of this.
> > 
> 
> The idea with this was:
> 1) to get the series landed
> 2) let compositors merge solutions around it.
> 3) Then add backwards compatibility to kernel so we can flip the Kconfig 
> default.

With that plan, I think you need to mark it BROKEN if it will 
actually break current setups when some unsuspecting user flips
it on.

-- 
Ville Syrjälä
Intel
