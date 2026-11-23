Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425316;
	b=mXY0O0fLeP9ahLp/aDcWSJu1FECmY1pnkbMiRsoAMqZ9XDCbqWn3ZxnbX6cfHUfRjchw
	 OiRSHnxrI9gmkvphSmUdox8jMRBahKq1OdczoKetJvo2BV5Lv2jCRnJ+Vp6h0Drb1N4Lu
	 K0uLpc8GfGFp1F2pFB/yXgxZMT+oMD83gS4GQNLG+hncUgYQxXlNK6iU+giHzJzr7DfjZ
	 kTgJnOSjDp4zX7nuwP25/kzwdV9aBmvUd+AyqzllUG7WwCgjb37v5OV4/AVjI/knHZi0K
	 FeuNSa/FL9by9k+Z3dR8qubPJEZj7cSY5AE6U0ogEnqM5owoieAvusGFLFsUMRdwzZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
	b=TYd9UnRg0ILRXIg8OSei8saOmOG9MPHoWjUXc4ffKT+qda1AaN91R5Qeg1JTlnjP9LNl
	 usIFuADpzact6iFQC4UlzzAGLXBOw+jVHTS3XwR+MaYAHxwZSop2a8ULV9hhUdlaHGNjh
	 McCURJuvo+uECYl48PZ4lJXXOzIAM9XS3qie5d2saYJpRyEetwFAqeZ4RbV7zJfpl3hr6
	 daTXYl+1HFs2V8RF49U0h1b+K9bGg4ovFwm4EaPoM1+ctKoiO/8svxH3G4gpR//3cYNEJ
	 yk80LtV0+qxl6Lc/ZLSowvLMJsn0mbvZYrsPeCfWzCHqumhNTnc4n7AZ8UuST7iK5Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="LZ/loZX2";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF17606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF17606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LZ/loZX2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28469175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425314; x=1796030114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
        b=LZ/loZX2sGBA1LmOAVWd0NM0Jg/udrTxAoESEXHdSAVToxI9PS4GDnOzF8cew+ac9L
         8u17WQbFu2KSI1v/6Vq7nAzhJUAZQG1KBK+a/aIo+lO+dIpTaufAFNuLSkh5k41ZQ/Di
         JJ0QHMCoP935ekri9cDlNpcOjPS+UQhbauqZbL7/0HXWPIEBiyItfVZt3Co7f+oNypJz
         lai1iKKFLh7mr/HYmtX055V+qR4yKJuRbbeD82cSzFQFaCN9iMhv4EIDdo3v0c3H063Z
         xgyiU1sxfpt7xk1unZ7VQbIv6bHA8GI0WtqS5mjBxFtGSmvWYqzcnwtOyxqgQYU/ngiA
         9/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425314; x=1796030114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
        b=uirCUrhXSjfth8+AbRM52aw7qTD7AJxKMDNLbSBu8GJ0rcYoPol90I23Ka05iyStWM
         YEjvhFFaFiLVS6O1geZC/s7bVHqoltsMT3ymPeImRLKCeZ5fKss9bhSePtv2zvhgP/z2
         Reh2K4c4D9/PTNVmovIeDGoTZEGKsGwXgD9jypJrtTcnLXO60BqUoTh+xfD6jXGos+AL
         G03xnrUZrvhBKL7iNef22JkKXKxQpG0A21iCO9Rm18eAGNJ50vtDGRDeI/Ufpw1MNfgE
         GsTXwYcq9HplaatEzxofCPwVIvw9gnGsJGnZgvKH+1keSkfWdfNmxB5S12StFW7wnbQi
         rXsw==
X-Forwarded-Encrypted: i=1; AL+hErEPgo+LpW3+SkJC/+lyMUu6BWiSHrr32owYYb2FghFzfLELku40+5DcfPD/niyPUlYF+Hvb2jPpOxxKeAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/63Uu1zGNaJZkQSaCWHlSpnfT1SA/W5Gz8BunlkThfdGvG9PfR
	SAhyICjZ64i3hcH+imF2Lw0PEJ/85720syrSKnY4sgmUZfAeXU8nITdxKjN+qZzIcRE=
X-Gm-Gg: AZFdTZcUbSPdhBEbGy0l7JLgAJUXiz/Qar5kIT33BcMzsyIzd13s3VhmF0U8w0GpRDx
	/cKGZaWPez0G1BSgqLzgWyNlZoNBI2kqkXD3wVSJtRrtFs/b48xU2gNgGSfCpLs8RzwjD6Hqx7B
	+0lP0EpDKSARSUgrSjfvyAc6E8UwZKqvloFnpcCiup9eMg3xql6xO+RY2LzsDxrCbnBNepZ4k2z
	kSS5iB85FLxKou9ZbN6AXupPZSxU4vy013bDG3mfgbFSmPCA62VU3WVtUpRJu+7x8/3l2Jm37zw
	O+arkacpEuZE4mMP4/YrK0CFdUarWllrI+JWCpyffRoHlIdt6aEgzNMbtpsmKWLi23Tel0q9LqT
	0EKoUn5Q8ySn/koso9zkUg+Fhk+lZRiZ2hQb91O39MzdxneFNHnkvMatc/osXQAGDUdZtSg+Zek
	vr28bLO8iSYd5eFmAX6ucuySQh2Mfj1ra059KAZqinBgY/ikdS8DP4ysxl5NmnJ8nplMhhGZiYa
	MEEzxH7595iL3jGFjfj8wqufIZqWIVxCNnfY1ymnvTPLvXWJZYdBdank61w9QUtbf+JbbDa95Qa
	vu9Lpc9D07Q4A23QOZjMvsoMTt8IzOT/hzcSpcSMTZQfBdUCxjVLbxox3XiFNJlER/nU6gUN/8u
	Fb8L33YirlSV4lJRo
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr218391455e9.10.1795425314064;
        Mon, 23 Nov 2026 01:15:14 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm626178365e9.4.2026.11.23.01.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:15:13 -0800 (PST)
Date: Mon, 23 Nov 2026 10:15:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	tan.siewert@9elements.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Message-ID: <awQDxB-09pHSgfJ_@monoceros>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
 <20261121034053.39878-3-prasanth.padarthi10@gmail.com>
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
	protocol="application/pgp-signature"; boundary="v6s5d2pxosvbykll"
Content-Disposition: inline
In-Reply-To: <20261121034053.39878-3-prasanth.padarthi10@gmail.com>


--v6s5d2pxosvbykll
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:10:53AM +0530, Prasanth Kumar Padarthi wrote:
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/unaligned.h>

<linux/platform_device.h> already provides of_device_id without all the
dependencies that are implied by using <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--v6s5d2pxosvbykll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBB0ACgkQj4D7WH0S
/k7Hxwf9H/8q38Ueri9XT0N4hYnYWo22+INjgZLMlUEbSlxNQBDn1IF2w7mkk8Xv
BdxmX9P9vtKw5T3eYt0Ay8rnTIvrpCTlqxLAdjeAG35Y9i0teVdHBZ2NoruLywJe
o+SMd+vKFQGJIaPZpqZ+8l9UVMX7cw2f63hV8DDB/qOQGLOxUp+8+SMlTSh/0vpb
tdDetsWfXf3zXpUhcdm94FD344QDgGcl4xldzIYrZH3YFr+1yZhRgrSzHEWlg+GK
LazzxZYuxXq1ViTVixTB1tYWNiQjv/4vl/Vwe8zcAcpBwo1usnJXrObYY1gG+00g
g80CYxg/efXxv1fI8Yd2zVP5nAVxKQ==
=C1hc
-----END PGP SIGNATURE-----

--v6s5d2pxosvbykll--
