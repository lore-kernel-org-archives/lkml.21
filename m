Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427844;
	b=PRjOxWuQtd/ue+yLYX9BgDJdWwjGuIVkhPCyzTbe0C5qTDFKRUAm4n562uGgQ4kS8+Do
	 0Z3CZdbnm4NMIxurOtsg8Eg4QDKm3qlTVm2Sfm15PIVHA/0m+R8JbKIj2rSSLZ8TOdhBV
	 fYOfzc0XXs5itlDCv5GNmxBpW4l1NZcCX9dm5pcJB095sYDo5cEMGPm58tIWm7y81tc44
	 FQYhi/v63pAssXUIvTwJSE+y5E/cLQtCyIQvy5fcHZS70LlkEzZfwqJ8as8/sQrjjlPtQ
	 CYDfgXaWb3/pVdLP2cFwLh5n7/Ld8HXU7b6uhk+6EUfLzYZ5xpwx7pHEhp84DTxS/Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QFDdV2dYbCjEWzswwkXh0IW+691RkqIfqbbTZeZPlTk=;
	b=4I2tyH7w4VFVy4dxWSlN6hCVegWWmDEnCBX6hGsh2O3TCsMbLMXJU16RAWHtz5Fbmtjy
	 Bzwzy/5PD1AEICpI3vK+eHJlV/i2KqcK3fsuopB5v63An6+JTyGH7b+X3ujaBAyBcaDDa
	 7mVCXV6TG3cxlleJ5LNIoOfzGRPCOCz3zldMzHIh7I/7kHzilfKCv935rWXuHAYK8FIdt
	 +R6D31R5HcRICWDOe4sIRiFFI57QC2p9NksarMQv21Tm76OQe+3UQz077z10TPeFqbB8o
	 9gtw5qW8hDJYAhYH+iLpEeXw58KLQ7SKQb/uR6IQT4SfaD6e3lLX+IjLhM6kBpFCcZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7V9LG91;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF164606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF164606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7V9LG91
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so4401121a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427842; cv=none;
        d=google.com; s=arc-20260327;
        b=UgrTX4zxNeLcmD7rtDWrPc8k/or8s8m4IQYjUv+2V+c0XMjTAocjlMKYlBRhvyY+k6
         qR2P636n6bvszRY4+JK+7t6rVCUaP/Ph0L+IvM7Z6hHYxyogZbCf1e97+FK71FO6HJXR
         rr6+jTgwIU0JlmJkwnraIn9Q42uRDBayR/rDU64Hg5srieuhnWDZcB3/W1LwNmH5TS/n
         1/NCOwafXox9FrkYt6IK1VfSVo0awksze9+Ui5YeA+mmNXg+O5CBq116Gqm/55Ov687U
         bEq9xQQjhV2tUiSoCothEpdyyG+om9VmwwFZCPpSU6ebXoOokij6kr2gVEOOAc9LX2p7
         n5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QFDdV2dYbCjEWzswwkXh0IW+691RkqIfqbbTZeZPlTk=;
        fh=OWP9NeDXBxWAq1lCPt77fw7E0RgbRSy1CDgCrlh9gKU=;
        b=a79HarkvLHGEKN6BUlQRCQjKwpydpmw7wM3fab+4qp0h/SA7TdmMBct9p6anm1V1q8
         26B1w9+mchxG1T897+7FWA1hAd7NSZN7buwX9fZZWezyVFCXisYlXq/ahR3eWX+GSsVM
         3TUWfNET/UbgZ7/nw1t+feCq2kVibJiqzeo9U6IPLrcLotywcIcfppxPWJybP4rqNgTQ
         2mPKUJ6fjvbT/NsXUkw4i+R/6202hdn1B8i6A5/Y+bsWPJ/SfEiEH7bSV0yUHPHk58Gw
         Ih9l5NLmQB85M/qGIOlEeT3WtX8gIefmXnr3QfEnkkSdYSfuK1vrltxj1VJWfjK2MqO/
         qx+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795427842; x=1796032642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFDdV2dYbCjEWzswwkXh0IW+691RkqIfqbbTZeZPlTk=;
        b=o7V9LG9118mmMF61ZW9FZ447+UE64jXuOMNteCfl8aN10L0wvEU7UlPJ+VuneqSJBF
         6hcsOJV+ZRMhkxAsxN8Grkc0KdGvQiuYr3iRl6RT+FssRJaJ3WlNxT3VwNyod6I0nOZE
         v2lsDGlSfpaXBB3m2PYTdfcOyEHoRxZHfZyKclosAnwtA4OtOkpM5zkX1onY1Ey/BPXS
         +qifY3lRU/aKdyRhxTZRwlf0leHYIhmmUZCRZq+Q8c520NMwAqxO8Epl7E9wapykj+o/
         K9+1r0QmrkhIsmIbYdPhZY50uk/Hd4JXlH+IPf3FXyrO9Hmx+FPgBk4xyHL3PauPv1dK
         1mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427842; x=1796032642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFDdV2dYbCjEWzswwkXh0IW+691RkqIfqbbTZeZPlTk=;
        b=IJxzwEmpBkzDX0L22fxsioBi95S4aL12u/KPUYcxebWQmaN68ytW0+L/sqZF+D7kij
         TJwGg0rJMyCzl8dH6vfHj2O5AyH9CNG4rajS+Tg+4D06h3a1ch/6Y+CJ0gAx7rO4ZBxC
         361yb2ToZd/KqWiMb/7OY5skE+d+A8L0L5b+vaNqtziJ2MNnNNvOjbiqiu0I9VRZGJv/
         RzB4wnn6e0wPcbdVGxxNeiKDegcSd+Yo4KxmXXR7GxtCPF/E23NrQ3zFoHv26e3Yh1wj
         BN36KrBsSK87efwaAOCLGazIjNjwKgPJeKehD91KrgoWZOckLMYiluDwaaIJ98oN8Wgt
         FRAg==
X-Forwarded-Encrypted: i=1; AL+hErGyAq5j5Ko6s5xQgrR8PK778kF0iTpoqnXTHPq1goo9zc19mIYkGk3np0E7LStu3V70mpSE8U7yDiLL1aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XrqkDIHyGf/kmlipy4OBqDzUZ5RtBfqx9CEOAKPVrWVWIFdYq
	NWvvzhT5Ape1wyYQPzIRntGfoneH80T2eii52qwul7+zve5ZnRIfJP7PyKeJsYsH2ZN5uiPq42X
	zHG0vM5EpjGnV9JujvsB4D/AihAhnR2o=
X-Gm-Gg: AZFdTZcD8TCnxJDGIu9xneBv/QaSxkPcVRYvXIwFPNQ7HDTz+B5lVuxC/PAldRnDVjU
	0e5M2CBYweynsCmOV9Y81Uol1CxZJqbCtZ3dW5SJKA2MXF/0VITxBeCstDu07GZodQp7qPZxRFJ
	UOQD5RN/K8kpiry/8fjBDj8GwpeslcTwUl24BPu3L0qd0nGgK6EnA+f6VFVqedlIOJCULJC9TIB
	NxrmOlRHIm7PDJJg8t9VyUfFIPH6WCueVHXjzWUHek99jubv4WIyynMOJt1/rzp5rbUyg9rBorN
	pauobWDH5GMGd98rR2Du6Gz/EChThikJJTS4HBlRmCWEPjrWmHLZbXxl9nTRN0A43C3VCIh8OEB
	5QULl2dTEOlnw8yc4EhPi+ggl7veiz5ljXdfZk6NBH0i3OpVBnvovxGrVzbd7o0LGygMe8qaqLQ
	uWpGsrY22bbyWWkPh4
X-Received: by 2002:a05:6402:2812:b0:6ba:9d0c:cc6a with SMTP id
 4fb4d7f45d1cf-6ba9d0cce2amr2233996a12.30.1795427842036; Mon, 23 Nov 2026
 01:57:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-delegts-fixes-v1-0-c89b37d2d462@kernel.org> <20261120-delegts-fixes-v1-4-c89b37d2d462@kernel.org>
In-Reply-To: <20261120-delegts-fixes-v1-4-c89b37d2d462@kernel.org>
From: =?UTF-8?Q?Aur=C3=A9lien_Couderc?= <aurelien.couderc2002@gmail.com>
Date: Mon, 23 Nov 2026 10:56:43 +0100
X-Gm-Features: Aa3M54rEUl7dme-dlmWVgPXMQ44sOZrIbSYWOBGskMIHOzyu71Lp3fDlp4HcD60
Message-ID: <CA+1jF5qBbQ9dgW3gGaCj98Si59uHzc6KouQKZL0sHkn9rv8SbQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] nfsd: don't grant write delegations to NFSv4.0
 clients on CLAIM_PREVIOUS
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Christian Brauner <brauner@kernel.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:00=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> nfs4_open_delegation() refuses delegations for NFSv4.0 write opens on
> CLAIM_NULL and CLAIM_FH, as its comment explains, but CLAIM_PREVIOUS
> skips the check. An NFSv4.0 client reclaiming a write open during grace
> can therefore get a write delegation, and a GETATTR it sends before
> DELEGRETURN in the same compound can never be answered.
>
> Apply the same check to CLAIM_PREVIOUS.
>
> Fixes: 1d3dd1d56ce8 ("NFSD: Enable write delegation support")
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/nfsd/nfs4state.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 490fefaef52a..64bf2e96dc7b 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -7532,6 +7532,9 @@ nfs4_open_delegation(struct svc_rqst *rqstp, struct=
 nfsd4_open *open,
>         open->op_recall =3D false;
>         switch (open->op_claim_type) {
>                 case NFS4_OPEN_CLAIM_PREVIOUS:
> +                       if (open->op_share_access & NFS4_SHARE_ACCESS_WRI=
TE &&
> +                                       !clp->cl_minorversion)

The ! operator should only be used for boolean operations. Please use
an explicit (clp->cl_minorversion =3D=3D 0) to make the intention clear.


Aur=C3=A9lien
--
Aur=C3=A9lien Couderc <aurelien.couderc2002@gmail.com>
Big Data/Data mining expert, chess enthusiast
