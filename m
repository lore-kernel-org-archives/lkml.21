Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114927;
	b=LBF1LTVwi2MaOTJF8hst43RFgYRu46WUtdkNaPhmldAcEse6w+Ht4TXerJd4/+sDP8hN
	 6c954MKziTypS0Sx5SrUTvhmGyL2fkShNKnJ8YzTqmXFaan7l7GcGA17bZyHCJM9PuPfT
	 aX4EVkJDL/2Q1AkQsMQDLEYAs/DXpsB7yrAxME0GSkorzK+gdyrEk5FGGX2meU1/EkOei
	 7n7MeWeql0oumDIXdDHADzN4I/i+ufXewRYRiMk8LpTTy06MJ/jwFOFINs7Te2OJOL7tJ
	 QocB4oQ3NKQKWMJYuC5nnt5OEX1ReSnKDiXpUcMy/QVlyb0gw2SFWWkhA+5Wc1lAArw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
	b=vng0b+OHjpKWP/uk3YKp7aTTsbQbt0QyNPh6PDZNyXB1zcXTwS/MdcMA5/LOsJHQnoL+
	 mGFjRtR9kYHLp95we6pYbENR7lJdlOlqOgLutLmOhn471W9hT0vkwJS1CZRH3FZ2eN6Ak
	 FypNg0G3n/CDOpNq2hCUxVBPEt2MBOgDsRD7wL7r+d/0omnrosxZqURbDP1d2lWGZrPUJ
	 M7fIDTs34b7KfYt++NfA2+14q2VqotxNVPKgU8qWNEyAzGEvCH4qKU42KznWC+V+PahBZ
	 kBFl0CXlOJ4B3UksUFaLfEXZC/RFAgT3CelOa86rh/J1AQ7n7paO1oZyzm+G+eMRVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BJeR+sVX;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F973606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F973606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BJeR+sVX
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso59724241.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795114926; x=1795719726; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=BJeR+sVX+oDZlDW1BD3uyy7mqCTvtwh8QANQ+JkyGDvh/WvEdxiK+U7ihFZ8IM/Dp4
         NLD5fJr2vIsb0KJLIx6cFnIFyd6xTJ7a+gaWNvA27Mwll9XI4Pv0wmIau1A2bX7b21ib
         my5xRhjfyg9quQYlE6FUPiB7wCGxyAC6NSRg2S99mhRwICFRQICTDs9fsZ8HEldpmnfO
         On7BMAhSUmxUxVsgbupT2Mop0LqoVX71xvxdCdzNfPnF+BFvqN/nOB15dGaQP1Up1ZsQ
         ascoXg5vmbvD2grs/BeCEY3OHTWcLHF/WguYPXgwnJm/ZEIOWcGV80EQbzpoqEcwL1Re
         5tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114926; x=1795719726;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=TEOyH9nOVB/1LO9QXHWIvyaW8Sk8iCtZKmjqQVXE4XN+kyjkOW2e5aQwI7bQypJCCL
         dTdSR/+NgLOcXzKiLlENohwmAEmAtJaRmmRXVaLLvk7qnhy5SvIyw86PM4IUMeGfCHv6
         ET1F+u6IBKg3F8qyFLba2kKN4OCdihQMFBcMtxl+SI6yhzL8nw7zvRj5j/Tl8bOZ+KK9
         ZoNOT7kMUVi3Kz+tKoSbd2pB391K5+dJTjOgDQZy9FjeEvBZOX4eaJxSorzbInvPQCzn
         jrX2lgjFe8FcKPZPHxX92hUCq202Guw7sb8AVkdosnG2ScvEmunyNdfLPsCKOUNVurPN
         Q3Pw==
X-Forwarded-Encrypted: i=1; AL+hErG8Pjw19gD1GydpGrbIoGZ68Nv4e2rOdI+x2i2NZMiG9mTdlouTquudM111hUTE0V572kq01nZg3foOt+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s7Ml5r3jFVzJ4BSvXUgPVv32ZxMXbI+oc9jaRVCweVT0Gui/5
	u2lh0GXCt4x+bTwEES4xOs4R8ySC5qOzz8RDVgu2X913u3VNoc8HjtTpiUVVoiTCgjg=
X-Gm-Gg: AZFdTZdc8xVCdkCZVRRRvsvcS4Qk1GnMGtCa+NXWJtOXZBdsJudzLKFTrx4CAFeYX/T
	QuF6oPbhTW5YsgdekeSQ4V9RVS4m2fgWPizZk1ZZLi+RGxJe07WKXWfT+PYAYwb3qB88vM30bsU
	3s7MrD8Ymhlf5GvE3uOF14Cn9TCWKmY3ueqeQ/U2tPfx7uaBmsLhHnWqWijsO1iwvDVBfq6b67j
	wiRrzf6mFCF9y+aIwwPQ4wGuZ3CuFyLD3JiSKpVFcBTh85L+wCJx8oH+SpquuTbvoXmP9kxQeff
	fTpgQ9zgJmSqAhtgQBkqlXs30ejMNTXa9rO/i/xHRFWhBBWeuHkmOg8rupY91e3U5wPjfUwtUhi
	WzwY48WikWFk3gFrGStZ4ADF2+CRBebvDqmZ3N/496Ap6kbMToxADW0iN/0XaOLS5tVlAum2LoK
	PZbcv/Ml5iVhwn5SPSUvuF7InOddGS4i6MHK6YM47jQMBP8UHGUxZ2RhhBJFN687W4KfXUM7glE
	2I0Lw6JxX/YBqez+unoCQMHMmtokNBhZSpcOsMnC1AUY7YSgcIgOhrrzyoj9hcT7QB2lXhOcHmh
	mcre7C36ljuUPNg3FBxTjTsZ6vEThCOgSvXk4tM0VeFmOK/eQISnK3c=
X-Received: by 2002:a05:6122:c88:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ee8aefbb61mr486259e0c.14.1795114925522;
        Thu, 19 Nov 2026 11:02:05 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm809462241.4.2026.11.19.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:02:04 -0800 (PST)
Message-ID: <84fd9703862c225d63d973cf170b06ab7a962312.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Daniel Scally	
 <dan.scally@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Joel Stanley	
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu
 Tsai	 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
  Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maxime Ripard <mripard@kernel.org>, Paul
 Kocialkowski	 <paulk@sys-base.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, 	kernel@collabora.com,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Date: Thu, 19 Nov 2026 14:02:01 -0500
In-Reply-To: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
	 <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zy5+UcnjO9CPStg5/eKL"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 01:37 +0530, Mukesh Ojha a =C3=A9crit=C2=
=A0:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9HqQAKCRDZQZRRKWBy
9KPMAP43HkphsVrqQTwGITR+0glsiS4Fp5Wyse7t/ZPwvyRH2gEA4/6BFP8fPbe6
9p9JGy6Ck2BZu8qjXZw4UU8oUtkiJgI=
=GZdK
-----END PGP SIGNATURE-----

--=-Zy5+UcnjO9CPStg5/eKL--
