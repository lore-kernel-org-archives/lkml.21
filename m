Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423699;
	b=QjnI2K9egm6L+CuBZmSqlyKm9kqSFaeRBqDdDm30zf33l1IlYTPNYZrLkE3LKfwi95oa
	 zpcyLXEPwSmpMViln/wHQe4H7r/xWJ6cJAh94Bx+l2MBNqpSzoB7DdMdc2f6KO5svtUuT
	 Dm2dNNNzwh+jU3C2kx5j7vqKurBajS8etImHyeblXE1cVh+pD+tL1+lmww0xrtgNNLRDr
	 kmav1Mc3ZlMC1CjEQ3QpIJErhM58bArQOTnp7bUMb7yBDxNG+WbloQiXnp1HJGr8AqGz1
	 E7meslWhnC1StMpPUEx1UaFVD0d8eGIkHa6kPsbYmSh7msH17tk15qoGhZ4IDfwsPZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423699;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZIoXELwpYh1o5DnGcjLjeH54OjVLR8OUMZ7+fanJt4Q=;
	b=xFv0jRHHc2HzE7o6HOTjfXO0g1PIu0zmBqx1vgO9yFcsq95BN5kZ4qHBCgoJbTsQFij6
	 Rd8qdN875ANnLH6TMmJ7y1H99wML+IlWWTrp7Pwe2MWis9+NNpm31IbqjggtoaDoK7/qK
	 3lPqS9HVwqXBfOFl3KUrQiMZ6308g6EIYKwc39uXCVK67UmrsoXefJkdVJYnYT5L91WCE
	 2mBlpsGEQtkFi6OeUt4X1hGaFNBiRHBn6+SaMRfyHQwIXANW11HtExfPZBvDMwGRTmGA8
	 btiJiH5Y9we9+KnCN2nZbadYyJhIza3EBBXzR/JAohuJWTLpz46OGmmbxMKFM/S+XeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJ8RNZBv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Go5Od3++;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDBD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CDBD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJ8RNZBv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Go5Od3++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795423697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIoXELwpYh1o5DnGcjLjeH54OjVLR8OUMZ7+fanJt4Q=;
	b=QJ8RNZBv53FuzqsrbggTvFbUHeAYROB6Cop7wZk3NO8pGL1jqiMio6DDhkho1g2e75mctk
	64aaQZbAs1zi/dVDAHYipeFdG3+ACWBqmpiVkE1FYMJDA/yxXYMIkfev0G0+twG/3WjOF8
	DTnMF8vCQWH4DETrH9lOrWj+8bA79RI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-GPKNjP5dMFWxhLPkRMidFw-1; Mon, 23 Nov 2026 08:48:15 +0000
X-MC-Unique: GPKNjP5dMFWxhLPkRMidFw-1
X-Mimecast-MFC-AGG-ID: GPKNjP5dMFWxhLPkRMidFw_1795423694
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so17426485e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795423694; x=1796028494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIoXELwpYh1o5DnGcjLjeH54OjVLR8OUMZ7+fanJt4Q=;
        b=Go5Od3++Y9wqdnHvtXU1a6dWMk2IRR2t3poBk31YzEKdVcItlfdbnDECdZEVDPu6lT
         D3kAWNnLwetJKeBxqAZYeNJI36uR3eDe/+0EiBv3/rAaQ7rpoPAWshTQAwWxhk/RoEIE
         evBtTFQwPVEU2xA8l8O+AKgkE+Df+p4rinXzly5619U8IkMySa3B8+XOQr9uumcTZVPO
         FXJCja9nSqWDzDw8NPclPpk6CiJ0S3LpTyBuMKQquXYAb1daszWgBeUzoemBYYm8K9Vu
         Ron9HnTBuYJQ4BsariTIMNydsLlDn1CFwFpZfW5KVff84L5I2++YdtcIcnQ7zLyd47cb
         QHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423694; x=1796028494;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIoXELwpYh1o5DnGcjLjeH54OjVLR8OUMZ7+fanJt4Q=;
        b=bhofqpJnwlsEh2bpPOG5SUDJF2oweKRxYVpSPeKfmpuLqc2kqeI1vM47ISG/qu3mnQ
         ZbpOoxKY40ooOwZd+Aa0cywjx9QeehogiJ6Tjk5SOxS/gmmIij5as4cPmdekG3xf7E71
         F2/99MuIPu3OlvqE6PfSWSG/g/x0SSL/7E0AJnPxOe8paDgYnk8dkFoTrJnO+lDKvW9R
         pKO0OhP5KDh1SxyCJqaFxqGD8ZCTuu9px/L2vnfwJ9gTRdsuXCZtyzl3t1HeP4bHr7VH
         PO8BGYuOfC8IUln82ZtUxGjkjAp/CU3ktc9bpaD+jPh89ai/Q2FgazIj51hzEqBVC0Pt
         Ojzg==
X-Forwarded-Encrypted: i=1; AL+hErEoZByYXC+mEd8F3rpGt4Y04wXYHig0zyDUp20RkrCQS09Ls4Jl1BdwGcRL/502xB04MQXp9NnDEu/Bgfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WRy3Ol4/Y9QnYrGoVutVcQ+eYr96NiBa4bfG+1ZjrWqRh075p
	QTAVz9TTLg6naM4gSO/NtHdSBZyRk3CJqnclYWxkt91m+rVuEM+w524Hy2oJ4Ej3/GRH78k0wXC
	CMge9EDWBkRYqRDlGtCSD/slx9d2xR//GfpqHtXmauDTY9Ku5TWnXgJXcFqgcJqfMBA==
X-Gm-Gg: AZFdTZdtG+8L1UGKZ+ftp1Jotz9eq7/hzMSTwYfkJv1Z0hEybVE26rJ/72fCtkuH5wR
	Bi1cwV0p2PPD2hfKO3x6HqYCcPH28CGeRPQ0EW0sXqlKthAdgtypcuWTNBOmIrMXF8D0BZPTkLW
	u64EqKHIqkxQx6Kuudy8XWqqNo6gDga/cjWlnswXZdaKTlnBVPw/rL8N9+uP731j88lH2l4DzEU
	bADsM4MCzahQAJ3g/ky1+3B3EcLuihFLJX1fLLT3yo5LacgbvPmvP0UQuSuF3drG3nUK3UkpcE8
	S8NqrGy4G2gFGnI+Wpglq8PcvPtkcKBZ6Wp+6llKmdVycu+GP8jidwqIS5RTjM/OYXagctetRn0
	341fVxDydLU+s4vMRKIhj5qn2dBPjSBVrFtd8vHHVIf4H2jwTYcozacXPHXoAxt+fKiBztTH9Um
	Evn438fyZ07Qz+oUWtFsRPO6zYiPFaIgsWyNryQhA=
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb887c2c98mr206908945e9.4.1795423693852;
        Mon, 23 Nov 2026 00:48:13 -0800 (PST)
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb887c2c98mr206908455e9.4.1795423693410;
        Mon, 23 Nov 2026 00:48:13 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm155883195e9.3.2026.11.23.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:48:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Mario
 Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 01/12] drm: add connector LUMINANCE property
In-Reply-To: <awP0nasqAc4pAeMR@houat>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com> <awPvoLCDeq1YFLE_@houat>
 <awPzsMWZ7e0i6i54@intel.com> <awP0nasqAc4pAeMR@houat>
Date: Mon, 23 Nov 2026 09:48:11 +0100
Message-ID: <xlv14id8rl10.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
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
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Nov 23, 2026 at 10:05:04AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Mon, Nov 23, 2026 at 08:50:29AM +0100, Maxime Ripard wrote:
>> > On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
>> > >=20
>> > >=20
>> > > On 11/20/26 10:41, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:

[...]

>> > > > > +config DRM_LUMINANCE
>> > > > > +	bool "DRM connector luminance support"
>> > > > > +	help
>> > > > > +	  Expose relative luminance as an atomic DRM connector propert=
y. Values
>> > > > > +	  are driver-defined levels rather than absolute luminance in =
cd/m^2.
>> > > > > +	  Drivers provide connector helper callbacks to program their =
hardware;
>> > > > > +	  the DRM core does not depend on a particular backend.
>> > > > > +
>> > > > > +	  Drivers migrated to this interface will use it instead of re=
gistering
>> > > > > +	  a legacy backlight class device. Leave this disabled to pres=
erve the
>> > > > > +	  de-facto userspace ABI in /sys/class/backlight.
>> > > >=20
>> > > > I don't think this will fly if it breaks the backlight class inter=
face.
>> > > > No one can actually enable this outside of some niche embedded use
>> > > > cases where backwards compatibility is not an issue. I think what
>> > > > you need is a generic backlight class implementation on top of thi=
s.
>> > > >=20
>> > >=20
>> > > The idea with this was:
>> > > 1) to get the series landed
>> > > 2) let compositors merge solutions around it.
>> > > 3) Then add backwards compatibility to kernel so we can flip the Kco=
nfig
>> > > default.
>> >=20
>> > I said this a few times already, but we keep having those discussions
>> > while the backlight sysfs handling is far from being the main point. Y=
ou
>> > should *really* consider adding support for the luminance property for
>> > something that isn't tied to that interface (like DDC/CI for HDMI), and
>> > treat the sysfs API as a sysfs series.
>> >=20
>> > It looks like people just have conflicting opinions on this particular
>> > part that isn't going to solve itself easily. You should not treat this
>> > sysfs discussion as a blocker for the infrastructure work.
>>=20
>> You want to be sure backwards compatibility with the backlight
>> class is a solvable problem before you land *anything*. Otherwise
>> you might just paint yourself into a corner with no way out.
>
> I disagree. The luminance property is more useful than *just* for
> backlights but is also useful for HDMI, DP, and MIPI-DSI that would all
> use it.
>
> If that's the corner we paint ourselves into, it's still a pretty nice
> corner.
>

I agree with Maxime. Drivers can choose to not expose the luminance property
until the sysfs backward compatiblity is sorted. But this shouldn't block t=
he
core infrastructure to land, given that's useful for other drivers/use case=
s.

> Maxime

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

