Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779540;
	b=0hnH+BCevoHZT69QWuFqnXQARZgHrj/6T9MYmfRWI8VSB5hsPtLIdGfTJKHOsGTyqr+O
	 UfH6IzsPJEZFOs47vhZvO3w3++36WusLEBk8PytsUELvb+oU+iZSGGSMeh7gmpDxuK4Uz
	 nebh//Gasv0wqF/xvasiZqRSKIzoLyqwjqUwHYHLneqRVh9D4E+w4CSQrBmJiV9hzb4m3
	 5ZLid0FuC9XROAMGnXMAQiWNOZIejonLOV6smesmvgQNnGs7ZKBzV+iQtbYNRBIGC12r6
	 eZbrjnW3sNdTvAm2U3ikDXivs07/QThYHF61/x9oXKR3vUVcmBPvLthg/RDajDuaxGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=c9ZC6MWzu3Bp3v+qDNZq5DpuS0weGkOl2JzPS3hazF4=;
	b=Jl9ejWD5A1h954vff+1NbXMgi11momDzdodyLlrHGPWuzcCdr5W6E+Mhwp4HR/ZEsA9K
	 Rk3CYd04HqKsjHdtE84DHPbk5UQI/rO4OFr/7tXZQ28G7IilKZ0PtV640nMnl1j1V3TQM
	 tVq6dF88ueEk2xUZ8huFFkF9gJDo0MICf7L/4KJYIBIrZCRkkPerbbEJY/ir3B+jX7HJy
	 Yth1+M0+Yh3JXg/lBYz0ra0cspYvdfE7PBRnPjI9XbT0+2T97/LTzxxrN4snSiFSghCmh
	 qp7PsqH5S4ajEQ3HEU7EF+ZLdF66E+3mafV6Gp5jaCvd9oIloATRD3paiqDzJuWFXYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=llEwaPv+;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB805606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB805606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=llEwaPv+
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so4879236f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779538; x=1796384338; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c9ZC6MWzu3Bp3v+qDNZq5DpuS0weGkOl2JzPS3hazF4=;
        b=llEwaPv+yFD5ixI8gLf/1YwHVK2jY3Uk8e7fnri0ADHVRlxkfS7BFhdVyvvCcaEa3q
         0I4JkU036mRaoGL6vnf66vTlDYsmGEDkItLzroZmPEezNwr/Hq0mGEKiiJs/ikI4ypVh
         wc+m80A3/oGTgAuxPo/4mPwcgEwhqlk0aAmDAlM9SmSy5xGBmAt8Rga3E5XmvdsH0wFV
         UbPPUJccgQ4TUVFrL6EyJaylmleBLGju/dWoahaKaVn3UoKJUpudMs7T0mYH7SKPRdK1
         CIY/AKj/VrWyhv7OsdQ6XeuqK0joerjAoY1iv0YbSvCXosUVHJsHrmf2Vm5Kl0J9HhZJ
         Yx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779538; x=1796384338;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c9ZC6MWzu3Bp3v+qDNZq5DpuS0weGkOl2JzPS3hazF4=;
        b=Czu3p8fTSbUfuoY3YYzOb1aSVtUhHM0TxpnzpGICH7l9//qQYPJOx9ZSt1kqfCKg2P
         mgHggVTKY4gjNgpXkOl1N6DNVsDzmblMkuPh4qC/Az1/SnE1CTsvMGKeXflN4nXR1Oc1
         qdAM0WKxufwol2gfKtFkm9g/dewZHVWF5KDbnAvOwLFWKZBzE4MAV/FB+XBo5BbQT1Yg
         qQMesNdg7MNWMRCj4mhcz2m4Cv3Wg7lfQ8kn0Fpr/+i4h98h+QlyBpLh8vGQjfbv4MAP
         VPD6p+kIXjtKYbZc6xkX0I/ynrttYfMUu1u4XkLH6aYNp8PF4ht8HveK3rgZAi2cDv5f
         AKag==
X-Forwarded-Encrypted: i=1; AL+hErFrTx8nfPeJZRBS1YaPYJ5+772rwrkO02yuB4N8K3aoVCUGlPIl8yHkmaDanXovoOSzJeoGCtK6ikPKgyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ex3w2A3LcfgTK4DVOiw46hLa6w8lnklUSdO+77LTTjJkFzbXS
	fJ/RJJSxSpR2iQhWm0fIqSjeRExgtYGrQG5J56cyN59Sv1I2JGUGlp5M
X-Gm-Gg: AZFdTZcy0UCCJ6GMfNevjC20Gsvs7U6Jew6wJKAs/VTkhmmXIuGL0El3h09ZXljykEm
	v/Jk57vlsRgvexehyNwGyvxFcxrt2FeidUYVb/e0EkqAixCBZMABqe8KwziSsd0djVs3FMrf/3p
	pc98J1lJJOPY17HN9yEgEoXBBRgHG9YAGcQX2MVh4NRAyPKf37wccTrVfWSKSbnOGKoNB4NywDc
	Bo0DYFmTrvEYqwlIK/9y30peCudosnS59rUQeeXPJz/+sLrvau6MuKWG8Hi6zx1GyCY90i0PSP6
	WbX5oMxfm2k7xz0U4dIyimr8h6nPWkdAQzDI29/QpT9zDjMF/0VtM0/JLWhQxrTprz8Sv4dN3NE
	BAdfJfKLocWR8wFhZBMZyZma9S7IvKgYGybm69WTymdD+EaT2DmUDomWoX3vS7pEJwIUe7TCC1A
	soBqRV+5AI51SZWwXrVka1FnlN46rzt4CR37/lpv+ou1vqlHVYQkDZPBpohPzKkmwJqGSzPO8XC
	6HAm6MpztuIiwN9xOcpD8EOquEfEYxNF36hAb22Kos0ZofmKyr/Gcv92NhXncxDP/GN9L5yC67I
	AanbBTg3giqABlucUy5Yg+rZopxWWce1IvQqpkien692AVkm
X-Received: by 2002:a5d:5888:0:b0:492:5ef7:5d98 with SMTP id ffacd0b85a97d-4abb6651686mr44136319f8f.38.1795779537909;
        Fri, 27 Nov 2026 03:38:57 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm44099896f8f.26.2026.11.27.03.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:38:57 -0800 (PST)
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
 boundary=9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 12:38:49 +0100
Message-Id: <DN5YPR39J7QI.1S1LCFLNUCZNL@gmail.com>
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
Subject: Re: [PATCH v2 2/4] fscrypt: update fscrypt_prepare_setflags() to
 use xflags
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-3-koray.fra@gmail.com>
 <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxjGLfuZMFABCwMvdXwnU+P24G_aTJLudWbjeSmWwyDF6Q@mail.gmail.com>

--9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 27, 2026 at 12:35 PM CET, Amir Goldstein wrote:
> On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Update fscrypt_prepare_setflags() to use FS_XFLAG_* xflags instead of
>> legacy FS_*_FL flags.
>>
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/crypto/hooks.c       | 10 +++++-----
>>  fs/file_attr.c          |  2 +-
>>  include/linux/fscrypt.h |  6 +++---
>>  3 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
>> index 149498bdab94..52d6a33fc9e9 100644
>> --- a/fs/crypto/hooks.c
>> +++ b/fs/crypto/hooks.c
>> @@ -182,10 +182,10 @@ int __fscrypt_prepare_setattr(struct dentry *dentr=
y, struct iattr *attr)
>>  EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>>
>>  /**
>> - * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SET=
FLAGS
>> + * fscrypt_prepare_setflags() - prepare to change xflags
>
> prepare to change the file attributes with file_setattr() or one of
> the legacy ioctls

Ah yes.

>>   * @inode: the inode on which flags are being changed
>> - * @oldflags: the old flags
>> - * @flags: the new flags
>> + * @oldxflags: the old xflags
>> + * @xflags: the new xflags
>>   *
>>   * The caller should be holding i_rwsem for write.
>>   *
>> @@ -193,7 +193,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_setattr);
>>   *        another error occurs.
>>   */
>>  int fscrypt_prepare_setflags(struct inode *inode,
>> -                            unsigned int oldflags, unsigned int flags)
>> +                            unsigned int oldxflags, unsigned int xflags=
)
>
> This here is a backporting landmine -
>
> Changing the semantics drastically without changing the helper name
> or signature.
>
> Please rename the helper something like fscrypt_prepare_fileattr_set()
> so that backporting mistakes will be caught at build time.

Yes, though, would it maybe be better to just use xflags_to_flags() in
the vfs patch instead of changing the fscrypt function at all?
(Also to avoid maybe having regressions, I forgot to test fscrypt)

Thanks,
koraynilay

> Thanks,
> Amir.



--9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawlryQAKCRA0bnTtJTDo
OAscAQCnLyzS8zZ9SFk9wktpq3tvXIGHHr6PhrHJzvvIIX5a3QD/d7iHp6UzpXcB
1oYG2CGEhM4jPCS3n/9+H/haKMzfdwI=
=mdIi
-----END PGP SIGNATURE-----

--9ee92098a335c2a68fb67c27de6debd3005add5d1428b82089d4d2e1ae1e--
