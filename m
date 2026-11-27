Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777457;
	b=0hudUgLOE6ujN7hwBvfqISrr72vzyTWBlM8UNM/xVuW8X6cbwQs7TRCBGNJkIDMsunyd
	 dqWLrzl+3DwKZJPlBbPggnp+eM9PLVTssZc4bHuo3u+RVT3dtNLCAel6gwQlYq2OVk7H/
	 dryGsBi46qrJij+dDA6FfpRZsm2z/1dmYx85fSlK46po/hbZBSbSL7SMInhAVmOxpT5E+
	 rKln8e5p12EYzilHkZTDo85tYvQdY2BQuTlvVgTBYgGH+AmKdLl46M7L0sUmBLlhIrczk
	 FQk4LDEpkjGNn3O5Ongwrm4h1wnMlW/VO45mz1oW01gsjjUwUeWX1F1GiQvoWr+I1+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777457;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Last-TLS-Session-Version;
	bh=6NKUvD1Ed99mxfzfNReRRwThedF/NAx/DiLTbVVTE1g=;
	b=KQ4VtqQJnAF1Oqnk4I+QP9NPuHzMcefRwLMIo+pP2NvfVgK3tacHokfaK49KLtIZCAMO
	 idROwyB/L0IaVn6GYz6pic+jcXRZuWYUBBISBpNoSsIp1Mv3g8VVGeWz1wL9/xWyvr9N5
	 Qn65U8Bc0fLwzt38cMlf1du/G5RgZGXoQkWWj5t37T/FmXsd54dh1PYN1mcifhLznHlIS
	 CgmIbhDh6EDJD/DzMZYrh2J8AZlyZjtzbynvcMQXqQK9wXacYK1UB0qACldalpUnL7C1K
	 l1M/Z4DitPLZAgVhxVRsu17gZRsJreFcIa7M+KaHhEvh2QXQYRWR3vv9fqugBMMuprw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nCPWiDEg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9EA606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9EA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nCPWiDEg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62B871A17B9;
	Fri, 27 Nov 2026 11:04:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3125C6049C;
	Fri, 27 Nov 2026 11:04:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49EFC11E6823C;
	Fri, 27 Nov 2026 12:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795777450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=6NKUvD1Ed99mxfzfNReRRwThedF/NAx/DiLTbVVTE1g=;
	b=nCPWiDEgUkTHOfK5ELkH2WFeTZasPyScnvEtG4GGbCkz/Sf8PxuOdnuI9zvK7ZqOsDmSUc
	mCx2AJIH40ns7zRmao2OL/6G3rBlrdb5Dapi30r9lMewLVyyrDHRYJCG3wpB11UUs0la38
	cgrd/W312pbB/609uGorVZ56xqz4Ga1TQLyx1myhatYe/lKsq134SHVVpokrJ8axOeDDPe
	9UYvn+MTkR2fC2XAIOOyCLk3VqkvTJwlyrIChpNDGXCNZ6ZoZb/WX91Gxb1+fx1HWDeHLF
	Rkah0ITus5uGJD6GJHA2+RooyBTCK3sMFQ1ReJGAu9QHOjSy9KBhjm2kF6GX4Q==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Singh <blfizzyy@gmail.com>
Subject: Re: [PATCH v2 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Fri, 27 Nov 2026 12:04:07 +0100
Message-ID: <8GefllIVTJGWT_cZWRnqVg@bootlin.com>
In-Reply-To: <20261126093819.76480-3-blfizzyy@gmail.com>
References:
 <20261126093819.76480-1-blfizzyy@gmail.com>
 <20261126093819.76480-3-blfizzyy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartGcDusM00RYWb_OsjnSb5mA";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextPartGcDusM00RYWb_OsjnSb5mA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Ajit Singh <blfizzyy@gmail.com>
Subject: Re: [PATCH v2 2/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Fri, 27 Nov 2026 12:04:07 +0100
Message-ID: <8GefllIVTJGWT_cZWRnqVg@bootlin.com>
In-Reply-To: <20261126093819.76480-3-blfizzyy@gmail.com>
MIME-Version: 1.0

On Thursday, 26 November 2026 10:38:19 CET Ajit Singh wrote:
> When HPD_IN has no usable hardware signal, set HPDIN_OVERRIDE over
> I2C in DisplayPort Alt Mode so the device treats HPD_IN as asserted.
> Clear the override when leaving DisplayPort mode, and preserve the
> existing register value on boards without no-hpd.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  drivers/usb/typec/mux/tusb1046.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/tusb1046.c
> b/drivers/usb/typec/mux/tusb1046.c index 34ef81f75693..50a856c8245d 100644
> --- a/drivers/usb/typec/mux/tusb1046.c
> +++ b/drivers/usb/typec/mux/tusb1046.c
> @@ -21,6 +21,7 @@
>  /* General register bits */
>  #define TUSB1046_GENERAL_FLIPSEL BIT(2)
>  #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
> +#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
> 
>  /* Mux modes */
>  #define TUSB1046_CTLSEL_DISABLED          0x0
> @@ -32,6 +33,7 @@ struct tusb1046_priv {
>  	struct i2c_client *client;
>  	struct typec_switch_dev *sw;
>  	struct typec_mux_dev *mux;
> +	bool no_hpd;
> 
>  	/* Lock General register during accesses */
>  	struct mutex general_reg_lock;
> @@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	struct i2c_client *client = priv->client;
>  	struct device *dev = &client->dev;
>  	int mode, val, ret = 0;
> +	bool dp_active = false;
> 
>  	if (state->mode >= TYPEC_STATE_MODAL &&
>  	    state->alt->svid != USB_TYPEC_DP_SID)
> @@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	case TYPEC_DP_STATE_C:
>  	case TYPEC_DP_STATE_E:
>  		mode = TUSB1046_CTLSEL_4LANE_DP;
> +		dp_active = true;
>  		break;
>  	case TYPEC_DP_STATE_D:
>  		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
> +		dp_active = true;
>  		break;
>  	case TYPEC_STATE_SAFE:
>  	default:
> @@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	val &= ~TUSB1046_GENERAL_CTLSEL;
>  	val |= mode;
> 
> +	if (priv->no_hpd) {
> +		if (dp_active)
> +			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
> +		else
> +			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
> +	}
> +
>  	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
> 
>  out_unlock:
> @@ -131,6 +143,7 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
> return -ENOMEM;
> 
>  	priv->client = client;
> +	priv->no_hpd = device_property_read_bool(dev, "no-hpd");
> 
>  	mutex_init(&priv->general_reg_lock);

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPartGcDusM00RYWb_OsjnSb5mA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETFOGm0tqZfYwVxBymGofZEoxB4MFAmsJY6cACgkQmGofZEox
B4OToA/+NznQcGmkDaz3HQCbsPpHI6YkQgmZWkwuc7o3KqaxOB5BZ8RAjCrSv1pp
RghhPOq7K7tenje4+/bZX55ma03/BXAwd3Q3ubZ56ZJnxTBh9TwTPZuIXXFWRtbk
os+M1o1fohvmtIMD6E8IBiQs44jwMgYNr/2ja+vSH+leP23MkdU7KdqOGO/M5wKA
22Zbi+V1ELygCIZRPz+WSvVRUy3Mycc3e3axWlxgTa1MQ0HHx2A8SKq/bMD2e7TJ
MfQNVwpYCLXp0ynWrafnfvPXzGXbb1siXOKBbXizykdU6jvnzhX7lY6LMKXGhwKs
uQeuYa06B9p5mSVHcJanAlonPQ+KCbAJS3SU1MHwi4fH8P9bbI7tskhP8GCRGicg
w2BGt6Lhk1ePf4XCNO1Sh/ya3TPfbbb2otSwn1YC33sxQQI3QhwzK5spgkty252C
QLWlCKKHHJelBxSUWctfrjAwRxyyL67BgfBtUgaMaUg2MSV+e5fZ6e9N7tp/8i0J
7fkFf3jymITze+7mqpFChxHRiyehqxdE8Fiu3004xuXPKUB9Vh+rU+14/w5Vd1EF
uWEglHbv/XEow4Khawg8mStVkoaDOJ0Mi+/no9J6EJGQdwlJ/NpDmuM8fsL50bBH
Nz4B6FW3VfgTCAGVekM+RiVsAIO7/98gDu95Xl4Pph9K0fpwN30=
=q8hy
-----END PGP SIGNATURE-----

--nextPartGcDusM00RYWb_OsjnSb5mA--



