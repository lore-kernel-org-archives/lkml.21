Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427838;
	b=dPeMrEg07O5v2i6y1BBY2f0+t27tQIpG8z4ZiFx6XY/j75D+tVAoPa8RYZXA6+a41WRW
	 GiBTY0xa58IDQU1+cqBIf3s0jMacXPvugT43Y7XGCvWgPNpLZ6pCk9woIKiuSaUfwv93I
	 PDO17Ik7IZsumNyH8eSPg/OwpBjpAT2CSMEb5rykVx611g1ssmGgpLdu9M3qdji6DC3cE
	 9jWr1qXqPUxE1CI63fl/nhxLiCavPp4XKSnBj4VKgZ7KOSxelwnSTKLhXvLUtH6e2orCn
	 oWgP/LeUkbl2wEvkQ8YzeBilE/E4T8kT829MQp+13syJ4ATwG5m2PYashGjUyC4WjaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427838;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4s8ObVh8aYrx9unOg3Fhb+rodQ27w3kLEqVCY36mwwQ=;
	b=PO42Lk7a7TrAD+cD2PT3EWWJVPuN9hYJ/2/f41kDFrlO5ot6X4EyhbR3wRQdsFbYCPoW
	 DdhTKNhv1ELDGktTG3MvwuWyeGRTrjqi8fZPmCXv37mYmG9cdZE+BC5HqDCTnmiTcqYB0
	 6+u2+gIwDyQRM1xT8d6uiOAzPj1UFBdrfopPXAy77h/jUBYXAzvG+Z8JkPaze23Tb2efb
	 p6Ux6uelAxJpJCXqkFbAwaRON78wVqXzRjavneYRqk0Q3ZWRBLWRRT+7EARS3CFWQ53K/
	 /98ouoxkJrJq/I6F5VM4Xakv5ulHSEKoDbZH/TGSCa8I+2Etq2BHFbzDLr/wd7ODQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMextjOi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83875606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMextjOi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8661F0093E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427838;
	bh=4s8ObVh8aYrx9unOg3Fhb+rodQ27w3kLEqVCY36mwwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PMextjOiyAOWweSOUDWK1+NjVnPuNdL0cjyOndo/GF1JFrEGisjxZMJSp94oqArn/
	 92E8cYnTMzmKDj3tUNDj94Ufez8GYcJrAF598NiWlG2SXjK4+IcALAczvNKs4313Qy
	 H7lKBmcG+71uTOfp9oszrMSEJZ05R8s1z7Nje/Rf4wCnkApfFXSsNFnlrkoAsOhtfa
	 TumJ80sYFXi/yMb5fJu3zv9VMlAZ3/BoBKO7lefIq9GbTe0g32AC4Z48xjBXJj6hqQ
	 tSfEfAVkuEqGFNIs6Zjg1jJUSHFcsGAjhLDpYEP3LVDQnNBYe9paw+dPeNBcHejoNn
	 EbwSDs2aDIN2A==
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-57728d87699so1202645b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:57:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFxjq3LfKR67DxaSQeaqgkX0hh9n85XM5WpLApIDXrFOYNLmYaIez7tsYWaZhdFMUSZc0hH1EjakgLXJxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JYZE+LVbttfyBsQ5Ua49rtQtdLe2Z1tcJxdIB0MtPxuhH6KYr
	8PLzmSlkrGsYttXSPTx9qZ044RBTITs6UYjfBtmZnPpL1QI78TJLnS09Pk/BQ6GCZzsPf3HbRRa
	yTxPPMUy9AJFjiK9/DNUpNVO5znaSuCc=
X-Received: by 2002:a05:6808:4f4f:b0:56a:dc07:f218 with SMTP id
 5614622812f47-57a0a10c801mr12163511b6e.20.1795427837069; Mon, 23 Nov 2026
 01:57:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795424546.git.x-professor@outlook.com>
In-Reply-To: <cover.1795424546.git.x-professor@outlook.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:57:06 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqKAmkvqD+WMms7ZCwGDm3QE_Aw8VfqA=Xc6k1=8O-8Rg@mail.gmail.com>
X-Gm-Features: Aa3M54p7KYmo2scuMtB2OXhhali3YsSnFeJgNMDOhVNqlLJAMAK0n7zrYR_BrAM
Message-ID: <CAL4WiiqKAmkvqD+WMms7ZCwGDm3QE_Aw8VfqA=Xc6k1=8O-8Rg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/2] tcp/mptcp: prevent blackhole timeout
 arithmetic wraparound
To: Yingjie Wang <x-professor@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "ncardwell@google.com" <ncardwell@google.com>, 
	"gang.yan@linux.dev" <gang.yan@linux.dev>, "kuniyu@google.com" <kuniyu@google.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org" <horms@kernel.org>, 
	"matttbe@kernel.org" <matttbe@kernel.org>, "martineau@kernel.org" <martineau@kernel.org>, 
	"geliang@kernel.org" <geliang@kernel.org>, "ycheng@google.com" <ycheng@google.com>, 
	"weiwan@google.com" <weiwan@google.com>, "joel.granados@kernel.org" <joel.granados@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 10:34, Yingjie Wang <x-professor@outlook.com> a=
 =C3=A9crit :
>
> The TCP Fast Open and MPTCP blackhole timeout calculations can wrap in
> 32-bit unsigned arithmetic, even on 64-bit kernels. With HZ=3D1000 and a
> 64-fold backoff, 67109 seconds becomes 8.7 seconds instead of about
> 50 days.
>
> Compute both delays in u64, cap them at MAX_JIFFY_OFFSET, and limit both
> initial timeout sysctls to one day. The new input limits reject values
> that were previously accepted, so this series remains for net-next and
> is not intended for stable.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
