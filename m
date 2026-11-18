Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973706;
	b=e9yH2prPRlUXSAFs74uyTqMjsvNbjvJWhroYSGPegiXLSedK/q13z025i2nNmp+NeWNf
	 umaEP1jqb9wUkDdWvGPi4YS+nxJzLUoZ9XEXB6k6Z6Mb6a0TblMJZAND1Yt6hE4OCPmmT
	 M6MESCaiXNwPHGkh7gIITn2Ewqc8vR8JGD0t9FbLyuWk0ZOZ/fPofs1x8o81BcYfNGmPG
	 59laE/nJCPkzJ5sw2lL7+pqyePiF2d+LRsD0W2qBEdE3NWUAtzclwEK8x0rz2dqIVtFGG
	 mzpxnXSpPX+Q8dt+DTll4jKJmB5OGwQTr92Uw3GT5lUBVPzuXUWGC42J//V46RU+Qhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
	b=jSKM+nKtx5SEDaCUfnfjAv9dvkGTII9H6cVdMixMceLhZdAln0al7GrHmEIScUQPbPcG
	 uCEiJoMslw2SMaFK+2wN+R0LfS36WtiVBr1WkpSAtgl0z4OrJUbzDELuvQTINhLibJeaC
	 V0/BhEDNlf7Ao23JIGJ5qt+3Odwh4AMjcs1b3iv3tH+8MwkwiALq/65OnnPQ6uEQWIGDK
	 +rZJG1P4mRrzdgAYqgcZCaTp7moOw5K2uXu+/lzB/fWhZ/tsQsfjKqQT26OwV7Txd4Ex3
	 0+GngNpIj2D0X1EHigDkzrC7OTmfLxGuScdq6EnoJWasxDCghOxcQ9zq4X8yjZEemDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Qud/GwRZ";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF14606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qud/GwRZ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06e79e152so295112b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794973705; x=1795578505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
        b=Qud/GwRZ/iB29w4vbbnsZrdA2yX2zWH58PtoorHYag7lRaQwP4PXkhdejkBhS23+nw
         +FKq8MMj9y675G8I1OoEZkOHK5dj2Nt8BlNhH4rXamxiVaUyX/SWdwyV2pjlx6mUT4a9
         ZHp9gDgjXPBhj0veDMAjYHVLUYZaU/xHubdD8pjKDbXm8a2qkg1Fv11tqHI11AaDnBjz
         YiArPH1OclWtekzUtxkVx9nhde5xFCXJLT+oolH5xa6k0LrIiIqDNk+SGW/hV1lE22MC
         m55AWsvJ6GtaUBk36r+7QqBRFOMzDSeEYyg8U2QA+u1spCiImLNNXb4kKuMcGn0s2C1a
         jQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973705; x=1795578505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
        b=QaPpXKeXoiwnZzpoHJU6JirHOhiAcEXPD3uVlYFoNu5il/J20MawcWplsJwkFbkWlh
         lcE+Jy1pbVw/m4pTJBeAxO3VdIRXiWwgfH+qW+LDovnfFP+kWDA/L6Kn7w4iqPjOjI6r
         Nwrok2SNfbU30ODxN6te0ySgCukote2KXpPHtEUn93ozx66AvKZViNJwMdEkgweSWT7C
         hai3BW78prbfvP1YN6OY9agicvk/Jbd1yIlVoeJbl4JDS/46d2ai7yYf+/Iwx5o5/XeN
         6DbCuZvoOctiR9IwHwKS2qewYOjCW/aGxTDVUtlPyj19EMVRvw7raKR8IqFy3Ot7+dru
         XYJw==
X-Forwarded-Encrypted: i=1; AL+hErF6Iel6oBXQNzBoVZYL+97NWQc1WooZ5qFaaO/ST8/NFXEjNNZw6zvx1mE+V27sTyoXk362EqA8nuU1b2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5EQEExjtVPqc14rpXL5QIgj8uFiccuJeFBXDUec7BBRR5abIx
	HA9misOOH79I5nM+Fto578Xnj6AYSqkZMMUIyVFUJ8pFCoTZ4ouZGMNq9Xyjz96Tnw==
X-Gm-Gg: AYBFou1uym9yk95hhOt/fSJzP+ViuC7EodDexr3dZ2kwrjIrTxHQge/Y/9F5BCL0QBM
	tXQ5SEXyhbKnjIzQVciK5Ytt5/NFthr/FZ5W4DyLYFBsK5/iZb9OqzEQsnCrtS6OJCw7rf06/TQ
	rUEzn2lw/sAjCVYA3TgkmEYiCXtIBkK0Ro0THgv8QjS4y8PReygsyucTMAZnMIfoio0+tTkyDGi
	YzeKUtaKWoQOFBqHESVb9NFUmPtwabaG26is4gOeM7p8XiJ9C9/a4XgrQ7QYvJRs/4hwxDApNQA
	1G+PHDtTBhfEmj682Wvw/so+brewLpFjZjmtOkIsNE0R6374dxxb1xqfNk1HvQ7oYbbIYk6gpyD
	FsXanHSxQDGZ7hgeVHuvCyaVY03p9y5jYaVKChRhG9rfYax1leZj+/fpM2fnL7WdwRuD7HubktX
	cV4o5lfbiXYim6snl6WNeF5IW+K5nf5jFDJDkhskGOvjKTMggKvckRB79T0DFHsnpG35yQHXSH8
	+XXQndfC5ATjqb6IHGKd1NoEDVNoBpnJ6dHcS49n7UfjLbhOAPXVeStqOMbU1+kWQ5eqkj2UxKi
	9sddmU1pMJqFQUy6kSI1a7aPmSYYjlIvdHikhm7GjUMq/ttVCIyYi4wIK02unPaWUT665FIL07W
	ktbR3H2k6yu/+nKSVDeZSrcSbO6K8KSoeZDNzaFXsf2VGaM5RRgAj32RrqWZI3SfU4VlFc45C7C
	zzCcy4ahuMUDEd
X-Received: by 2002:a05:6a21:8210:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-3fe872c98b9mr1476685637.8.1794973704719;
        Tue, 17 Nov 2026 19:48:24 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bb9f3e4sm380752a12.13.2026.11.17.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:48:22 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 17 Nov 2026 19:48:20 -0800
From: Benson Leung <bleung@chromium.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, tzungbi@kernel.org,
	groeck@chromium.org, jthies@google.com,
	chrome-platform@lists.linux.dev, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Message-ID: <av0gBCp63QZ2F8gy@google.com>
References: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4fjyoe2kkllcO+TQ"
Content-Disposition: inline
In-Reply-To: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>


--4fjyoe2kkllcO+TQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xiangwu,

Thanks for catching this OF node reference leak problem. A few comments bel=
ow.

On Wed, Nov 18, 2026 at 09:39:34AM +0800, Xiangwu Lai wrote:
> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Keep the node pointer in a local variable and release the reference
> with of_node_put() right after the lookup.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---
>  drivers/mfd/cros_ec_dev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b80..593297df5 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -184,6 +184,7 @@ static int ec_device_probe(struct platform_device *pd=
ev)
>  	struct device *dev =3D &pdev->dev;
>  	struct cros_ec_platform *ec_platform =3D dev_get_platdata(dev);
>  	struct cros_ec_dev *ec =3D kzalloc_obj(*ec);
> +	struct device_node *np;
>  	struct ec_response_pchg_count pchg_count;
>  	int i;
> =20

ec_device_probe() already has a "struct device_node *node;" declared
immediately before this context. Please don't add another device_node point=
er
here just for this. Instead, scope it to the block below using
"__free(device_node)".

> @@ -269,10 +270,12 @@ static int ec_device_probe(struct platform_device *=
pdev)
>  	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
>  	 * the driver should be added as an mfd subdevice.
>  	 */
> +	np =3D of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
> +	of_node_put(np);
> +
>  	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
>  	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> -	    !acpi_dev_found("GOOG0021") &&
> -	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> +	    !acpi_dev_found("GOOG0021") && !np) {
>  		retval =3D mfd_add_hotplug_devices(ec->dev,
>  						 cros_ec_ucsi_cells,
>  						 ARRAY_SIZE(cros_ec_ucsi_cells));

Moving the of_find_compatible_node() to before the "if" condition breaks
the short-circuit evaluation, causing every ec_device_probe() call (includi=
ng
secondary MCUs such as FP/ISH/SCP/TP and non-UCSI Chromebooks) to walk
the entire Device Tree unnecessarily looking for "google,cros-ec-ucsi".

We want to only run this search if we passed the other 3 checks in the if.

Also, testing "!np" after calling of_node_put(np) evaluates a pointer after
its reference has already been dropped.

Instead, please look into using the automatic cleanup attribute
__free(device_node) added in:
9448e55d032d ("of: Add cleanup.h based auto release via __free(device_node)=
 markings")

Scope the device_node pointer inside of the block (so we keep the short cir=
cuit)
and the cleanup will automatically drop the reference when leaving scope.

Something like this:
	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
	    !acpi_dev_found("GOOG0021")) {
		struct device_node *np __free(device_node) =3D
			of_find_compatible_node(NULL, NULL,
						"google,cros-ec-ucsi");
		if (!np) {
			retval =3D mfd_add_hotplug_devices(ec->dev,
							 cros_ec_ucsi_cells,
							 ARRAY_SIZE(cros_ec_ucsi_cells));
			if (retval)
				dev_warn(ec->dev,
					 "failed to add cros_ec_ucsi: %d\n",
					 retval);
		}
	}

Thanks!
Benson
=20

--4fjyoe2kkllcO+TQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav0gBAAKCRBzbaomhzOw
woP9AQCyMO9vyhePX5Mo6ySbyd6lVvlJLWQmBZ/JkBQ5++mtEgD9Fn8urRODY8Dl
tKHn5MQbfnC2KA+qSjaW58BRnL5tUgg=
=LNBZ
-----END PGP SIGNATURE-----

--4fjyoe2kkllcO+TQ--
