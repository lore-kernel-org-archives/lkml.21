Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285494;
	b=HwqOs0GXNH7g5oseT1Tyro85GLx4nm0+kmGQraeokJ9s8gzz/E8WemvAcLX/FNzisRuc
	 QjJ+FlWolQG/imz5+bMVHHRm0Jy6+Y1YbyhuWIL14yujBPD2jV7wfM9YKqFHUHxbcFpRe
	 /6uJPsYaU6yZkU6BcuMxYWYdi+vrggYxDDa+KAqUVHgwNlRBPakP+QJrz2XHwa9kUvgEV
	 RPI8gO1xeikacgOokmQKGB1t+U3yedTfV6XGjgr5JPInajkFZu6JDT3MXtjcdoBrSUnIc
	 3PRndypDHG8to7NVDlvk6DlzfXsgrN7RII4SzHNkUggm+lNVr6d1CbY9tCVddb4gY8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
	b=Q2fMnJMrtYb7LYjqQ6cHg8flxiE/PM5DxcBkIGA/aoy4jV8V7i6isAtS5xC7LMELzzSF
	 0PeVTmMxUxupFxRRQKxhD8ex1ycmKkGX4E5aU5lAdS5BBWy4iccXPYh+39qwZS6khtE6F
	 9z1R3GxrDf84fbUfrv4wJfM67OQk7EaVXYHLnIs0F3RGwAcXTnr9ZDHQ2DrO6INViH0gx
	 ZJPjJg62NhFtwYEkMWDCbjhc2R8SdISmiPZHMUqJOJAe7/KYMLPkrjgan2L2JQ6jdM+Ku
	 FWxBup6plWxKcsfTW0c+kbuZ0C7BgdDwFBUMPMpesBdYWbCfj2z2p5vM03nOCi3Sm6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvVCmyOW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE7C606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE7C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvVCmyOW
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c58f18765so1344829d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285493; cv=none;
        d=google.com; s=arc-20260327;
        b=jQX4IyNm+ArH27SuMmoHMdLrMk/1amiQKribaM5DkdgSeSN0ULNyzLEKtUxZ5j84sD
         sf9aRcCU1Co9jbvz9QQvJE/b0r5YmoUphOsy5nQK2zap+dXHDG64C7h2c0/ZgM15bNb1
         zY5GqxisvCpPpPpTfuQCkrom/yifAaJN3gsWu3yNm5rJ8p9hxM/amxbIGbDqIet24TJ3
         XUT/Yka9FtYaBW1DF0pNbuRWopFgiLB8ylLbzNhmWGNf/XeoZjLuiXpefkfuDPP6ilJ2
         VZCfedKb1FFFlIekqXKvY73JfT0sePie3quGDFeUzAarCe1cDuMsOBgNfh/Snye9CFRf
         Tu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
        fh=1cTlOYtXzUp/e7gQQn870DbS4fUNjKnn+rUUIxRfhS8=;
        b=XZ2zwG2AjbvC5jzPyAjVZZ6Zsc6dd1H2U654lIYlfn5QE8EiUGnc562yzpeqvtlmve
         J1t47dL5uTKmS7vt4I8MFCjwBCmAy63rnbaUcKbR8/be4ScFKDqHZVY7dZZL6ifO3CDa
         vIW0eYVy0LA7CNg3WQSN1U+Dy1AtUJ9kj8C8QzN6rJNAartg0hQUVtB1mq14mYrU9Y8l
         4OOKCcm005eR4lRpU60kBHdY6tmRUYX0913i58GkcbF9Dw97majjHb7PFDe9Vm160eg7
         41CJUHe7vqYE5kwQL6coeMKCZ4o7WX/MGTtwvLIAJOVGApLrkpY5levajD+UxfcO5gUk
         GdfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285493; x=1795890293; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
        b=KvVCmyOWqy+cXvfoBKNNNRBT7cJ3XMHTmv33sXJblseu+84KJ0j88G9egt3cAWC1yS
         9OQdFtD/f1f1G6vJ5SpbtRpUonbuI7v0JCGFwIB7Wr5gFxmH6MGCGOiNxL5BxYbd9xTb
         qgX/RcDA6hQ/H3F6Ue8cy/5lLW9vCTypX5bgAxSZbIIzhs4X47dv7q9s2WMRziAjMTct
         gSPuU4kgIrHaBxImDO0Bouu627uPxtcblkdGktS93WBI/F8XOnPwmQtea+2yVV/nMdt7
         zSCRzDqhLDrdzI4cTnhw5VPcxSIzA+kfDEjnEujv3MxlmaKflPB3AJYCFB1+zF7iKEWA
         BcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285493; x=1795890293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
        b=JQNQOjHYLYX3SvKC1TjHxVgJ344BJZlyeUZJorodHHdrZ6+vU5pP+wleDgoh+YhCaY
         UxfS3A0206LK/KFBGpZ5l7oaES6ENwwtZg7v4SEum6JmnFxGOYdQwIo0sE3uE6tmdIfD
         CyqYx/9/ulvd3YZXruKGeu8mAPyMB0KPssUUyCObtTe6BYKe7WLad39kTtLxpmmatnTo
         yyMUES+pTMDox1h4mhBjdPkPRGjdpn1RelB9+WKGwR82656AVZ2ma86X9WhmNA5pDQTZ
         uGrbNnI435/8iIkKVADSqhvYaEQzNNliCQ8ZWOj8eaufZsbWueOpL87IyMOzSuCOIOh2
         Bd9Q==
X-Forwarded-Encrypted: i=1; AL+hErG6G/LYgmt6kXq0Co5JBQGttCrbztBUWCsRO4Bag7Yk3Avc23h0U5Udd3vpisjrr/F2cMFK9dk8nnVFmJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3ZuyfafJPykC2E/N7w3+5Vkvg/bX50uI0qvUu55mFvEyWhW6P
	1ngFkwCP0mJ8qTcfJt5tPh0reCmULj1jdbyJv06MMf7ajmUF+LRgW+aRqSsFhlCUKdwRN/PhJh9
	AyghtXvu01sKvgjE0tDCpDggaj05ZqvA=
X-Gm-Gg: AZFdTZfHlXdoftckXQ9+NVtd+KUMxSuSual603xdfC0gnZeUGn9ryqcGLpxIa3nlWk9
	sLEMO4o7wax09flTAUoiNdJhOtK/cgJpl7kXtEdMIE9SPw4yVt8rd7KhY77Cc5acqLUDyErePu0
	lVj5Bv/2YoctjdM7OuIFWgaK3W9JKzcHR2zBuLFmhuzjEYe+b0ko5hxTedUbfp6rcwfSccYrc/S
	dQF3z+824OE6Sp7NAmU+uH5nsRq5xaOBlV5HIc9NpmNEVGevUQmMwH6QAi/ooUqYD+K5THccP+X
	xDSWIEFeZ5Z9zWlWYh3JOlxInTiK9QzyKrFyEjpfIiJ8aiNXJBrFnlbWPOa+jEXNgGpdAFxK6wi
	hA5xMGB95hbmhaIdlvT6/urF3Lnn+qxT09ywrbHsyTjWCsK222AKlArHFCpbFLadFX+JMWrcj
X-Received: by 2002:a05:690e:441c:b0:67a:2ca2:8a39 with SMTP id
 956f58d0204a3-67df42c44b5mr1420739d50.3.1795285493200; Sat, 21 Nov 2026
 10:24:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com> <CAK+kzgycrbHcEpXZhLTPXdWtCUh+WwoBA0mC7CaS2HO7nM81vQ@mail.gmail.com>
 <b4f49c01-467b-4c16-bc47-b0f08ab48bce@yahoo.com>
In-Reply-To: <b4f49c01-467b-4c16-bc47-b0f08ab48bce@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Sat, 21 Nov 2026 15:24:41 -0300
X-Gm-Features: Aa3M54prqDFHToD-m4_afXfK5h3QfWDtz_Lzzt42xCFZtGEEkBsBe_5z6pffYRQ
Message-ID: <CAK+kzgxEzCzq5EvRh9zqB8sc27B6bFws6zreP8MbO3s5mQQYUw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

On 21/11/2026 Mieczyslaw Nalewaj wrote:
> This path is only reached when the last port leaves a VLAN while
> filtering is on (e.g. a port leaving a VLAN-aware bridge), which the
> toggle test does not exercise, so I kept your Tested-by but would be
> glad if you could re-run that case.

Done with v13-pre2 from the OpenWrt PR. In a VLAN-aware bridge, VLAN 50
added tagged to lan2 and lan3 and used (the hosts are learned with
VID 50), then deleted from both ports while filtering is on, then
vlan_filtering 0: frames tagged with VID 50 are learned without a VID
(SVL), and h1 -> h2 on VID 50 gets 20 of 20 replies. The toggles took
30 ms. The rest of the toggle tests give the same results as on v12.
