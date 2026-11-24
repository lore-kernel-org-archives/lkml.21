Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795494050;
	b=ZNNz8w7PmxGyrl87EgYFEMQqaLDqTNbHN55KBhpC/aWBKa6e2K05KhrF4+6lE7MvW+el
	 uOhreX+fJwRELmA1etWlovbAsASmiL+5r2A3jTmD8IvKXgrXZaNPLSVXnNYTIqXvR/agm
	 ee2I0fbIW9uQnwMQugxbaiB/JEgnjlxOJaxM4NJDECDjhSElvw3VRSjhjOIW3cJevmrmz
	 wJudf1C2k+HpO93cGAb2c6bLbLXUWsnJ1a8Jv4bwV5Reyijh81TjQCbMc0uXqNByXEZu2
	 QvynqBGEX72Ce1lDmcegEzT+uG1pWyorLiriLdVsbwokxLaAYx6h2vO4t5NsJHEfjzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
	b=GKDyVR2j+G5YH4hCgPBV+F5nE5fxmYQOxFIV/mMj69FqR+PiizbZvnj5tsQUjYjZxtPy
	 JDSfq9NpUtWqH1OegSAPjdMIsNvrbgIwY+FRe7QGjR6R/EGwSNP9R1ZM8xxXqnjMIIk29
	 +WFhcGisvPTiDlmRK8OOAP1jPJLx3mHWhU7eqLtKeDKKTr7lQD1B8AI0nxNJi8Y+cI782
	 6FGqc2Sy0veOHzwbEwFQcL6DwTwP6TLMNyvloGnST6noQdihrJ+q9Cc7rk+YFTafIhctY
	 d60UAPrv6DMgrWdzZ3V/rKt/LjgGik/g7ztt47qLJDrIAFq7LV+d/SJoDPb7RWcMlfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LngA7yn+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D170606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D170606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LngA7yn+
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so4779065a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795494047; cv=none;
        d=google.com; s=arc-20260327;
        b=Sm+9pBCMgV44VyD0fZd138Y7M8MAKqtjX9BZm7Xxna644INMRWL40AnSlKF7ctEvza
         XQjexA6ADrSvx1/BaXb4A5MYZXqhea1pOifMTbUFbKTgW0JdedQKXFeKDXW7j5CU1J91
         JhbZp63jb5Bptw5To9mjREyuYqX+2v5a5V9g/ppLojHFAwFx+Salx966x/KNdNXzI8jv
         Xh4HbN61ger24Wh7Za24p659m5GpgsSsgiEIWaEWEcUgiUANWUKfRvhpdc/dGoAFWV7S
         bq5tJIh+CDBZNl2FA9flgICYI+jPL7dzWzGvfOwlTlcDvPTmOcVWvmn0H4m0hAbdwnMw
         v2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        fh=VaT/m7cE8EwpD1EWuDBmGKL6+vfFZFmho94Y5CzpKZg=;
        b=DpUq5h93GuSPrkgMFYKbzJA/GTKgMabJVMSiyji6VEbLclH6eiBiOfxEl4WIupieem
         FRxJK0zVUWOg686EppUmmSdkkxEvtlA1iPreCAILYINLTHoGwETUGZ1A0uQ4HQ9xJeh9
         6swQbKMN9vYNwJwdE4RTQFdydb0Vfkbym7wph+w7sPQavQq6zIIGIXrQpxrAgkjmLSnu
         pri+mAYW59V5aIFjYD92nJPKTfR9g1kPl8g5UMkRHUvIG2LieTLLUT/Pc46dV5iAMq0Y
         2dQSjIL6JopnppZNJvB3+Hwv9Kc0TNOWOTjq8My/zZONndOWtaeH1IXMp0vRQnmJAq3m
         eSsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795494047; x=1796098847; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        b=LngA7yn+TYj3oBq32jsDML3Wtm1oLrVRjkDolfkMT1Oz7Qj+6OuF3gfr65+3X4izA5
         Y11HGSqlPp5/pQ8gk5fHZAUH95KMDhMm9TtyIWpaPzHIKc8uirsZmilPhpVqOO+DaHuY
         2Y2wGIOE/s59Td8aJONIlq6OE+j+tHh2gzIglSCjjgBI4WKEooJvAEXqT4JksOKevaNP
         37m32naJDe/zEuog+obxzxCI+SFVsDI26JPSx/HNztwYEMrKi34wXl/n2ghjLzxCC2Dj
         qk5XXenBf3Qs41nOUSPrbXNUT+mfMB32+2o648Nw0cq4+CJaibNaJf5NbvFEjNyCuxdb
         h5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494047; x=1796098847;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        b=XTCzyRVcOxHhhcsGqGAJ/4gG3q65d6b4b35fvnY45bW+xDDU+AuuRiesyPXLxmMpl0
         ixLl/hVAYtP5E1IfXWBRUkK+6Xz/6/CUxYCsFxLlMmlzjmZ0RgB35W8QV4a+85dlHLE6
         vk16IXUvav9xwGhdj3l5WpvkqPbTD2p+7xpqg6+ozF8DhDhzN9OWlrEJoF+o0wn41mup
         k+xPOGr7z+wTGovlmlzo8FQECrRgQL20NKPuXj0KWDUlb7zpKvFL20Fg6kLsV3qMQ4F0
         oaMLvDSFUZtcwMyHR9kl7vntYTTJvQLeMs+UugyOCuZyt3nrSB3Pf40oAkHC4wZ7N0qG
         1w7Q==
X-Forwarded-Encrypted: i=1; AL+hErHypGiNUZg17f8a1nwWM5bzm0lQ1aPqfcxsW1z1a+PwzFfIglpOCU7jhGD7FHkJBnxIMl071sfumluNAXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/amFVtDLPD/uOaGBLro/gO+qkk3hAQqDvANGpK+2J4T2DUadWX
	Ng8GpYoNx6iUqOKY8tNAGoWPb60TfUcFomPytlZ6eRdHsh8uG7tsDzKf/fyXRMeyHJnqOks0tVa
	72PFBqNWUgDZ2Fp6gmVkREHs4KVoXHyA=
X-Gm-Gg: AZFdTZfNAe56VzML946u5SsqKk9oyI5sjfwXIBMou74DNnqB4uR/xPg+96E1dFtl/sz
	oJwixkrwD/pe7PzmMzevbvp9SQwvriBwI8irARe0lFfvyfcfWF48sievqC+Reop7kT2VK25GoW9
	NdLzunF6RDEgdoQy0WUQrQhMrfaUdlNJEtiIGevrrzk4Vw/BcIieRtTdjWAzckxIkyxHCV9L6K0
	STCjf+H9wz33zRaPtRqROHcrDQXI/bOJBTOJyTNKo+5sfE1tLDKE4Dv3B/w9Tk5UGZAwFEuXQmK
	p8JWM9XIFeY4U2/5WQrfkKiZuUSq3f2Eedzc/KiYjnIq1ACYPGs7JRAbxNqVP/uM1K/7q3amT4e
	jr84l1eKDcAr/iX8YtojNpeEardKc/E3l5sc=
X-Received: by 2002:a05:6402:234a:b0:6ba:7762:3dc6 with SMTP id
 4fb4d7f45d1cf-6ba7762424cmr5526320a12.31.1795494047241; Mon, 23 Nov 2026
 20:20:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118104935.1716-1-linux.amoon@gmail.com> <20261118104935.1716-3-linux.amoon@gmail.com>
 <awS84s2FVdzy3j4Y@aurel32.net>
In-Reply-To: <awS84s2FVdzy3j4Y@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 24 Nov 2026 09:50:34 +0530
X-Gm-Features: Aa3M54o2V3tALqDtTk5FmFGSg-XejOz73sQbTVaEuMBBmEBfiB2hu2jposXV5Ww
Message-ID: <CANAwSgQXRojN2x4NypLajJ8tUf2cyNfdfFLnaOFPd1hXuOMkJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
To: Anand Moon <linux.amoon@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Aurelien,

Thanks for your review comments.

On Tue, 24 Nov 2026 at 03:53, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-11-18 16:19, Anand Moon wrote:
> > The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
> > request system shutdown and restart through the PMIC.
> >
> > The system-off handlers run in atomic context, where regmap operations
> > may sleep. This can trigger invalid wait context and
> > scheduling-while-atomic warnings during shutdown or restart.
> >
> > On SpacemiT K1 platforms, system poweroff and restart are handled by
> > OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
> > reboot driver duplicates this firmware functionality and is no longer
> > needed.
> >
> > Remove the driver along with its Kconfig and Makefile entries.
> > The P1 MFD driver and its other functionality remain unaffected.
> >
> > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > New patch
> > ---
> >  drivers/power/reset/Kconfig              |  9 ---
> >  drivers/power/reset/Makefile             |  1 -
> >  drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
> >  3 files changed, 97 deletions(-)
> >  delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c
>
> The patch is correct, but you might also want to remove the
> spacemit-p1-reboot entry from drivers/mfd/simple-mfd-i2c.c.
>
> Anyway, while I support removing this driver on the long term, it might
> be a bit early to remove it. Indeed, while the driver is available in
> OpenSBI 1.9, using this version requires either patch the vendor U-Boot
> or using the upstream U-Boot which still has some limitations (thanks
> for your efforts improving it).
>
> At the end with your patch 2, keeping this driver a bit longer doesn't
> hurt, as it is only used as a fallback if the SBI SRST extension is not
> available.
>
Ok I have no issue keeping this as a fallback driver.
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
