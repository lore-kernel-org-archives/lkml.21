Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127117;
	b=vPk2CTN3MG8EfOeMGhywSSUCYp+4WhrofUMSoZyKHjfEFN/qhBE1wcWb+y6fpWOBawIn
	 m2w4XutPGioIzAS6EGd6JrLH6XrB801QR1cZUtT7HYmX18EqDwg334SbMKRY9cNXACJmj
	 9IUTLQ4GMyLS0QQvp92rhJ6wRbfSKdEy/gBpw3vDzHfDfOLavcrE5Hz8umWELTb0PjliK
	 bNNTLrd2/71pkZ7XQTkjqeZVkpjxwIE0ewVpUIwJ4SNdcbPmTwkImdh6RCirY5mI8PXmQ
	 Tg+BL5RHxszO75RQDKWnsm+zb6wp0Kup755D9PmzD/+y1Bfd5Y5GDjL8ySzm/6kH8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Wkkl/Lkl9FxKypByBkDGnsO1INO/Eqn1TaVyFB/5Zdc=;
	b=skRlUExxtaqI8gtLOVexGa8UVfGTc+gh6Q9H+4WgVnMWDdUQWMYOMlYOZDb9JvegL4AG
	 9EgJquJFfor+tNLil5tDyDQ1p7uER7W8RvopCd28fd4lLJ3xENhhKq5QofsU0NjPg7GpW
	 GH4ARj6v0BdvmFrAw7XbjSihFYynmbW1VRmx9KMKmkq3Mf2PEmuUw4zBYLI7S3VOai4Mc
	 aRv2HTbaJYx0HJ9XwsUaWH3MAOzh4uGq3cVD61SB18abWcIrjZS5mGIGi9lOleOLgtv03
	 F47CNBlUWKc37mJXHP+tyYjEdHJX+nIqHN3+dyaIlnSh6/bGnBwJKHgy7q/3WfmWK6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNzeBpWr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DD8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32DD8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNzeBpWr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so1866775e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795127115; x=1795731915; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wkkl/Lkl9FxKypByBkDGnsO1INO/Eqn1TaVyFB/5Zdc=;
        b=cNzeBpWrgItO0o/7RGgPImOFVEr90D6Z6G7U3EeYqrD8wslqFl+MrRAtb2P44AF0yd
         dDuTWJb1SPD42yPpGSlydHa28n7VMGUhRKXSewGeLV52Pq5PSUaeLk3ZhLH+SWO+70Hy
         rlniiquZI8JIdX90R5zhFOmpYFAssDOIImf75zzjeL7gogwm2Xq9F1ENknGMHDmtwmxB
         XZ2XNP3gqQp8OASv8dS1bLhNTeHZCOemPLD9n81bJBqSIx7E2OGgzWj2qaeOmJuk+dgc
         1u2ebfHJwRl6IBLrwoBqVSTwHqalkb0P1aQg4h4lFWRtuxo0RXqddtpTUr+PwfJ/mvRi
         dwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127115; x=1795731915;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wkkl/Lkl9FxKypByBkDGnsO1INO/Eqn1TaVyFB/5Zdc=;
        b=fdLTttGxfQp5dXyfOJyogkeNRlCkYDtN7tTKw9iqiTXLll/7aLz5erOB54FM77sqLw
         YUgp7zd5GHZG92M61e+r27DgVAYZCmYiZVDj2G3+3kxMtzOjfCgrqTCqvmII2JHEv1Vd
         /VT+IMCr4Qy817bzUPvB53SCJindxDX9WVPZiKXeozEu3cxjUEevQrLTsHu6Bf3q/WwC
         +xeo6owFTDp4ZWYLvPTI62nONN9CG+wrpIFh99iIjiuZ/BXdgVylN6LxKFbQKz4G7Nb+
         GI7x+CLpGoWrX4/Qt30USrZA2iBlI8xbQrpFhcHIA0KJOxr/kjEzlXs0WpX8BTFVElZX
         4E3g==
X-Forwarded-Encrypted: i=1; AL+hErETiFnhGEMfIFeThaXl89rhzBpNsddUfLU6jwizjE5whEmesEgN7SUEemgKRiu4wr9OOmloFxl3y9XDJpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JRx8HnQRHcTcBx8WKNvgT2Ovquj5I4T1/EC/2y1rq/bhaOIIG
	t0PdyigueRfqf6YnXyzUgcdbY/ECYTt+W2a0hSNeJkPbyh53QVPgmrMH
X-Gm-Gg: AYBFou364SFWF8GqTnIPjGl++IzNjH3c45mVTMqGsG3E/VhLtWvTG8WG0Iu4K/0HKU5
	mdXCw+pMw2LFyiqU4huc9H4WbziOQP/NDuF+1J5Wfi20rlChIMvwkd9gCjPu1nv7jBWCHqlhXIO
	+BrVPcL/Z1I0+vftLdUVaQHE1Il6Hh6mocaJlLCQVhoVhslrO1EY74dRRRd7k5DCTNoQcyt2HMj
	ItSzmOKrWUY5yk+2McPw4tiUjZ7r9ohH1zS8qEv6F3rrUphIMO19bIUmmmvpnuitsvkKwbj46y8
	eD+UU5xzMPpaNRETxjnvxd8ZGU6mZ4snYeXKEQY0U7RQR4bc0GpjhgIPSTCnqnO4lWfV1HLj2i9
	3abPItT5WJBTkPn7w1uAnYOyu/o2fB5ExNRJ6eK2Gs8HVQDmrinEBE+ZzQlj9StbYVdnYXA0c0D
	iKOiPDixCNPef3cCEZ6dkP9n9fH3muY0h7G2cl08F5qKdbNCf4fkqjWl013PU+25rBWRJvreEqN
	HKuuBIvpHQ868XhSZ+aonZD/EmvUMgPR7cJOUruwbm4gzz2U4TxFz03jXmfabuuiGX91w2uQ7lc
	VFZt3PTuegS+Do8eGB4bEp2PKg==
X-Received: by 2002:a05:600c:4f16:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb8882a66emr22851135e9.32.1795127115405;
        Thu, 19 Nov 2026 14:25:15 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm42979175e9.11.2026.11.19.14.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:25:14 -0800 (PST)
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
 boundary=4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Nov 2026 23:25:12 +0100
Message-Id: <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
Cc: "Amir Goldstein" <amir73il@gmail.com>, "David Sterba"
 <dsterba@suse.com>, "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Trond Myklebust"
 <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Chuck Lever"
 <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>, "Chris Mason" <mason@kernel.org>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Jan Kara" <jack@suse.cz>, "NeilBrown"
 <neil@brown.name>, "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo"
 <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>,
 "Darrick J . Wong" <djwong@kernel.org>, "Sean Smith"
 <defendthedisabled@gmail.com>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Pedro Falcato" <pfalcato@suse.de>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
From: "koraynilay" <koray.fra@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
 <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com>
 <20261119220936.mssmaixcorn2gzli@pali>
In-Reply-To: <20261119220936.mssmaixcorn2gzli@pali>

--4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 19, 2026 at 11:09 PM CET, Pali Roh=C3=A1r wrote:
> On Thursday 19 November 2026 22:51:26 koraynilay wrote:
>> On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Implement provenance time (ptime) in ksmbd, as introduced in a
>> >> previous commit ("vfs: add provenance time (ptime)").
>> >>
>> >> Map it to SMB's CreationTime, making it settable by SMB clients. When
>> >> reporting CreationTime to clients, prioritize ptime over da.create_ti=
me
>> >> memorized in the user.DOSATTRIB xattr.
>> >
>> > That doesn't sound like the right thing to do.
>> >
>> > If the server stored a CreationTime that client had set, you cannot
>> > override this.
>>=20
>> Ah, yes, but how would we handle older files which get a custom
>> CreationTime both before (in the xattr) and after (in ptime) a kernel
>> upgrade?
>
> Just to note that this problem is already there. ksmbd can export for
> example ntfs filesystem on removable disk. And this removable disk can
> be connected to Windows machine which will always only touch
> CreationTime and ignores xattr DOSATTRIB.
>
>> > When the client sets CreationTime, the server can decide if it can and=
 wants
>> > (may be a policy decision) to store CreationTime in PTIME and not stor=
e
>> > it in user.DOSATTRIB.
>>=20
>> To fix the above problem we should probably keep storing it in both
>> ptime and the xattr though.
>
> IMHO for a long term solution it is better to not have duplicated
> information in xattr. Because duplicated information are going to be
> out-of-sync. Windows NTFS driver will not update xattr DOSATTRIB.

Yeah, to avoid out-of-sync issues is why I made ksmbd prefer ptime over
the xattr's CreationTime.

>
> For me it looks like that this needs some policy / configuration
> decision done by user. We do not know if the user will replug that disk
> also to Windows NTFS driver (and then those xattr DOSATTRIB could cause
> out-of-sync issues) or will only use it from Linux or Samba and then
> xattr DOSATTRIB is probably fine.

I'm not sure if this is the best solution, it doesn't feel too right
to me, but maybe there isn't a better one.

Thanks,
koraynilay

>> > Fun fact: the user.DOSATTRIB format also has a mask so storing the
>> > creation time inside it is also optional.
>>=20
>> With my current patch series applied, when CreationTime gets set by a
>> client, ksmbd writes it to ptime and fixes/heals the xattr (=3D removing
>> the CREATE_TIME flag created by older kernels, see the other fun fact
>> below).
>>=20
>> And another fun fact: until [1] ksmbd ignored the flags and just
>> read/wrote the attribs every time :) so that can only be honored for
>> files that have been written to/updated with newer kernels.
>> (That's why there is the ((flags & CREATE_TIME) || da.create_time > 0)
>> in my patch, and not just the flag check)
>>=20
>> Thanks,
>> koraynilay
>>=20
>> [1]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-koray.fr=
a@gmail.com/
>>=20
>> > Thanks,
>> > Amir.
>>=20
>>=20

--4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCav93SAAKCRDmj22qf5IG
XCh1AQDHwCluN/PD1HO+ivE2XkUxV2Zyx9D+P9Mq0OOkUf4W5gEA15FUsuExyJyj
iwFtbJlvhrNrDKohBVZXaAkjbhxknwA=
=N4cE
-----END PGP SIGNATURE-----

--4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2--
