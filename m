Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022897;
	b=n6q/kKXYCNukyDq3H+bkxiWyfCBAR85Lz9w44rXFqdV2nSzh9qBBIPu9gjGHh7heY0+Q
	 oV/BpF7Fg8MobCxYXKX2vEYHImSjcdcA/AyJhojBVJEjKBovZCCtCBtXz8cQ6M79g/ZRW
	 FMt6TiivAxsysLXM4OrQK+IZ2GUHTMPXc2j8zFahib0EIHggspX/QTRw0guuOKBDgy63L
	 QyCWmu7cvwcRf/v2VRX3Q96pwuGRSaJFtKB5tIF8eMR+pXgUBKOmykIu+HtkfeWa0XW/v
	 Y2nmjkDtWh+kpgx3ret+iYx95rTBaDIQtYra5Smldb6xyAQX63Izd5RraLLD6WTIm/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BuqsxlOJVL3aXO3esMarU1UAxW5/JG2MFfneSOcfhAg=;
	b=4Wpjo54658C5DYNKowC1lyzr28SaZL1M38ATzLB+dquhszjjzJVZUqS9ExcG4cnQ5S6F
	 kjDLZCGEBvti50T1vPFoPt/LhrXuVetSW0Cqpn/WfOV9I7PsvYxHbYS+OooZ8NHr8zvfU
	 vNiEuyquYkXKYpgYlffTTR/RhVrrktgQm1NYqgC0chfYYpjdckKT9REMQ6cMRqhAQDHU7
	 DDXzHtKSXH7x1XqHitUQcbBQ6vuXVRABr2EDzhzLShlepmdhpRF2pJ2OVETxMe19/I0GM
	 4QXVMDrQvZZZX7O1MV6zAMZ4iyliJIpNO5EUnvK8OrGO2tepStJMIuy2L9dGeR4IdOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0ka0oEp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301DE606B5CC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 301DE606B5CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0ka0oEp
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso1472595a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795022895; cv=none;
        d=google.com; s=arc-20260327;
        b=LGyFAVw2iDU8KCSdYULFDKtU1NS/QZCqDZvlj3rEps0qEE3sEX//keWJu1O4d9iGGU
         KmcABYRcGTH8rbV86HAu5/ECb3+Fd0qLgRXChVWjQohixcGR6pwIX89aMiF+pvR9Iuvz
         RvWRq86+HO2SfLFm9o4SJs1zTK2Xar/38nZH3GeD+oWZLidq8Bb2o7/Yjh393FESZjEG
         hRNvqQsrWZ7RW7Zl//TF/gQ5qQSS/soNYrvNgfWyu1YDEpkLo+zXiggrSxSJveXDkHKV
         l5VJ6iAeTuiiYOW0PxRpyCPMfIbi9a9zzr1gGTLSTQYeZjUr1QEMVFkCas0PjgG69ia4
         Oh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BuqsxlOJVL3aXO3esMarU1UAxW5/JG2MFfneSOcfhAg=;
        fh=v+1jZX5EkMW2p28XLSbs1/YmZJkyV8urC4a6tSLkaQ0=;
        b=TbviYwvAe491sqf4Tfms4uEhTxB8Psa12iD0yDR9gADF0EmpR1WiM+aRnOeCET5kct
         +o1pMaJ6dBkO+E1p9zgJ9WtC95zeoXhmnVncBuGuOkODAl04gL5gMuoa44WEv2EouMgL
         lCE2I6/EgqJfHxEbAYKWko7El+w1uKB0VFYhMyuOzr5kFyR5RXUViWkM/crr1WGyQg5A
         OZKKpzBxBSsrRFaxJQ+eB1NxFLbF6UAIwD4K+VL+2/ZxTq/jPgleuidqjxBRRc0O3WPp
         R/v6bDe4qQFI/GXshWxuWOE2oKLadsT3r7FExgcbjSUBjD7XrllvN5mGyHYtSa9q5pVB
         8sig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795022895; x=1795627695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BuqsxlOJVL3aXO3esMarU1UAxW5/JG2MFfneSOcfhAg=;
        b=N0ka0oEpdc1KBRETx6vJralQzXZsG33VIDKTqxcReCenPkPMzjBbHoAj8OnXpSilUu
         A1wEHuH4VLiE5fKH/269FevCSo8T3wfaLyXfhAREdtktxpz0vbVp6YSGOZC9WgRHlfHu
         hoYAGmif14It/vlu3AnFqhAdg5yMe1Sg/7YsqVKfzrahaV9yv6dPM5UvmTS8082UHuOS
         06xG26st6EFINK/uHEn9QyGnzXtLRyv2nEX5V1QJmRRD5JIk2GNaN6rdZ/XNjZmZiO1f
         Zdc+3U9kshh5a/xmDA1xX5XPADDc4Xs/h5ZDTj/nHFWfmM/zzjQzTzWGBfhNq4veH5qI
         tsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022895; x=1795627695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuqsxlOJVL3aXO3esMarU1UAxW5/JG2MFfneSOcfhAg=;
        b=P4xicdLSi/XDJEe2c/UaaLF4uROsK2ZckWnNA7yCMUTofQ5toy53WYBuHkgZi92o2R
         byj0zLvavbir+5ZDbEPkfEi1Q7Qkvidjh5b6AMU2AB5HA25XHy2Gc2mZNctm6qNfthgN
         /OvjynuChh7lgqthrHdYIqCCznfe1QPwZdEvuzEyiIitrzEDvgDhkKCNvIGFkkguNW8r
         m8v+NSvrk/eeodiMIKaTrzJOWYag+at4Rp2lLgqatyC96f1APaIz/qcaFlPBpnBPdnxx
         SJPEdkQm8UnuYrKl8J/F321O6d0MXbqXUmIDw2LBEYhgTkZiqojUIx1y+VTo8X+8vISN
         pk3g==
X-Forwarded-Encrypted: i=1; AL+hErGG051dU8s4mxEPfpapDcJhBP7HN8ZIyDSAxpfzkgI281j/r2pvu7du1fEWVh1qMlj0hXGRvb0jnRbjTZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+18Zk8EO9KNdN5GswE973eibe+58+LuU3Qh3sZgTbJhA0OfyrI
	i9DUWo9E4GYfWN6pJ1+vqq2WA7AK1tAFRBD5jQJ7IoUePgPgGO+1wwmH2DDP2QfJlCBQal8zZwy
	+Bdj9c7YUT6uoM/sSeNsoaEtxroFSijw=
X-Gm-Gg: AYBFou12SEMHfDVvj3imlLF4vQQE3tDnmIr5mtaRJNAcgpZMgqodsgJqN5iO3CxPjG1
	KmIh4sdYwnBECB4/JnRnv11igskQ2HL/qIPRm6AzlJW4UpN61LjjNe3RHU+0H5b1DBgpD5HounM
	rQTdJ4VYaBKvFBLZMoxS7N0jJCUAmRqMNogZLsYO/Lm4a2V0zILvlAZY7Za3ze7xLQomuFbEjxh
	lgL7CgB0f4KBWWXMj0lv65eLvNjkwj59UZpmJhQBFMptaZ0GzoHEyJLX2AOw1/sE45JbF16ZCzM
	j9dCKe75Ewcqdd8NjiB8Sv+x65H0n7ScdF1jfIKGdI91gLDL5WgIjPWONTaPkA6c8jleEX97Bc1
	pdZRSW2PsdJ30H5hdoZcrOBqe1QNDifa27VdFLtU0cZi41z5rGLOeLhg67uIOiyaB4oLQUA==
X-Received: by 2002:aa7:c719:0:b0:6b8:7e86:3e90 with SMTP id
 4fb4d7f45d1cf-6b88810f98fmr2191340a12.38.1795022895320; Wed, 18 Nov 2026
 09:28:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261118142613.be3r3s6kobkkxnz4@pali>
 <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com> <20261118151605.lqtn5fz423kuswk5@pali> <DMYHPLWKPSH3.MUM1IIZZIWNR@gmail.com>
In-Reply-To: <DMYHPLWKPSH3.MUM1IIZZIWNR@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:28:04 +0100
X-Gm-Features: AclHuK_OBRtHc7-5KG7akP_YkM4KJWR2TZsgDeHOUIp0HPbMp3zus5S6xDYf1EQ
Message-ID: <CAOQ4uxiwpdC-fKkqS5kiZ515q9MenC0jX4USV1idN7h2njx45Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:50=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Wed Nov 18, 2026 at 4:16 PM CET, Pali Roh=C3=A1r wrote:
> > On Wednesday 18 November 2026 15:58:02 koraynilay wrote:
> >> On Wed Nov 18, 2026 at 3:26 PM CET, Pali Roh=C3=A1r wrote:
> >> > Hello,
> >> >
> >> > I have just one issue with the userspace API. It does not allow me t=
o
> >> > figure out what is the source of statx btime field. If it is fs ptim=
e or
> >> > fs btime because this RFC implementation is mixing both fs ptime and
> >> > fs btime into the statx btime field.
> >> >
> >> > I have feeling that this is quite a mess in API and I would like to =
see
> >> > a clear distinguish between btime and ptime in the API, like there i=
s a
> >> > difference in the fs storage.
> >> >
> >> > If the btime is used for forensic analysis then somehow I would expe=
ct
> >> > that the statx would not report / not fill changeable ptime value in=
to
> >> > the statx btime.
> >>
> >> Hi, for native linux filesystems it will report ptime as PTIME and bti=
me
> >> as BTIME (also semnatically).
> >
> > That is fine.
> >
> >> for the windows-like ones that only have
> >> ptime (semantically) I think it's reasonable to not expect btime to be
> >> immutable, since they are meant to be used with other OSs who lack bti=
me
> >> semantics.
> >
> > The problem is here that the RFC statx API does not provide this
> > information that the fs lacks btime semantics and instead it fills
> > non-immutable ptime value there.
> >
> > I'm pointing only about this inconsistency.
> >
> >> > It would be really helpful if the statx API on inode can differ betw=
een:
> >> >
> >> > 1. btime is present and its value is ..., ptime is not supported
> >> > 2. btime is not supported, ptime is set to value ...
> >> > 3. btime is present and its value is ..., ptime is set to value ...
> >> > 4. both btime and ptime are not supported
> >> >
> >> > This should cover all cases of different filesystems and also allows
> >> > userspace to do proper backup of both ptime and btime fields (if it =
want
> >> > to do forensic analysis or anything else).
> >>
> >> These should already all be covered by STATX_BTIME/PTIME and their
> >> fields in struct statx, the only problems are windows-like filesystems=
,
> >> which IMO shuold be handled as mentioned above.
> >
> > Exactly, I pointed out about these problems. I somehow expect that the
> > new API would be generic and uniform across filesystem. IMHO it does no=
t
> > matter if the filesystem is windows-like or not (there are also FreeBSD
> > fs and also others which allows to modify that time). So better
> > description is fs belongs to category 2. from my above description.
>
> Ah yes, I used windows-like to mean "only have ptime semantics", so same
> as your category 2.
>
> >> Of course, as in the other discussion, I'm open to changing ptime
> >> NTFS/exFAT/... support to remove btime altogether and only use ptime f=
or
> >> their own crtime if that's what wanted (I'm fairly impartial on this
> >> specific issue).
> >
> > I'm giving some ideas how to possible handle this situation:
> >
> > 1. do not fill btime it at all when it is not available (remove btime
> >    altogether - the case like you wrote above)
>
> This would be the most semantically correct option, but would break at
> least 1 script/program/use case.
>
> > 2. when userspace ask both ptime and btime, then do not fill btime
> >    (remove btime altogether - but only for that new case)
>
> This probably is the best compromise.
>
> > 3. fill btime with ptime value, but add a new output flag indicating th=
at
> >    the btime is not present at all and instead kernel filled ptime valu=
e
> >    into the statx btime field
>
> I don't really like this, it adds complexity and uses memory/1 flag big
> for a single specific field, IMO it's not worth it.
>
> > 4. let statx btime as currently is, and add two new statx fields:
> >    immutable_btime and ptime. immutable_btime would be filled only if t=
he
> >    fs supports real btime (so not for ntfs/extfat crtime) and ptime wou=
ld
> >    be what is currently in RFC
>
> I think this is also too complex.
>
> > Ideas 2. 3. and 4. should be fully backward compatible as it would
> > affect statx output only when called with new flags.
>
> Then 2. is probably the best way to go forward (maybe I'll include it in
> some way in v5), but I think we should let each filesystem maintainer
> decide if they think their users want to have statx report their own
> crtime as btime, ptime or both (native linux ones would of course
> report btime as btime and ptime as ptime).
>

Guys,

Let's take a step back.

If this discussion is proving anything is that the btime/ptime
duality is a big headache and it's going to be a source of confusion to use=
rs
even if we come up with some smart pants consistent semantics.

As Jeff writes, I think we should consider making btime mutable
be a per-fs choice and not an API limitation.

A filesystem can even decide to store both the forensics btime
alongside the user settable crtime.

There are some precedents in xfs with settable UUID which is
a different field then the origin UUID from mkfs.

Fs that have immutable btime have a few choices:
1. Keep it immutable
2. Start making it muttbale (like the Win fs)
3. Start making the user visible btime (STATX_BTIME) mutable
    but keep the forensics btime on-disk for, well, forensics

If btime becomes settable via options 2 or 3, this could require
admin opt-in (e.g. tune2fs -O crtime).

With option 3 the crtime feature would be ROCOMPAT
With option 2, it could probably be COMPAT. Maybe.

If we accept this story and the major fs maintainers are
in agreement with this plan, then I think the missing piece
is making the "settable mask" visible to users via the new API.

IOW, we need to somehow export FS_XFLAG_RDONLY_MASK
to userspace instead of only exporting the supported mask.
And then with the addition of xflags_mask, we could also
-EINVAL on users trying to set readonly flags/values.

Perhaps a single xflags_settable_mask is enough.

For file_setattr(), xflags_mask is anyway a set-those mask.
For file_getattr(), does it matter if we get an answer
Filesystem does not support casefold on this file
OR
Filesystem does not have casefold on this file and
you cannot set casefold on this file

It's kind of the same, isn't it?

What do you say?

Shall we drop PTIME in favor of "is BTIME settable?" API?
Leaving STATX_BTIME exactly as is.

Thanks,
Amir.
