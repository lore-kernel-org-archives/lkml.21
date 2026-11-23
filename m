Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429055;
	b=lbzgfc/tXHSLBgCinemVYa1EWWibQ6+OFZB6PbU0zcisuGsK7PX+UmrCEaEzA21jwIjS
	 Vvk77RxQZfiSb4hno1ly3qeWgIU9oHjX1/aejlLT337c9klZGYjT6J9QdMcVbu6o22zJU
	 sLFPA6NpJnKipoJSAbKF8ccvgE4b3Qp49If4mqVGX6rPU6UJyHXHQV4EcwVjy6DrPGuzI
	 5yNspQdQ4aCKuoFVmH/JRTThlvg8lcFAg1IekEFBiz5WPxLa7znBF3gJL+s/rPtD8aF0P
	 XLbjOQV7bk1XRq0fusP+5rfL2GLnm3rdyR2JzEdgHfiZnSAJCYF/fa7Wadn67G0p4Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429055;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ducv/mz4hmKhT5QO6HCKfk5+lde9Z7VIz0eteTv3C9c=;
	b=wXN0RVQx36vXeQOb2N1dIWfOFvKTv3CiMmPLvnyYrP2Ix7I6CnF02H7Kj8rH1QKvYmet
	 CYcXruC3iFOdTLta6e2xc5LreNpXd60mMdSrsxt70nzboe4yXPd5Z7QHyMDseiN6Aku38
	 TiwshNLmky8U+oxf54thkCb4gjtav6H2veBJCOc/Wu7OSMzzLwf76tDtciKT6Zc0n2CQN
	 QFbvLE8c1qlTjL7AOjgc8af0VTQkn1JBQ8Ge5XpjJsujbU6pFEr7Og4HKDZMp5hsh6ott
	 LdpU1vZXZrNhS5qj6wSOIm18Nx6OA7Qp3zzLRyOdZ7CJTBCWVBJsW4EhCPHwgQG5YCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bbnraiON;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B44606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B44606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bbnraiON
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ducv
	/mz4hmKhT5QO6HCKfk5+lde9Z7VIz0eteTv3C9c=; b=bbnraiON6bV5sSTu5iru
	PYflYZSl9jl+IuxyLlgEY9+JPOcuQOMQMXrmURJyetU+kabeTdeykCRi83G+Eyhs
	RKyogmgjDPRmqOWCwfP2rq6f0XpNsmcwIZ3w+WyKIciPahXKrNz5j4w/wHSblyiJ
	9zpqpRPmpZQBtyWkXEJFs0lx1WlpJeyOvZe9DLsQDFOn+8eA1kwuTPkz9bS5zP3i
	jekw62Ww7RvO/lNgQ/EXU4cC0ldkDc7TndTEF5J2L2kCq1x2H7xdlhWjJFnc9UN3
	5otU9T4QpUYEmpKPYHN9ZqTDV1OlCngEy6zHo9feCuTxPncd4v/37UVVi5qlstIW
	+Q==
Received: (qmail 2658429 invoked from network); 23 Nov 2026 11:17:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 11:17:31 +0100
X-UD-Smtp-Session: l3s3148p1@+anU5u5g8JIujnsu
Date: Mon, 23 Nov 2026 11:17:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Artem Novak <artem122novak@gmail.com>
Cc: geert+renesas@glider.be, linusw@kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: fix typo in RZ/A1 driver description
Message-ID: <awQSuzxVZkCZr-9q@ninjato>
References: <20261122174427.276446-1-artem122novak@gmail.com>
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
	protocol="application/pgp-signature"; boundary="j7CUZoOm/IRBz0Hw"
Content-Disposition: inline
In-Reply-To: <20261122174427.276446-1-artem122novak@gmail.com>

--j7CUZoOm/IRBz0Hw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:44:27AM -0600, Artem Novak wrote:
> Correct the spelling of "Renesas" in the RZ/A1 pin
> controller driver's module description.
>=20
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--j7CUZoOm/IRBz0Hw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEErsACgkQFA3kzBSg
KbZuMQ//XjKsOZ8XOyC+BXwMuoP/w7PbhG9gpNmPX/bdH6ZJOKYBe+pkezMbWKDf
PHi/H5BVJmt3OK5/9H0/W/xjxnHKLLk+goSuPwzZbzS6q8Gc4IU3KCmDkVX2D7At
9+GaeZ1+E2abW9Yh/sPI42srzyg6GbrsAnAfDGzgT9/AhTk4DoWy/DkU/rFN2I31
T0Ex9npTV5ghMnk3HJffn2AhfzRllEMfBEZtVEQFP0AzT/9I85++3XKGu7+an9AF
enFKpEMsTMa/cmgWVS3w3mchtd7+7EZzyWhhtcJ3Rg6dmJ3tu3JqtN/9JP2xRN6B
Bl3Qy80nD2p0BoH1PYFvwWczpPdgsC1rBySjiHSVG8Wg1EWWtSxTsuhskSWxpf8Z
788Ng76yTxl5GiPCXZ8kclUTt5q4XrSdtAfIIcN7NrvCg4CT6KsKgG92PN8Ni7Qv
Ok/xkg7FxxMz39KDJzfRtSlr7UoV0FjFqY01gkhu7cmILnFc274k8kGSmEx+/oBq
QbF/Z+nikopUHVdxSReDyDXRoZE+eG75Zv+Fxt0SJ7tEBUkWc6D3L/gWfOv80qnF
D8Veaph0U4pAh2n2h6nZolkXBFbdB2ELBDMUuR1doWIct3nzrOgkqEUaofVQjR24
JjWbC27msnYk+RNsNOv//tLJ3vPM8K2SzjU6xC9874PiXe+6ihs=
=7AD0
-----END PGP SIGNATURE-----

--j7CUZoOm/IRBz0Hw--
