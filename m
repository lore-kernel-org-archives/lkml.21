Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204425;
	b=tUlwJzrxiPGzMzD5dnnKMiD1diD7RkyroKsKBE2bVqdKmiyT2NpsNzrBBRpritoopcWL
	 QI3cmd2c+H1nVpPun6BHD37DHzjGzbjsjj3OTHlpNw3KG5ovyD1K5IlGxOC+UoJFOYweQ
	 RS7D7hsk8ukefIkFSLeiclpOA57YFFXEOLYrSFCyTmhQfsYK0SzXPmn6tMZ0R2y/jIi4F
	 x9H3s9Mwr1wmv6KUgc0wEJowL1hITyb/ABE+C4Bf80p4Ra8+qFCSuzRpiX4kWze0VWUdF
	 8XpwmnOWrU+GwZCmYHhfgVtbUrarveCY2JimQ+qZNn6w1EPjkgB+0PfHmo01+VnSLNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y76CwwbIFFZSLzT6VqrJeNVAmGacmUJL5O9mQNR1EcY=;
	b=nFAVxbKrTZYkDDLW3ziL7EWsE/8E01TD+O6k78zi+HlRauPNtNPcoXWZB3NE/18t1lXT
	 p/Qs6J3rn/qXGwMoeIRkBDCLrxwe+btKy1eOokxZF8U5gSIP+MhP1adAx3HecCiKk5+cv
	 gzN65m8VwXvonUsdjp6+5So2JcJjvwwPns5oEciW2N46bHeOBL9NOLd+eI884a9NWbvfF
	 S5lUniAejSqImeO/0u3we9u0iYvKfEMfkB1IPO1ehAWe+zsNwxY2OZ9KhH1tam3oC9ThV
	 psU0I9D3ghTlZT7faV2iNIpWJ22Evc4qC7N/p92XXhkMPTTIoUAzbMowOUnmbZaTHoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OIzOhE5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9468606A6D2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9468606A6D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OIzOhE5i
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so744137e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795204423; cv=none;
        d=google.com; s=arc-20260327;
        b=CW2+8x1o07SqboyioIzsM64isE+y40xh5aLJvQ0OjElGlrhvjbygVC6RDGi3+mEZuC
         L2mMnIG6zCBc9xub0pTO/+VaAphQUgW8iwrncbhOEcGOWkM0Z3HA3JMgwVFx4fVa97vV
         NVsxeQFum2VX6v76dCYERd1KE5Ispzp++w5bTsQIif6I4apNGWV1oEBTYqn1M5nH/Mcj
         T8fneQdIMQZkZOT8IRyR1STY+ALqpyPLn3XFLawkv+jOn2WIYCazxAd+9MEGBfgBQZyK
         HfEl0SI0j3EAdHKCL1zyTQ+lwW8QkpQa4rRmrJ5Yo5VOEo/Axr6LyW8d+G+opBNyBBe6
         5P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y76CwwbIFFZSLzT6VqrJeNVAmGacmUJL5O9mQNR1EcY=;
        fh=FrC1qLVAXn003y99SJJL0dpMjQPNcpnkto/QEA9VmuY=;
        b=cwr8pi1SLJ4xdQZYWVWEJnRk+ZQqFBSi+bAiiXiHyWwpDiZW6DSVEmNbmUmC3dIiST
         1mPFp5MZ2bpG2yXZUMBvhdUeAr3FeKuqLxEhNa1OeOxA18T7NnPY4+VONHwf9rYvjEvq
         LKuVgQHKC1RrNu8vMfSLsF6mzs3z1bUG4jh4vgn4uFc2AGVFDN0K9oxVKKtuKIENo+k9
         9fsgdWKRm3KsrYLyhkvwZ6haRgMf2ZQsDZOBiMVg1AlzAK+ERcZCvPJvQo3NNzM3873g
         bEE+TdvjvykR3fRKegt7/eXYjnAZNfFcUlRtixuFOvxyI5MMER6dFbtZNZoZU6Ma2HYC
         mZIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795204423; x=1795809223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y76CwwbIFFZSLzT6VqrJeNVAmGacmUJL5O9mQNR1EcY=;
        b=OIzOhE5iObSc8vEouH0agFHpvADyEkxMoLtQygTw3RAog7Wv+L7LAKHBfx6tywTWla
         XUmS9LeJ7PnxVQ8l/3h5q4xOUl+0sR1Yhl89cyUVCQFQ6WCNIJ01mU32NChKR7y23gEJ
         n6jCSfPaTpMmvNA7KdBLfnQPGXRT46ttzJgAvgufnJa4wXOuJ17zrS9bXry+tvzH4oPw
         y8KH2mJUm+Io56eSd80lF5wNq2JRo3v7s3MN3hIShmIFHlUZKroZclqXKbLIjGE9o4oI
         gDJi5i5Hy/If+d9CSXWm+OtWA52rz2oh8TdXKQlysnEYYdN/92oAHLZ0UJRgGJo4WwVZ
         xk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204423; x=1795809223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y76CwwbIFFZSLzT6VqrJeNVAmGacmUJL5O9mQNR1EcY=;
        b=TWatci4kqqD7anXh9MIqa/OBZuf1xxyqEkA6wSPqwVnCAtd22De4lBfvqpv9iluu18
         sx57Rxsq5SbMUyYAf79uhp6pBMBFW3RYF68IXsJSbiR44xuwFkFshHjXkf76esdXBpan
         tysq9fnpoV9RGBt2WxseFS0CJiZurx7ZDSYB4qcKXZJ1nsjJ11kjx3TFgNP1YlzeNHxr
         HeLmujmtwEocKtUkyN5u5xCxaU+m753oqh9Q/usqv70wJiI9Z/o/Pnmx46Wn5ILONphx
         sve7MOwgdBkaYxKX5LYoEv2suRsJdE0vHL94FAjgwjy3E9I2nYwT5OJkEKmu+L7pnjDL
         1ptQ==
X-Forwarded-Encrypted: i=1; AL+hErHu3B7PkVU6DCtmQWLf+L82PZwG8xgwp/9aKIuADWtJZ3CQTwHsC4HWPioXMwTqT1aGhSQYabnCfyTdy78=@vger.kernel.org
X-Gm-Message-State: APuU4Z86ajddtS+S9WAcVEbFVu7QLhrH7PooT0b2b+dVdNPeA9pM0ZzC
	sineEipTrTyXovpIr3/kD1n8zZJ0TIQ5Cc8qPnkTq4AhDZ2kZU70RpE7vnGQmWyhMySiGyJ/i6/
	WThADOaFt9m47OQtxLYePMDpo1HGmramfbX02DD8m
X-Gm-Gg: AZFdTZdeFll3rOrUoReLuqjv6vqtyKJO0j/3AgAqvJNIuA8q34dMO62ArGDxvoUyluE
	mW7eFxblQZt93nWUoaJG+VwAw82IDD8/5jrwAVeGOCPdvQCjAVURbaml0Ud07MCTu7kVRY6U54V
	Hbs+RMpDI2E42CAFxX64zCaTNfNt01VoWQj6vAT7r66eVG7VG4Pq+EAAEkqha4lF1QdSOc76/UK
	chldkRcjBx0gTwOLpkmiJ/H/LS6O7LiaU6Q3rjlKV/lrLbCO/klG+jvQfwRiiAAzTtvNRiL14GG
	ZFih00R8xAt7+GdKWpzaAnUoDseFr1yz/fxWqTHNlFbykUJ+VymwLJ9T3pMjQmiTFlUxxcAuqwq
	JqwXzvYMp1nLdL+fVqContxvcmPfeoCpBLQ==
X-Received: by 2002:a05:6512:1046:b0:5c1:acec:260e with SMTP id
 2adb3069b0e04-5c1bc8432bamr1303866e87.55.1795204422738; Fri, 20 Nov 2026
 11:53:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <av3bkDnwmjunTleX@kernel.org> <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com>
 <9463a969d35a7d5ec5a56aeb67644b94.josef@toxicpanda.com> <CALCETrXt-Do28BHDpbrA98kEy-tQuorxD8c2XsW24Tt8Vspdtg@mail.gmail.com>
 <CALCETrUbe8rBoxrC+Q66AMsrJ8Fow7xt5KJKRAmobtXBvHWdqg@mail.gmail.com>
 <c301fff20a4920fcd3baa31dda2e31ad99c93436.camel@amutable.com>
 <awBHZO2VwWyJzvBN@kernel.org> <1f12636403bb7af3759cd933b2612d8a5d7317a2.camel@amutable.com>
 <awBRyKgOQlaEqpWX@kernel.org> <awCg5VYXKJvex9vy@kernel.org> <awCkANwNDox_99SR@kernel.org>
In-Reply-To: <awCkANwNDox_99SR@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 20 Nov 2026 11:53:30 -0800
X-Gm-Features: Aa3M54pKxDm6eU_2Sjm44hIEowicdxL9W6xw2PHKnbweFLV6y91fuj5aPjITmFQ
Message-ID: <CALCETrUnQjrWmSzL-FOqFF+_enxVsEM0On7orydXLCO-L2f23w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexander Mikhalitsyn <alex@amutable.com>, Josef Bacik <josef@toxicpanda.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>, Serge Hallyn <sergeh@kernel.org>, 
	Kees Cook <kees@kernel.org>, Paul Moore <paul@paul-moore.com>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 11:48=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> On Fri, Nov 20, 2026 at 09:35:06PM +0200, Jarkko Sakkinen wrote:
> > On Fri, Nov 20, 2026 at 03:57:32PM +0200, Jarkko Sakkinen wrote:
> > > On Fri, Nov 20, 2026 at 02:24:57PM +0100, Alexander Mikhalitsyn wrote=
:
> > > > Yeah, detached mounts API solves a security issue here, but it does=
 not
> > > > fully enable the use-case Andy describes (if I understood it
> > > > correctly). My interpretation here is that to fully cover it we nee=
d
> > > > some well-isolated communication channel between container and
> > > > container manager (vsock for containers? :-D). And some well-define=
d
> > > > agreement of how PID 1 inside the container can get an information
> > > > about a hotplugg-ed stuff. [ But it could be that I completely
> > > > misunderstood and Andy meant something much more simple here. ]
> >
> > The sequence for hotplug (Andy's use case) breaks down like this and is
> > doable:
> >
> > 1. Host creates rootns(ROOTNS_SEAL_MNTNS).
> > 2. Host sets uid/gid maps with NS_USERNS_SET_IDMAP.
> > 3. Host populates "/" with MOVE_MOUNT_T_MNTNS, optionally combined with
> >    MOVE_MOUNT_CLONE for bind mounts.
> > 4. Host spawns PID 1 with clone3(CLONE_INTO_ROOTNS) (optionally passing
> >    an AF_UNIX socketpair fd for communication).
> > 5. PID 1 watches /proc/self/ns/mnt via fanotify(FAN_REPORT_MNT |
> >    FAN_MARK_MNTNS, FAN_MNT_ATTACH) or polls /proc/self/mountinfo.
> > 6. On hotplug, host mounts the filesystem via fsopen()/fsmount() (plus
> >    optional MOUNT_ATTR_IDMAP).
> > 7. Host creates the mountpoint with openat2(RESOLVE_IN_ROOT) + mkdirat(=
)
> >    and attaches the mount with MOVE_MOUNT_T_MNTNS.
> > 8. PID 1 receives FAN_MNT_ATTACH and queries the new mount via
> >    statmount().
> >
> > ROOTNS_SEAL_MNTS, NS_USERNS_SET_IDMAP and MOVE_MOUNT_CLONE new features
> > that are yet to be submitted but they were not tedious to ramp up.
> >
> > I'll include them to v5 of the patch set. Thanks for underlining this
> > part because that led to having those.
> >
> > Architecture scales to this even if my choices to address these details
> > would need some adjustment.
> >
> > The clear two-phase (build/live) progress with rootns sort of just give=
s
> > room to address stuff like this, and I have hard time to believe that i=
t
> > would get much better than this.
>
> A completely new feature is NS_USERNS_SET_IDMAP:
>
>     nsfs: Support NS_USERNS_SET_IDMAP ioctl
>
>     Configuring UID, GID, and project ID mappings or disabling setgroups(=
2)
>     for a user namespace currently requires writing to /proc/<pid>/uid_ma=
p,
>     gid_map, projid_map, and setgroups, forcing container managers to spa=
wn a
>     live process before populating a filesystem owned by that user namesp=
ace.
>
>     Add the extensible NS_USERNS_SET_IDMAP ioctl on CLONE_NEWUSER nsfs fi=
le
>     descriptors to atomically configure setgroups policy and UID, GID, an=
d
>     project ID mappings before any process enters the namespace. Enforce =
the
>     same single-write and capability invariants against both current_cred=
()
>     and filp->f_cred under userns_state_mutex.
>
>     Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>

I'm highly in favor of this.  But maybe not as an ioctl.

If you have an nsfd for a userns and that nsfd is the "control" fd
(however anyone decides this is formulated), why does f_cred matter?
It should be possible to create a userns without privilege and
SCM_RIGHTS the fd to a privileged uidmapd.  (I fixed the rather
screwed up workflow for this in newuidmap/newgidmap a few weeks ago --
this is remarkably easy to screw up.  It'll make it to a distro near
you some day.  It's supposed to *work* even without CAP_SYS_ADMIN in
the picture, and it did not.)

--Andy



--=20
Andy Lutomirski
AMA Capital Management, LLC
