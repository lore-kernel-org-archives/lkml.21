Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430538;
	b=PtUzjkP3t08Qn62EkgfMyjLaE5ZeaIZXiub6u6dXErD38zEY51W8QVE9UCeEUgVn7Lfn
	 SZwQ+RrDCfn0pQkND3c1Dp84qon3zpR6KpJHUUZCEjNggJemHFza7IiW/5bl6H+hL55j6
	 tE8HDBqIBx5nPV3crcpSOxI6o7Khk4x9LHZsUvWR/jzy6XeC8zs73zFa8UlY3CMMud5gP
	 ux9qswbDhDbtivsL/xTfPS4zapRl24ZFtdEpE/1Jxey25+3BHIpuuleqFGcOyVMHg1D7l
	 CwBqoO+0afA2zSIi4T6zTG+M+aKZraZR0ZphfalwR693c6DeEe5b8SP6jnM+R+Owswg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=N+nCfVUtrVjunKdjrRoAbdycizCCNxwXyMjD41LbAvc=;
	b=S2R4y1aBfFxsDVSBEEeWOA5Ckk+5Qrw7c89M8iAs2v9BTquQ8Ie5Pq6shDaqmY8dp23h
	 ImSJtAPAZ0wtmUzOU7AJSYYyGi7tbp6LKI2qojKow8xbfE+gDM5qMcpJXFVfompDrWxUC
	 9H/ILPQ0KggjiJCbOwa+nzcHGmkVjZfRDXFWTTpC8WgK+EqZdidbjxmelO5/pnsYq5VgV
	 IIz92/EnpWddPzIuLGbaUnzk30u38H0B3Qn3b7ojHuBtM+vQC39uNoxUCOtjNdPfsdFxb
	 HNgqvktRILF5q+6/HjaH3tZCnx9NiOpSIQQ5OXOpdiDP0arqzkOywC7sCC/Q8WOuEgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtZqZ3u3;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F5606A698
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491F5606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtZqZ3u3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795430538; x=1826966538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gApZ5DZSU116umgI7/UqdlLpi26Oe/ElEASRU8KMngs=;
  b=mtZqZ3u3yJTHPsBEux8WHHJqtIgQYN3p+7mP8LPddIZJl2oect2v4/dG
   plcbgf2ldICJWs75TgEpbH7lyEXuJYSiIg9BT4HNmaIa0c3U+QfSx2caa
   MsZ6fyHuP8G2Uz6W3k5YXbFqqtb0MgCNjrHO7IUUehZasrc8FMIJRRV2U
   HXtXNhmk4XH6cBAq56EqSrBFcP2296liWCpgq6vDORDQkN6XOfEodyz3/
   EgoMd38WBfAd3CuPJfQjZYUW3oBn/p1gx9u5E/qPd172UFDC6aMHw6q59
   GT/GJd1133rbUeJ1GJH0iDCeIoFyzJfCzLF0nPcHqHfka40WbB16i/26i
   Q==;
X-CSE-ConnectionGUID: efZJLUjyQ2+rHyAJXmIdmA==
X-CSE-MsgGUID: WY6OCKuZS4Gr+FTrQ6oL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4080656"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4080656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:42:17 -0800
X-CSE-ConnectionGUID: 57RXYtU6TtaTrmuR1q7InA==
X-CSE-MsgGUID: XgJn0jIOT4aBigTgKpItoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11586140"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:42:13 -0800
Date: Mon, 23 Nov 2026 12:42:09 +0200
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
Message-ID: <awQYgTQWOiK66m99@intel.com>
References: <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com>
 <awPvoLCDeq1YFLE_@houat>
 <awPzsMWZ7e0i6i54@intel.com>
 <awP0nasqAc4pAeMR@houat>
 <awP8hAy3Gim4eNxz@intel.com>
 <awQAlSSks2We5h2z@houat>
 <awQENQN5SswJRtWw@intel.com>
 <awQGSuf2UJjItcO0@houat>
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
In-Reply-To: <awQGSuf2UJjItcO0@houat>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 23, 2026 at 10:30:05AM +0100, Maxime Ripard wrote:
> On Mon, Nov 23, 2026 at 11:15:33AM +0200, Ville Syrjälä wrote:
> > On Mon, Nov 23, 2026 at 10:03:50AM +0100, Maxime Ripard wrote:
> > > On Mon, Nov 23, 2026 at 10:42:44AM +0200, Ville Syrjälä wrote:
> > > > On Mon, Nov 23, 2026 at 09:10:17AM +0100, Maxime Ripard wrote:
> > > > > On Mon, Nov 23, 2026 at 10:05:04AM +0200, Ville Syrjälä wrote:
> > > > > > On Mon, Nov 23, 2026 at 08:50:29AM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 11/20/26 10:41, Ville Syrjälä wrote:
> > > > > > > > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:
> > > > > > > > > > Panel brightness is a property of a display, and thus of a DRM
> > > > > > > > > > connector. Add an atomic per-connector LUMINANCE range property so
> > > > > > > > > > compositors can manage relative panel luminance together with the rest
> > > > > > > > > > of the display state.
> > > > > > > > > > 
> > > > > > > > > > Keep the core backend-agnostic. Drivers create the property with their
> > > > > > > > > > hardware range and implement connector helper callbacks to set luminance
> > > > > > > > > > or disable panel emission. The atomic helpers sequence those callbacks
> > > > > > > > > > around pipeline enable and disable, including luminance-only commits.
> > > > > > > > > > The panel is left lit when the pipeline enters self refresh, and the
> > > > > > > > > > luminance is only reprogrammed when it changes or a modeset enables the
> > > > > > > > > > pipeline.
> > > > > > > > > > 
> > > > > > > > > > The stored property value is independent of display power. A commit made
> > > > > > > > > > while the connector is inactive is retained and applied on the next
> > > > > > > > > > enable; disabling the pipeline does not overwrite it.
> > > > > > > > > > 
> > > > > > > > > > LUMINANCE values are relative, driver-defined levels rather than
> > > > > > > > > > absolute luminance in cd/m^2. The interface supports emissive panels as
> > > > > > > > > > well as panels with a separate backlight.
> > > > > > > > > > 
> > > > > > > > > > Keep the interface behind a default-off DRM_LUMINANCE option. Migrated
> > > > > > > > > > drivers retain their legacy backlight class ABI unless the new interface
> > > > > > > > > > is explicitly selected, allowing the DRM UAPI and legacy compatibility
> > > > > > > > > > policy to remain separate.
> > > > > > > > > > 
> > > > > > > > > > Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> > > > > > > > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > > > > > ---
> > > > > > > > > > v11:
> > > > > > > > > >   * Don't call .disable_luminance when the CRTC enters self refresh (Sashiko)
> > > > > > > > > >   * Only call .set_luminance when the luminance changes or on a modeset
> > > > > > > > > >     that isn't a self refresh exit (Leo Li, Sashiko)
> > > > > > > > > >   * Fix the .set_luminance self refresh documentation
> > > > > > > > > > v10:
> > > > > > > > > >   * Add tag
> > > > > > > > > > ---
> > > > > > > > > >   drivers/gpu/drm/Kconfig                    | 14 +++++
> > > > > > > > > >   drivers/gpu/drm/drm_atomic_helper.c        | 98 +++++++++++++++++++++++++++++-
> > > > > > > > > >   drivers/gpu/drm/drm_atomic_state_helper.c  |  7 +++
> > > > > > > > > >   drivers/gpu/drm/drm_atomic_uapi.c          |  5 ++
> > > > > > > > > >   drivers/gpu/drm/drm_connector.c            | 57 +++++++++++++++++
> > > > > > > > > >   drivers/gpu/drm/tests/drm_connector_test.c | 28 +++++++++
> > > > > > > > > >   include/drm/drm_atomic_helper.h            |  3 +
> > > > > > > > > >   include/drm/drm_connector.h                | 16 +++++
> > > > > > > > > >   include/drm/drm_modeset_helper_vtables.h   | 28 +++++++++
> > > > > > > > > >   9 files changed, 255 insertions(+), 1 deletion(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > > > > > > > > index 61111d50b1c65..1bbe2c2d7c76f 100644
> > > > > > > > > > --- a/drivers/gpu/drm/Kconfig
> > > > > > > > > > +++ b/drivers/gpu/drm/Kconfig
> > > > > > > > > > @@ -33,6 +33,20 @@ endmenu
> > > > > > > > > >   if DRM
> > > > > > > > > > +config DRM_LUMINANCE
> > > > > > > > > > +	bool "DRM connector luminance support"
> > > > > > > > > > +	help
> > > > > > > > > > +	  Expose relative luminance as an atomic DRM connector property. Values
> > > > > > > > > > +	  are driver-defined levels rather than absolute luminance in cd/m^2.
> > > > > > > > > > +	  Drivers provide connector helper callbacks to program their hardware;
> > > > > > > > > > +	  the DRM core does not depend on a particular backend.
> > > > > > > > > > +
> > > > > > > > > > +	  Drivers migrated to this interface will use it instead of registering
> > > > > > > > > > +	  a legacy backlight class device. Leave this disabled to preserve the
> > > > > > > > > > +	  de-facto userspace ABI in /sys/class/backlight.
> > > > > > > > > 
> > > > > > > > > I don't think this will fly if it breaks the backlight class interface.
> > > > > > > > > No one can actually enable this outside of some niche embedded use
> > > > > > > > > cases where backwards compatibility is not an issue. I think what
> > > > > > > > > you need is a generic backlight class implementation on top of this.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > The idea with this was:
> > > > > > > > 1) to get the series landed
> > > > > > > > 2) let compositors merge solutions around it.
> > > > > > > > 3) Then add backwards compatibility to kernel so we can flip the Kconfig
> > > > > > > > default.
> > > > > > > 
> > > > > > > I said this a few times already, but we keep having those discussions
> > > > > > > while the backlight sysfs handling is far from being the main point. You
> > > > > > > should *really* consider adding support for the luminance property for
> > > > > > > something that isn't tied to that interface (like DDC/CI for HDMI), and
> > > > > > > treat the sysfs API as a sysfs series.
> > > > > > > 
> > > > > > > It looks like people just have conflicting opinions on this particular
> > > > > > > part that isn't going to solve itself easily. You should not treat this
> > > > > > > sysfs discussion as a blocker for the infrastructure work.
> > > > > > 
> > > > > > You want to be sure backwards compatibility with the backlight
> > > > > > class is a solvable problem before you land *anything*. Otherwise
> > > > > > you might just paint yourself into a corner with no way out.
> > > > > 
> > > > > I disagree. The luminance property is more useful than *just* for
> > > > > backlights but is also useful for HDMI, DP, and MIPI-DSI that would all
> > > > > use it.
> > > > 
> > > > DSI and eDP are all over the place when it comes how backlight
> > > > is implemented, so very much would not all use it. Some HDMI and
> > > > external DP displays might have DDC/CI support, so I'll give you
> > > > those.
> > > >  
> > > > > If that's the corner we paint ourselves into, it's still a pretty nice
> > > > > corner.
> > > > 
> > > > Separate APIs for different outputs on different drivers is just
> > > > a bad idea. Every userspace implementation will have to support
> > > > all of them until the end of the world.
> > > 
> > > I agree, but then there's an easy answer: don't enable it on drivers
> > > that would expose it on both APIs. We do have a lot of drivers where
> > > there's just no backlight involved and would greatly benefit from these,
> > > and without the history of i915 or amdgpu to deal with.
> > 
> > It's not the history of the drivers you need to worry about. It's
> > the history of userspace that actually matters. All existing
> > userspace expects a working backlight class interface. And if you
> > don't care about userspace compatibility then we're very much
> > back in the "only usable in niche embedded use cases" or "only
> > usable on external displays" territories.
> 
> Depending on what your perspective is, fastboot was "only usable in
> niche i915 use cases" just like color management for amdgpu or leases
> were. Let's not be judgemental and / or dismiss others use cases.

Fastboot didn't require a new uapi (or intentionally break existing
userspace). You have to be diligent when adding new uapis or else
you end up adding ones that don't actually work.

> 
> If some established driver like, say, vc4 that only has external
> displays can pave the way for everyone else to use them eventually, how
> is it a downside that it's only usable on external displays?
> 
> And even if it's still usable by less established drivers, slow-rolling
> it into more drivers, fixing the bugs, rough edges, etc. while
> consolidating the code still has a lot of value. Just like it had for
> color management or fastboot.

My *points* were:
a) you can't just hook this up and break existing usersapce,
   which seems to have been the approach here
b) you want to be sure you have a way to hook it up later
   without breaking userspace

The best way to insure b) is by actually doing it.

The alternative of course is that you later add yet another uapi
for the cases where b) failed. And then userspace gets to deal
with three backlight interfaces instead of two. I'm sure they'll
appreciate that.

-- 
Ville Syrjälä
Intel
