Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767343;
	b=Ef2fMLWCmR6+obOH28GlBTuqxlDTAKSqDueQHiPpo+Y0/r/y1B8DvNf4uQf5+0qFMLIa
	 USr8nSL4LY5HaFErrXlN9bzU4fLGwgLJ/n6dbYV3UIzuRvWa3c66Ji4uOoZxtg1lX/3Ri
	 y/8/48IgS0Zc9bbBFqblYcMkFDQfce2vVaIHnyP+L4ZtMm3LkFhHdAApxWT3jhwnLk1NV
	 rSCuus14mey/bkn+ZDtx+9yPdScXpWWqwAFNSJ8PVaUBVutZ3VAClij6mMGZ0BZeMC0u6
	 v3fXfwNHOZDEbD2Qy6r5zNAJwKKRoc2tyjncFgs29RCG7YQ5o+btckJ94E7rAqWkZlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767343;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ytZq8gj6jCwazQwgzUyu2K3mPeB6wXaHJj8qdDD6SE0=;
	b=HW8Mq+3T7Ka955flhe25cDeqTegJV5XAiTqWe6pDe9fOaZt9PfNZL+nLFC4Br5ex233V
	 ufq69itA5VFwus0EjUB5yrBghJMumQAbqxrRpFFQA5j+tGNcrbmtd0RBV0GcMwRQtASNb
	 e2amCdm4E1JwVvJzIy/GTYtPR3o5tjQpq4ou+c45C5+WLqVQbabHmJ/7d2Tr8pyLV2DYp
	 AGi+0mGJz/lcdygctnbAFR2w0pDRAY/PK5X8wZ1fkwFLYt/GFszp49pLbTxCCVAupnqBy
	 FIOnuxq+H3HDFnf+feBNl4LD99yYpbP9vbTbY1TwDibI81kGmDKwtYknl3XJxcUWldQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=RW6cxThq;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qCayskzQ;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BCB606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09BCB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm2 header.b=RW6cxThq;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=qCayskzQ
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B8EB1400359
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:15:41 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-03.internal (MEProxy); Fri, 27 Nov 2026 03:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795767341;
	 x=1795853741; bh=ytZq8gj6jCwazQwgzUyu2K3mPeB6wXaHJj8qdDD6SE0=; b=
	RW6cxThq+soCVGgX3gm33NtBEea1iyXO57J38LTNBSFDRRlRgEAtG78vKf2uhuNz
	/HaRmZuJLoijVoswbA+w/90u3/vmMZeGpJ+/BLrOXq6Xz7L3U2ZsHKefY8OHaEJP
	7xwAlQoIJImHyPI4MD5oglGfO+3V1wqPVUisJbv+vsT3OJk4mte1eOP2fVZguML1
	Gton9t3aZHDTURGgjayuEsUQn4EoI8D0wxgrzfleAO4AzVrhLooOmQJU/5fNVDnZ
	doTxPOqbLRlaPurH1/gXkeIRmupcsZmqiP2pCOsYtSI+rFT49fNWrmo91Cp4iT1i
	YMw4EPRzBno1LeC8laP1Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795767341; x=
	1795853741; bh=ytZq8gj6jCwazQwgzUyu2K3mPeB6wXaHJj8qdDD6SE0=; b=q
	CayskzQZYS1R3sTMrBCdIqxoKglFI98aToa8t/RIffUmV4o2Arm2riP6qrdnYvmt
	H8SyVAgGSy1kEZNK4+YnONTgBlj9NAXgxbGDx5DGruTwqKYSzdbJ/jeTPWHpBYcb
	3+GBkAr7XNjQKbMRDsBgNULtOXjwfnbvELPSwmx0SBly1j/ddpc+Xc5j6EHudGW5
	tyWXNLBSktzNrjQJJw+0qxqmoSmAE9Y6alrgSTb8GfT1HhqvZXXhLm2SW8mnk/kC
	tvRxaPoGe0crwfQgAUBhZ7p+z1wI2tlLfDotbdNmPGzaGb1EeQiJlSAxh8KwNQIM
	Kp/qIAk33R+O8ijE52qFg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795767341; d=pobox.com;
	mf=PGJhcnJ5bkBwb2JveC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:nR+EH8szqTuM1vj8ulHZQ/CozFib81IrrrnwGTQQboqr+RD
	B8RV8eGT1cXfH/0sLSOfCGmdn4+dt749UibU/8LnB+pMZ7zh2xSz0yP9cMLIvMZP
	6pcwjQD3nR+ngFCf/By7JTgO6OlwU56QeFnII9BbzNnSQb4cIHur3Z4Tf/MeUSP0
	cKvWmrRXebbuxXZUzrqnZytzzf5yXKGpKAE8X+Gh3udnip7jPxVZUQxk1n4LtzOH
	srARjum7nDgsMH5/V+rzlgSbXHy+i/dPwxg2mo1RACT0/ooq0KopsAd3JUR8XMQ+
	p22MuEmeewlLBFJgQEglWUAScUK2/H1W8b72HsA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:FPRd9GZgnMs8zbGUlSebgY3SYWizgEq7VJFit7v/JhA=:f8OBJqF8fqCHZSGbC5+3aoXQGyzwkDj3BkithDi3hoo=;
X-ME-Sender: <xms:LDwJaztM8Vn1tum7-_wkKSIfw0xlmJUzITBvUjB5cwRxO0M3PxHQoQ>
    <xme:LDwJawXGoWKzKoNV5J-XUGLKveGzrfVfuixr_3-t052xffu-O7Uw3TXG0gD1EcIgQ
    BNJl6RMeVEo2qA-7urXEr2uswVu9GU2uiDe8aUe5wsyFEuWRDObUFWQ>
X-ME-Received: <xmr:LDwJayS1eUJTI5Jmcjvt6Smhv203uhwwYQtA3ql01uZSbv6RwLs5hPmclWiI8ywbTNecExV3AyqKEWllaeoE0I0TXgF_gXrY>
X-ME-Proxy-Cause: dmFkZTFECgzKvlvUqKsDDiGrTI8oVMB7++oRRRSxRaWMMuN1mAnK7KWj6y93eho2RNep1b
    Jr+l+Ua9ZZ5a8l+j8ak/p+JCIYVUy1w+XEgTyz55LucdKidQTESivejNXFa1QpLxZj4q9G
    IMwUL6QDD9oM3yChYIaRc74Y/Q7MRXw2U4DrIDvfCapZ40Wfk4TFZPHIvq46nzogawf4+5
    RX/KavW3M0hxuxdrbK/N2MJ/f94pdJIFGS+Nh8qg8O9ggQLicBzXvt+p9DrdK4pwelDpEb
    /QQ3TqQhTpij4jhFuWtNMfCYAR+YRBXk4AD4dniJtk7rqWa6LXlyn3kxcFm/3sB81VWJgp
    sLAZ+NtfUQslZgvpfK+uo7Vdm3mwimZ5mua304gJQFo+MmWRQtRNcDPbLFAAuxfgPG0MbF
    Aji85MX8rtYAQRAh+SmacutqcgdjZSvSyqYHbaJUgHHeCaT01y+h6OXNdOIzJNobZ9PdVH
    im3hGQn/Xp+hC9dLTOoVJ7GuyDKoJI549aaIWRVU7103DBqmlPz8Xiki8HA2VjTZP1K6jb
    tKtAfy0MOfTuEAuBEapZz73ko3PVzK4HxEUbts+Aohatit30KZ6o44rHOF/yNcvwgGWALM
    /IWCgpenJ8A2JUgHgsDglvKGLoHl6oARLFpy+V3elGrmiC00WgVcDPCDQeQw
X-ME-Proxy: <xmx:LDwJa2JiMy9KE1RlCDEmns2Ewhpo9ZnMjEOKAloVN2U6PAMKB8thMQ>
    <xmx:LDwJa72oCG3iqu4yqku1wTXRs6IlNUNj71OYTnQ3vtwFBXraBDKQBA>
    <xmx:LDwJaxI94Wifl5zQulNanTvj2hu2hBwO17yl7xKjqyVVm7C1V-9X0Q>
    <xmx:LDwJazlOJ_c9W-g_jt5jnlIs5EnXPxt4nOqRfaYZ5bUaAesCyXF9PQ>
    <xmx:LTwJa-C78qja8B59fPran9KD8mtLCTykAh2OTRVVmUlDutz2jZS-QCcY>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Nov 2026 03:15:37 -0500 (EST)
Message-ID: <8c4cdc80-2741-4f3f-9e2f-ee1e696bee6f@pobox.com>
Date: Fri, 27 Nov 2026 00:15:36 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/815] 6.12.120-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261126105709.009001842@linuxfoundation.org>
Content-Language: en-US
From: "Barry K. Nathan" <barryn@pobox.com>
In-Reply-To: <20261126105709.009001842@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 2:58 AM, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.120 release.
> There are 815 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 28 Nov 2026 10:55:59 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.120-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

I took 6.12.119 and applied the stable-queue as of commit
936541b23bb407322981540c7964c73f2ae436f0 ("drop 13 patches, add 2 and
fix 1 based on RC review feedback"). That's the current stable-queue
as of this writing and includes the changes that were made after
6.12.120-rc2.

Tested on an amd64 laptop (Lenovo ThinkPad T14 Gen 1). Working well,
no regressions observed.

Tested-by: Barry K. Nathan <barryn@pobox.com>

-- 
-Barry K. Nathan  <barryn@pobox.com>
