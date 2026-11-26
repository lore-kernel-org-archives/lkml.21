Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795691899;
	b=nSL41ubTKfQXb4bBwzTv5W1+2a/VyAWN/5nWdeyv85Jz4JWL7GNh0g5XfK+d8o/eJ+4r
	 8sAzxyoBWHxyMnQ3VKvbj7V60UQq2UelHBbemZNojq48uOrkCVSSf5Y5JDAyVIK7dW15H
	 BQdjbjll9BQyERvIwpaDW1v7p+KcqzNPaJErfRTw8Ka7QZ712uiIc1ybThygZvR06kkiS
	 J3swiQ9r5/Uz/XaaOVxj6P7yLgy990BxBU8x+QIsQf820wvYABwDnerTy0u51jLR8TFtQ
	 4lPV+Ry6ZA5gtyeXYHdZOvD5GMoqe/QYEWG82lnyt/BFitEXnEOB0Fyd8N99NC3xGfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X8WwWz6JnS6y65umA17S2axWzHpMAWvbUXb5Ah2q0Qs=;
	b=1HB3vK6UVndH8eMc7qRs1IisuSn+K1YAz2yH5Qs64kpLqevDS4r6m5VwAO1a3GVRi6Xn
	 CUBh2VbGLxriwTw7AiWK5lU9iKmNN+Sh5eAv6tL1rC/EHIQY7ukLXcmJnB/xTsgQ+P7Wz
	 TV9lmcQe83vwds2nA+tAU21ko27V/DnokrAYk/MOmulH13TtgbNO5jvhNJ5yoZIXKqjmA
	 yIkPtEx3oTpQp6KaLnwrrOWVUVPKLbHZdXC4RL0d55x2BSGgs7VrzK4Z9EtupU8x2pxse
	 sF2DUSX8llq/V4DW0nC3Wk/wMOz+N9KjND2Bq2uZZPoKBbAJoXDPTUzfkOz6f+ig+rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQa1M6mK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DDC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQa1M6mK
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5133831027so967521566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795691897; cv=none;
        d=google.com; s=arc-20260327;
        b=JwTYyVktfKYHewvD4CBhV4EOOcKcA0Oc6+uB/ahjd9YD+p9mBmcfaoLhbcV8gXgABL
         5PjJRLVd54E1YMd1vfpdkSzF20/7iDXmwNG59+yCTmPVWs4Ca+E0EMqL0n3vqw2zNc8w
         d5tjKT5dmIN7XRh7an3yb8p9E1nRUSPn0P501g8zVMZjfTW9E8jbZZ2w6B0QNoal0R8H
         yMs062Gx4K28CGY4q8kzo/ulA5Xmj/ysbRZUc7vCepnieNOoFwyAxxb8sguXHHdRd/RM
         7dq63ghBXL6zjlbW6nDRCPLcdL98hUVLzznG0jm9eRAa5w3x0MUqSNOjdhpQB9bku3n1
         4EHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8WwWz6JnS6y65umA17S2axWzHpMAWvbUXb5Ah2q0Qs=;
        fh=MX19EjQLzwnESUdIl591La5Yd7EPs9oK9STMGJhABy4=;
        b=J/fNMjTgCSkZy+nVrXvRcC4o2Tzpb0u8FGqzaE2J7prS23PEZvwUlGJ/83dVBSz8uL
         WVJzCfrHwM682C9F/4ZQDJ/JKWFbKGmIO1bBxmeDJWafY6AqjwtJt45StkPcDwUFPXvJ
         FQyCg3gj01w6413+G0GsxvA5qSBkv6Jlb9iYwUE1gbrirGzWBLXT3ofCJNEiM+1SYcf7
         oVFBUtAknDzSaT7DjO/GP8D6xFyyvE84RPoVUwhvvhPm9jhWjT3kt+u8pSpQHUObNvhA
         JVzDg64zT+D2Elkz3JZcRhOb0tSTHqGtnBYllQXHoORPSDCg1rTw98+vr8hZeFNqSZdH
         e8Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691897; x=1796296697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8WwWz6JnS6y65umA17S2axWzHpMAWvbUXb5Ah2q0Qs=;
        b=TQa1M6mKPCJFjBUSMOQU0t3e7hUnaXCb9Uj9gtpyXJKSLALQ3+MPJncfJh/ct231pB
         uGCFDx/Ml3ajuFfausEbI+Uc1sLgJxzbWHT4ln0d1tCQuq1iapilG0D29JPVjKKnHwBg
         zjYaHfR0uROA3tOBZpo1ArWIFY3kyVEgDLRfCPP+tG2Cw/ZrtnpQc1kIK/DzXGUuBO31
         usA6Nc4yhic443m+UygHAlqBQ2x3JdnAOPlLlMCy2MnVCY4J6x2+mLrmzI+JksRxh/e4
         kAkH8aRnl/UBTnrrDZkrFmt485Ux/eLIFuRwqT25Uxkk+PwrSI9rxL825UoURyxYHhQy
         RQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691897; x=1796296697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8WwWz6JnS6y65umA17S2axWzHpMAWvbUXb5Ah2q0Qs=;
        b=Tt3D+g8QZPKzvOEoYThZfQ6LxOdUOUR8c1X2BUSKZIy1zua5KWbSf3VyOOczg85Nps
         zpWWOaxwIQQvsxF3YJGe70PoiWmdmigK0UrloX638OIsUQ/hirIsIgRAuEvefbeixPYt
         KDjDPIhrQyr2WygS9NEae4WxSAncNG5dK4qoNQNBEAdr2v+X3GOsB3rpxjMKKXmvi939
         SM+uhv3QRwija7QijuYlR4UluqZrN5gNxjI1NAcLlO5hgn4USBUBwJQ3jqGn5kHMyfAv
         IGnwGT4CgovAzDAN9+T7960c41ovoVMQaE1DIgoIJQHoI7NaEbrEE16qMlpZVFYi7fri
         H7EQ==
X-Forwarded-Encrypted: i=1; AL+hErFBY6/f5JZ0Ar6LQaqtatxkmklSG78q2rjVf/uOsdA7mAOG8UlrfMyQ+V41WAtWZBXlXGW1hq8H66PODuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GwDBPinarLqwxnaMwjqmwEklFvJ4cMIP74ONociv7UZjTyTxp
	0ttpJCjnfH3ZxRWYoo0FMfknZYafoiDen+hSE9bqjS1rgGE240P2F5TpdfGF4AvJkrsLCnnFlMH
	UDwE+vKITW54N2p7UW4jnglxhW+UG2Y6DSQ==
X-Gm-Gg: AZFdTZemXIelQ5ibQNs4A/4lFAtWPmspsvcxlv5aJnwjNYpSWsMZTqQ98vflFv7UM9N
	Ajulvy8QIL9dhboBz+nfFAXpV82ER1200yS53eLGUEZ43sWFW87HlxviuADq+Ac8K12TtOvJ4l9
	lCc3jMLmZOv9erYvXtLU2EsVJIFzRZVr5gcaNrcdyepk0kG/1JuJwvb+BHtpvw3WFME/qR3GNRt
	OdlcGbbdR93dnuQ0fZWAdJlFYm8+d8/v9upgOCB+NaTiswqxONJ+V5WOcfOf5n93weJeun6sTjV
	l4vdKAL9DKplZkQqdtSrU5d5VU51ye3sddUrP/jJoCMNdYjz0H06CijR/Jt6gJXVNEI496HFGDW
	ZvpeHCqPkJIU6oi7KK+Y5tsrvsJhBA5Z5hM4=
X-Received: by 2002:a17:906:3e1b:b0:c50:93b6:52ed with SMTP id
 a640c23a62f3a-c513aab27ccmr1230543066b.40.1795691897317; Thu, 26 Nov 2026
 03:18:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-b4-btrfs-fitrim-interruption-v1-0-bf5c53738b3a@gmail.com>
 <20261028-b4-btrfs-fitrim-interruption-v1-2-bf5c53738b3a@gmail.com>
 <b00f8fc5-89f1-4483-8986-947392837a6b@gmx.com> <CAO0HQ0VfHczGkTb0OOxXf38Cnu3sOufi24652UR0AJ5a7wzoSw@mail.gmail.com>
In-Reply-To: <CAO0HQ0VfHczGkTb0OOxXf38Cnu3sOufi24652UR0AJ5a7wzoSw@mail.gmail.com>
From: Luca Stefani <luca.stefani.ge1@gmail.com>
Date: Thu, 26 Nov 2026 12:18:05 +0100
X-Gm-Features: Aa3M54ojdEGLiceptP1aQHnxZ7c12hdMS3RYK5bPYgGle6EicdE7SBNpHTVl4kE
Message-ID: <CAO0HQ0WMy0zAgSTJMVMLexv00YqJQp1K4e3tu47cSb=et4WkUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] btrfs: don't report failure when trim is interrupted
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Robbie Ko <robbieko@synology.com>, Filipe Manana <fdmanana@suse.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhiwei Liang <zhiwei.liang@zliang.me>, 
	Qu Wenruo <wqu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry to ping, is this getting tracked somewhere?
It's not an important fix, but one nonetheless :)

On Thu, 29 Oct 2026 at 09:56, Luca Stefani <luca.stefani.ge1@gmail.com> wro=
te:
>
> On Wed, 28 Oct 2026 at 22:07, Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> >
> >
> >
> > =E5=9C=A8 2026/10/29 04:25, Luca Stefani via B4 Relay =E5=86=99=E9=81=
=93:
> > > From: Luca Stefani <luca.stefani.ge1@gmail.com>
> > >
> > > Treat cancellation as a successful partial trim as ext4 and XFS do.
> > >
> > > Reported-by: Zhiwei Liang <zhiwei.liang@zliang.me>
> > > Closes: https://lore.kernel.org/20261028-btrfs-fitrim-freezer-v1-1-0a=
d1d58aa94d@zliang.me/
> >
> > In fact you should use Link tag here, for the original patch as a
> > report. Not Closes tag.
> I think that was my original intention, but I mixed up the patches.
> >
> > Otherwise looks good to me.
> >
> > I can change the tags at merge time, so you don't need to resend the
> > series, unless there are other reviews that requires code changes.
> Thanks! Will fix them up in case.
> >
> > Thanks,
> > Qu
> >
> > > Suggested-by: Qu Wenruo <wqu@suse.com>
> > > Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>
> > > ---
> > >   fs/btrfs/extent-tree.c | 5 ++---
> > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
> > > index 242db255cf1c..90e581c29609 100644
> > > --- a/fs/btrfs/extent-tree.c
> > > +++ b/fs/btrfs/extent-tree.c
> > > @@ -6926,7 +6926,7 @@ int btrfs_trim_fs(struct btrfs_fs_info *fs_info=
, struct fstrim_range *range)
> > >                       bg_failed, ERR_PTR(bg_ret));
> > >
> > >       if (ret =3D=3D -ERESTARTSYS || ret =3D=3D -EINTR)
> > > -             return ret;
> > > +             goto out;
> > >
> > >       ret =3D btrfs_trim_free_extents(fs_info, &group_trimmed, &dev_f=
ailed, &dev_ret);
> > >       trimmed +=3D group_trimmed;
> > > @@ -6935,9 +6935,8 @@ int btrfs_trim_fs(struct btrfs_fs_info *fs_info=
, struct fstrim_range *range)
> > >               btrfs_warn(fs_info,
> > >                       "failed to trim %llu device(s), first error %pe=
",
> > >                       dev_failed, ERR_PTR(dev_ret));
> > > +out:
> > >       range->len =3D trimmed;
> > > -     if (ret =3D=3D -ERESTARTSYS || ret =3D=3D -EINTR)
> > > -             return ret;
> > >       if (bg_ret)
> > >               return bg_ret;
> > >       return dev_ret;
> > >
> >
