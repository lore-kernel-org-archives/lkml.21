Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691915;
	b=FPQcAO5Dj03CbtaGHVL4p2vKtEpuidBPVBGpeTKjpJzBYzCJXwK2BOanhb+Fw+3SuKOU
	 mAz9X92HlodDc45iJaKAg0aI/PbiLaVHrBhhCYdu5BpOd2FmrmqNWIsyvu+Sk0K+UJes2
	 EFDdP5uWGCLWNqEgBD3pwQ2S/56fK2+ffyg3BISCR5BuJu5U9tpQXroTsW+qL4Y8ICKlG
	 TJLCLnMqVXy9L8n2LuLUvpd0QpqG9A53w+ri2fG4X3cpW6rkQLX5aviQZlrBk7kjjppLg
	 QRFO339cogx0XaZXN3tcex+hqYxLXgnaV8UdIu9jhIjFTk9YHJvomhPejSpdZKH9Dyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691915;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Qn2DiAIad0hOk/kwAWOWeWyYdFwm1kSBArGgHjC7hKo=;
	b=JRbOyDpn8bBswvzHtTtsPychoJeKTYgEHuPW76htpI1BrbvkdSNT6vWu94AfGMzVU423
	 pSPe73xiR8518SUI0X4krwKq8mnRdThhYHNowgLLcirjmr0IUB4Uc2u4WMDDUD/Pm4sIr
	 T21I736RCiUbxM7++KBKWmwJU41lKH5O0FE4Wp5IMUlKxf/e2pNzf0ZSEQ1bidiOBIib1
	 vl2DjYBCymugMFiZhjLnOIiU+XcS4fJqFc3UqMR0b4VzewM4A6KTEVrDBlyVrLK6IPBw0
	 ivkXIcTJXu7RNarQU2aJ1fKrfDKT2haCYQitzkA4gXGR3mZVeytJDTpYRAVN3jYJrfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jv0mnMLn;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE18606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE18606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jv0mnMLn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F33644E4167A;
	Thu, 26 Nov 2026 11:18:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7B7960237;
	Thu, 26 Nov 2026 11:18:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 737AA11E6B35B;
	Thu, 26 Nov 2026 12:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qn2DiAIad0hOk/kwAWOWeWyYdFwm1kSBArGgHjC7hKo=;
	b=jv0mnMLnp4qe7lG5xMPkCwFTido0fVstnYEsnsRAkYtKgt6LqjL3BFwR8OrmT6nmojPbdz
	quKsHJoB4gwl9GvnuBMKGHlJwI/O7hZ5H/QGMild7hmq1JMCFlbe7QhTIV6NOuY5arOh8N
	dxUKoRYWxhnQtlNbDPSudAV2Z7M1c+jrntQA8YaiEK/uVNh3MxtWsfYGh07XLLm+9qNOBJ
	w3K4wTpqrWjRVuaOUg2Ux5jXEimouWZa8pOm3DurReGVO3Fd9F1J/5jf6/9RmDk+XcOLc4
	090E8yHPLRS0lFDm3REnwXsFWptb55JEei9QHdLvtWOOes9JPDzbyJxdYkpgtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Alvin Zhou <alvinzhou@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on
 MX25L3255E
In-Reply-To: <20261126052524.1816136-1-chengminglin@mxic.com.tw> (Cheng Ming
	Lin's message of "Thu, 26 Nov 2026 13:25:24 +0800")
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
	<20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
	<20261126052524.1816136-1-chengminglin@mxic.com.tw>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:18:26 +0100
Message-ID: <87qzg7x2m5.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 26/11/2026 at 13:25:24 +08, Cheng Ming Lin <linchengming884@gmail.com> w=
rote:

> Hi Miquel,
>
> On Wed, Nov 25, 2026 at 07:01:35PM +0100, Miquel Raynal wrote:
>> The MX25L3255E BFPT table is incorrect which leads to the RDCR opcode to
>> be reset. Make sure the configuration for this chip remains correct.
>
> I think this patch is not needed.
>
> The MX25L3255E BFPT is JESD216 rev 0, its parameter table length is
> 0x09 DWORDs (see Table 9, offset 0Bh, on page 64 of the datasheet [1]).
> spi_nor_parse_bfpt() returns before touching the SR opcodes and the
> QE mask in this case:
>
> 	/* Stop here if not JESD216 rev A or later. */
> 	if (bfpt_header->length =3D=3D BFPT_DWORD_MAX_JESD216)
> 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>
> Since macronix_nor_default_init() now always runs before
> spi_nor_parse_sfdp(), the read_sr2 =3D 0 set in patch 1 is kept for
> this part. So the BFPT is not incorrect, it just predates the QER
> field.
>
>>  	params->qe_mask[0] =3D BIT(6);
>>  	params->qe_mask[1] =3D 0;
>> +	params->opcodes.read_sr2 =3D 0;
>
> The same is true for the qe_mask lines above. They were only needed
> because the old spi_nor_init_params() did not call the manufacturer
> default_init() when SFDP was required. With the reworked init flow
> they can be dropped too, and only the 1-4-4 PP part needs to stay.

Ah, great, I thought it was still the case, but that's good news.

I'll instead drop the QE mask then.

Thanks for the feedback!
Miqu=C3=A8l
