Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370086;
	b=tEoPcXXm/P2EUJsyUOE+aw/wjMFvdrEhUO3pAAmB4T++dLve6vaIyJMyTI5VGN/1bhVH
	 /v+qWehCHHnPwhnCLnHE9vKX+bmQuOJV/tiRpUTYqDBlnxHqPR2+1R8A1k/xEWzzIaRfL
	 tSag9ALleeFC6AwoNn5zy7jww5p3REPBpdwjN5ZuGIH8MVqQh4a+de5kRQ73rSqjmnp9t
	 i2rCJEI1KSSenlsHtRUEDwCHVi/gA/K/8LxDfVUASSmwqsOCMqEHatQOTamKYRhWSCCWQ
	 o/brRsBkqNB/+I1bhi/yv8pjBm+ZubCGAMVxqqvH/mae4mAqbCwk0VSJH+qay+bVeUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
	b=zDRUwwNl68rft2RgDB+t31NIso7RlkXsjoCP7DH9JwiPxdykCNTgquUejG9zYWZ3AC9h
	 TeCYerfpuTmTRcd25uYKwGKjsWfYLjWlK+/NEbAEBFkKr8wHhj3uEaDwp3ny/ESCOkvJH
	 W5aPO1NNsODKvYijDLGQea9zRyNpt1XDNNI2uBMbevp7zhTRHSrwRBQvCa/hXLwlilJti
	 kxUMTPVHQjVB5+ISYWDrL5+KNq2XzE4wvM64Ijgi5Moj+DCPb+Yc3qXMl9zEBCjo4j9N5
	 mSo9jwe96URY2LSc8//bXbJZaUvrnjYoHpYCKutOX7Sy+tNCholqnrqhfIw1HmAMSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuoSorem;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29E5606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29E5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuoSorem
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50e26763a4so467751166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370084; x=1795974884; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=RuoSoremNHQJkMwt4D9dlvXzHbdF7ZHj+l3ej0fCcfOvXWfKMGiZH2eQWHfuCe5Ump
         eslZWh2GdQbIq/mp24WuRZzpysLTaawGYLAAgeCncvtc+SGJcAJptpb/7PvxC6B8wLIX
         6xofLLQFcYECW49evFPNMYl5tX3SLCqeTkGCSDQ+651Iw41VcFjhdiFGJljJlg41O3rN
         5AwO/IL3X8gclKNzNKRRi58zfyrkfLFpUMboMbnfaKGlsnm4wqtwhhxLccoPwXyML0BG
         UqJ1gKO75yBFRBy18KZEl5EvoCSUFR6OvCaK74AmRqAJnWsxKRyHz4znDnCsdbBUmlVu
         JQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370084; x=1795974884;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=wMB12JKRWueuh4X5QaCahn5VGNy5ct6J9Iytvd323VFAxVavqU4OxHVsCjEFPnVsxU
         vrWsFm0Nz8rbpuzNMBITcEKPB9zzTIU1dBEB/Jlijr/3l36xSn3NGq6gcIUOvIxJaDyp
         0hyh95cObqxN/kElEE76259V23VrhUMFOazfAH3f/4/PMjta3KnH3VLgE9ZLf6t5UzHp
         BDJPbNdarW+VsPPmHWrSzf9/1EiSY/Y9s8iB1NDFNyW/iJnx8t/z9yo8ybnUZhwpo1XW
         A5GCyrFok1Rw/ljp8m+YGbpK1G/zNCh4fZkE2eGy995UwgXWnOOrDJ2ynJaMHaaMOTx/
         Vnsg==
X-Forwarded-Encrypted: i=1; AL+hErGo7X3w6msR38rpp7EeQGBMHnUvz9zetwfVLkY5Xbe0wyz8cJB9mKuJyMZYhl59upCuLHs8SLg2T/aOsH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WpiqTMPvXj90CJfpN56r1inYGHKj+NimKwaff+a9jHDIHBSrb
	HU5MDEYDb6VjCus2TX42U8Zfq7z3sE2KWKU03eEpjggr9zMdrbMBT9dM
X-Gm-Gg: AZFdTZd15eKk5lj/dshbBwjI+Bn/GVWgY7NStCCr2bbLeeup4micu+S8feDxVuI6nS2
	ktBQUZuTYCCXKotHtu8MhRs195juHSIjdVv+uifJloan1W8QKt8uFHOGZsGl8fgLtWBJaIxEhK1
	YWnRjFXXqddlVuLEZgnNrPzJ7IbrPV+rrsyHxPXV6Aq9C3iX5zT94XoWyftWIyk38zDIFv9Nkdh
	cBK08vdRoFqMg353GpUq6vpJFmaiX0bRJBinqV8WeTzNl1hbv9NNYcfwhYjnJO/35rz2Lxg6UQp
	KN+idIR8WO2nkc/bAW6VB9qJenlTnK6A0TeVb0jc7b1xmx3NWW5bmPnUEEP8Mh+C+NBJf1dnIIB
	okoVyRWnd6jlJNylMYLIno0Mv2kDv0eqGDootmzh0S3O62FNYHOeXyUBRGDrAyPYaUXEtSj/qGJ
	2OKhFbI9gqxXg7hsw1N7KjYj72HMpNcy2gNquAmUFbuJpqzPefQ8HQvSpftm935wVkLaUdQKrQ9
	DqwuzvTjTEaBKoc4Nac7LcKeVcaxh4V6NdYCXfEgpPMtmmxqgSzqpvxeiR118Pf63CI6KZfBPRF
	Jba2Akebm4382nWuM9TA+DJcroIMKgM7wM/j2Y043H5uCtuGew==
X-Received: by 2002:a17:907:9692:b0:c31:fb29:a137 with SMTP id a640c23a62f3a-c513aac2909mr735269366b.21.1795370084301;
        Sun, 22 Nov 2026 09:54:44 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm327992466b.0.2026.11.22.09.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:54:43 -0800 (PST)
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
Date: Sun, 22 Nov 2026 18:54:42 +0100
Message-Id: <DN1XKTU0C9E7.3GV5042SF8QV1@gmail.com>
Subject: Re: [PATCH v4 3/5] Input: hynitron-cst816x: release gesture keys
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <5312d67200e3251b2be08aef0a726d50d94fadde.1791233147.git.daniel@makrotopia.org> <DM338G5EE7D2.2WBOX8VFA3076@gmail.com>
In-Reply-To: <DM338G5EE7D2.2WBOX8VFA3076@gmail.com>

Looks good to me.

Reviewed-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
