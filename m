Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421118;
	b=X4yVmNP3S1o5jyX2joKCaV2ql6a6TuPZMMQkZ3xGhb3lFdxngVf/hQT88AyWeE/Saa8v
	 F7vXS0tunqZkDnhVYYkGsZ080OtCCVeUE1RbBazswHOcfRDCpuMd4tIAx1q8BbA/Xg3Pa
	 7wZUo2h3qjy3XWUVtR/Lt4/kISgK9SrZRLQSLJmH7ElJMN0st6tReeYP7brGqOAvSERTV
	 z4gaWitzmUL+N+yL9kIqT5lmfouljXMysqIJnnbLDcOqD2PCO6OJw6uz29awGEFD9DZ1w
	 +7GV1073XepzktMUSzsvHOCA11q4PMroMtoBgXNq79uc6O7mBebJfva6jkqK3ARNJMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421118;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=MTO1onBKZJSzMlhNLtOC/hOwvdajGf6CYqsXB1dFCtE=;
	b=4AYf+RbQ1Rp2ZVZ28Ul+IC1lsjbtp9JnjmracILjAfHAqlcwcMyVeYigtMLWp1/37pv7
	 9hL5oyQxrrcjletyjYJyrVDqs1RIDbSG/I3upUUoIPDsx1bgtikjj1Co/Kna2LaCOhekn
	 hZ8+UKuDXHrBhvopSNPBCJbMb9oNvlbNBAx42yLSEnPxYnqBIaOzPGeh/O3yhQQN1cWHu
	 KuuNNWK5xCUt9xz5GxBVD7Fs+P3a5+9F8ws0Lfpx2IMOfpxKRUM6+Bb0/XvR+94PuUBXQ
	 PIpaEUKOBmtT8AOJsRG0dt/q1JA5jGIvUwpDHUrc7ujgF1ozG/M/jZWTI0gINrpBP+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LCof6Lue;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532A606F60F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A532A606F60F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LCof6Lue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795421118; x=1826957118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=urMfx8Tg1Mo2IdrR6dTT35HCyK8ZaZyaJndlD7atYzs=;
  b=LCof6LueD3xSVbC6MdJu6RMGip33+kzukWIU2FjlunCtvhAQHJ+w68tt
   ZjZgvIO96g800o4tTtwEcNPkYrJMP5QhkdFLJWO/M0ijAG63umuY9Zs/y
   4jhJGl770Sx283ih94l5fWQ2A1bYSCQnpj+3OLq1RrV2AJrnCv0+phgch
   Q1qsuhvIIKynDkAumoUgP9ocbPk5EnoZk4aFSZM3OdfJBriuliPrc2VDH
   SWgm2GUqhdNI9WPNLUcL5cJuBFPH99h6TRUaWu5zqNzCbl68/QJtJOmQh
   swu9qpNYLg0uaLNiwhss495unHK5zTvt6bYYhJsaHr+iB/pChjYv4RVhJ
   g==;
X-CSE-ConnectionGUID: 47lXdxSEQTicLyYChntSwA==
X-CSE-MsgGUID: JhJAXWQeSBqM1okhnPiCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4254367"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4254367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:05:16 -0800
X-CSE-ConnectionGUID: AmTzmnSjSmmElgfOYxCyZQ==
X-CSE-MsgGUID: u2HtPnzaR+KAmRySPzE27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11797381"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:05:08 -0800
Date: Mon, 23 Nov 2026 10:05:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
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
Message-ID: <awPzsMWZ7e0i6i54@intel.com>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com>
 <awPvoLCDeq1YFLE_@houat>
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
In-Reply-To: <awPvoLCDeq1YFLE_@houat>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 23, 2026 at 08:50:29AM +0100, Maxime Ripard wrote:
> On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
> > 
> > 
> > On 11/20/26 10:41, Ville Syrjälä wrote:
> > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:
> > > > Panel brightness is a property of a display, and thus of a DRM
> > > > connector. Add an atomic per-connector LUMINANCE range property so
> > > > compositors can manage relative panel luminance together with the rest
> > > > of the display state.
> > > > 
> > > > Keep the core backend-agnostic. Drivers create the property with their
> > > > hardware range and implement connector helper callbacks to set luminance
> > > > or disable panel emission. The atomic helpers sequence those callbacks
> > > > around pipeline enable and disable, including luminance-only commits.
> > > > The panel is left lit when the pipeline enters self refresh, and the
> > > > luminance is only reprogrammed when it changes or a modeset enables the
> > > > pipeline.
> > > > 
> > > > The stored property value is independent of display power. A commit made
> > > > while the connector is inactive is retained and applied on the next
> > > > enable; disabling the pipeline does not overwrite it.
> > > > 
> > > > LUMINANCE values are relative, driver-defined levels rather than
> > > > absolute luminance in cd/m^2. The interface supports emissive panels as
> > > > well as panels with a separate backlight.
> > > > 
> > > > Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> > > > drivers retain their legacy backlight class ABI unless the new interface
> > > > is explicitly selected, allowing the DRM UAPI and legacy compatibility
> > > > policy to remain separate.
> > > > 
> > > > Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > ---
> > > > v11:
> > > >   * Don't call .disable_luminance when the CRTC enters self refresh (Sashiko)
> > > >   * Only call .set_luminance when the luminance changes or on a modeset
> > > >     that isn't a self refresh exit (Leo Li, Sashiko)
> > > >   * Fix the .set_luminance self refresh documentation
> > > > v10:
> > > >   * Add tag
> > > > ---
> > > >   drivers/gpu/drm/Kconfig                    | 14 +++++
> > > >   drivers/gpu/drm/drm_atomic_helper.c        | 98 +++++++++++++++++++++++++++++-
> > > >   drivers/gpu/drm/drm_atomic_state_helper.c  |  7 +++
> > > >   drivers/gpu/drm/drm_atomic_uapi.c          |  5 ++
> > > >   drivers/gpu/drm/drm_connector.c            | 57 +++++++++++++++++
> > > >   drivers/gpu/drm/tests/drm_connector_test.c | 28 +++++++++
> > > >   include/drm/drm_atomic_helper.h            |  3 +
> > > >   include/drm/drm_connector.h                | 16 +++++
> > > >   include/drm/drm_modeset_helper_vtables.h   | 28 +++++++++
> > > >   9 files changed, 255 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > index 61111d50b1c65..1bbe2c2d7c76f 100644
> > > > --- a/drivers/gpu/drm/Kconfig
> > > > +++ b/drivers/gpu/drm/Kconfig
> > > > @@ -33,6 +33,20 @@ endmenu
> > > >   if DRM
> > > > +config DRM_LUMINANCE
> > > > +	bool "DRM connector luminance support"
> > > > +	help
> > > > +	  Expose relative luminance as an atomic DRM connector property. Values
> > > > +	  are driver-defined levels rather than absolute luminance in cd/m^2.
> > > > +	  Drivers provide connector helper callbacks to program their hardware;
> > > > +	  the DRM core does not depend on a particular backend.
> > > > +
> > > > +	  Drivers migrated to this interface will use it instead of registering
> > > > +	  a legacy backlight class device. Leave this disabled to preserve the
> > > > +	  de-facto userspace ABI in /sys/class/backlight.
> > > 
> > > I don't think this will fly if it breaks the backlight class interface.
> > > No one can actually enable this outside of some niche embedded use
> > > cases where backwards compatibility is not an issue. I think what
> > > you need is a generic backlight class implementation on top of this.
> > > 
> > 
> > The idea with this was:
> > 1) to get the series landed
> > 2) let compositors merge solutions around it.
> > 3) Then add backwards compatibility to kernel so we can flip the Kconfig
> > default.
> 
> I said this a few times already, but we keep having those discussions
> while the backlight sysfs handling is far from being the main point. You
> should *really* consider adding support for the luminance property for
> something that isn't tied to that interface (like DDC/CI for HDMI), and
> treat the sysfs API as a sysfs series.
> 
> It looks like people just have conflicting opinions on this particular
> part that isn't going to solve itself easily. You should not treat this
> sysfs discussion as a blocker for the infrastructure work.

You want to be sure backwards compatibility with the backlight
class is a solvable problem before you land *anything*. Otherwise
you might just paint yourself into a corner with no way out.

-- 
Ville Syrjälä
Intel
