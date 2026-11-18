Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013893;
	b=FXUr8mAh2mG5AJTLM2b4SZLWCtO/ZaaULg3OfGPg1CDl/ehp/a4Pd7hpKixM3fhcNNqq
	 QBwnzrznpwPcQAxF6izx+u06OAPq7joyTG2acr+ZvkoeLbezFjydlemR2/d4N5G5iBRjS
	 wBNWaKmiNc49Wv2I+zLBsVgn1zOfRrApaYjkOjDwtZzubg7qSwpSZ/QpZ26wrdEVOTnPp
	 MFkbsZQ1R0MzhG2hb45gTO5uwLX3B2QtO3oVUI8zrcUXP7oS6dA9zaVXU68YBbYkxlB9b
	 Le3ttgaE5wQNzsZEp4uu/H15vh/IC0X8hA2OqGDbMdkL04ydZ8O0G7KEyoHccUHqR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
	b=f8r8KSWo98uxA/3duXoZQs3Vuq45o5zKiCiStI+bPeifQ7Rkm0llqirUEbbALEvWQQiD
	 yI9yUKbO7KRlJMMTckV9+fg0Enj/D3ZbMuCRNB7sT6Z8rJtBPQdHc7+uIuuj8khepyMor
	 ey7QieJP6fORgjHXzNJuS5v/gIoeGCKCO1lRL4btd4WgjW9B9BaK5jr+z3OY3v9hGg0o+
	 CHqYDZVHIZ4gAAwpobbim+8RFIthpIVtutvFIRdiVCKkR9N/98UCG1OTWTgjQ/FDyoBN3
	 7pFrlK7ndg8V/dX4x0JMVHkhwls9dnHXWBCUnwplLnfTKMTiT2NNGc1BACEtJaEz+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIynCKYl;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C222606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C222606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIynCKYl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e46e449e8so694271f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013892; x=1795618692; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
        b=WIynCKYls1N8nEyEmKDwpbFtK4fRYUUmPMeyj1Lc9KrBLr4DNDXRTqxqglZZe6Ifn/
         rnLkHwm2hphWg/c9Bfvobg9Xh3gOHmCC39W5EhYmE2vXc7oQ8QkoZqlQnR0DV/jsH1GX
         0zzmewpfcvfatXcXxZYAaoXNifblQeQTqV9d1MYWR9E61n5n3sGbMTxRnTnaL0nDt2oW
         nQRU8AFvYlvH+9vQ96dlbf/TUEFEwX2A0JC+XqUxCoPLcHF9R+OCRlpqai8JZglyJgPk
         qdEM9PuU3prps6Ygbz0r7hOM9uQF4f9gUmI0QuSofnln19TV9ZuOiZ8w6K8QMEHi7Fbn
         NPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013892; x=1795618692;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
        b=ipWIuJ4D5e9jRYomx/5XCtn4QtT+PtkT0LdFCvqihnwospwilzw58FUPIGJGw49DZE
         3+laI26SymCNphHhfgrPvGp5E4HHIMyplUabTSSvTKP4iAm1NI/P0XmjY+PQr1elbBHh
         ieB9O/FNvmEsML3WPDTNJZnVzAYivEXVCNYhyZsxE8wyF5dl08HEf6xPWAWKVHVDEoeo
         EEeFh6ohLIthEwfl175g8C/8/XlHWsfU6hXVf0JcdPlW/2m5ddEz7lHkWLOm43hNqkbx
         CMwLy2oowq7SlDBlaZwnwbLsdVztFkSqnRQLYUe6xQFoHvl9yFjWHpHjjRndXcoCkDe0
         SmFQ==
X-Forwarded-Encrypted: i=1; AL+hErFvXP9BrPEjt8Ex188hss52mOuBSF/qmujs8h/b0+hyy/t4GqecwzWutenn1BGtq0CGyjs8JkuyHhn2bLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+scum9yi4PfXNTzuymoPAqbiroRxOnP3UO+n3bQQZGePCZj4XE
	f/+A/DvWHibOUZrbZKaGTJmXiND5tHD+lb60LGnZsvzMp/KfJIuq50hx
X-Gm-Gg: AZFdTZfrpDYTcEKywBylvMIMLtsxqt12p+gW8RLG7ZLmY5BK94Qh7Ti8ZALmpGDlAIg
	LK12T8qolWGdESgQk5yKP1Kx5d0T9EdwvRU+7GeCZtdM8USXVpHtBOcDFrxdp5rIpjQkO5BtWiM
	LZ6oZw+UIq/DxwiuHUAkbC4n6x3nWGoRSXclcv3E5UkhfNrM/7B1T3lZ4oXMVw9aKDcO2SJAXEf
	S4M2bMIdvPa7SBc0O5yksERL2bVPW2BvsRxOYO6+mV8wos7MFbEVB65zPy+uo2XCSuadfiq5jEN
	lgKVsffh4pIal5npfw8p5WP0XZwIjsFn4OnZEAG0RoLDGVqZ3bimc3k2DSruPLu0GVZWaJTAVOB
	zYQFGj5PkIqBh4+GIeXaB324fKkGD1nRR/Ul20JG5BAmMVcrSddMMzpvrN1VJ/P+sbdJ0Ob5nJ4
	JgGuJbOYte9ZaDiNsiEcn177C2YeDBbu7z9s8Tf2sB9kHC/QiPgXAm36fkSDrzerBVn0fw1oNqb
	mRVAblVXOWbvnMZCcG5BMuXrVdwTcZjbAf5+Rn5nD8EPKLmGPXJ8royQcFAZpgXEzTaSh3eobdA
	p1amZqKbCP2zxhvKWnKEmQXaQ8CBqWKVsj+9rCQoD/bA5GvoFmU7/L4mhgq1/AW7Yw==
X-Received: by 2002:a05:6000:2dc5:b0:4a7:7bec:e159 with SMTP id ffacd0b85a97d-4a84976942fmr1578019f8f.15.1795013891542;
        Wed, 18 Nov 2026 06:58:11 -0800 (PST)
Received: from localhost (mob-176-246-251-118.net.vodafone.it. [176.246.251.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3b3sm5373344f8f.23.2026.11.18.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:58:10 -0800 (PST)
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
 boundary=9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 15:58:02 +0100
Message-Id: <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Namjae Jeon"
 <linkinjeon@kernel.org>, "Sungjong Seo" <sj1557.seo@samsung.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Trond Myklebust" <trondmy@kernel.org>, "Anna
 Schumaker" <anna@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff Layton"
 <jlayton@kernel.org>, "Konstantin Komarov"
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
 "Pedro Falcato" <pfalcato@suse.de>, "Amir Goldstein" <amir73il@gmail.com>,
 <linux-btrfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-cifs@vger.kernel.org>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261118142613.be3r3s6kobkkxnz4@pali>
In-Reply-To: <20261118142613.be3r3s6kobkkxnz4@pali>

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 3:26 PM CET, Pali Roh=C3=A1r wrote:
> Hello,
>
> I have just one issue with the userspace API. It does not allow me to
> figure out what is the source of statx btime field. If it is fs ptime or
> fs btime because this RFC implementation is mixing both fs ptime and
> fs btime into the statx btime field.
>
> I have feeling that this is quite a mess in API and I would like to see
> a clear distinguish between btime and ptime in the API, like there is a
> difference in the fs storage.
>
> If the btime is used for forensic analysis then somehow I would expect
> that the statx would not report / not fill changeable ptime value into
> the statx btime.

Hi, for native linux filesystems it will report ptime as PTIME and btime
as BTIME (also semnatically), for the windows-like ones that only have
ptime (semantically) I think it's reasonable to not expect btime to be
immutable, since they are meant to be used with other OSs who lack btime
semantics.

> It would be really helpful if the statx API on inode can differ between:
>
> 1. btime is present and its value is ..., ptime is not supported
> 2. btime is not supported, ptime is set to value ...
> 3. btime is present and its value is ..., ptime is set to value ...
> 4. both btime and ptime are not supported
>
> This should cover all cases of different filesystems and also allows
> userspace to do proper backup of both ptime and btime fields (if it want
> to do forensic analysis or anything else).

These should already all be covered by STATX_BTIME/PTIME and their
fields in struct statx, the only problems are windows-like filesystems,
which IMO shuold be handled as mentioned above.

Of course, as in the other discussion, I'm open to changing ptime
NTFS/exFAT/... support to remove btime altogether and only use ptime for
their own crtime if that's what wanted (I'm fairly impartial on this
specific issue).

Thanks,
koraynilay

>
> Pali

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCav28+gAKCRA0bnTtJTDo
OLZcAQD9pG1FmR7nRZDk2H08cDMhIho0sN3gDoVZ9UGDLNS9YgD/Z/0Ge9mFK15R
FEjSmx712gDHXRyPIeZ3A/k22EGaOQc=
=3Ms7
-----END PGP SIGNATURE-----

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd--
