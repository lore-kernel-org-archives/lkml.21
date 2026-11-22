Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795331564;
	b=dlW0/u0d1xeWEuEUwBvSNHRokrKjbKZDhQf7SA9DWCii83JtRmjF7MgZmM9ULzVoprVF
	 IGVPFxBC40Y2pSBI+VUmK4hxPnTRlpFf3wJ7KF1PoKIK61rhos27Y2F66tZMUO72jeyOe
	 gYRH9YUUHP/OW2uLrDllrTs6WobR28IsOVW8CXWuXSeevxXPEecG632qhnMD6ygpvIETH
	 thWFjKBWSSolxtmaGI8kVKIY7sYYeCOFihKwbvDiMOW73JCkvlx6kxZJdV7HpW0rFDURt
	 3SHMy80ZcJn/Na25obE7pSPNQJVpC0YJKVYqKFQPNYXELp/iVrB0CtKQ5CDFc1LaX0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
	b=OJeGUeGv363aJ3MZgwIeKzhtNSUU01p4CHTh4ATTT9bSUlRQQrOuKBNYMTe2J4HuFKWZ
	 feSqXr4NUNCcX8IZ6Z1yK+X4MvtFmyxqJi9sHw5chLxMyvZcURkfbRCdXgQ66s6IlMaHV
	 FyZh+CuK7thBGl8UI2rVdq6yF/H+SJwBwH6TeBytq4W3P6hnGhP/oPIUbR8xQ30ce7LxV
	 zKJW+0EWRMEkpaBURqSC/Kxps7DEOwjD6atWskXDFKpn9cUGvnViwn19xRTQXy64XV5A/
	 5HnznskqgSXlzFy/qp4K05tprM5LON6kmb4DS1WvctVcpQQ7Gu9k/Z/7GpVzxl08PIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnnaOsuc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEFD606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnnaOsuc
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so4857723eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795331563; cv=none;
        d=google.com; s=arc-20260327;
        b=HcjIM2uweqkkJnb5c5sUhaXnmzKlqBaN1vl+4Bl5LWqOZqSknrt4q5FONQLgJP86TK
         PmzMByAiCvSakcyhUfBYzjwtxk0tUmtCE/DR/fT6Ft+iiBeOVumS9hb/YwFSbcW/W2i/
         FU/tN2PYaA4GHPZrSLjCpNmF3t0KdzXN+HmzorTdjhsYCO5N6avI/1f37mzVGc0qr05m
         MCEpPq3otKhaZSs/OS9s62AR+EETsZXh2O80W0Vjewo0aCrOTz4mi4S9ijQnZHUZz4+y
         747CIBhoTtxA4W0OI4DkaEnHroBbOVAWR5GI0oGZn6F5Og8RihOHmqvkEtNoHylHmp9/
         jaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
        fh=dNGvcoqmlj2M7EwP8BgGMfqjRbqN7PnXtFQEeP3/UCo=;
        b=SeXpKGWrDdMrSfzPSezsTX5lz62Gxm9WSCJVExm2srIk2a8sqs5nspUPKnN0nDPn7H
         QHaMPoJCkmwIRFrkaWE6/z1fOcoE5O3MQwHScvvwxB2rQaUfEdlZvqI2lIQSeHctlwzy
         msRNshlIVkpqWiPg6aoZEzTd1JQs5GmYCNpiJp1fl7rAsQozEaTc/hWiBCIq2s8h5+g3
         RGJ8vPRuLZV2RWXFmjFHMJ+XlmE66S6vXX05IBppAjfzCZbTJy3lsh2BV3F4KIkZkOSf
         y/Gk5xxwoRbjORMJoqwUNM7S7XPHNqOys4pSMuNIjsWj8blTckJpz9Ka21DcZu63iOTO
         DRFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331563; x=1795936363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
        b=ZnnaOsucVYX/DpYqsG0NMRxxNHndwpI3QP2ecJ1bAcia9LOdpB/4xgGkLKF3dCuFzi
         oOFMPUZa8JavQQfbnxRNuO2sgn9X1UT0P2VCoczxfqaGWxPcDo+7CmUmo45nbLDgo8xj
         27KbhSIgL2l36VDw3TXvTlHNcCBt8K6611DkLmiJ1d/stLjd7Qc39BWZvIjz5OfpOwEc
         ROgoAUtEQfi4Ic6SbCaeiWhG+ykCcw3+KB/ppdoxsKn8zPDrM8bE/yhoLf2s7UzGCUvY
         ZcEUsz9WRafKG6cqV+4sEbYzv4vMSQJkFj46CEeF2QwsObFOq84bcvSoEJNRJWc+LyX9
         /54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331563; x=1795936363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zVCA/hCaFTJ0zs7I3VxuYhc3vtPcxVWB5oZY5PyGJw=;
        b=gwcbEnkC7+EkO9R4XOiUiNk8ifMlMMSG6qHQKZmk0wvfkpoWvJPOWCQfMyKIpdCQ9Y
         VGIHcL5SS8ApSHPYxxWtSe22uZR+0bfu8xoSJlyUj4OUNjMWzJlwTlRyK+bG0Kqk9DQ9
         mTIlXcTEU2GH/56lqjFwHUYkTn+yeMtGYqhsH0Xum7kVv+09RAV92Mrz3DpXr3OYbAjF
         tmOm2MtY0uuAq4BYVykydJKzm7c8w57tzMFwxVgjeE4ANz5DDi5G5y5QKOw/ZgzowUok
         n1utdWbeCL4Lf1UHgo+gzqKLjSuhRhV/uOkUGnNVtTIgSUMj9c8sqa471LiZngw1ChrR
         /wHw==
X-Forwarded-Encrypted: i=1; AL+hErE23ChKjHj59D3Aw1oCCUXBF/xz/t4DXnkqD8JU7D8znK8w6i3Df665BsVOivAGRCyiAmAhH+nV+UDWeTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gxTtpvzDa/KBjOw0fb3SDOWkodlhLRVw7QWjDV1aoho7/8/2x
	3J5E2AuL5B0TVqeEo+4tZX1oJXBYu71p9V5rHry3FlfmtiJ7AT1f4kuzcXUUvxcP2/Sag9GVq5c
	gqoMj/zwgmF+DoRAmbl4j/0MPXj38lLNWDmml
X-Gm-Gg: AZFdTZeOjLKJCM6xj4VmT3rp78imbvmFjPArC9juNd7x4HV2Ua2XNZkMAbDb+pIgOdy
	6/oeKerYJI3Zj1r263Cw5wuOMFCnSN1jirEwug7shGIS50sDAgN4+ZEqlPZjH+7tzfWMbYMYS9y
	jTScabydFzg9A89c79l2DeoiHL18DXxjA8ZeN6ro1z7R5z6u8xnOUlGOYk4b3uu5teVRXT/6NYA
	mY20zlOrU/ebvnndMe3RYY01xnvv0h/WsyYu490/6Kjpmrp8o2Ed3PySITSe7oCVd2Uoi2vHUsE
	rYD1kfg/A5p9n71hw+Nwxft3p+FcJVWTwc7cLxWB8XSk2cR3N4FM9Rn0Z1jr7V9JZ796i+/eAWv
	uypBtiQ4U/OVtM3mSmH+dsjmWru/1A7T36zmT4cQbEyK4ueQ6Q8gpAoahg8YzqSD1n4HsmlNQty
	dcknjnk2VXJiEFxhn3BTv+3Jvt3vl4YdU=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id
 5a478bee46e88-3856e63b3dfmr8855384eec.9.1795331562732; Sat, 21 Nov 2026
 23:12:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-tegra-soctherm-shifted-cp-v1-1-528e3621226c@enser.io>
In-Reply-To: <20261122-b4-tegra-soctherm-shifted-cp-v1-1-528e3621226c@enser.io>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 22 Nov 2026 09:12:29 +0200
X-Gm-Features: Aa3M54oEQYrdYNxdmGboCbVhjm2_VcZfJC2F9W-WuGPrYliNjD9ZCNd6ydzWpMw
Message-ID: <CAPVz0n1wm2jNu5n0DXMea70mw1Z1uSrQQLVDA1PLHYbh+-h4Ng@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/tegra: Sign-extend the extracted shifted_cp
To: emcp@enser.io
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Wei Ni <wni@nvidia.com>, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 22 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 07:1=
2 EMCP333 via B4 Relay
<devnull+emcp.enser.io@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: EMCP333 <emcp@enser.io>
>
> tegra_calc_shared_calib() extracts shifted_cp from its mask and shift,
> then throws that value away on the next line and sign-extends the raw
> fuse word instead:
>
>         shifted_cp =3D (val & tfuse->fuse_shift_cp_mask) >>
>                      tfuse->fuse_shift_cp_shift;
>         shifted_cp =3D sign_extend32(val, 5);
>
> shifted_ft, two lines above, is sign-extended from the extracted value,
> which shows the intent.
>
> This was harmless while every supported SoC placed the field at bit 0:
> tegra124, tegra132 and tegra210 all have fuse_shift_cp_shift =3D 0, so th=
e
> masked extraction and sign_extend32(val, 5) name the same bits. Tegra114
> has fuse_shift_cp_mask =3D 0x3f << 10 and fuse_shift_cp_shift =3D 10, so =
it
> reads bits [5:0] of FUSE_VSENSOR_CALIB instead, which belong to base_cp.
> actual_temp_cp, and with it the THERMA/THERMB coefficients programmed int=
o
> SENSOR_CONFIG2, come out wrong. The hardware then flags most conversions
> as overflowed and never publishes them.
>
> On a Tegra Note 7 (Tegra114) seven of the eight sensors report an
> overflow with TEMP_VALID =3D 0, their thermctl group registers stay at
> zero, and cpu-thermal, gpu-thermal and pllx-thermal read 0 in sysfs. Only
> mem-thermal reads a temperature. cpu-thermal carries the passive trip and
> the cpufreq cooling device, so software throttling never engages. The
> hardware thermtrip compares against the sensors directly and is not
> affected.
>
> With this change all four zones read plausible, distinct and moving
> temperatures (cpu 32.5-33.5, gpu 30.5-31, pllx 34-35.5, mem 31-31.5 C on
> an idle unit).
>
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
>
> Fixes: 65b6d57c24ed ("thermal: tegra: split tegra_soctherm driver")
> Signed-off-by: EMCP333 <emcp@enser.io>
> ---
>  drivers/thermal/tegra/soctherm-fuse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/tegra/soctherm-fuse.c b/drivers/thermal/tegr=
a/soctherm-fuse.c
> index 8d37cd8c91..2de1d0cb67 100644
> --- a/drivers/thermal/tegra/soctherm-fuse.c
> +++ b/drivers/thermal/tegra/soctherm-fuse.c
> @@ -102,7 +102,7 @@ int tegra_calc_shared_calib(const struct tegra_socthe=
rm_fuse *tfuse,
>
>         shifted_cp =3D (val & tfuse->fuse_shift_cp_mask) >>
>                      tfuse->fuse_shift_cp_shift;
> -       shifted_cp =3D sign_extend32(val, 5);
> +       shifted_cp =3D sign_extend32(shifted_cp, 5);
>
>         shared->actual_temp_cp =3D 2 * NOMINAL_CALIB_CP + shifted_cp;
>         shared->actual_temp_ft =3D 2 * tfuse->nominal_calib_ft + shifted_=
ft;
>
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261122-b4-tegra-soctherm-shifted-cp-a3b27f666f1d
>
> Best regards,
> --
> EMCP333 <emcp@enser.io>
>
>

I wonder if this is AI slopped, or straight up stolen?

Existing patch sent 6th of Nov 2026:
https://lore.kernel.org/lkml/20261106-upstream-soctherm-t114-v1-1-c875d1921=
084@tsv-stahl-riesa.de/
