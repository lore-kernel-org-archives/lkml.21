Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795079816;
	b=N0ikDgLj9mBSG7K8UXVzFm3CzZxi+N6GFKRXSBnITAkmcnlW+e+lqL63zRLxtTSmO6h2
	 fFU+sJaoQL1BiiJixstHBRx4HLMEgxoyfBhLtRc1FSXkLPA4pm7zFeq8xRFzosnwUtP/3
	 5PR2QULvCs2Fe214s7m1wTeUGkvIsnZKpPasWS4t5+3OltAwpoclcus3KhoIzj5kmqPtl
	 /FXv+kBOljNuwNtPZe083Md5/+eVSHzvgLAjpNMoU97DdzUiLB8oXbgAvERnSlnahM5Vn
	 46n7acfT8gWtZzbu/rOfGr40Vmc7gA7dOq3x2dKDcG0fcyGsw4qqAOGAYlm1CfOJ1Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
	b=kpru6zsTjVO8/iQDf9fUZuOtuRb1E4tOi4ym689OdDmKHfcCnLhHNBZZQOA38S8HX+0L
	 1raPwMevasGLxrXDWOhBCTxcabF5c0+Ja2Ef9utRPT0hwEUYVUyJEuROl390w9kp00RfR
	 h2UR5WVKlG6YCnZqOpjYSdyI9g5gWs4qdjVY5HnydankIKeyowmUk6Fg/24hqI8Q4PqX2
	 /IWH/bZxx3UejrOb3krIvJlx7nC8TVdeMxtRzdfYSoOzEvTI5JjD13+uWxYlecjDHZjhq
	 U6rZWYYm/vvEIwr9ZphKv6BXAew9V1OmbO2MW54KvnbQ5jmZgWv6V/WiqX3kgZZ0iRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H596OWh7;
	arc=fail smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB7606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EB7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H596OWh7
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so207181e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795079814; cv=none;
        d=google.com; s=arc-20260327;
        b=XdCf3UcywCYVeNBZ9f/kbfMSDY182c4+1OvKuhcne9ydTAqlBysmlqe8qeOrw5qs4W
         Uvh/VQw4RAoY6JgE+J9Wqc82EzRxxScUfTjvCHobXoGzvPTa1lkZdyCeBtgZM/P6jZFW
         pupx3G8NiOaD/XJWN8UjA7D/tvRl9WqBoziig/2nWlF2PwH/M4Qy/iOMZICYwIMCeUQ0
         Vs5ERq2bMrRMfQDqyYkk9/BGg099+PwhUFXE/8g07SnCrr2gweqTvp2TEHjDPH5XaD0U
         m5AVG2uwReadwQ+2tbNKKxPKwM0S+MlUdYZlm0qh5KwDtC5nXCuklsys8H225Wsw+nTV
         Gx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
        fh=S3YCF5KLEzvXu7oLJ0hCbYT7c9/mSf5S/KcZ7987UPo=;
        b=sWkBk7SzT9/vhDG8VW14EKcQzFnK2g7h1efhcHDGE66EVeULfAYOzci9C459ac3A/H
         UpYbRfibH8a8pmTlq7I6uu8MC3c9B4v4tm4FleCjotA8Zgd963RoI3iSyW0aITkCKlvK
         GKi5pqY5HQO/HUQLpHmJ/9gi3Zsp0GoIO3aBcHKXbH5xGECE4LFHoMz8cLcnLDQIElah
         POV6EkLwT5JBpVFbHEc5A765ujC2S/60Zxq9GMfi+n4nHnbRQ6wn7uU/JttKqsJuMsse
         Ty9jOewq5kaze+tzho9ga7RYRg4RWyiWPZeMhY/eKh42ANT7m4aZnrJ2vqLL+RI5zOe/
         QHQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079814; x=1795684614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
        b=H596OWh7WXxL6ryFZecYsvKcas6rAUTOPK4ZTv5ocNVMX0XURRu/lYyz7NsLH4fUML
         zMDv0+OZhtGOsgKTeZvgmDfJe+bvPesZAn3gCEqbgpSXVN4oqX1wgJG4FoJr9gOceOjh
         xpI7dwtooFHITIzrQsWYgFLp/cc1/bNJESflFInY7eH5cYorVOLC18K1geyh7wVqlFNm
         bo07JTjebS4lSHVfymO+dfiyAK3Tiwb6HCGe3WwDgmbkBLN+F6gmNYmngzOatT68+8AA
         59Zx0D7Kl0eEaFFBuAKVJKIpIaSXpBHif+UrISihXARPUJraW5zH7oaor5XJCSdnhO6j
         cSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079814; x=1795684614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOnm9VgyV9A6nAmgpwHr/sD2iGFNDk3FeSWi3tD2RIE=;
        b=PxC9vugHLkbR/L6MmaQPEIsyfbcZBn9qanJmRoXvUGqI8wwD/ZKnzO4mvbv+PRlrRE
         hCHRwskr5uY7cLJdTQCxFutoH7OjhjfnNTiSPqZ2cnieTsfzHtMIGMxTgNu6LccrDn9+
         HA+j3Gsb7ydBw3Zmd54iBqrpNCeE5enbYJ0nqs5PAJ/d/84PixLCUNBdcFALHIw1Do1n
         z5yHx9+CIpz96zsKtHWBtY8su4pPGKXH/dBQ2J7BKNYb5n01zyZuqzEJ4PkBuYc4JzJr
         brpIqCc25rTuNPpTDLAX/yV/gIGAB6vjUa2iaINlSnkKE5eCm5eb5LgrfAIKWoDTDvBy
         iEpQ==
X-Forwarded-Encrypted: i=1; AL+hErGm4LFRhygKrwF0i2Fv1nZULI0bEhKQMHyzSaH6/0xD5dOBehotnSfM5L/ZfQ7zCNuDeDk5Nt+HhSuU02M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GfXwQcCiUZSV8no0qALVmZDGt2M/MOELzh0pSPWqv0AYV8hnF
	s4+vCb/Q4kGZR40kW2BCuend+3SHbyzZ9CViZ5gSNWHGmSXEaNuhZqkgOwyq0DmtAV+CkmMDtVU
	5p0orzKwCaxh7Y9NmSh0VK15zcyhishM=
X-Gm-Gg: AYBFou2WqyTYcB0HTQo3m1O64MjRYTRdo8W/e7w1WN1CUMP76KZHz4Wm8zcSk0L8taG
	+7kzraIcxZLiyieGoNXq3Yg5IXws+npv/1z2RgXWnU3offysFC/P0OsJuUb++6GZhmjqTTeipFx
	vCgqemwWjMm8PuQuYj8wMom/RZ/hj0Nb1xlgyDDcuqsXQJbQyUS7D/eiRqFPvRF/M1gb0/0tJcC
	fPtBbEZ5wiHo7AVAIOPXbR/uBnT0lIuajgCxLM3mh5T2YMVM83OLgSF7syEx9/m8pf5MTOWwvam
	gAv8dNRmqJB6eV5MVKBaCgrYaPqtKA2KDZmz6+iI43XXdzLA3SHfr7zsF0bq6Rhd/RTr5FFINwR
	1coUwSYXjS+XmPN/HOR2XjNoXC341gHS4zCgKavvvUT78eg458uurp3fNuBy9pRsfvwNsRCGaVi
	qbvogRLqL5pqA4lSMtTKKyZfaN+ViQOs0dfQUcjQpwpE3V0sgkQwp4IsabB5DZsb1utvUQl2qc+
	cP48ycAbZwpNdk/lYqsI8kp5tQ+ezIuY7CQPEuw5n2L1kkYpIXZ9X48T0Sz1OGbsEZRG3cT
X-Received: by 2002:a05:6512:6201:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1aa031659mr2118221e87.6.1795079813531; Thu, 19 Nov 2026
 01:16:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com>
In-Reply-To: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Nov 2026 10:16:41 +0100
X-Gm-Features: Aa3M54o_6SezOlJoJCWSx-bUjKVqZp3a5XNbhlqM7Ub90ktijfyQoMBmQTdWto8
Message-ID: <CANiq72nfu9-4PzxhFeVZBdzFOmowWw0VRLeYAGxv67wQ0xAeNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: str: tie Formatter to its backing buffer
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Georgios Androutsopoulos <georgeandrout13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:57=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
>       rust: str: tie Formatter to its backing buffer

Applied (just the first one) to `rust-fixes` -- thanks everyone!

(The other I will take it through `rust-next`).

Cheers,
Miguel
