Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795592818;
	b=yRbNS72S0I0czWxdHNQ6542nk8/XqK6Dt9Dqb/Ce0i/fnyumh+96/0YkWF+rvPKKLMgM
	 zP+hri+fKhaEnyhgaPlAay/3o8099TSOSgg39izq8/j3goEnbccU9imJQtLu4dSyVceow
	 W+H9p+kG91RIrt0gphfQ9ogK/g/x4NKUW/pOguVBxs/euDoMkuuzJ2SK03085C/+0mE2P
	 AHadl+qcajTwdx5tkgHD5McJ4JFCP95BQfXXXjo6Up9U+h1GKH18MCyq8nLP0nKZKA5Nz
	 syybyPM03acp8heu6XuLvHO8Esh1xV258Gri+Ux3c0/IXYQQr8oNzc6kC8qU4Rzx6QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U/rJwxOFAuUYoG0w11daH5oi3dDRM84YiGwVnaiS5js=;
	b=4Y6tUAs0ZDYxPrrLYMRMRn0r0a+YgGx23MVvfnRiAqVsvgmWFFM9iIPmRxeJcOHMaV3L
	 4cZfKV9XSjgjElJ0p4ojePxDgoG1Om7YwiKCvl+iwSOs1Kkoyj5ratcV6YT/+24puARjM
	 7qhxeJ3diOhzNwEf46GtZ9oJayAk9jLH1s52v5/PsmxQ2x9MhOBElMduJwE53laJB4vM3
	 LMY1I3mYQi+JO/xf6cKI5ISG0uLr0yIdvTOmzsnsyVF5PhgXNkYhk6Io/dJlFublAbg4B
	 nhesNiePlXELozGk+nJjCzKpQukkBg1ZpxOWyjpVw19cgnh6VKDk4JptYifSHclB5aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtPZoNHl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D4606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtPZoNHl
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so6303729a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795592817; cv=none;
        d=google.com; s=arc-20260327;
        b=JW9LaLrDyptwWuLxPw+gHm7+G+z/bocUrEhDgQGRkNdHrjj2srw6jas1bBrk/CLaap
         KBeM2nSk8vsfNo5AMYDao9pLoml+oQgfTdBFrSh+CztpVOvFKVy3PJqdaBcgQeFcSIKG
         ldgpHLLtFVWJ1AILHv6iiG5sJqaEOwK2GFKbT1UiZ7TZpfqAOUN5T3Aiuh7/y5jKNlEN
         E4M7+GHaCL4/iOr76g5fIID81bX6FEeRV13FrBT8923vV/fDNYJZxy/b45ke0VrI3NYd
         CQxED5N2ctC0GX5qzkXi999aXN3pevSqkbzxWJVfR7adAvMHT76D+sFSCW9lZ/kgyXYr
         SSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/rJwxOFAuUYoG0w11daH5oi3dDRM84YiGwVnaiS5js=;
        fh=5ZMbmN1yz1xa/1ofoJQh0nXZLQNKgbdKI8vqg9WXgxQ=;
        b=Xwe4GIPx+kB5fhCxc2bIOgfOBPbliXJs0MmuvA6Kx5SVz7v6m64eXPb5s7mDSIc3KS
         rvt5gq/BCf8349kaNGs+c4Jdo0sExE1lw7MKp51m/IP0CQmP6XzSnX62B5oxMo7dnjUz
         ygRoQ5RN2RslJXGGnQtO5upFQmapM1qdBBQZg7MmDDUWg4WB7XwWZa4LyMshjaFF8a5w
         +7rZdiu4yjUusGgJXf33hu71i2ZbGy3KGQAwWJ7KDcj6fcMnqyI8Ls7I0vnArHU1E5GD
         86Ff5voUay+H3k5fvcwOv/KkOCcYPLcy7GIheJT6vs/6U0aI7PX424AeiNyUHDX5P5FE
         H8pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592817; x=1796197617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/rJwxOFAuUYoG0w11daH5oi3dDRM84YiGwVnaiS5js=;
        b=VtPZoNHlAXAQsj5bEHPGJ0pH9PH+uAptAVb7ng3RQd4KiJ/yixf4gO3gkxsw3iaRZm
         TWYv9oLVeFRy/ZbQMvSebdbDh6oF3peMQb3sRpaZPL1x9gcKT+XIi0voQruLQB5u4p0e
         v25GZIT9BolYen7M3/HNj9XYRM+Q5VJKoqYNPrzQ3vsTJva0k7ksSmrLKDUYESt0apwP
         GYccdy2bcFoIocJnRk+sPfocFT/Y+ifzh1LGSuIBQJZbcbG22Cps1hM9Oa/4AuRiy7UR
         u+rmlD058+hFaFaOgT9Zjf/iqqOG6+Rhp4DwODMk8XJ0ka9oJKyo+mici67q2iA+cmiT
         f2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592817; x=1796197617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/rJwxOFAuUYoG0w11daH5oi3dDRM84YiGwVnaiS5js=;
        b=R17QlcQFecOXtl/HuFbOOPUNxi9y3p7PjX9ZcPxxWNOVSXk07nFM3OaxQduibR3xjq
         4XFTHo+9f9O07m3FNwiQCUJ7ohZiCeaCPm4AdFtUw0Xpr55xTyaAmKA+V3BPPortSmPW
         7YlQcQ50SjrhBifM0CcKMn+HhABJU5UxNuusdN1GVrHbCBHFQZaFMtXWWGSk6IvIp2r7
         EDO0ZfOadWMzkriPbOoTI5bTAeZzwfaDZYi6t6dV7oB9FVw585USNUJmflPfOJm8da26
         pUrHxfg7b2i6m7pHlPIgCegutqMQwuvX+vnb2pP4kTQj0amUuyCvZ9opjlQx4gIjIkzy
         OxOA==
X-Forwarded-Encrypted: i=1; AL+hErF7oMouhXGJHQYYvRdISU7ym1FtTyReF7EDslZl+ytNfLmiR6b5QYWQDvA3LzC1HP1RvAIIq6SsXkILqSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s+HBEMsqC4d8vC9EHtycQjw9BhLvjk7CsJCKz+bkG3YVChf3U
	KqYqOLH6CAJheOo4uMiqHiYSb0HxchsVvfLO9ug9p08L3xCiokj3a+blBpWZWa2S7BPdnXt0o7F
	It5enB5iaJWnX8M5aUbCmMAPVRcCb98M=
X-Gm-Gg: AZFdTZdv56fLi/Mz72RNBfIE03tv6wdGXgSWCAgWNsdG8bAEtoa3aOMLYs/PcstKxUZ
	UKfOkfmeDXxweM1Qbmp8KKKkz+Qk78YTREX+j4yERJWR5L82DM3QZWeMDAXaPAqtIwH197FZWHj
	iWbMi0RZeghcnyCPC/gdHdOFI318o8Tl4vhT59oBa29DIn7GbbEcRkIEzlute17sc6fg+Izi9HA
	5BE0uB8vYcsP0hrMH/vQUkOU/PEsd+fnWL8NmiJRNh3A0Yxip8DSpJksohTD/nZHarNC7KLnCTc
	ESJ2gTqo5OcpB+pIVyEnN6Q4Mb81j3m69WycWqC5YxYzmkrFbSP9ZNhlEbA7SC2yiYmv1QmXUYu
	1IoAErgVBCwmmgiIcz3+JkSjBUiMO0r9TysW6y4KK/1E2Ca7wMTQlTVMWMRxbSOp3Gg2sNw==
X-Received: by 2002:aa7:d643:0:b0:6b8:8706:8e93 with SMTP id
 4fb4d7f45d1cf-6ba37e843d4mr8822550a12.20.1795592816544; Tue, 24 Nov 2026
 23:46:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123221410.3328780-1-neilb@ownmail.net> <179550252639.1728055.4014817916838632741@noble.neil.brown.name>
 <CAOQ4uxgF6=QoD9RoAOPmxtvkq1jWf+gG1AsJzR=Kt3ROMA=X0g@mail.gmail.com> <aau5z6kck6a2efcjvzrt6gno6ljs4eioncgizeh7vfbc6ipkr3@hjxzdk5pvgmt>
In-Reply-To: <aau5z6kck6a2efcjvzrt6gno6ljs4eioncgizeh7vfbc6ipkr3@hjxzdk5pvgmt>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 25 Nov 2026 08:46:45 +0100
X-Gm-Features: Aa3M54o6U4varTbnF50WUavOdVKfl6Xl8YctE_By69EQZGlFRJs8IsX9InoQqak
Message-ID: <CAOQ4uxjXP4Zegb2Vgsv-yBeFmhvc8FT2bDKDcaM_t0=oJ5KpXQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Fix easy bits of the negative dentry problem
To: Jan Kara <jack@suse.cz>
Cc: NeilBrown <neil@brown.name>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Kent <raven@themaw.net>, Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:26=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Tue 24-11-26 14:08:07, Amir Goldstein wrote:
> > On Tue, Nov 24, 2026 at 7:42=E2=80=AFAM NeilBrown <neilb@ownmail.net> w=
rote:
> > >
> > > On Tue, 24 Nov 2026, NeilBrown wrote:
> > > > This v6:
> > > >  - fixes the autofs changes in 1/5
> > >
> > > Sashiko says this is racy.  I think it is but the original code was j=
ust
> > > as racy.  Maybe the race isn't relevant.  I haven't properly understo=
od
> > > it yet.
> > >
> > > >  - updates d_duplicate() in 1/5
> > >
> > > The fix was seriously broken.  Sorry.
> > >
> > > >  - uses a new version of 2/5 from Amir
> > >
> > > Sashiko has something to say about this
> > >
> > >     Can clearing FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN and dropping conn=
->lock
> > >     before fsnotify_set_children_dentry_flags() finishes allow a conc=
urrent
> > >     watch-adding syscall to return to userspace before the children's
> > >     DCACHE_FSNOTIFY_PARENT_WATCHED flags have been set?
> > >
> > > Thoughts?
> >
> > Sashiko is right, but this race is not new.
> > The same window exists upstream: if another thread's recalc observes
> > the 0->watching transition and does the walk, fanotify_mark() can retur=
n
> > to userspace before all children have DCACHE_FSNOTIFY_PARENT_WATCHED se=
t.
> >
> > What changes with this series is that the walk is sleepable, so the
> > window is longer, and in some workloads it could go from rare to
> > plausible. OTOH, skipping negative dentries may shorten the walk.
> >
> > The more important question is whether a child can be left without
> > PARENT_WATCHED permanently. Upstream it can: the transition can be
> > observed by a recalc from the mark destroy path, which never walks.
> > With FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN that cannot happen.
> > Every transition sets the flag, and every caller that can add a watch
> > consumes it,
> > so a walk that started after the transition always runs and fixes the f=
lags.
> > What remains is the transient window above.
>
> I agree this is preexisting issue. Let's not block this series with it.

preexisting, but sleepable children walks could make an
improbable race actually observable, because the scans are not
serialized and could take longer (I don't know how the scheduler
treats a dying process which has its marks removed).
Just wanted to make sure that the point is clear.

>
> > I think a proper fix for the transient window needs a sequence counter
> > of scans in the connector. Each caller would wait until a scan that
> > started after its transition has completed, no matter which thread ran =
it.
> >
> > I think we can live with this v6 patch for your series and deal with
> > the remaining race later if we want to, but I am not sure and would
> > like to hear what Jan thinks.
> >
> > If you want, I can implement the sequence counter for v7.
>
> No sure what exactly you have in mind but a sequence counter per inode
> looks like an overkill for this. A global one can get contended and
> a bit hairy to manage but let's see...

I had a patch with another conn flag _CHILDREN_WATCHED
set at the end of the walk, which covers the Sashiko race, but
leaves some other corner cases (see below).

Are you concerned over the size of the mark connector?
I think that connectors should be rare and scarce.

With workloads that frequently add/remove watch,
Sleepable children walks could cause a situation where
scan that started a few add/remove cycles ago complete out
or order with the most recent walk.

Only the completion of the most recent walk can guarantee
that all the children dentries are watched.

This is a concept version of the generational walks.
The _UPDATE_CHILDREN flag is redundant here
I only left it so the concept patch does not need to change recalc_mask

Let me know if you want me to post a patch on top of Neil's patch set
or in place of the v6 patch, or nothing at all.

Thanks,
Amir.

void fsnotify_conn_set_children_dentry_flags(
                                        struct fsnotify_mark_connector *con=
n)
{
        unsigned int gen;
        bool update_children;

        if (!conn || conn->type !=3D FSNOTIFY_OBJ_TYPE_INODE)
                return;

        spin_lock(&conn->lock);
        if (conn->flags & FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN) {
                conn->flags &=3D ~FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN;
                conn->children_gen++;
                update_children =3D true;
        } else {
                /* Walk that consumed the update flag may still be in
progress */
                update_children =3D conn->children_done !=3D conn->children=
_gen &&
                                  fsnotify_conn_watches_children(conn);
        }
        gen =3D conn->children_gen;
        spin_unlock(&conn->lock);

        if (!update_children)
                return;

        fsnotify_set_children_dentry_flags(fsnotify_conn_inode(conn));

        spin_lock(&conn->lock);
        /* Concurrent walks may complete out of order */
        if ((int)(gen - conn->children_done) > 0)
                conn->children_done =3D gen;
        spin_unlock(&conn->lock);
}
