Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457748;
	b=QmdTWqAmUkh6mFno5Cbcq2eV1cpozwHbAxiSjXRecGbnH1nXP0fWxYXIHCMr1rLE/0+1
	 WlEmj/q8mEzaIKQvS5xhXvCBcq/QCHBxzzSYNrB6n+A3TWjIejOXT/sJLgEKUsVYVJKzs
	 BTN4DKfjG+FUoHNYHLfQ+Z/94qZ9CpHRqnSgkp4Igme7lErPKLyoT6Xl3wHJuN8jpVafE
	 /b7449Tblq7aqLVTIPcSuHRy81T5GnTfZLWazqM9soqLgWWcpec0rOnn1bfGw88C8s8xC
	 2HkEhpgRwUTQ515P5mjGviCymGZZfld4YQtBp/jc+WMe7DmyJ3kHNLeiib27Ooc80gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nMsBK5JZkeseYTz3X1TgvJ2SrDeEmSZ7YqTTt41Yzdk=;
	b=huVGzlE3CCDBaqDTEG6RfwtK/WDWkwAsBDfJuO2bm6s9DQw7fZ+o1LuN5puQaljSXPcv
	 ObvTnj5t6EimI3nuXgkzP9NRQG4Ug+6gDGSD2iO/+VOuhtzBvlJAOKMwxS5qFD4DGO2fg
	 J5mVmPCtRqK+NG4EwG2gBnA8JBKuiBnvppvs/BHMCI3lVx/QXx6gRWxNsRJdeoVGLMwMe
	 0mHegU9QZG/GOUAFnnT90UGtZJvIszviWvljy4pz74yquJobEeCIndFfnezzM5+c44J1g
	 yBJAcdPd2nCTlT6XxLKGCSFg5ubM8CaEZCDsQVdWh7VL7YQzgMcpenn0pJGs+02jNig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAvQ0XWo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6AC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAvQ0XWo
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4cd576f2aso26772127b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457747; cv=none;
        d=google.com; s=arc-20260327;
        b=rfHa23iqZmRCwtcSVa0+h8VWlPyacZ/ccfBGEPby0hUhxd+h+2KZrrqsjJSt3oOjUz
         KpV5zYA8kB7s+mQejpY7BB/xwrP6D9TGsxIbJcie1iR4/vag9HrL64Um9AcJ7KS4a11j
         Jscfk3T0Cs/rrMWMGyLwHWaI+5ruhSLok/dEyGfqCrW3Luwai8ndp+jxPnZooXCUk2K1
         xwZW5w0z0CZR2ucwXJl6AKhk+PspAuUWHkTsyXBeuvssFKgArHf1k+N9JQIFeGqK0eii
         +siQYctoi2DL1MWe3IXaWTHcezdD9HNK2ug+B/aHLYQrvs3PyGKyaoioCxaoFvUWnBKj
         j3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMsBK5JZkeseYTz3X1TgvJ2SrDeEmSZ7YqTTt41Yzdk=;
        fh=x5LgXrRM2Dc3Tm1cxzqtwAt5je/oVXk995POctBVVQ0=;
        b=JIGCcHdP7/EWbBz0DcRcR+sdNhAvBSH+XSHohWWHGS2ker60bZgRJQNSjRwDdtlnzg
         Jg+pgh4MP5VqV6572j0RE1xPFHNir5QcgDAlC2uA/O2S5XvreVGwAEeJc0eGKsufShw8
         7eV5eSvAG5eSNjIIICzmb1rdvwySLCA2y/pULxg9U3zIVPLxmSz/JjpCm1EzqNB7Ru4n
         UgpypTm6rrecslxsZI0Q/UVOsaL0kT94cp8MhxLxPMFzox+K72HG/QMXFPFTLWKjnmx1
         8WK5XUKSDDSBBtxgB0RyXTTyyCZIbSZnayq2O7zDQqzhFtKEHV22kFCHMv/8EspqzAWg
         Okhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457747; x=1796062547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMsBK5JZkeseYTz3X1TgvJ2SrDeEmSZ7YqTTt41Yzdk=;
        b=QAvQ0XWo0tcExbNOFzJESQZNbHYBLhpD32HKNvni4HEhtOqZEL5GCt+suncaWlBUiO
         FZtlYyNOqn9GHma1eRgPcYdd0NoljW9zR1Rc3Q6xInR6kvJqQNoPNRRrvYNNLbRwErFT
         C5Xb2wcOQSFScBdI2yQWvbeXEHGwhJMNY699xitU3dlCIUs7wu1tGJEo+Yar4GHnXN0U
         wLc//ydgb6yiwdJhE/yc8kHeO5YrOdlZnMqS9IH1XC7S+sN200e2Re8+RSKxq2UlZI6C
         C4TtJme+P2FM5uP3jC74YS73mzHG34FPYNDILJ0QBlMq6nWOwr9hYQ0pZ6Zj3bui1vtz
         H+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457747; x=1796062547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMsBK5JZkeseYTz3X1TgvJ2SrDeEmSZ7YqTTt41Yzdk=;
        b=Wwp3TdEm8caWmAYhrMkr0qjzfFydA6n5aFylabH9uv6uFO4M21VuzUOPBtTMqW9m4p
         9QLx4Xl/3xJ2bpD2s/K2zmdjCuo4rYmMj0JVtGOsIlTN+OORCz3hktjEY6rj7azhJSvO
         XU563OPBn+im6ulHjweyxXjhqU7Z/AjT7MZ8YIs0sS8PaesJhFOtc9h6LZgrNdS0+20k
         5MIHxiMTGXCFfh2EBrIuoDV2OQUz74Wp3XNEL3mCGpVpYWH+Kw963SO8K5Y/sGh7L7kA
         atf6c3ovhfStt2OfhsMLvjSNXvib6TOUxDQ5mnehfoe44hafKG0NvBCNwGydecBr0XmB
         y4iw==
X-Forwarded-Encrypted: i=1; AL+hErF3mxdEBsC40HOhiWqV8mlNzHMThvx4Q8hH6CHyMk/so//49r7Buy8ns7ul6n4BZzWrT3KYvIh+x18Cm8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+suQjE5OFZsTtXemYvG3V/liYFCLmH78n4O/LQgeEHkrw5EqF0
	fvMdlmJLtl6cpo/ZMI/QJONvEksMNMEsd7ZbYX2s4W9P1f3vkOgbw1C0/rI23CgKaxApU+4I861
	xFyKwPVHS55haiwPNvb5V/zHAI3QdjT8=
X-Gm-Gg: AZFdTZdXpUrpuHsGrGRIFWIo0jD98W9ef3b9CmA5KA8eZUSeNWUg0m5Dfbd/+oZH5Gb
	vtz/Kw3h/0gproPYF+VlO60Sd+288+QsapRTSomRKCYg6kd0bpI8lN8BtP9/u5iuGMhMzqn9B0q
	/MWsMITez194HWugFP7upmMZ/10OPr/6Eexwg1etcjf/SjVvBC9uRT7pYhA4lS58t5Pb1YpQxJX
	szdutIyd0S13ZiWhBYn1N6bD5YWzqQemuzIAoDFOOOXyemaoRwQgXsawP94n8wHtvQAVRFeOvUV
	PsDGRlCqX/0LOz1GYdRlZGWwJOovVxfSo7I1YrZNR7xE6tAxZIooDSG9+8WSp085NibHHWuWQ8q
	mepi47u6751z1/5IMN7A9R3HkWPLGlqwZePKazSI+wxokNfNVo9NVHhZ7j0Zi+wvRT9cettLUNf
	oY6BQBsi+7rueoNrA=
X-Received: by 2002:a05:690c:797:b0:8ae:87e7:9ab8 with SMTP id
 00721157ae682-8b5205437abmr48277337b3.67.1795457746844; Mon, 23 Nov 2026
 10:15:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-vmlinux-lds-v1-0-49818f3f5cc0@gmail.com>
 <20261121-vmlinux-lds-v1-6-49818f3f5cc0@gmail.com> <a6fdcd6d4bce5ace3b4e34d1393f5cfe58e17c0d.camel@perches.com>
In-Reply-To: <a6fdcd6d4bce5ace3b4e34d1393f5cfe58e17c0d.camel@perches.com>
From: jim.cromie@gmail.com
Date: Mon, 23 Nov 2026 11:15:20 -0700
X-Gm-Features: Aa3M54oFOAYf6UTkbI4OQkVdZIf4cCrnHVvp22FVwZTxOnodSxK6PbkkLux5L8g
Message-ID: <CAJfuBxxJMwrBKTrwC8RoLKRs7uBBPrgfWmPom_r49JmnOPvMvQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] checkpatch.pl: generalize linker script macro exceptions
To: Joe Perches <joe@perches.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jason Baron <jbaron@akamai.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 7:27=E2=80=AFPM Joe Perches <joe@perches.com> wrote=
:
>
> On Sat, 2026-11-21 at 15:49 -0700, Jim Cromie via B4 Relay wrote:
> > From: Jim Cromie <jim.cromie@gmail.com>
> >
> > checkpatch skips macro-rule checks in linker scripts; 3 of them
> > explicitly check for vmlinux.lds.h, and 1 (the 1st) skips on any
> > *.lds.h.  Generalize the 3 to match the 1st, including the escapes on
> > the dots, so they're literal checks for '.'
>
> Please remember to email the checkpatch maintainer too.

ack.
I missed that b4 prep -c didnt add you.

>
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index b8b64f720191..318e1f2577fd 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -6016,7 +6016,7 @@ sub process {
> >  # Usually multi-statement macros should be enclosed in a do {} while
> >  # (0) loop.  Grab the first statement and ensure its the whole macro
> >  # if its not enclosed in a known good container
> > -             if ($realfile !~ m@/vmlinux.lds.h$@ &&
> > +             if ($realfile !~ m@/\.lds\.h$@ &&
>
> Probably better to have something like
> my $is_linker_file =3D '\.lds\.h$';
> or maybe
> my $is_linker_file =3D '\Q.lds.h\E$';
>
> and use that everywhere

yup.

>
> > @@ -6175,7 +6175,7 @@ sub process {
> >
> >  # check for line continuations outside of #defines, preprocessor #, an=
d asm
> >
> > -             } elsif ($realfile =3D~ m@/vmlinux.lds.h$@) {
> > +             } elsif ($realfile =3D~ m@/\.lds\.h$@) {
>
> >                   $line =3D~ s/(\w+)/$maybe_linker_symbol{$1}++/ge;
> >                   #print "REAL: $realfile\nln: $line\nkeys:", sort keys=
 %maybe_linker_symbol;
> >               } else {
> > @@ -6192,7 +6192,7 @@ sub process {
> >  # single-statement macros do not need to be enclosed in do while (0) l=
oop,
> >  # macro should not end with a semicolon
> >               if ($perl_version_ok &&
> > -                 $realfile !~ m@/vmlinux.lds.h$@ &&
> > +                 $realfile !~ m@/\.lds\.h$@ &&
> >                   $line =3D~ /^.\s*\#\s*define\s+$Ident(\()?/) {
> >                       my $ln =3D $linenr;
> >                       my $cnt =3D $realcnt;
