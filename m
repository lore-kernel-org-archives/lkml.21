Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795080795;
	b=pn4dd7ZXhSrpGDPk2ycugNXqAkqQwR9WvA8Qm899b1IC8owKe2u7ktZbr9eZKxVmlJP6
	 ub0xfkyfhEIbPVDaVHvjOf5zzmpCHV4Rp7ADWOJT34IfxwD910JXMxO65I5kKbMIv4Dx4
	 dTtr0HfvDqtbRJ8y20wFGrEs11HmBnmVF68jupWAsKYmCwR0qEmab1IL0xROJB88rYY2A
	 ULV3ndD0CXdJ57uyJiAXy2Ph9A31hQCvIJRXcmHH49b7qKoTBM7y4HHt8AGpnN1DF1q5r
	 O1YyFBV6/TIaT6w+r+Ta5N4E5jFa9ZpPRGpqJQDiB+PWkUa3bsC5Frd4h7UQT8otsoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080795;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q3iNwzOS37/jrc7WtY7Br5byxUiklpla3M+UNj4OGHc=;
	b=iri6VJi0yi8Apwajh35eD7fGjmOk9EmuAg7yI7MmEz7rCEK+0WJXuWAnIqcLx+6ga9wi
	 cUFdgHPf+mrQs2Lm+wCgz3SrMWSzCnfmPUWQIL6bUtvyH1gJzQDZV2g/CA8z0NuN2PiwJ
	 KJNcaw4BIL+Gs2YES75CVSrXVM4+JzJh5MctbQFpHfpSUDRgohggMwCY8LB12WDRA0NTA
	 ODdOa9EuXgPQxDEJrnfJB4sSiuMeVryiGgCgRSUP105LWUWaahSQPdblm2EvuW8ANtAi9
	 oi4NpXroKVab12acu/SCFgnLisoPdMAOjmZMAPdKem7nrVFMhmjCqdPKKGUY53RXSfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVEuICZe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Bk72f3Zq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD560A2605
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDD560A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVEuICZe;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Bk72f3Zq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3iNwzOS37/jrc7WtY7Br5byxUiklpla3M+UNj4OGHc=;
	b=AVEuICZeucfsSDHike5vdCqLy+6J4XxogjpJx2zGod93RmDop3EtCRphEdhbG3q0msdOpe
	UZqHJhwbEa5kY3kxWjGQ9DXMoWI43DPshHZ9sVUZCbrAM9KKTUojKqt0LmNJlR0HcKK20n
	vqiBo8vWOXle5+Nja7paKWNFZcs9Onk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-rKOZp3IuORu6F2VqMlRWBA-1; Thu, 19 Nov 2026 04:33:12 -0500
X-MC-Unique: rKOZp3IuORu6F2VqMlRWBA-1
X-Mimecast-MFC-AGG-ID: rKOZp3IuORu6F2VqMlRWBA_1795080791
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4bfc0b441so29556677b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795080791; cv=none;
        d=google.com; s=arc-20260327;
        b=Oxlw/v2cB9V56P5bNyuRqh8K9TSRyP1Ofw/RFgHn7JUu5qn1UyXDRzdjG9uEVo1ODY
         TkebFCY569byfPCzsk52QptKGBxdIRs1haEFnrnLCMqgD2TrstqTJeuGuqifpILNtxwp
         VmUBh6YsGkAPHhCs20Gek1k4mp+mdGkGsg0pw7nRACSoTw4K53ensAhzB0Y+DaGBxrWF
         /LFYujOqfV9Pi5Vv3OxtJOsrPUA14xI0QkVxaYJFNr9vEnod7ItUJSrpC07tFrP//QJp
         lIVGY2X1P11OUw2Uwv5AfSAjQwudnRDtTfooW5/rP98CdzHRSIx0usXR2a4N0LOYPKgD
         Frsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q3iNwzOS37/jrc7WtY7Br5byxUiklpla3M+UNj4OGHc=;
        fh=oOH37VWGPGTA1ifnyYrV2OLRGbzJIId0uMog3GLmegc=;
        b=jMnHmh48SxVHFsdGMbuXtTFbktaiucLMotYbV2vj63d1WUGRTASckHgXZGm5O7HyNU
         EFZXVmOWx3IFbCDOlMQNUPn2SayU3ajYKVX3c5LTnUTUsD33Yizim2kwS88EI2qvN75p
         5H/Pv9lprHxhe6qKy2f4QMN58bSPp/5V0+M/C82zHTgpz6L8236rBlRo3QYhh5OKITzG
         j5m/uhosbV2psVmWAf/bIragA4+JudPo/k362mn4wUUxCBGk9gMotJ9o6EHmsA5/NQnw
         5OIfXYQf326yIuSbOler1O+UQ0JrfAxv1KqMLd5jEPkA92mehuOZvlbl6z58ews5abwE
         omdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795080791; x=1795685591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q3iNwzOS37/jrc7WtY7Br5byxUiklpla3M+UNj4OGHc=;
        b=Bk72f3ZqTjfdx51T0Knu9YMolzdsMvk6gu8wdYCThL3XNjhtDXIQpjS6iVJJAgSbeQ
         HT3XjLdw3wLyWo9MwUU+PAvEJEPhv3/DFM27Oi4OFScljbmY+/VD1Ct12gkvqqYj6jWS
         3EUSSnIksDqH5Mhndhe93mZTqrv+nZZGKPjWfjPm97Zn03Xmlcp7Fg0gkBZ7SYb7g2y2
         iNxFROAXnbhSEmx65W5v+8drbMqAim1RH2vE5isZGRCy8XAbVwuBdVfKgKQf4RJ1GrWr
         ksliaRAnWTSLimqB4iBO0o4CyHibXGfDejX7eYhL7sMIBk3h3Gzx2XDZaiLyIVE1oBJR
         DvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080791; x=1795685591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3iNwzOS37/jrc7WtY7Br5byxUiklpla3M+UNj4OGHc=;
        b=iMiTHQN9/f5jcAKHV5Wu46ziCfTd7y8QrBJFi7OWx7Kc5s8MM5DV/nMMfaKdt9Bvaj
         cUh5n8/qHWtZTfAci7XU2rmF3OEG8evGlGzR5Nc+nzSCqDYS0fZRET/NtxsgUIfklJdg
         n4ZpTEyQFFSknGaHrjATWJwKG/kzGp2S/gEZFG3GJdgThEd8hALG5gtwm0462HiLNabW
         N80+BDFVLt1TlHaQKWbcjWrdpTiaYoHkioPOrCUe5+QA0VjjDRS2DpnPiNfbcpwYUOwO
         cOw8vVF4dmRHDywFX58ip6vDdmmWxRU09ii4pU+pfNTVyA7I9+74s0mLX2DxuFUN0+8i
         1Dvw==
X-Forwarded-Encrypted: i=1; AL+hErElE9yrOVPi/EinIIb0j1cIlhasMiPGbFXfMccmafS+VnFIle5IlE4u1/c+bJFCeM376xKj5NQgcdYyGCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9voY7FZ39jGtursQeAA/ynP6CjvRS1hKSAJrnNz5CEK4D2dm5r
	RHDsHOXlIPc7jGCFQLshlh/DDpDLYiyXNzm1RkOEEjeYnZXscik4yUHOVtaeiUeXf4GWT3pjtsD
	oXJS2FZrNJtdrdHecDvj0w+tys7DK270dQDovbjIrka59V7UzV90ynLIlj3q7Bxkl2XRlQuiz7I
	u4/RtNQwdaCdDayRSJ2ZoXYH1AjGR2BfhpisiZhp63
X-Gm-Gg: AZFdTZcpXIsAMgTu8YN9kWY34RyDw+w4MKJ9ttqVwR/R/oAajKNdBdiFEtku4Xt409E
	fZ7BxcCmJvZy/h9cyLzQdq0oJUd61a3DquWHxNfLV8FntJAK6i28o1bizoLbj5qGrXOtD26f6Xw
	WB6XynODMmelCyeHGkLMHKTeoTOfIiFHGhED0UQNJUybpEwJ8WMHXTCuYJ
X-Received: by 2002:a05:690c:3682:b0:8b3:5a91:61e8 with SMTP id 00721157ae682-8b4fedf227amr22008967b3.69.1795080791324;
        Thu, 19 Nov 2026 01:33:11 -0800 (PST)
X-Received: by 2002:a05:690c:3682:b0:8b3:5a91:61e8 with SMTP id
 00721157ae682-8b4fedf227amr22008857b3.69.1795080790664; Thu, 19 Nov 2026
 01:33:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117184019.430513-1-andreas@kemnade.info> <CADSE00+-9Br_eVWRc=+i+OnthqZYfaMZ57Gxp5fXmqFXrMqf3A@mail.gmail.com>
 <20261119101734.2bb8bae9@kemnade.info>
In-Reply-To: <20261119101734.2bb8bae9@kemnade.info>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 19 Nov 2026 10:32:59 +0100
X-Gm-Features: Aa3M54pDLkMvy9x4DRuXey_uiaCFyWTCdPTvY_vPUgwdK_XS83M8GupYchvlxWQ
Message-ID: <CADSE00LzPSHX5DhB6-DNwmfd6=rQc86fBa9MmcW-NhApjDH6iQ@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: dss: simplify omapdss_device_init_output
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	luca.ceresoli@bootlin.com, louis.chauvet@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:18=E2=80=AFAM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
>
> On Thu, 19 Nov 2026 09:32:11 +0100
> Albert Esteve <aesteve@redhat.com> wrote:
>
> > On Tue, Nov 17, 2026 at 7:40=E2=80=AFPM Andreas Kemnade <andreas@kemnad=
e.info> wrote:
> > >
> > > During reviewing of a regression fix is that function, questionable
> > > possibly unbalanced drm_bridge_put/get came to light. Sashiko
> > > review pointed out that of_drm_get_bridge_by_endpoint() does not retu=
rn
> > > NULL, so the questionable code is simply unreachable and therefore do=
es
> > > at least not harm. Remove the dead code.
> > >
> > > Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > >  drivers/gpu/drm/omapdrm/dss/output.c | 10 ----------
> > >  1 file changed, 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/o=
mapdrm/dss/output.c
> > > index b5cef5093a883..cbb9b2f1a2133 100644
> > > --- a/drivers/gpu/drm/omapdrm/dss/output.c
> > > +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> > > @@ -20,7 +20,6 @@ int omapdss_device_init_output(struct omap_dss_devi=
ce *out,
> > >                                struct drm_bridge *local_bridge)
> > >  {
> > >         struct drm_bridge *bridge;
> > > -       int ret;
> > >
> > >         bridge =3D of_drm_get_bridge_by_endpoint(out->dev->of_node, o=
ut->of_port, 0);
> > >         if (IS_ERR(bridge)) {
> > > @@ -34,20 +33,11 @@ int omapdss_device_init_output(struct omap_dss_de=
vice *out,
> > >         out->bridge =3D bridge;
> > >
> > >         if (local_bridge) {
> > > -               if (!out->bridge) {
> > > -                       ret =3D -EPROBE_DEFER;
> > > -                       goto error;
> > > -               }
> > > -
> > >                 out->next_bridge =3D out->bridge;
> > >                 out->bridge =3D drm_bridge_get(local_bridge);
> > >         }
> > >
> > >         return 0;
> > > -
> > > -error:
> > > -       omapdss_device_cleanup_output(out);
> > > -       return ret;
> > >  }
> >
> > This looks correct, it is dead code. But removing it makes the return
> > value meaningless (every path returns 0), so it may make sense to make
> > omapdss_device_init_output() void?
> >
> No, not every patch returns 0.

Ah, I was looking at my local tree and I had missed your base differs
in the IS_ERR branch (which the patch context doesn't show). Scratch
the suggestion then.

Reviewed-by: Albert Esteve <aesteve@redhat.com>

Thanks,
Albert.

>
> Regards,
> Andreas
>

