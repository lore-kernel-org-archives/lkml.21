Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463215;
	b=pW8yjzIIftIYG/JWEpmEwtHpSNsrBqPnjE70qae6fyfv8+WMDrd75h96haL2oH3dGBhr
	 F5mATGinjwibx3Zn2fVN3mtVRvCIZyrtcDGYox1GX2v7cUccO3PCSuN84yQ+rr6Vp/twh
	 1qUbsZDDnLJ6iLkpc3NNccEwDfkj+5rZmMM7MuJCjr5JcE5YPdJ0++TQbJTRH7qh8Dy2q
	 TDStmjSuT9qOojXVr7bWWVEaQT/vUMidXSC4OiHqv03txGzDRweMbIOdM7FhWb2a7LFPr
	 I1EIfPSkgcXd3XDK/FFg41WhOT7Bx66eOvf8L3PlLAiDmUnG5OKlLk8JkxaCW6t963A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
	b=Ono1btciRvwI/oXXGpzGdmQEZbUBlb6eoiZ0o9wiaRqbw3puC118yvpFfu7JrrXRItPn
	 g/v330kWZJBKhAKFproORtyiT3VQA+Y4J+Wucq9h0Ef+PmIYbQRXrCbhXa3wCHZjWiqVa
	 U3UNWx4CsF8elsRhxvDXrB38ajLnvxQ6PQODh3Aeoz1hDChvhdL/uMlvSsoQUkuJPc487
	 lzCJm+kssTvEYBLRCl761J4UAcXoKKsLD8eE4qffPyZ4X7jMm9knpDs+IIntK4346xgHE
	 0IHwy/pj53Ka136VOiX5+BfBkqw6NwvwIGORpvUKlXitWLEGZQDPlKci9wTKIXel7Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NxH5C50a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF9606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BF9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NxH5C50a
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGIVHO3962894
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=68msumE9ER+
	DmiSRosq40jxym27XxyiCjqWMWovmiXU=; b=NxH5C50am/nw4X0MHjqFCQfQQj4
	A2bOT7e7cLabU4X+Sd7THNtQ0jl6lvyPzgQ8aOft1isWuisGo+XJ7aIXM51vLROc
	qpPpnDmrvZlB8yc0yB5YrixgG5RHYMlIFX3nTm0V5JBI7PU/MIOOByEkhJAKUVFE
	xX1gXF3waa+WEhGm7iKHLHJZFkp1lLYYn9mdCJt0+YUM1GX8VUH5jmf31nNw7S/w
	SpQlGDrlIaO9LC8fxFlZXyX7bNpQpgNXsQ+ra+V5OEhX0O0WIXkynG53BtDhqIBb
	CzlqPIM8Xakrj0S2g1MP02M7rJZAtx5Csz52FYEb/yWEZbOe7LdyHCAJxCw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j39v3bh4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so2479365a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795463214; cv=none;
        d=google.com; s=arc-20260327;
        b=PCtqzezhNPre4UfiOLPlfJgX8OAAXDL7DrkOAunAbJLYUg7HHPYCQCPvBQh2UWA2cS
         HS/As2wSaXogTxRy5Z8gVd5N+9ALn64Gje1kUIU7s3Np9AQySDI7nJ9Rb5NWdtP79pap
         82p688KNE1p7hBH6jFnaLhlPwg/ZncIeHHXYh9TkvIrKxaEPA6qq6P5y/xe0XwZwuen2
         E4C/QP50are4pGjtTyNKQnkT9+CvXGGfxIci1OfM2VVDItLsj8W2agCOkYHOFaSbCKYZ
         0fzPeLqJkD3Ta5wILJdGbZmIoneIvEflbOzg6mItz47j49y5Py8aUKpXi1tBYRLXUF7v
         FeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
        fh=wPrEttPNItbXuKq4qKsNhGpakGyGav1FmdfAgjVfajU=;
        b=LDlyuNO+Ol+n2MUhBPv8JHmOnZOfx/zcjozbIxX2fcnKfTnpjUxm/FJWBVOBz6qBOi
         aqhJjVe4EzMpoonL+a+pqdux0vf4YbXZFKNeU7/6S7CPqkmGLoCl0ZxocSNTNPwyZ3Ep
         RW9hTZ56fultsl8p9gz6CC0eCmVTA3qXQMMBbLyMBoyIzp4wrfrI1DTLlJ/l8nfQGfih
         zOkADFOx6S7cAzUogwfxSmN9zM0G43kihutdjUuxnCyjaAuoybYi1Jtkg34sTvjYyxgJ
         DynRr0Z7hVsLAsgjQnvIktOYDXQcHjFHUl8lBaZ5nUSQw2kMRpFpkwWP3jjcXtF2o82H
         keRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463214; x=1796068014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
        b=xijVdrUruesl62qehTwxzsBG4ZCFuHhqPD5I6bervjOiYfd74mR/Au3wER9tsVqznE
         uvqoUTqFafXyaUEahUyc/RAqwQXN6Kq682HD9ucNJjh9nHeQWwCGn6sBLGCArHYDXmcN
         qzdZR6A4NxYzyfHxaTqThLLWESabC4GP3+KnO6YzPQWBYI39TV9TzlkrA/7RXYHDnp/r
         ORNfFzZxeXDXbm+IB/+iwyk+7nE6h6aLcdEgvWDmzYrXJYncCjVYedBbwGERDtkOhIWI
         vqeHBDhRbkfOaqkS99mWxi8YQN1d7/4EC/Axpk6lkxfMdNGOIGIsIB0rrFkq+63MiKLs
         sVfA==
X-Forwarded-Encrypted: i=1; AL+hErGexCRpKgAC7BQY0BvescwnFwymkD+8JSZYhPcbbq1bmeZDcWXGd2qdEeT3yUONsQorhjONhOEFEqkUlEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ogbcI9wMUWfmvED7CRiv+nl0Tn5R6BTm3leVzKCm97Jet8vw9
	ZJQxBIXoszYtNNN6W496zR2I9REZCWG9D2DIMgUaGS7cQcLbMNSAcfBDKEdnIA51jed9zU+x9N3
	Ic+EVNlLxb+Zb7LILRG8hxT8Lml7nveuK4PtZ/0Mm/gpbK3URty/qkyHGk84ZbPj3lipY0WWN6k
	Hf8Y1365iCvImUXqamibXjQ2seTjdX3/Ryugy+pR4=
X-Gm-Gg: AZFdTZdW7rNaoWFeb1Il1UIH1eRxXx/nAGOOnOXapMvQrYvbykz25uBSnKm1f8/KvfK
	Xn/RkGdNYgjSLyg23+2Mup0Fniptce+472fEb4DeQNl1VnuP/wF1TbX82m2gt6AMGz1eqU7OfUV
	03BdSBSQqisMXt1KM4FGU00j7VlVnRKNB0BYKImP4v9A5ZF6O8y1yJnTpFK5OIez+mj6a9gncFa
	mPtOI0FuUXDMbJBOHyKVI15oWC4mpxEO2YpCalg/CygeQKj0qE=
X-Received: by 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b41c7bc7ccmr7276188a91.2.1795463213793;
        Mon, 23 Nov 2026 11:46:53 -0800 (PST)
X-Received: by 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3b41c7bc7ccmr7276167a91.2.1795463213335; Mon, 23 Nov 2026
 11:46:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-6-toddfreed@meta.com> <179529586258.3135.12190616828136497053@kernel.org>
In-Reply-To: <179529586258.3135.12190616828136497053@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 23 Nov 2026 11:46:40 -0800
X-Gm-Features: Aa3M54qNBs9m9dMGH-6cVdsrK_G87ANBZo0TyGs0hmoTzNiwaEmGoS1Z8U9eLXY
Message-ID: <CADh2yMys__9M11pgtxkMQHuhjvM8DzZr20t7W0aEVNqEmABEnQ@mail.gmail.com>
Subject: Re: [PATCH net v6 5/8] ipv6: icmpv6: don't quote decrypted payload in
 icmpv6 errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1ngQOCZmMTx5
 9dnOui48c7CH9BDpYSQXyiFcdoVrmLyOHLcTLaXGeWkG3ZQHbPNrICsTF2C6vKCYQ0eUJmRlQGh
 n4UsaepQgc1ib2iJYmlvcFfsOueETvY=
X-Proofpoint-ORIG-GUID: aDdxq4MREmQ3050HTR6W07cF6HaE9cNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX77ANJB3rLT64
 olxJRckDU7ra0QlfxKqdGprDlwwVWLpQe0iZVTQ8e6LerTE1VUB5RzaDZh3WyD1+7ki/BBLMI4j
 L/ZOxQXC2z1YgCyBpA1mF0qj2FLD0ouJVE2LcGzHPelWqNEEbqsSGsBdhIlumnsOTfvdC40Ni3F
 PcR7KhsrEeM+ncbq/bKXAIjWpw1yPYVIQ5I5UxQRKaNAyHPWdQhCQEk/A4Dn7tN7pj75au9XEko
 /jooITnhCRzGbNWcuw/wy1+UsMFN/xecKJhQn4ciUwpyQ/Spl2dQ3eBzOLJLX44OGPS5ZdPRBPA
 u6hA9Mp1NS2jhxt8YPgYl9V9nI51d6vyGsJUBfxHKKwspKu7fS8FOjpjr690si2/P/1aKzbD13s
 bsPPjb51hi0HQXRhpej/GyWT58btU/Bf0BpmTz9gUKhMgAJ23R/UOvuwHiFlpi6XKz7xoc4f/Qi
 37SxtLN5909bWwESxmA==
X-Proofpoint-GUID: aDdxq4MREmQ3050HTR6W07cF6HaE9cNo
X-Authority-Analysis: v=2.4 cv=a+mlZkSF c=1 sm=1 tr=0 ts=6b04982e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=-7il3XB7buBOucKm-QsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01

> [Severity: High]
> Does this cover the NDISC Redirect sent from ip6_forward()? That path also
> quotes the invoking packet, but it never goes through icmp6_send():
>
> None of these conditions look at skb->decrypted.
>
> With
> forwarding enabled, a PSP packet sent to a non-local IPv6 address would be
> decrypted and then forwarded.
>
> kTLS RX offload can also produce a decrypted skb whose destination is no
> longer local. One example is when the local address is removed while the
> offload is still active.
>
> The !skb_sec_path() condition already keeps redirects from quoting frames
> decapsulated by IPsec.

I reproduced this on CX7, with both psp and ktls offload sockets. It
only affects
ipv6 (or rather, this path is already addressed by patch 4, the icmp fix).

* server enables forwarding (force_forwarding=1)
* client connects to an on-link address using the server as gateway, so
  the server forwards the packet back out and sends a redirect
* the forwarded packet itself is dropped because of skb->decrypted
* the redirect quotes the invoking packet which had been decrypted and
  goes out

I will post a v7 with one additional patch that addresses this.

-Todd

pw-bot: cr
