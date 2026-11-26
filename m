Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697882;
	b=FY9CCH9NSmDhaNHillMAoC5EKwzcfTtOyCpNi0+myp1ZAg/GMiGw4A+SB4VcVvY/xCx/
	 4HUHgDdrM4fwJhMwkORJMvLHSNi4PwW2WaTqXTH4M8aTpN1/4YoYnQ8uB92MFv3XihRXC
	 O6KrB4lAvS9xGFegA4Rn1Jv2VEpSg9bnHCtpdphDiUDvldNX16OwHhp6wWFzKRDGNmqBi
	 Rf+KQZEHFdMU6HcRV6lzZLbYKVheqY9z4iCZPH+xTkazIx9TAeGBgGbhPU86CwIqLKAdH
	 hjO9mv58FGQRuZBjNNYidFZ4lVTwaQpTfVM6af9IIgLPljQhsWlhWNFjLqOfE0chQ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zogW4wCFsq5UWNkLI/4xoNlFpn4BOZwJaLkB2jw5PQQ=;
	b=xKfHCxwvMRlwvhhqSYPf35x1rjIG9buUaOBZ88c/P2AJfh4uwxOTm30FaOFk30BOoESK
	 D30hq52WfsIsaxbMipJTP8vgTPR+CnQslKJZb9kXJqvGqvhqXuoFFsJRiHQzMo+ST83PF
	 9gP0CsSgK0faM8sqGcYJhzOQuExTJtrGaqTr46BvKa5zG2R7ZHS12Nr0KOqd9xB+3oe7L
	 x3PqN0u355lsteY/0YkIPuhtblMWWFZ5hYoYnVGg4hEVwxcXCREg+JUGq5TR928WGS+ny
	 TYIm+OG8bwMiiqDPLPDM06sVsyc75/Q+FQlSf5X//pXUXRGSgRv15QEvYaOtbCbDmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e9xyUUnQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488D606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B488D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e9xyUUnQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so74502885e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697880; x=1796302680; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zogW4wCFsq5UWNkLI/4xoNlFpn4BOZwJaLkB2jw5PQQ=;
        b=e9xyUUnQXLcue24+72FobV8GYWKabzhBiz71TukEHdYQv1T0RhmDA1CfIryDJ1d3fG
         GbtzMmkp6JDrp36KJfbEV3jyGRf6R3XInIzqnssudJ9QhU7la5DJm3rz9ku14qfBRypH
         2cy043HNo57KS352sTroyOTyK2LHkGHZoZkw2T2VoK7BXGSCTdWpUeVxmgAuai6ZVJso
         CNo6XG154vRExH5NKyfo46LV1KSyYBuPaPlUPID7Am/ixPJMR8ut9m76VQVuBA4z0aca
         8bq2cBTl4rI1HG1CYL9XtqcAWteQ1f+fbCp+faWLoDuR/d6K59MkV8woRkWNTnKrsMd/
         UPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697880; x=1796302680;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zogW4wCFsq5UWNkLI/4xoNlFpn4BOZwJaLkB2jw5PQQ=;
        b=fwxHP6bHjPRA60DlbftDgGVnEftB6PZjCeemevwtos/FoZUaHX1bpUHI6pcAL/bHTR
         9b8BGReNDAQrq0wI13NBCe945eUpzxYFBB1TH4HRR7y8XxOqmfGWLzfPdFY050g7+EJU
         wYePfRtP8bZeN5fZjY0v3krlF3LxYb+muPl2rCerQBc48YOK/KmYWLtpESKvsldTdehR
         5fVheICsF+GM++NcCR9HjUsikppkEpaj2aOvAtUN63V4tk6Y/jHjvh4orfopedPaztgG
         /elAgZypm4hAP+DWY/OtlM8TE17dhuKLwCzYo4YF4RqYuJOeezkOGXx1OxbdeUIJ50Ym
         JufA==
X-Forwarded-Encrypted: i=1; AL+hErGbZnL3+rlBqFSQQvyu+3BXqvWxzSOciZ2DYLepk9Vvz4sFvTwttPpP/KayoPidx8/XiZ87HGyNHmRwiOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z90vBiFDRe2Znxs5OD7D4izzMhVZGEhI+7SMWWr0n8CsWLd1Ame
	/1dZI5CTrMS5tqz9Rr+ROhcshhDVFlkAgx4+mUINeposdOYt7iW489oKyoqzH4GdDPU=
X-Gm-Gg: AZFdTZdECu/v1RipwbtTly0Vu6pReIdcNy5kz0WBy80+7HYlHM9rU3S9A/VAlQj3ceN
	+xQdypPES6PiIM9B2LE50iu66kdvK5vITs+0qEMjRv/zS5GjwTSphEe/lxXFCCYiImM3TclCfqD
	X2OntT75QeV8rjC4CnUlx7DCxWrm/R+KYcDlheGykvVS+WFMtqrTnOWKD/vF8c2MKvLITrl0zLf
	3BOS2cpAsLJbEYi587BcRryymWxbi8yiQDP1xRQdr2GfZK14HXWedf2ir6T2+daLTsb5+4nYU7N
	aTgmLQQu5RHv61a+1KI4Ua0qIc1AhnKFVcoK9m3xRUbv9zPoQhqAp85UjP2qrOnhpvv03FttmTe
	zPBkfIruoVowgBg1wdKHrRlu0Xg3g+a2ESy58qfRZ9SE40WjS1K3cdzmk5wUNDLVz7rZzUDF7ql
	zNYDMaeolMV2DUhdsmtgkGVq77zP4PJzT++Pu86iMKhcbGp54xyVVJHU9VjDdoLwHYKz/tN54wW
	Dq6rVyc/ZHvm1K8ALrphgcu1I+jRyIcDADKe+BbFJuwqd/ibHvGgAaVYRKzNtrVY/mvl5ghQWNC
	97EpZTXJszJQyNUU1fapYYH/1OuVTDxjcQ==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr431408155e9.18.1795697880151;
        Thu, 26 Nov 2026 04:58:00 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm541261675e9.1.2026.11.26.04.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:57:59 -0800 (PST)
Message-ID: <c3273007fcdc6e6e832ce3e24e6ff7052d46c14d.camel@linaro.org>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christian Loehle <christian.loehle@arm.com>, tudor.ambarus@linaro.org, 
	bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org, 
	lukasz.luba@arm.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Date: Thu, 26 Nov 2026 12:58:16 +0000
In-Reply-To: <20261125173959.2198116-1-christian.loehle@arm.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Christian,

On Wed, 2026-11-25 at 17:39 +0000, Christian Loehle wrote:
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clock=
s
> independently of its interrupt mask. Setting it to 0 C limits all three
> clusters to about 200 MHz while cpufreq reports the requested frequencies=
.
> This was found through trial and error while tracking EAS regressions.
>=20
> Program slot 7 from the lowest active hot trip so hardware throttling can
> precede the critical trip's system shutdown. Cache the low/high window an=
d
> update the hot limit from set_trip_temp(), because the thermal core skips
> set_trips() when that window is unchanged.
>=20
> Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver=
 GS101")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
> Since v2:
> - Use hot instead of critical s.t. it precedes shutdown. (Tudor)
> Since v1:
> - Rebase onto linux-next, including Daniel=E2=80=99s queued ACPM TMU fixe=
s.
> - Cache only low/high and look up the lowest active critical trip when pr=
ogramming. (Tudor)
> - Retain the requested window even if programming fails, matching the the=
rmal core.
> - Handle critical-trip deactivation and zones without an active critical =
trip.
>=20
>=20
> =C2=A0drivers/thermal/samsung/acpm-tmu.c | 76 +++++++++++++++++++++++++++=
---
> =C2=A01 file changed, 70 insertions(+), 6 deletions(-)

Thanks for this patch. I was indeed wondering what was going on... Boot
time on Oriole is back to normal in my debug kernel; just to add some
numbers:
=E2=80=A2 reaching multi-user.target drops from 99=E2=80=93111 s down to 20=
=E2=80=9328 s (saving
  71=E2=80=9390 s)
=E2=80=A2 adbd readiness drops from 120=E2=80=93132 s down to 21=E2=80=9329=
 s (saving 92=E2=80=93109 s).
=E2=80=A2 cold copy_modules rsync throughput jumps from 4.37 MB/s (1,727 fi=
les)
  to 30.71 MB/s (1,713 files)
=E2=80=A2 CPU die temperatures at boot end also reflect unthrottled executi=
on
  (46=E2=80=9348 =C2=B0C unpatched vs 49=E2=80=9358 =C2=B0C patched).

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
