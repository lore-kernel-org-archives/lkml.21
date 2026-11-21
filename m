Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795261965;
	b=B2QspqDAcMWfzjp4ioYxZM8j4lbeCAWCSQgt0oux5QoAbz9m+SNlcHO1SbYxpZYNcYHX
	 frDieJR9bhBViMiC4SByQjRxZrYp5yPB44hIx+pZQC9rACOwZH5YXcCHm0Slq87L/9Ow8
	 KCmqMvR1KU/yZt8DFKe+IOSkvRH+RvJzPF31ttm2o1Py/4K1+bBuXUUDlGOYhWeQnfUoA
	 6KK9/NXF6KXUtKJzd/g7z8MnkKW49ZXG/N0eJ58SIWTcz6JJi3K0fpx2sLcbVVGzJsk8Y
	 maB9eCeIH/CWj6s/FdMzG46zjcnpC+19Sj6QNuRb0iUOr3iSnjTQVGL8Peqa0vvqigA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
	b=N7h/gnPuK+0qqbup7W1mwv4NApc3uhY0Xyo7yeeCkQJkdsfbmauBC5hNKYizC7V3xrDx
	 p20H95oJOwYirHl4ux5M9CM4HcXU21HzlCaJuA52c+agAMlD1p9WQ+yZsoJVlfvmoGu+L
	 ird6syMgIzzF753Zvzu2r8aWebHkKE2h32axG/Sy3nStEpIWi5xTMGTVq/5LU7L22JTEU
	 VfL1lX6u7p40OFiE5Vp+y7rFAD4uLGuxkxch4D61flqBBDrHy7MNsxsy9S9tcjCErfMlH
	 btawrp09TjoElmZE4gK9rxzuL/KkkCKbCbolUJQA7EQh3instbF222TbAteIsKqI9Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qb5bJfVt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B840606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B840606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qb5bJfVt
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da7d18f2fso1972010d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795261964; cv=none;
        d=google.com; s=arc-20260327;
        b=MoP2iKCFvQU2Z56HVttm5Ac1/wkKBpH6y4gso9PaVm8FA8Imyyq7J8PkVbXr1PqP2U
         Isr16Vb9By4AXEdqJzku8H+lK86RHNYYmWt3pM3AOOCiqAtGY9iKaHtQGb/D0xLzb72t
         2z50UTW/ReFAQrM6nRsGH3k1k4B/vYvDTduEUInYKF0iy3xGxkUgOT2C4GkxZH42bYLk
         VuUSaRQtK46IIwbC2SQrvSI+iWa66espWv1MHGj+ormQsfaQ2aztdZ455JtZ9g2notR+
         cOvFDdCBnhEhG0r7sTuk/nOrgiCLZaZbzXfl02/x1gO6sAt/pSn4AE9jM2i8+hvF3pBM
         BDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        fh=twMb+/eZgHvC9ZCdzGfKaDUcuy6V3M84BqIfGpU3AzU=;
        b=Uba/EtpBAlk9JRPobQE7SFwcWwQTB7dT8HoWg8RudEWOI3F8Ulj9+gVnqpFHHNCPwo
         t3biyZtEq8ZnHFfGFvGIIbMEq2k7Fh9sbweBynJsKmDCehYC2+5tbO/AZJz/46rWHs78
         N1TzNA41TWaPCyYqAWV4D3riFMlDUpxCCPQogtPm4A8sRZkVR2sPaucziy9Idy/EgOxA
         HkAVqPK0evezIQ9UnLz2kNKiaCRKm7AUOfXYg2ehHcHnSOD/mxfaRIb2Y9XHvVBh8idL
         vjtYndatrQ1c++Scl4+UX/Xk0Q9swEEBKNMTIr+lD1Hqx6JKcAnSuOjFIK35hX4z5Ros
         hKcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261964; x=1795866764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=qb5bJfVtA/D80+4zx2m05pDWxT9nPxP/bWOJ/woKNsUNyhX/SLgh4QGGFI/dC+6aR0
         yIuNj9xlMvR7m1/Pj1wh10ZAtTUPfPyWhAR1DL8jLDw8QwhbYyj/3UkubkcO1Pur6I0X
         Nwh6NYFE7b6vXh26kw7VbAEQfFeQYV6hy9aAXxJF7eC6kcjuIU9mpPH679E7+d6qzl4w
         dV6C1ALIEp7yxxu20gP2IGzFT5UFInrqavS90e2AhUALFUFISR7I9+qMhW5EFb5pRyQC
         jX5B6HvLy8BlN5/FSIQT5GY7OYUicvqb9HKnzeMhZ5J7zzTS/+rNz6BWV3gvSmx+vXhN
         Dl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261964; x=1795866764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=bC6SZgqBm+xlwG/fO+adEoFlKrVcS4zhW34m+rSsTaS5dvjMbwMJCBDCmT9PhA/fyW
         HuuySrybeH+YVVRbQr+zdpzr0hqK5XAG7xaOHNWENGqy1uDF9m3vedewUmABlsvgYUr7
         G5VBjAJbJtUFwBoGAiDA2IRCkwVw/bw73d4Jl0rSxpS2rhx7w8SpbvOF7WDW4xtpEbCh
         zRM6rd1gMuQYsZ7BskRvE7ORE035g38C0uvkGBo5UWnmYSvuBu+fMD+57gFPDz7c5TMf
         875r9yFqxEUd5J5OsTNUnODzhfQm7v7U7gyWde9TbFG7aTgM3wni/MxNpI6ZJ/saqpPr
         bqqw==
X-Forwarded-Encrypted: i=1; AL+hErFTSDjUSdunqCiVu/eDbtsbRrXsx0mPHkJTDSSuqiVDdpa6IjGP8wrSKeapQ9qy3d6HwGY6IfHoGObgq5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dU9TCFyB+DoMDY+YrrDEs7/Yae6lfHR3NfVlNvcVT0PAYhzQu
	w2KbduIcujAzgLB5R3j72CtmT0BI7eqGQmCUlqI11gnuIXFcjgoGj9HACZ18Ly15TYDpBw9l40G
	2aK4UTPfI2SMVmHeAK8vF613bFlK4H8s=
X-Gm-Gg: AZFdTZdrIwXcxlBl+1aS/tBLqZINV+aukzykCCktBUyw877eKIYZTNjpAMxb593Iml/
	WfN35uj5gPwpPxALHRiL2yiWLv/RTHORqTgMFb9ji8T9k126VDEYMtDhu+GN+A0WYnsBXA+SoEL
	4b9usdmU4xf/COl7I9xzDUl4BaW7y7Firk0aOV4j2Sfdu2qk1MzGb6YEawpzKiGwSkqNN5npvet
	VTLeegOXMU27U1XTJ/vlFX+bpX//MagHCUu589kb9dmblJgCjHjpOlBv1/nCyDLnTPx/2kThXQ9
	bOM2OMaResf73fh9U2kt8k/zRz/0HVf3YKVdXSUVP4Wl7tKtpFcQ8CPsZnrechbq2w8IMEeyxlC
	0RLPcefzqPOe7/QhiALVLBg2FTOmIl/Yvh0ybkh6pD99jJfpmQyApLHaqm1HEwkSFruAn9QYRlT
	W2SjxUAw/w5J2ngTtQw5/1LIIWVzM=
X-Received: by 2002:a05:690e:4850:b0:67d:ab84:3bc9 with SMTP id
 956f58d0204a3-67df42c4011mr1425040d50.5.1795261964144; Sat, 21 Nov 2026
 03:52:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com> <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
In-Reply-To: <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 22:52:33 +1100
X-Gm-Features: Aa3M54rZGK9MVhmV7coDk48If11yJyzjN2A4aBmkg_LQalyda1z1hSvlbjbiJKY
Message-ID: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Sat, Nov 21, 2026 at 10:44=E2=80=AFPM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>                 cpu_p14: cpu@10204 {
> @@ -272,6 +314,8 @@ cpu_p14: cpu@10204 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };
>
>                 cpu_p15: cpu@10205 {
> @@ -284,6 +328,8 @@ cpu_p15: cpu@10205 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };

Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
It's just 1024 like all the others. Can you apply that when picking
this up, or would you prefer I send v2?

Thanks,
Michael
