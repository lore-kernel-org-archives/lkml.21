Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785380;
	b=SfD1T29Zc0vLGXv5OVyirKs8hD22nSuvAQSqfRAHDp85Gq8uERoi5+oCUCKqX9dBq3C9
	 6dfpyr8jFS4g9XQ9EPo3HNLo8/uyj+REs/F/RzUKZK5GTl1nbNcHVzLYNZ6au4bAvF6ye
	 q3G3hbK+E+nAH2SRGcFJ76aYjuro7FJt3gculCy23QwmQsRp1lF2xHWqSEYywfCCwcfKW
	 Gdn3PXHROqddSkfUvOvbj5uU2J5xe1l98cYJzUKMBLCKUj+wC/8ynhMf2fVcykPS5KR9V
	 p2OlQ4H4bVc06t4gOikUbuIPi9OucVODlBCghSqsvwkXrkIyDpT5DbaEGYb0ipKcDUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=KP1KQQ5zc6J2penQP9T7HSMskKwpsejXhyxZijwDgBw=;
	b=BEW21KyYvOwygw6B2nYl60IbiGT3Fa72xnMlOzM/Tbi3Qot9T4wy3Jx9SmSkOSPgr9UT
	 ezhHa9QyWu3RSakA9YD5EuaHbRe4v5Z1C7LXJZK5qP8iAY+N0gh0qFdXD6ppEekYjcQ7E
	 308IacVxqy/YVnDg49P3p1CSXojWWHCilkwFVWjopA89WO2rud5rIwdCB2bmNp/9Ta9ox
	 KUGPWvH3myqBsLjxU95uMJWI0EEfiPkPZyMUVx8CXZa7zLTz79M8g+6wUx85krd9MPPF9
	 gnALXAr5hMUg3JhL/bb5mL+ma80jW7Jgq3KtY/6k1PCJACm04TqMZbqtgjC/kPrn2Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDNYoHai;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9B606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDNYoHai
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5777647f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785378; x=1796390178; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KP1KQQ5zc6J2penQP9T7HSMskKwpsejXhyxZijwDgBw=;
        b=jDNYoHaiPCM26YLr1LFLyg6vcqQ3lRu+qOryzuAYi+xEuAHmc0UqBdZ4poBpehE/5s
         7PiUWUCK2wkW2dteZs/thupIvuqyOU4W3Pq5sVdCMf0lb1Kxo4J28XQbhfyF7mT2cs7q
         3uFW87E7O1hT4++crNJt3NAX0SUI6+EOb5aReqGo7+i54H0+ooS6ly1ZFIV5I74tqsqS
         IKB4ZHTTJl+Khf2B08Stb1mg1Yplxkn/8s7Lx6Cqfze+pKKEyi0RsBeOj+BbhwP9gSIJ
         mP2LhvB4dpZzb760HoemttcxB1nTp4qjR8BwnjtOJyYwn3j7VDur80K0A/7El8aVvwX8
         YkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785378; x=1796390178;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KP1KQQ5zc6J2penQP9T7HSMskKwpsejXhyxZijwDgBw=;
        b=0UF8fW0xvCKEQIhWgUwZUQKDYKv+y/A7fvcFaD2WDruuXZTZ/OG+LRLazRlYcFrRTF
         vulWExI7p4tUy9QI4DEzmhqkTE3kLCLxPN3dwoMFQorODEOhh/o1Xi3xDwzctEFZBvSG
         +YDG7rBt42HIQHJkhc8npV2WJgUCBB2/7e1di0qBEEt+rZAy5dS/Ym8bqEQwSzpD5YZQ
         AWmcqzaYr5zHcuvoON6H7L/6HzjEG+GIWK7/Fxz4YqsrvtHNnwr0Q6wd/e7K6YWi4K7F
         YptsH9mazFNreWeD4SV2FiudDKr72nbjlNdKeL02fEI1JtZBvtX1jR1sRSxcCVKsDx5m
         qo7A==
X-Forwarded-Encrypted: i=1; AL+hErGvaejbq8Fg0xHt8YK+F7VKQEagys/ECogm8jDGDrl7oG3gPtWogroV1GYDjHC1EuZX9G+IRBkOgIFK4/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OXF5WV+4brTnGyRONNz5i1sAsD6KEJeps0NDozhWNe2jdqXG9
	+DaihUoVGHNNR67p/w82opoJL7hLT1ejT4M14IDd93NePpstVsvyc3ap
X-Gm-Gg: AZFdTZckpXuU4NcN9p58fjW3EoJMu7eqTgUNXm7dp+1yZdDf3gb5gItGy1xq7MQcI12
	rKx5OFy73HYSoiaK7zMPfTNYkTbgdoRMslSolNg9zQd2uyK5T2r72OoZl7BlojFckCGIltJ6lDv
	n2hKtkhnHA2v59LSaCWcjytwPZ1PrgtqoHwJptSkhmuef/y0b7ypIcV2hJGnA1EunAYKmI0PVGz
	J5NYinRYddKc+bKiakSD2070vmhJoiTEPFrZ2HfEKsTF9bAyglqlAdKbP6rWj5WN8v5hsY9J76d
	P+qZ199OpiUpZDoEIZvqIx40ECne1XmO1pOvxsm9bogi4qbfsRkrhExgFrgEj3tY+isRMD5/oKA
	ZNZTAeFWHqhAoCMnzAx1HIi+Dx3wYCeUeb11F9QNdbEW+m3BR/pwivur3QZfRsdsndJrUR9L58h
	RjLaGoOyeuoLk92xp7xKP+rMWtRPuco120nus/W9THqHwXw9tsOI74jweHeRKd9QL3U9r1kJ66R
	KOCz5iQ7H2yvF4bkYlv1lYLdST9MCOnNwZ1VZEIHKzTpcOT3Vuc8UvnzvzFX6sRB+LcYnLd2Zom
	DacTyqI31o/wBPSi9/IJJb47u4fVgm3x5NiiZOzawNbBEvNG2fihbnDe31iC
X-Received: by 2002:a05:600c:6219:b0:4bb:a5f1:fc5f with SMTP id 5b1f17b1804b1-4bba60168f3mr171039875e9.26.1795785378311;
        Fri, 27 Nov 2026 05:16:18 -0800 (PST)
Received: from localhost (mob-176-246-245-5.net.vodafone.it. [176.246.245.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm947107665e9.13.2026.11.27.05.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:16:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 14:16:09 +0100
Message-Id: <DN60SA2AMQI2.3C10NXIO3L211@gmail.com>
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to
 use xflags
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>, "Hyunchul Lee"
 <hyc.lee@gmail.com>, "Eric Biggers" <ebiggers@kernel.org>, "Theodore Y .
 Ts'o" <tytso@mit.edu>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Chuck
 Lever" <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Jan Kara"
 <jack@suse.cz>, "Alexander Aring" <alex.aring@gmail.com>, "Darrick J .
 Wong" <djwong@kernel.org>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Lauri Gates"
 <lauri.gates@gmail.com>, "Christoph Hellwig" <hch@infradead.org>, "Dave
 Chinner" <dgc@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <ntfs@lists.linux.dev>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-3-koray.fra@gmail.com>
 <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>
 <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
 <CAOQ4uxgzmB0dEpQCVGKOc8reJ6OFV=BxDMgRW81aKiCMwDSn_Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgzmB0dEpQCVGKOc8reJ6OFV=BxDMgRW81aKiCMwDSn_Q@mail.gmail.com>

--d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 27, 2026 at 1:02 PM CET, Amir Goldstein wrote:
> On Fri, Nov 27, 2026 at 12:38=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Fri Nov 27, 2026 at 12:35 PM CET, Amir Goldstein wrote:
>> > On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
>> >> legacy FS_*_FL flags.
>> >>
>> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> >> ---
>> >>  fs/crypto/hooks.c       | 10 +++++-----
>> >>  fs/file_attr.c          |  2 +-
>> >>  include/linux/fscrypt.h |  6 +++---
>> >>  3 files changed, 9 insertions(+), 9 deletions(-)
>> >>
>> >> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
>> >> index 149498bdab94..52d6a33fc9e9 100644
>> >> --- a/fs/crypto/hooks.c
>> >> +++ b/fs/crypto/hooks.c
>> >> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *de=
ntry, struct iattr *attr)
>> >>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>> >>
>> >>  /**
>> >> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_=
SETFLAGS
>> >> + * fscrypt_prepare_setflags() - prepare to change xflags
>> >
>> > prepare to change the file attributes with file_setattr() or one of
>> > the legacy ioctls
>>
>> Ah yes.
>>
>> >>   * @inode: the inode on which flags are being changed
>> >> - * @oldflags: the old flags
>> >> - * @flags: the new flags
>> >> + * @oldxflags: the old xflags
>> >> + * @xflags: the new xflags
>> >>   *
>> >>   * The caller should be holding i_rwsem for write.
>> >>   *
>> >> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>> >>   *        another error occurs.
>> >>   */
>> >>  int fscrypt_prepare_setflags(struct inode *inode,
>> >> -                            unsigned int oldflags, unsigned int flag=
s)
>> >> +                            unsigned int oldxflags, unsigned int xfl=
ags)
>> >
>> > This here is a backporting landmine -
>> >
>> > Changing the semantics drastically without changing the helper name
>> > or signature.
>> >
>> > Please rename the helper something like fscrypt_prepare_fileattr_set()
>> > so that backporting mistakes will be caught at build time.
>>
>> Yes, though, would it maybe be better to just use xflags_to_flags() in
>> the vfs patch instead of changing the fscrypt function at all?
>
> Yes, much better. I agree.

Ok, will do in v3.

> Now looking at the /* initialize missing bits from old_ma */
> hunk my reaction is to look away its huge and it should be
> using helpers probably called from within fileattr_set_prepare()
> itself - because if this is de-facto preparing for a set.

(I'll reply to this in the vfs patch thread, so it's easier for me to
find it again)

Thanks,
koraynilay

> Thanks,
> Amir.



--d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawmCmgAKCRA0bnTtJTDo
OM+8AQC9tcOsGFPF287JKL4pLZnhvZs7off4ihtuxm56vgpT2AEArgij7OQEsKKN
AWm00Ai0JaPzKxHQtiid5dTOQhG5TAY=
=uJ63
-----END PGP SIGNATURE-----

--d266ab6a5424ddaad121a0a52eacc7f99696bf23ca7b0dd531f4216c8dd3--
