Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168627;
	b=AJ7iHIOyqxoN1mYHiBWsY1ZukRUHnxQjJMnZvZ9nib0Ete3TdNA2cRMjjBbKIMCWUHCx
	 TKRQY31sCww/o8B8seJA0CM2Gb+gZ8ZmtlRZYb400VNfPuU0izeHJIirCe9pol99shjUO
	 O1BLx6KdGkFjig0KJeijid+f2DAueugvB3QbekpW9yYdVoYoJmJoYG6n3IpTQf6u3C6IZ
	 vyINx5ALr3p4RIftsWFkSJIOzzWuncvAqLZ3FsBRrL4NL/jeHqwqt7ehXG3TidA96Z6uw
	 SjCFtXnajRJGVDcr64CmwtYmljXwdBhFXAXHfbvL2C+5V8XSj55iEqP4KRdSp46r9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168627;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RiLXCT33fn3sTnxmiWGsufjs6YJRxioeNCivACLz64o=;
	b=5YuNBCE5txcX+22S/htzyseM4hLOTykzy296MfDX5Xqf4V2qnMqYmU3gUi6TRzpcA3zh
	 EEIbiwV3GFgKVgL7nid+oEL8vqJqlgo5uLWswcYkEJdTBHrinB+WVqiRtwwLIy+usnCMT
	 /NnH0GCLFFcKFAo5jjrwOExeyQeCDPTb3YHa6BCYRgaVXMLETsMDO1/mPevXQXyazm9fg
	 l34wsubcKNbWJ2zoFtaLDaCI3ASxuNlGi6Q2mKGYqja6mU0qeXDOjN2FUO/rRX5Moc28M
	 kTO9UR+WHUE9s+X2vTxnKQ7t3FgIZqrnmuB479OFHYxLhQDxxKphrEKuMrocQcIhFBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=CD6s3ucC;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CAC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=CD6s3ucC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=RiLXCT33fn3sTnxmiWGsufjs6YJRxioeNCivACLz64o=; t=1795168626; x=1796378226; 
	b=CD6s3ucC7cPE4aMIgaA8UqJ9PryLrdlyjeU0o3rg8nk2Pj0EhiPghGf41iF0ibrTGO2GdHZg0Vj
	3XYEcXRIzS+WNRI7Cmdfe1+tQCK0qhPi6jPqKWDIH05fnzZEnFGqsP6HfAEgTfnHfsWFLnooKXO1Z
	1cpcJPDCcwu0DsG86vecb1DMmjzrGixi5CZ33PkCZZSda6pdV0dB4XnqxXuYqJgwAqnoAxM7ATZRV
	RTBeG1yWhYfFouIMQ6ajX+KFuJx8awpIjEmSbXzdUoL92qB5izsv6EZUZdlZK6I3RSTYCPzzVQ/8X
	2pxTG91tO74j92iHL4WNsL8qHLA4peNpDc3g==;
Date: Fri, 20 Nov 2026 10:56:59 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>,
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 j.neuschaefer@gmx.net, f.fainelli@gmail.com, Tony Lindgren
 <tony@atomide.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
Message-ID: <20261120105659.16f48da2@kemnade.info>
In-Reply-To: <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
	<20260912123827.3aa54e58@kemnade.info>
	<CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Sep 2026 20:17:53 +0200
Linus Walleij <linusw@kernel.org> wrote:

> Hi Andreas,
>=20
> On Sat, Sep 12, 2026 at 12:38=E2=80=AFPM Andreas Kemnade <andreas@kemnade=
.info> wrote:
> > On Fri, 28 Aug 2026 22:32:18 +0200 =20
>=20
> > Andreas Kemnade <andreas@kemnade.info> wrote:
> > =20
> > > Add ZSTD compression to still have a quite high compression but with
> > > not too much boot delay penality.
> > >
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info> =20
> >
> > Anything left for me to do here? =20
>=20
> I think the patches look good.
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> Please put them into Russell's patch tracker:
> https://www.arm.linux.org.uk/developer/patches/
>=20
I have put them there.
I constantly get this from emails:

 linux@armlinux.org.uk
    retry timeout exceeded

So how to proceed here. Am I just feeding some kind of black hole here?

Regards,
Andreas
