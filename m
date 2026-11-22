Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370249;
	b=kywwBNd5vqfCDaKVDqhN6MGMX5TcjsdF9Pnm0yKMI/tHNdCpUEPtrA3gBx2gFF0JRu1F
	 1GnWNWpVRRjpNQwDyl7HhjeK2KRzfdEMfd76HL1QghI67O03g65GzBpAm6AE9R3oeKZJj
	 wB5pcj+9nXW7KOOHmytxM0jUMGRykbq8/+eH/MSfJ5+Pf4gCyinWEMd1vCKRZ7wUPpoMi
	 qPKlc6teaylkM0e69UBoCYaT+3ba+3WSXK5ne6SeAhoslqXReGt4SXfksAk1PxRmfjy8c
	 +RonwrGgcb7GJNagIExwzNy7ry9RrvTe+54wjTS9wJ0esM1rTBZIAgrews/vdTfbVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Subject:From:X-Mailer:References:In-Reply-To;
	bh=viicW6dYYgqYz/0PCrk8AqSDsgJ/CNYIh9VKy9gaRjU=;
	b=037LAErpDIsg8mxugTJCwhC1/oXkpQ6hKPy8ssyasgDJHY1raalAyJ/NAWHe90n9TyfJ
	 pfeKzMno1H6gXSRpCuDRKwpu39MkI2lr2lr2vEMaBP/YNDAJyPOdgp68EfEwsoznthN5f
	 UEANeH9Nsqvz0GubuSURPJYFSlTiOMURem+Nnf6Uok8CM4A+5xEVu9IU3i4SBGllczhYA
	 nci0Ia2nKimcInjnO4Vn57txT0NJ6FOrW+Vi0xOkOA0jJWAC/0CALatMJdh9TbyoVeJvr
	 InU+5f032lL/o7qvZvUmj57gUJMRtJR0Wau76H7iRH/4/6Xfu+xhxTF2UqYfJvZZghw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dr/Qrd94";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F98606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr/Qrd94
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50e26763a4so468021666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370247; x=1795975047; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viicW6dYYgqYz/0PCrk8AqSDsgJ/CNYIh9VKy9gaRjU=;
        b=dr/Qrd94gpydZk0dZQZ2CXJb6YoGCswSFWhMwiIIj47twDTJ3HdOaFBEegD4UDi5Ci
         C5Rm/ulgGPq5iQyanl5JTJ8n9cmsydNeQs1FMh3EWDV5LRRzR/+ybKLlUDAEPuGeHMgJ
         p4x+z/Qr+gT9ztzpL76qiEgH6lOxq+faWCKM+UC7u4FkUFdP3ufnNdKWmQ3gXQkcVO7V
         sQK0t50daRMF8Mv8DPGjGOwrK5JbCEfHW7dYRe0CliEuOjtiwMOfwNb9pXr/ClcbvPQy
         xh4RZscekd4aR3P+gAP3MVJCZpfkTPmDTseCiU4bTBB/DwwGDRQZo+ofQwQimKH+mbXo
         nW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370247; x=1795975047;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=viicW6dYYgqYz/0PCrk8AqSDsgJ/CNYIh9VKy9gaRjU=;
        b=CJ8CmNaKopfmTdF3AZ+q6sswFuftTA73YKeI5rxGYzxKdZjXiDpkhKKYpKe11XXXS9
         oWqe0bM2E8nVPR7Ot+Apyb7INRhdvvy2ovkmyZIlUBceSr2ID9ofDrgfgA7jJzynjWss
         hgxIiyJwWM592UDWgU+kze2o4ODQnvRSYQKetvS0o7+nwOUNH8GUk1aqKvg/V6hfRTto
         SoxzU917Iuec/cscRfWEPh9l83idAoygtLxSlPPiPNMfn6613UYkchKYEGv87wBhNzGA
         OynjA48mU4oBUqANbVkgdG6a4OCk6iy5GvCs/gU6AR4/bccmjFREbVEAdikc77zB9AKd
         XkZw==
X-Forwarded-Encrypted: i=1; AL+hErEQt1CSgRgrcxrPyEjHQVYgF+RbhPdYWNAvnepQVWsiA/tm9NFwABiXP85An7cHbLOVHzE/DbGe3WhP0ZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TUBfWwfSNEdCZ4yknF39R5phGAW5e3R+zoyWvMqzsER4zHZIJ
	7qOccjDOgUZoCuzK0vSlX7ue0toWk4emTRksNU1VWNXAvbQuTy2spZau
X-Gm-Gg: AZFdTZdkFg7nTjn1jrrQwEXdx17iYlcpWue4fQCeARxroYL28qfQUBNuX0lPca7oNXo
	Zk3ZTTXt86bZAXKEiP5OUGJ2zxMLd+TUabfwHZYVNqwK3BQZGcFmngOf4vhFkSBLl7ZpwhD4DaE
	duIg09rfA+sjdqVq2dGIdjbBNcdB/D+M1iABHDXcrWJc0IXzsG2+FDPsXV8UZGzb7YsFOnd3o54
	D3g8/C1zLl7q3F5wlzkmu+PgWwDG1ad6cp1y1rCqEkmg9dOVnYZyKC7pbWMYnVIghoCA5KOmMRy
	fIE9YIonmmJ1f+SI7vsFWOoiHXdh8tsbXgAOJEJUp4HjrCJJ0iyG447Ja8i6PwnbfhqvYmkR2SU
	ee9aMN/h+BbAbgSOCgWLW4fQpvnVWeZIN/Do0EKTCy5gfetLjZ/QzydgfM5hxsc5sWCSc0oyheE
	Km7odZzsuDSKPDjs53Mpvf8PrsXo1c4ej+Zcb1X5ncmFjcuxmGrMvs1VJyHTrsWuLIywbHcpvsa
	HIhcTXlbnsDmnDQa7OQ7AjS+f6rwzRK00of9+jqizPvdsbVXQy1VjV6754H1Ru85jNA8J4A3ydE
	Tl5b02iOyXaWSxDKbWmGe1+EGwYo
X-Received: by 2002:a17:906:a099:b0:c2e:350b:7220 with SMTP id a640c23a62f3a-c513a99a637mr622258566b.9.1795370246930;
        Sun, 22 Nov 2026 09:57:26 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm331129566b.61.2026.11.22.09.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:57:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 18:57:24 +0100
Message-Id: <DN1XMWA7362O.3IV0CG8EKY4KI@gmail.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] Input: hynitron-cst816x: set INPUT_PROP_DIRECT
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <ff91fc6f203d4442d555597cdb455b476af9da50.1791233147.git.daniel@makrotopia.org>
In-Reply-To: <ff91fc6f203d4442d555597cdb455b476af9da50.1791233147.git.daniel@makrotopia.org>

Looks good to me. Thank you!

Acked-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
