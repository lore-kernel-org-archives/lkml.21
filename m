Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009337;
	b=eZ6rWOXRfExfACGORzsGDFDO7p/OM+ABTsdRflTtwHFcdkcSqsF2LSAr3EZ/Au10ZQGh
	 MAcX0PWPd6rOtaX4zoBOh9VBhi68KNlU4Kq9Zp8YVEY6cI2z9+MgMkSxvQZ+agqQtoY4d
	 CeFftVSROlaK52QcW0c7fzy9X44e6wD9UKX/pPCNMQMzTwZdifsSHkWj67HPWn7t3V4Rg
	 loKNuxYTs/GajrPt6Jhrw/5mZyU4l1QcU3mm2RAne78iBPS6+XacKvvEtLAT9DBRU1MxX
	 t5DTy6ga7TbD6CFFfmMTejupVD1+YPChs/RDwsE0LMqwc3OGxYVvh8/FQ9M1djyWgQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009337;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=Pdo9o/RZRwcXVuirKWXZb1r7laMUfwlqTIE6v9fJreg=;
	b=Yf868lUwxREt7A9VayqbfIaEupk0OJJInb82diTufEa5x47Ap5+Ln/S//R7xh1vPBhg7
	 e0ZfjzI6RsOB57sGRaBiRRs/6YwoMH6NMj1C/OQNixum2hlT4lNAk6hK41oLXQDWyCO7H
	 4r7LGZP5DsJEbDxqrugrcUeLw39cX1mht8FG9pgSHHE9YpSmFCwDWlVw5xsJOuZfsxuts
	 iJESVjCI5xmc5oXOyBZFTO7zgbd8jM35lKOFhL/B57759aL3luZWdzUwNPxjJmj4ltiWG
	 7Dl6C6STlYDK7VvHodUJ4/CVc9ySIDTA28J3x5yUJ0vaTS2Dou3y0jZ9iXaHzye0+rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP1asxug;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 243BD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP1asxug
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 37CC61F000C4;
	Wed, 18 Nov 2026 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009336;
	bh=Pdo9o/RZRwcXVuirKWXZb1r7laMUfwlqTIE6v9fJreg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=jP1asxugAZ70Ob8meTximYOcbzJUzYJBNmnnRp6yfHOtw0VFGwB4GsZCNqsN+6AJi
	 8ivB9Wxird0Yh3caLcwwSZdiwbWPj7/t6ztDGuE6T68obcfrctJjuNnVsvlrJb5dHs
	 hxLhZ2wgzBf2Rab/vx02BjYuDT7xQjZ/e/GuaK3ek6oh735fRTXNd9DL7kqgWSDn01
	 PZi3KZY7bVIZwGrseohgkQx3iaLGpzc/VRgE/tyiDtX951I95EassIunh8KeWKEjOf
	 2AH8WKTSdrGEprbCPOVMGeCf318VvEtCTlkcrtwUTsmD+FEnd5VN1FbaIpeKx6so0G
	 GgZlCY8/xU13A==
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
 boundary=d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 14:42:13 +0100
Message-Id: <DMYDPBNBU7IY.3956HW6C59693@kernel.org>
Subject: Re: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
In-Reply-To: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>

--d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Nov 6, 2026 at 5:33 PM CET, Nuno S=C3=A1 wrote:
> Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
> The part is fully described by SFDP, so only the flash ID and small
> post_bfpt and post_sfdp fixups are needed.
>
> WRITE STATUS REGISTER (01h) takes a single data byte and only affects
> status register bits 7:2, so the default 16-bit Write Status assumption
> does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
> path is taken; write_sr1 is already set to 01h by the BFPT parsing.
>
> The flash also has no Status Register 2. Configuration registers are read
> with B5h/85h and written with B1h/81h, and the 35h Read Configuration
> Register command does not exist, so clear read_sr2 as well.
>
> Software write protection is done through the block protect bits in the
> status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit a=
t
> bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
> SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to ge=
t
> the generic locking support.
>
> The flash also supports 8D-8D-8D, but this could not be tested. Since the
> SFDP has no SCCR map, the core would select 8D-8D-8D on a capable
> controller but never switch the flash into it. Hence, drop the 8D-8D-8D
> capabilities in a post_sfdp fixup for now.

Could you please test if one (or maybe both) makes a difference
here and the fixups could possibly be dropped?

https://lore.kernel.org/r/20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com/
https://lore.kernel.org/r/20261013-winbond-master-spi-nor-w35t-v3-1-6dde1d5=
13df8@bootlin.com/

Thanks,
-michael

> Note that given that the Flag Status Register (FSR) handling is the same
> as in some micron devices, we're adding the issi chip directly on the
> micron-st driver.
>
> Link: https://www.issi.com/WW/pdf/25LX-WX01GB.pdf
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

--d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav2rNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gfUwGAmsWQCdxnZoffctTLEcL3xEJIAczCdXuW
1VqmTcfEGcITv7bnK3oc3q5ctSFlkQ/KAXoDRYSSQ/eAselPr9B9zdraAccV8Gjw
suygvLcggxobzzHZVXwNC1cc1xaALkqwUuE=
=SZ9S
-----END PGP SIGNATURE-----

--d48a81596f444f649e66672f6e26c18772e0d7b92bdebf14f5d7829afc8d--
