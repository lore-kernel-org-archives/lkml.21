Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780980;
	b=ZFGXGUyjYBtyrvpf63pScBfgv9NwltJx8tsJf50NHtDPvqOJFkSbsBszNtCj5fC8VkPJ
	 RrzEpXv9rkms5Xg63PVX1YBKFwNlz+Uvd7sMH4m8fzFnIyq028ILg1YRNpyQyamYeyOX9
	 x1x5KqMayyuihxfsB6B+KnmOdfIFUJSPaNy2uAPk66sr83rIzjzVPDyQx9lgXhifywYpG
	 f0Dmpaw19Dms3+40eGeb5kDmun2YXnvf2wVYNGv24CIdKiabEhcyMYRgjvrrNv/qsPMXY
	 F2l21XZUEokg4PpfRie3OinARTqfBYzU65WjVgG3tBhTFd32GaQxf2aC7D4t9GauQFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
	b=ADUZTkS9+18xuT1vV3RXk5/ARx6Nm+xpXLk47kv+BMkRWmc8DwJ2jxFV+k62h4gyVCHo
	 nSKoA1gtUKrtoxj0EGfBk8bVaYxEkr60mdNui969SFAMbY2Ubini3rPPnOexINsB7jqdS
	 6qr4KJgjnsJ7qvKIrtkqUrxfcj1RIWDwu+CfumDb3J/eEOuKxTgno6HlMRGW7yyRn3L4+
	 GSJDb5D8qDMJl2qXLZ8diU5ikpWktNsy63B1uszBN0SJrJTFpP+KfZk/3QJqGppJX9gAc
	 s411O3nvb6Eqzq1edNl0WX4Yz1citDB0b0z/ZQTvdJz968CZeJrDEvhpzi1oVHJQYcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnFA07cx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C1606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnFA07cx
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso63562841fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795780978; cv=none;
        d=google.com; s=arc-20260327;
        b=RyBSp7zT9HXkY2wDSeQPFc3u2G4oYGtxROeV3jrUOwr2TupmhYRimWv0az7/F0Ow/y
         vg8Pef1jC/1aPls/lRP7a+LsuU2JQCgEc2PcR+n40HHaBn9bNjHtf7rOHuvemdEKzwcZ
         nmHgQAVjTyzhy89jyiKi0qJl5izF9VGdrchGvw0RwO/ObnDIcPMu+Exkh/1+aUIy54Zc
         rC3/dQH9WqBUUWvaiYmcUrJhwDlqBgNT9cxdKubbclV6p6u36RPhOr2TKxsClbgbDRNv
         h/IDWzZ+1hSBAT+2HhS1/EX0Xh01n4C0tYeVprIs2rKTXvuOBoaIvXC8TmkVfWkBGcHB
         oRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
        fh=sKVsg+fuGO6hWg3rxIITXz7T4GboCQTI21aWatgzNmU=;
        b=gWJNPHo4fD/ADRfQRjF4w+S3wXbi29V0PZ6u9WRyxIJgziBySXNxjNFYdDWXZTgtUp
         shMvGrFRjl7FbHhqiHEVWa4uyWFxfkRqAXmVn9ij70Kf2MWUMyhlgOonkOpZbU+sZYa3
         G1FyppiY2pseH51NFq96NaWyAFqEnQ3uVfqKsFsOBKPQkgu3UKlO22F1nMrlVGjV8v04
         LyYw1gVLkSRjRRpUbaM0Z9OTsYr/jX6yXjaynjAA41m+bU1FuBMpJZD4yPF7WXzUFv/L
         YuobjDFNvT04KZ7LREMGPpKGKxuTm9VkwrfAyRfmZu13z8bYEeF35VCdeWOZjp6X5tnE
         mnsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780978; x=1796385778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
        b=SnFA07cxVyuwSSQ2WlqVldYscrENhFj8PVisFe6EUr/u+zjaGcOlyf+NO4/VeKXXX7
         4E5nqOC+Z3I662UCySIHIiaMwrjJK+ZjK9X5FK/V848T+A65ClvPxk5bvJvrsV+MWdo/
         JIM89r7vSI7FFB67/tWpYnfwZs9/cVksgSfXEE4llKDhqleU1ZWfSy+N4AE/zsZMEKkf
         FXtLBubySwAUA91pvO8XAdbubi6E7QFc7BDt/+z27xlpQGmIW0sbpzCnfaiUYkOVUtJK
         S6zwuiZQCA+1rzhAC+jCChTTNWgaEmMmc18deOG2Q+9ze1ubEHLrjAXDP7U1S018fipI
         jn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780978; x=1796385778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKBAqoHb6dKCB8lGd+jVvxodjbVVN2AMGRa9Yq/Mby4=;
        b=WnzfyCYk0cS9GgN4BDOYfX166s2J/49FsUZ8exWU+s78CkVI4w2wWzau/yv6KBSt41
         m/zam0WwyzU3yrKutCxaFSNEeetqeTlgxv+q9Ifgy0TUeyRPbceCdMorzQeD0BBkpBTb
         53BytlZDBPDSclDjy5jpju/m/FC4RbXMSIphvPhGLwdaKJ+gMgGTvi3hluWEwMCWFppo
         BzDDTZqSQVi4Ceo4+DBlrzzsRR0f0IAdMpAAz4o/QdbdQjyUwbld49NcUr/uXRuY15P6
         00aJWhraoPnoHXMeFKYeiRujvGyyx+y+74mxMlktilwqJQhYcsISHMb8uJ+jBQWJmTgc
         ffog==
X-Forwarded-Encrypted: i=1; AL+hErHe36Xfm7jNJYs2o1i1Awv2nkeCWq7mTEX5WpL3DqWPw4YLdhimPamm1D/beJb+rQ7dbaUWeX3F/JptiVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EIYZSnA0ax+RrgA1wj6pxqoahGSaPX7NtXbgLr8zyyXD2dKrs
	QUbneZUgpi/vU/1S2y7zr43hJ7yCNAYBK8i9yutfWn9Vt1CbelHAGcdAHWEO9Xw+6zYWlrM3hqq
	el7mnNVtMel84Z/01bmsxujozsUc2TLs=
X-Gm-Gg: AZFdTZdLGwO44utleTlk2NBFawu8o71SdnVKAA+elplv6XW203KG1BCO3MvHYxHwbUz
	wTAa3NKoZSR3ST4J/lJPs/02YiYkwNYXehwVxxnbpWKyWZtINMgX1LGYGfx8pXlkx4yXk2RsN5y
	ISyyXbaXeh6qr0G8mSXAYvNiNOJeaqF3XLBq8L03jK7XZ4dHUndf2qGTrHr56hUjwDHWIC4TyDh
	U/uNNQuD1+9m02JUBxq09Z6FTVom8thDExoKhLlgES36hxW1IFevlYIRPD2s+x2H+mvjERmaps+
	L4kGJiNj2lsPTQD+YhG/rcX6Zwak+THrtYZ07dmPMlGpdk2MfvruF056CvcjB5nZrj2yKOwj6lR
	esjVqpsbdx63Eleitq96v5N9GVyP57c6Jlqritr1Qxxcge4v2uHF9QG3wlm74lfjYu9n92A==
X-Received: by 2002:a05:6512:1148:b0:5bc:cc46:1849 with SMTP id
 2adb3069b0e04-5c1bc874b3cmr6981033e87.54.1795780976912; Fri, 27 Nov 2026
 04:02:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126163114.403846-1-koray.fra@gmail.com> <20261126163114.403846-3-koray.fra@gmail.com>
 <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com> <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
In-Reply-To: <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 13:02:44 +0100
X-Gm-Features: Aa3M54ohq34732gC99y698hjwvA-0NF3EsaW7G0zij4KAugMs04c_-FFLASygdQ
Message-ID: <CAOQ4uxgzmB0dEpQCVGKOc8reJ6OFV=BxDMgRW81aKiCMwDSn_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to use xflags
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexander Aring <alex.aring@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 12:38=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Fri Nov 27, 2026 at 12:35 PM CET, Amir Goldstein wrote:
> > On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
> >> legacy FS_*_FL flags.
> >>
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/crypto/hooks.c       | 10 +++++-----
> >>  fs/file_attr.c          |  2 +-
> >>  include/linux/fscrypt.h |  6 +++---
> >>  3 files changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
> >> index 149498bdab94..52d6a33fc9e9 100644
> >> --- a/fs/crypto/hooks.c
> >> +++ b/fs/crypto/hooks.c
> >> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *den=
try, struct iattr *attr)
> >>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
> >>
> >>  /**
> >> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_S=
ETFLAGS
> >> + * fscrypt_prepare_setflags() - prepare to change xflags
> >
> > prepare to change the file attributes with file_setattr() or one of
> > the legacy ioctls
>
> Ah yes.
>
> >>   * @inode: the inode on which flags are being changed
> >> - * @oldflags: the old flags
> >> - * @flags: the new flags
> >> + * @oldxflags: the old xflags
> >> + * @xflags: the new xflags
> >>   *
> >>   * The caller should be holding i_rwsem for write.
> >>   *
> >> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
> >>   *        another error occurs.
> >>   */
> >>  int fscrypt_prepare_setflags(struct inode *inode,
> >> -                            unsigned int oldflags, unsigned int flags=
)
> >> +                            unsigned int oldxflags, unsigned int xfla=
gs)
> >
> > This here is a backporting landmine -
> >
> > Changing the semantics drastically without changing the helper name
> > or signature.
> >
> > Please rename the helper something like fscrypt_prepare_fileattr_set()
> > so that backporting mistakes will be caught at build time.
>
> Yes, though, would it maybe be better to just use xflags_to_flags() in
> the vfs patch instead of changing the fscrypt function at all?

Yes, much better. I agree.

Now looking at the /* initialize missing bits from old_ma */
hunk my reaction is to look away its huge and it should be
using helpers probably called from within fileattr_set_prepare()
itself - because if this is de-facto preparing for a set.

Thanks,
Amir.
