Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716556;
	b=K7kmtEGBDsSJRYtOrWai3hX9s9k44608Q88pUep+UI7qvjBPyGBenAmwiW6wfaOj3Kgq
	 S1/cetOrSn3hremS43zvdkwMlNolzS4UqvqQ/1xWfmBu+dOtNSWmkP67uJv4qbw25CV96
	 oQENbEpkG7Fk5PwmQECKxNfG9l8VxVl+g9EuCsPwOr7nakarrwDklcDklhXlwUnMHWMGW
	 KfSZD4UNm6eUty7w5XQETJBDHEvocxv+vdSGKd3jnx8kVoNp7W0mzfcWScDv0kANDl61o
	 JD57YMiOueknnRBKKvqGstvmYWx1EOqW+qc914AP0ITg/2+L247EgkG5yg1DvYjKFQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
	b=LVs7oqjrm5BzOzkRVdAq071nFpQcm0QhOLwqftwEcDNfHIV9BOS27v0t592SUV7uV1zX
	 maT2us/H1oPY9oXwmRoG8f8IT6LC75TzWar7rIKAtcIis/cic/0u7I2PClBGzi1cI772D
	 pto5ZO/cmF6K6TEJpFaWl28WPJPnilRVyS5ucCDczd+46yEZqWh87kgn8+jPL4OXlLfOx
	 YWiGAht8WQHYsmUwZrSiCe4UKSYG2fNg1IQTEKno52vgGihisZl7b4bKN2yybqvMV6ZcY
	 1y62uJ2SCF0ptDv1pti4q0fhiSNGlABXUpXX1evCykQ+9PDOffaxIMcKiy4+iFlmKzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4ysYqZI;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7749606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7749606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4ysYqZI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5163835f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716554; x=1796321354; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
        b=Z4ysYqZIi8yTtEsGaz3PJPdELo5yah/1bnKBGrQNdDouR5yhyfZgAiqVpFk2dXVvNR
         saVwKIPGbZ0WHF7+ScrB7Nn+ThzlMcjK4sI+u9ysAQpkDXIRhGd5iGa5sRNT5BEVUHlB
         51yQUuvr1KzVN3EJl2MorHrHyXgbCLCyqu0ZAJMTHy2RlgdvtAa6A+w1+9nkA5RU5Jkw
         zAqsyMWKeR50HjRN65BXcOyLcE615jvvZHikjzc/kq2xvqbbMYrUQ8mRrYd4LbcZJye8
         dsDComUeHBZAMqWWwMe+eda/TqBmk9RUDBNQ56KOGC4Zf2HZYQIDV2KFGcx2+oYZP+f9
         K7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716554; x=1796321354;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
        b=pJUyVi2LOZ6l5uZ2f1mgpxVVDNFDkblVkw1rvGRC86yUkM3hPbK78JLaCiC0SB+b3E
         4qUueiW48WASdcQacVsyFOQl0MsFUnlRnMbfEFmqg5npvJCV2KUP1GmGBMyYPEUWmbub
         PtSQMYkVHeKcHQfabU+JUZYLPwHIU/qSegVlSQupm079MJM4X9NUxSlPVPUKm3OndTuf
         Kd6t/sp59/2yE6SMxwN5id/n0KDCctgn+l4+AJDqIR4jmp2H27A3rV+unADUspi4xrnU
         cQBSP3BQmCG08DZ0DGEa97LQQrtCwe5FD+FahkzZrRznRqmaXG3js1gXBaiQMDmzjsN2
         FP6A==
X-Forwarded-Encrypted: i=1; AL+hErGfYcNGoHwvfNp+tG+aIEJmG8Pc5hUarGHhlUVLfkrFbcg2qqx3Xck1U+VTska86f45xQQrBk1Zj61KdZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//B1zw+YKSfC/I6Nb1W8LFuU05wkMjsEW+LF9yqsFvWM3vssgZ
	wEyuECgOFKydO3H2I4a3W+0CVi6Cb0L3Dcl9W9HFGgrLmwAGgX+nZ4bQ
X-Gm-Gg: AZFdTZfibHROoJl4GOoCHQ0vSbiRIGtAWFynnCfOD+1v5f/4NQYuuuuWUBWknsW+wM+
	LMKTf8/s1r+MJAO+xJvRfG5uU81SZtfJG8zhCfsFuJEwkG/czqVTsEpzrfEo4itn3wgDCreVF2O
	awgyn4QarLTGX4UUuVhkqA2r64qjZeC86t8ZWynxeh6me1fz0FE/M3xpJ831p0ZQwG/whOqTJRi
	d0rz34M9H7kNF3cqzIMF62AfScS9eh/NqZHowO6ABPSVbBhyMxZ8D4xfsx7HFsb+lLsu6xJptyB
	2dBswF0Zh+T/OB20OVxMLsKLN6eFdMi7kGjmXs2nPEeGd32/PQqQPm1460OfBj0QEMOp5fvQbR1
	NcDy6xNxSjYuhDSA5RU95YEOpdmjye7+ppjSH8uaIESmfjjx1QkdjfjUhbNTe+sz7nNW5a/hhAk
	WgzgEIX856q532VGF4viAUHauA+0FeI7wKK/n+AgrR48ix1hLaWV0LOkbgLB79mD6GLt+hQAtzg
	Dz64wmSVtND+oYkmWKtCjUZgF6XKtuTVbSbQo4s6hQvoGoBUQ08k2fPmB4V1c5mfBOCJO7ogCE+
	97LO+GWLJUIARPXiF9QN2cPbUWBc/ca6vE7GT6OsdA==
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr52009407f8f.37.1795716553993;
        Thu, 26 Nov 2026 10:09:13 -0800 (PST)
Received: from strix.localnet ([197.250.160.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm50447904f8f.21.2026.11.26.10.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:09:13 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>,
 Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mfd@lists.linux.dev, linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Thu, 26 Nov 2026 20:26:25 +0300
Message-ID: <qBBdBMwWSaK2Eq9RGMmPfg@gmail.com>
In-Reply-To:
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
References:
 <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartfY-J0jcIRweO3vnQrxe_bQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartfY-J0jcIRweO3vnQrxe_bQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Thu, 26 Nov 2026 20:26:25 +0300
Message-ID: <qBBdBMwWSaK2Eq9RGMmPfg@gmail.com>
In-Reply-To:
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
MIME-Version: 1.0

Hi Ulf,

Thanks for the review!

Am Donnerstag, 26. November 2026, 15:26:20 Ostafrikanische Zeit schrieb Ulf 
Hansson:
> This doesn't belong in this particular driver, but rather in the genpd
> core. In fact, we have a proposed patch [1] that is being discussed;
> but the bigger question is if we need genpd provider drivers to be
> removable at all.
> 
> What is your use case for this?

It's extrapolated from the clock system maintainer's request to keep clk 
drivers buildable as modules. The pmdomain is even less critical than clk and 
can easily be unloaded and reloaded, even though I don't see much practical 
application.

I see the following options, in order of preference:

1) Simply remove the device_link_add() call from the driver and add a line to 
the patch description that this is deliberate to maybe shut up Sashiko.

2) Set .suppress_bind_attrs = true and make the option bool.

Note that the MFD parent is tristate and unbindable, but that should be ok as 
the pmdomain consumers target its own node.

.suppress_bind_attrs = true combined with tristate isn't going to help. Unlike 
the phy subsystem, pmdomain doesn't hold a reference to the driver, so you can 
rmmod the pmdomain driver while there are active consumers.

--nextPartfY-J0jcIRweO3vnQrxe_bQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsIa8EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiBIUP/05AbhnlM2LcacFX58EL
N7rFiT+lhfKkTk2WyMVEI10KwIOop+Y/Am5zrnL5YXQPyLWu8N+pfkUki9SvJSBH
iKKDQAncXwJ7lWkBISVb2/BxeqJxIHWfDJ0GYhYsaHxLyYo4PWMjT+tq9s+Naqvv
gu5WXpYb3F5sqS0qshsJicHYiU4z1vU9hg4Qazrs61AjDU46L6XpevR5L8mONzHZ
piLakQdu+Hp1LFMtu7mMqniIc/RnlRoL76NDcjP7BZ5iS9l+INN5R4bIYGP5uCJR
84bozcygfkiO6tlkIIcumE/Z5DtZfUlC+u4vvpy1X3jbtMokGZ9K+hpKLCVOQkqq
nklQEfe5EwJVW55bPLRj8LD3npSlBNsAWI5BdgyEqvBf4RuLdbVmodDK5dT8p4YM
/u/o0m891tAX9tp9dMrkPPJyyhHe5rmRoV9mSBNDzqLuOUfQcvhsHdyPgi/xFLY2
FHugaTeVu2QhrRUvurddqz6liNm5+sfy7uzYUtjVjQWxAQZ0GBnDKaVkIaYYUHnv
i1VRm13aavhPdH3WgQh//hh7gZZxc3zO4ioU9gRtxWGwOoCZOYhM43WrTmImaRMG
EMld6KpU6bCcuWmK9sC7u6W7PXOrExL+8Z6bO09no49EU90SimbONtaWrHM9i/jI
0jucOU5MLX8n7BJ4G4cwpoor
=3XcY
-----END PGP SIGNATURE-----

--nextPartfY-J0jcIRweO3vnQrxe_bQ--



