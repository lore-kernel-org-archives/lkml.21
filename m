Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805478;
	b=Z1tTGxZRxvRsSKExc/G4YQJ1JK75XCOJ0SLlyzZxZNoo1dBEbeTgM8la/2va59m++Wsa
	 xx+Fz7GqubQ+ahMjfhogqUpD1YEiMB2OxRVa5VY15CjiWbo5/xwr7T75ggYW12HrU+0Nj
	 NH5ZBL4/82Civ3JR2IlFqUBjkNFB8ZFvPlbM/8JpvCo5lAppfdHbPyh4VexsznN/C6N+h
	 7Kn1UTWbKy9tyHfMyTsm+m10tXzcOizXYlwvkdKbVulmxM9gNq4QK8iWsMS9FIemyioKJ
	 8cA7rIaSptvcd3dq2dGr2GzLXfC4PwFW0Iz/lB3Pubj3Qd8M6G/UUii34H/GZ4EUYHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=JmL8LoMVs76VvbagqtHAZXdxFbOYrgh5zmv9OUe36GM=;
	b=CLGFKmMyKEpxtCeiRVUyID3N50xWEcEWw2ot4DQLk0mEcYjG8kte6e/chMzEIF8uJygZ
	 rUM4F9MEwvvI9bgXpDo5SRzW8DMomr/1ik83webdFEdF0BcL/G3tDYENs+zxosDR27Cjm
	 ksVpCgC0x1HJ91VB7TMMNKlqR+UajM/FpRjnM81DVeev0IUzZBEF6zaoR+T6yKio0seCO
	 lLkLQh8AJZB/Fj4FipWKtwJCWTjaWvakUvQnsLilCT1wrm9+MNyQwFW7BTXFDayIknPfH
	 Rms58dZ2n7As5E2Zcm7RSf/lsrwnPboLz6A9VJuKw+N2XASZbmuEEJ6uR7TUTL/7xZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3pNdptj;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB460606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB460606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3pNdptj
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4829759f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795805476; x=1796410276; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JmL8LoMVs76VvbagqtHAZXdxFbOYrgh5zmv9OUe36GM=;
        b=m3pNdptjqW81pY9NLNr665+hJMXwfSRIqlg9cV1mmo9g7662QC2nuYP6a74k3dZ3Iv
         zvWxD2plIKeVWrLGkl0fu/pCXc3Vzo5AvT6VFc4h9ivwKjhKyhk7gIjLCx9npZwJUmyQ
         Nk4TvX4IzB2micR2Tn6o+UKGujjmbSTrorSwb1pZ/GkQGqOji8LqBS5bCMicKVrMKepu
         ioYd1kId/PYWHMgCja4C2aGhqgHUyOK5G1CCmNbKgHfRfy+Yjo4yFy+orjpyYzTB+iHt
         M9/R5HRHUsAyOqHMXuprEzV4ETE8D3x09EMM2j33PoYMAXrIBvD7VzX01Z6gcTlyJABk
         Dmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805476; x=1796410276;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JmL8LoMVs76VvbagqtHAZXdxFbOYrgh5zmv9OUe36GM=;
        b=riugtLrIEfLsTn0eAvoBNG0FgYASefX+VuSJkVAhrxpIthprKAojwlJn/xICJZ61JU
         TGKKs/mw85jc2iD6BlkuxfJ9QSAF35L0RlVzZNruf7gu1uNFUMPxTkuI0aGikxxKyr7f
         CPWHK/FM7VUTEow886LLJKgJTzaTmGQM56E6TENk9KZ/LmsJYCvg0kDpkuDrS5Y1CQDQ
         azKBGqplE3JSpap6CZfndzhYeq1w0SJt49SI9tzDiwYDW0Hc8d7U9aYYvq/EQQj30DWU
         JstNeaq1ayPQl5eTKAxJQYoxWags60UDbmo2U3z+Jxq+SJCtfx6y7zl9ThecEP0rIAC5
         Mfcw==
X-Forwarded-Encrypted: i=1; AL+hErGMPhTUhvNYUC4CXeZ0qpdq0TtagRoz3q4Ne1Ikhp7Z2BQgSkuJw7oqfNT5tejsDrCY0JW8rrQtLOWhHFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hn/p6UkjdqE3X8mnGIQtdciRojYmGcPw4MFoLLvuVJ+cOhrqw
	KCYs/E9tC+d5Srw0SU4TPfu7CnCyf3kyn1o/sXG2qNeSLsr7A0/kb97w
X-Gm-Gg: AZFdTZdSg/rbAm82LXABjUIarzeyqY0iAR7WHiuAcAmoxPp5hh0Xl43j5giJQf+Tdo/
	Bx5kkl+5yEpqocBEtNiiFYoq6E8+Dnfs008ZXRpPq6Kv04puR7Qa3kyoMzCHTzuqXT3GBvtjp8m
	8bipZ7Qlpf3CIQ23ypmYLAOlhFON5vumzb2XOiHPbjQF2qB6LoXQrHOJ0Qx7YpwfosqhoO5qHR6
	MhZto3iUWao7ohT0g1DXlGpQ6bov2GISHiFwa6vtadcRGUnGHMF+vFsb2eoe7Mi1LHeCd8gw6qW
	hMmxP9eCgwvbsDUM91c2juwE/dhLbGBE2UFJEd+Fa6GPz7H256bQ8D/BJ/7fJxaqkYWgsekbpX+
	xKbcp4vXIzqJLrMN8G8pZfMIF1WWpEOLiQDMwrX+m067pDf7V96RaBGrVax1AZ2myBWDrUEkqO5
	slN9r1xXeEfdaIaHuNu8EHqtWzjAEnv5YQduvBZwaJaT2V3N68rqYKwwlnBCKYh56EVFHjAYw/f
	WnTbFcWT9/tKwxXV4ZJ45pUW+nUacYtwc1CMmbOpPf46rp0zlITLQRCCrsgdPFLMQKdRanrzoMh
	Zt/et9G5xxgaMJMmmRXmmS8j8A==
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr49465105f8f.50.1795805475952;
        Fri, 27 Nov 2026 10:51:15 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm4921752f8f.53.2026.11.27.10.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 10:51:15 -0800 (PST)
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
 boundary=3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 19:51:13 +0100
Message-Id: <DN67WTNVL19F.1D5GOBP57BP1L@gmail.com>
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
Subject: Re: [PATCH v2 3/4] vfs: add xflags mask to fileattr API
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126163114.403846-1-koray.fra@gmail.com>
 <20261126163114.403846-4-koray.fra@gmail.com>
 <CAOQ4uxhA+93bo5WseLxe7cAvJHJ8eQodoQHLwh=iToyEVkeXEA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhA+93bo5WseLxe7cAvJHJ8eQodoQHLwh=iToyEVkeXEA@mail.gmail.com>

--3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 27, 2026 at 6:48 PM CET, Amir Goldstein wrote:
> On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Add fa_xflags_rw_mask and fa_xflags_ro_mask to struct file_attr, both
>> __u64 to match fa_xflags' size, and bump FILE_ATTR_SIZE_LATEST to
>> FILE_ATTR_SIZE_VER1, which is now 40 bytes.
>>
...
>
>>  #endif /* _UAPI_LINUX_FCNTL_H */
>> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
>> index a13c7b32a1bd..63d88ebe3420 100644
>> --- a/include/uapi/linux/fs.h
>> +++ b/include/uapi/linux/fs.h
>> @@ -238,10 +238,13 @@ struct file_attr {
>>         __u32 fa_nextents;      /* nextents field value (get)   */
>>         __u32 fa_projid;        /* project identifier (get/set) */
>>         __u32 fa_cowextsize;    /* CoW extsize field value (get/set) */
>> +       __u64 fa_xflags_rw_mask;/* supported writeable xflags (get) / fl=
ags to set (set) */
>> +       __u64 fa_xflags_ro_mask;/* supported read-only xflags (get) */
>>  };
>>
>>  #define FILE_ATTR_SIZE_VER0 24
>> -#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
>> +#define FILE_ATTR_SIZE_VER1 40
>> +#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
>>
>
> Man... we really need a bot to review all UAPI changes
> Please someone tell the bot to check
> NO LATEST/LAST/ALL constants in UAPI headers!!!

Forgot to add: maybe Sashiko can do it if asked nicely :D

> Your patch does not introduce this constant in UAPI but if we change
> it we risk spreading different versions in installed headers.
>
> Honestly I see no reason for FILE_ATTR_SIZE_VER* to be in UAPI
> either. For other UAPIs those constants are not in the UAPI header:
>
> ~/src/linux$ git grep SIZE_LATEST include/linux/
> include/linux/fcntl.h:#define OPEN_HOW_SIZE_LATEST      OPEN_HOW_SIZE_VER=
0
> include/linux/seccomp.h:#define SECCOMP_NOTIFY_ADDFD_SIZE_LATEST
> SECCOMP_NOTIFY_ADDFD_SIZE_VER0
> include/linux/xattr.h:#define XATTR_ARGS_SIZE_LATEST    XATTR_ARGS_SIZE_V=
ER0
>
> So please move those contacts before adding/changing them
> (can be in the same patch IMO).
>
> This is a high level review.
> I did not look at the details of the conversions and validations
> Will do that for v3.
>
> Thanks,
> Amir.



--3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawnRIQAKCRDmj22qf5IG
XJUmAP9OYQdkwBS0FIjyqP9a3I8gdrfFrp/bZms8ThGuY3SovAEA9zGXlhLiGxhC
iuYnX95tMjFyQ2w7/Y0yIwxjSTRZ7gg=
=DR0g
-----END PGP SIGNATURE-----

--3d0117b6230d8b8a6a185cfbfe10dda73718c7f46272653fffdbe69dff91--
