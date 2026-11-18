Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014255;
	b=0NaJYJYp5TjAUnF2WtIftPUAKysBNAjOZaQsI9QM+gO5XUN6S0Q4Pa2ezHt2D7li289c
	 85lpoIB7hGzW7LUHkSX71Rl5+3JC84r+bTPBydm43QQ8R+fGS8Tqgt4VB4yhn2j2GDOHt
	 k81ljsRRvGd2iMaim0lRVxnMiTGS2cYAA0qnZ3FzR6A7sCpSTnakpX8BLdRoDxyF/CWwA
	 pojElh7GapqeXR6j5GrfkTs9F2a/d8Ss96TRSvKHs1g8oDPRDxJj7u30+BhzTHEBI6Ttc
	 Wh3CaTmHSloQpCOyRFMcm0Wj0ufrl0gdSHCpS1+/cWSf17hHsJpzCb767j9qAIu888w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Z/tQwtb+guAS1R6/OD9tZmRzv2qN3TXj6uh+KCQvyAk=;
	b=qbvDouRuA9gx7mGtA7B2QCpVNQh6coDxIpVpAfT2cKdtoaZ+tUpwKhV3OYQNnu8UVqwJ
	 V9scFzsA2JiH/GjzpsM+7KqzYdISmoZ4bQGKZoQdKjyMiNglJ4icIdOU0aOPZoDMJZZnd
	 2Vl0ORJcNoNQaPYWPgToKScv/Lun0a0JMRHwrUExhV55semMXeeenJxq/400IX9rQ03wa
	 aFhvjgtIDhpecQjMR6L4aZzfu9YYJU+/vpLYL2dRtjco+YP5BJl8gSzEOIP96/VrJ+Csr
	 UGRilbQPtcsTstP1++L/VxYqc1/sOGxqPze+791iYvBtSaPgC+XnvjCo6e228GBCRPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZgNY5oh;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659F4606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659F4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZgNY5oh
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c506187deb9so17620066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014254; x=1795619054; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/tQwtb+guAS1R6/OD9tZmRzv2qN3TXj6uh+KCQvyAk=;
        b=BZgNY5ohqoEFQkAOL/iufDJibOewT3UgU2WVfwz5xpbqpBVbkYqnhc5ABRsYqWLPj7
         8GTikK+xnUaXefdEgttPL5Dir2FKlQPUJi8SXvikn6YoJ8UbiIxeNQg7jnDHaaDw3Osc
         7HMiGLt7nV5j86eNOAMOXcwjFXjU5ruEQXU4NglemLKDqQEaYmweQOhUf6y5XignaU7O
         piEJezvPTns6OaohWw2T+dnTPhfD44fRRmw2aW3DQLnvkEuv9wCRY/p7kGA0jZIVhCLa
         ud9DSv7W/UVw0VCagPDTiXYbdGPHJa2o2Mgq0t6CGcMtFx8rf8QAjg9T8icFuXsQLdxF
         VUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014254; x=1795619054;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z/tQwtb+guAS1R6/OD9tZmRzv2qN3TXj6uh+KCQvyAk=;
        b=H6In3jRPO+Aj1A/Zb8arHNHM2kAH/BCYz9S6+gsYdVDFTCoRs4+r3A6yjHnv6HkiMG
         l/MTWtMAmXABgIaDZ/n+2TYPUL54H8KxT/1XLFFIyq23KmLqPpfmB3Ck+dOV9nArJxQl
         UKAlhrI/xOnip2rnfbB4FxcbzLTnPg+jvlStxdsY39qvoSO/yixzk00f0xWLa5UBtbr0
         MCmw7FPdBdDZftCh6Cdcc8d1x5OiTQZxDFJS/pg85QvU+Gnro7OpV00Q4zx9oZsDYiOw
         Qpnj6E8SFl0OTFx8aREZ55nZ2YBxdWxpW42EurlrAgnTi04ECh6yQCWFUnFdSxID/CRj
         gvKQ==
X-Forwarded-Encrypted: i=1; AL+hErE0QKI0iuB4Mw3EU1b4P7ziTqbdgkCYdfFhS55WnvB77/YP8Gj03zYQZE1fugjKXZFF++jIdXoKUYaIkK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mxNqnGYdYbGizcbubuvcawFGkrN1Xu3h7/zsX93ZuIZBhVprC
	VJ+vStWVFk6vz1Kl2y5djdDaC20VEnhIsROE+poxm5EnLhVrfc3YM47mo0TSTA==
X-Gm-Gg: AYBFou2VNEwH6xusuIl39vuXqkgBJTYerVPvae+wrEWBwTR5lZi1E5TsrG87jpaxxEk
	cVyzJ5nNkKyTTiEIgRsSndc/KDGV7xJy083WKW3bwO2ei3pbV2CjZGRHEDuzQTFAdspAtQAhPG8
	Qat8oMrK44hNXp3i4EDXXen1Om3YMSerxwpXrpsgpeWheJECevJSxuOvfRrsrbhwI0kJS5c77eW
	OBBp33AI2jT87Ry6yywgxGxXqMa7uPS3Y/w97DVKCYRid8FZ0P3FWACLOy/QBbwyuBMOgcvlgF3
	891UoH1HR7VSbsq+cAI4P3NrdKXlL+nleYcuRMP/u9JJ3GF767xFcYr0TnLlJApHaCz7FOEkcFl
	cXmTLX8JNMmhgx30SMjvxHHUbUVlQqMhUIERiM6O2KMa83WpnJ9y4QIAmAydtkzCwEfiGvJuPtL
	0WopS+IPspFYjujFJDJucU4qEafO9SI+dpfQmfMD+tKIE4xFWjJR1o40PI1jjJ1FwGgBDfwnFi6
	tg5c+/ze0FhHX7f+rYN/3+LHWQTqB9BAmoNApaw4dWV4N1io58CNjTQdJ6Dm4FQWDmL2bfixpLd
	+dT2Rb8MHRHR/hLvpN6TgfUXwbolyAEU1IT1d/t9i1pa2uxQJe/BXV/bqCMrzRKRnPZuOqlk+GP
	fMKSeopfuUCDp3Q==
X-Received: by 2002:a17:906:7085:b0:c2e:8801:9139 with SMTP id a640c23a62f3a-c510deb9e53mr253754166b.1.1795014253543;
        Wed, 18 Nov 2026 07:04:13 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d52sm7516566b.14.2026.11.18.07.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:04:12 -0800 (PST)
Message-ID: <b6b45a76699f8b5dcfb2fdb1ee682bac0ed501df.camel@gmail.com>
Subject: Re: [PATCH v3] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 18 Nov 2026 16:04:07 +0100
In-Reply-To: <c80644469f01ae6d2ba0339a7a2fcd7c6080c310.camel@gmail.com>
References: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
	 <c80644469f01ae6d2ba0339a7a2fcd7c6080c310.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 08:41 +0100, Tomasz Paku=C5=82a wrote:
> On Wed, 2026-11-04 at 03:44 +0800, Shengzhuo Wei wrote:
>=20
> Works as expected. Thanks!

BTW Jiri, I'll re-send this as part of a series shortly as I ended up
doing another big overhaul of most of the driver code. It's currently
waiting for Oleg's review.
