Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648231;
	b=olsOJ7qwNrma4iwSfryrQsiH11mgEMiLBQToP1VgJHV9auNoROw8cKeGQQoZa3fMOjNI
	 kUkedQ7zLwJUEz9r49RMs4U6QZx6sJETiNo3K6xiVM8Ltb7TwTivLJbptnez3HMKL44O3
	 UWHZOR5JWBNpjQHZfmyj7dGgjrTbzSVTEYW+UljMG0Dze1HsPcpiire5b+uKT5QX8MKYp
	 Don6g19/SI+oJjcPT5gczOSE+c/E36ZwFAIlJoy3+PlFdRVTq66etT/ROZU51mHX+xEO5
	 C2abJKTObvu5RfyBCuZzpUCqkAEmV2QGCMijNBbiZtXe3z6Zk1iHENYtvunvpgZ1fjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
	b=ADoy0ZR7BtujnghsDLMISdB1sk/xfAub3aV/2zL6TlfwkJ6GhavA0L18edQIKvly0h5P
	 Cwkx2NdXK1qmD4bh7UVbChIiOxJ5U589wEW3sJPSzW0n9sQy7ZCyqrZUtmGyBif8YVAJA
	 XS7NYpu3bz2x16ewnC00GnOgoz7VMdQ2fJNrz9yXRePeXFiTpDp14sBbDAHsuwnYJL7Wz
	 eNY5IFjGQTDlzY1UjbVrm8KK5NFV8BYdFuq98at9h6rG0jPE8tqxUdsV7HgwW57VRld6/
	 sgV+LOJk5m6F/gDa/35HRLXRPEiVlhZibkDXnqJXRrHewnKKRhyzCsa83ngRuZxjDeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE9606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EE9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso3451130a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648230; x=1796253030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=QiSPxi8Ruze1+eJW6+Da2Pb69jLHtjp5IOjJBHZJcfCiPL+nrAc/PVojTPm/UyFnFr
         2ToPnK8ovRrXR/aZZeKm9h6vS5pzLDPhzpjmuJqIQgCatKiLHY/V/nYzTPa1tUY8viLW
         HHQsqwosd/i0t9dlJU4W0+xtuayQqbQoW+3ExNQxi7m24WsrgIN4teF5xobePoU7/i98
         ptn05DfhDKV9mDYG2vp6RlRg7KE0UffcyutOQ0p3mu9OklqnnbBDA5e4zhg2rU8LLLYi
         B0c7T89jS1Bxy6HJDKtQ1FHLhdUT0g0G6U9EDRLy7nHRlnfHPRxUhNV6NfEGeetdzMvk
         idTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648230; x=1796253030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=iej6GXxKIhRDOM+Syp5OJqhZmqGebTndnrVJX+hLfNaYz8ZpGecW25djZPtAgp5M7+
         ofg8JaotiwNwiH/BIRrwgQRU3T2/fE060zYyASWACPqFPVIUg4Y+ZcZATCFdq+F7eOhb
         IquejuJXusU9Ce6bQtoQqlEts3+UEqiV8qd/hTRacLibbKtFiSRGR6zEA1zpxKieC2us
         7KZ49LVL4WOtrWv+D0NMfleqp1Ohy9gQ67YVZLBDfP4B1qOssXwEmHrRC38uzZkk5ilp
         Yw7v/KpffbGgcqfHOMQ4uRNhaYgHjkR+6Zeo94qgTnPgzx7vYwN2ZWT4qCyKJzu7AMYd
         u/3A==
X-Forwarded-Encrypted: i=1; AL+hErGUQd9ZXM6SITvfN79qqyAYaaNiultohlsG5NAKn0ivufvMGtVLNdC2zmmAeSK/PO2Hf1bldbZcJZv76sE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mtRHPGafWLOwDWyNpWbYt660Fztz6JdXl7NA8+lldcZctvk/Z
	K4LneShOF1fXeFIxqfC3sNSNX3dfLZBW37QCntl5N1rLh5w3JkrkPycI
X-Gm-Gg: AZFdTZe9VAXF15Cj7oV8RYANFiqKkq5a0rXuJ2bvPmH/82yg8q1uO3L0XAAapmY9AHU
	w6ss42TLLtMdCKxIXX65L8oWBpe8WeWEIOV/FnKa6f6IuqHA70+qZeJ9Pg2vc1qijdBw+d8Rjko
	ZK0VgX1D4XbhLc67J7euaKy2SmkGu8zp8GqQjlauB+GzIV5TW81TgeAKRjTDgQX7vSkR2oJVYcH
	/eXaGn2zNBvTNGy0MKr/3X6YGGJ7xMHXnm16XkkCwsqS//d2ltY3U5TiNkC/gtT0D34ZMaV7j0u
	dHNPI3Uqea6Q7Apfpj7F0oAgaUP/dv1fYRz5AZT82vB5kiwuA38H0o02z/5rvpbAPtt0hq6OC05
	7n3JHctrCTb3ZPvnVbBjVYzKJMggXeA2XdZKCGaLbhdrejs4Cppq95zBcweZ/rphhPWnTCwJbNo
	hFXTg0BFThu5YS/KlzHOxjoptnc0RH2Qj+ZZ7sRn9WDEUNpLvAOgM7zthlWY8ovu57UkXmeMR1H
	Cu1A/dHzBJMYh0oCmmzZ96k8zI6OY5gT/f+tbYyBVngrEhUQPRBCLMlQ/jxGn6IAzUiqBJM9FWb
	tTNk29OwmU8qWBcAFwQTV7faqp06
X-Received: by 2002:a17:90b:2648:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b41c95f127mr17871039a91.52.1795648229629;
        Wed, 25 Nov 2026 15:10:29 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm6822830a12.10.2026.11.25.15.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:10:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 19F1A420A76D; Thu, 26 Nov 2026 06:10:25 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:10:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 13/14] docs: submitting-patches: defer to
 security-bugs.rst for security fixes
Message-ID: <awdq4PpsF0BiBpBf@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-14-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="fXRipf5woL+m9ZeZ"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-14-w@1wt.eu>

--fXRipf5woL+m9ZeZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:13PM +0100, Willy Tarreau wrote:
> -If you have a patch that fixes an exploitable security bug, send that pa=
tch
> -to security@kernel.org.  For severe bugs, a short embargo may be conside=
red
> -to allow distributors to get the patch out to users; in such cases,
> -obviously, the patch should not be sent to any public lists. See also
> -Documentation/process/security-bugs.rst.
> +If you have a patch that fixes a bug with possible security implications=
, you
> +need to read Documentation/process/security-bugs.rst first: it explains =
which
> +bugs need to be handled privately, and whom to send them to.  Most such =
fixes
> +are posted publicly like any other fix, but their reproducers and exploi=
ts must
> +never be posted publicly.
> =20

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--fXRipf5woL+m9ZeZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdq4AAKCRD2uYlJVVFO
o6e0AP9gJNOsIP9zrW1e2mg+m5ED7Bg/2J+m6qHgcL361ELOsAD+JrY2Pd5C+/6o
IZAvI+CqACZ8YZPx9icO9xBREbGGQAI=
=9Bsp
-----END PGP SIGNATURE-----

--fXRipf5woL+m9ZeZ--
