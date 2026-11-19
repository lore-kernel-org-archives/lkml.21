Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106009;
	b=MQF0Sk76Ozb33AeNRJL2m/QLJXBWp8vKdxjFh9ucPVgSuRiunHqSPBguVSPDS2csQJmo
	 GLZectWs9qhHh77Cw5Vx14jJl3n9a6jbQmkHxEOTdJB9ZiLLOj5pIr2VYm+mhl/dI/j4t
	 xJ5JEbWMbMQcCUZhIgqWEc+ME40xlDsUylb3myKqNuh1JPM+aQaF26Lf7yh3gcjDLi9qG
	 wyLzYSBF70o/mYMMd6CvQ4HpoJIrXsCT/s/3/0PX9jZAmpgC3kl4hgOLck4nl2+6X1ZD2
	 j+1Ir3X5mm7WYl69IlQeC/72DPc9v+szFHLmaVNWMNKFEOGNkRq0H80DztMJ87lkSMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106009;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gUplJdEPkiupBXMg6jEbRKwJvmMRJIncRxN/ReK0ffc=;
	b=5fLoXICK4M0aHrkADmpwMCzo5e6e+G1mXbzJnk0/B4NJ9YXcIB+pmgRWYBkoYFBm1QcM
	 wa12CmBl85/gwiePQo/+TSjK2Hm1v9hYUoXEKs0oWYrIUlo8Yu4VPf/4ugtJzWOWQHSX6
	 CcyNoiyodLf98RtK0cItivaK1gn6YTHgwMrsI+9HhHpH93dsHdreDzTi3A3LlBl6mAI5v
	 F2+0MJa+fX5AuQKyN7vuhkxKPp99/aYpJQ284CWogM16MnpkimXfM+dbYMHwSXGFABPHp
	 LCje9F3qpbXXJ1lEBNd7LQYhsRiP7kwtDduPBQq7c0bHQpCVtic9yYJbdeggInHjPZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=i7UYjapW;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED676606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED676606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=i7UYjapW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795106006; x=1795365206;
	bh=gUplJdEPkiupBXMg6jEbRKwJvmMRJIncRxN/ReK0ffc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i7UYjapWOsZ+uFsMxKBYOh4CI3jdU1rGx3qXth2588c8yyd6Q6XV8M/kU6CkpDiql
	 uXdSXloNZPHGhngJ2537hNNV2Y75yvoObAkyFCNUodpQNY/FkUklVBzBaKBPdvpMMb
	 W5X4pXVlhquKEPm1M+5dAuEryHJZmBvtNLp0U0kCM2HSGc1Qy5EEMCTFvVz4qcNYbP
	 Ky73+22RTulBNrGbr2NgbNEXiPvHJ7JcTtD6qNix9+8BoWd9UpZQcaXTuzfxxsQLv+
	 8Oz0BrZ6hMhDswzquS+BDiA4fCiu8nsL80vb4o2ao+gt2TRPaPWodt0NTZVFiuMJz+
	 0q9iv1OZL1Jmg==
Date: Thu, 19 Nov 2026 16:33:21 +0000
To: Jonathan Cameron <jic23@kernel.org>, Joshua Crofts <crofts@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iio: light: stk3310: add vdd regulator support
Message-ID: <e-R4fXmiyMiZY43j027FJGyFhtgfke6qdOAsLOTr7VMAfx8pL5sjDimH44WdZ0tIvoxgb3-ZPWWbZb5DE8gMloPynRLs2ztiBLezfyijQg0=@protonmail.com>
In-Reply-To: <20261119033238.39bff7a7@jic23-hlaptop>
References: <20261117-6768-stk3337-v2-0-92f4c7be3bc6@protonmail.com> <20261117-6768-stk3337-v2-3-92f4c7be3bc6@protonmail.com> <20261118110138.000003ab@kernel.org> <20261119033238.39bff7a7@jic23-hlaptop>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: c70958a9528293deffd0e4f3ee6d0f53d931a13e
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

Hi Jonathan, Joshua,

On Thursday, November 19th, 2026 at 5:32 AM, Jonathan Cameron <jic23@kernel=
.org> wrote:

> On Wed, 18 Nov 2026 11:01:38 +0100
> Joshua Crofts <crofts@kernel.org> wrote:
>=20
> > On Tue, 17 Nov 2026 20:08:37 +0200
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> w=
rote:
> >
> > > @@ -745,6 +746,10 @@ static int stk3310_probe(struct i2c_client *clie=
nt)
> > >  =09device_property_read_u32(&client->dev, "proximity-near-level",
> > >  =09=09=09=09 &data->ps_near_level);
> > >
> > > +=09ret =3D devm_regulator_get_enable(dev, "vdd");
> > > +=09if (ret)
> > > +=09=09return dev_err_probe(dev, ret, "failed to get vdd supply\n");
> > > +
> >
> > IMO this should work, but I don't like the mixing of devm_* and non-dev=
m_*
> > functions, this may cause issues down the road. Consider moving the dri=
ver
> > to all devm_* functions?
>=20
> In this particular case I agree with you because the conversion is very
> simple.  Generally the rule of thumb is that devm from start of probe
> until you decide to stop, then no more devm.  In that case the unwind
> order should be correct.  This change doesn't break that, but the
> driver already breaks this wrt to the interrupt, so if Roman
> doesn't mind would be great to fix it whilst touching the driver.
>=20

Sure, I will include one more patch for devm_* API migration before
adding regulator and new chip support.

I recently found another STK3337 variant on yet another development device,
called STK3331. It seems to be exactly the same, except for the chip ID.
Should I include it in the next revision, or send it as a separate series
later?

Best regards,
Roman
