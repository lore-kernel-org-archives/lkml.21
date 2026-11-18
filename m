Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024002;
	b=ZTree604cUNMcGoiKFeSZb7lDqcvd7//k/9RwXwXzgPQsy8HkbRm023ibwuf1zqPV1c3
	 yz/Dwbo6jtgRwhulmAdiEEXe8mttP29uvjraw2xF+A4QpiqdSCvqtHFugGIS8RYehv8Xp
	 W+Yx8q+fny5KZRbB/VZSZi7nQmdB4ufLDHdl0PmJfmcEVnhAgRrYWvkuuBY78l7I/mX3o
	 sx9fxViAbzR/KkBAl+NkWDqbXe/mX/qUiZ4i3acLRUN3rinS9Nm6Mj0MF0XdO4GPE1dGY
	 sJl+kTDPZpdSVv+z1KV5AXCPkSqYCmO8O3ANzeqpwsddr+Cq7pw6VIM/kGJ0j30bhVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
	b=lXPdicQ07EBSLG2Kjp2I2ifGwZVWLEFhD1Ya1CIFCZ5P9UnUWB6TtFCi7BjGgkP8vJCy
	 6zokMRqTTYosLrRmISmfe+9af8jnM59qtz+hHLMWnKP78Vq57s0CT0YCug6jpiLwbFTN8
	 8pjBeyWgjeGXoyBeu1m0T4+t0ablSfgPAY7wP53U0xukEf4PRAS7HSgngjVQcT8+Tky72
	 7qshfBLWvL0ArwwI/28W/CR3HEEeww1+TOD5m7VKWoSjLPa0OKJXUkv+XRuXsolT0I+w3
	 9jVFWQDkqdrjYcAHogN5ls9QTcW9/SISUevJF/79wFbDOLcC05zcX3iK00uYxufxY5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4130606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4130606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGEcs531304
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3ykO91BHuXI
	Q6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=; b=mR5cWZhHSGlgX9Kp6sEX3IH0+vZ
	7DhjCpS6kNifZvDX+8X4OeETq3AcTzE9isy0aS2loX670ry+7TN75kVbI8yRo1Q6
	gq+x5l6yhhuU6Wk3IRlOTXzEW1O8Kj3CPXaW7nmZ2iZTsfulilCriD9DhvSNbOFV
	+LEfsYSD8WgJDdr759A/H/ZR2SrSVA+o6i8qGD/4Jzx/vvk0c2DA1O8WtVgovNWz
	mS4mSF17IRuXojKZUPJgIbCJz3yts0xln4eo1+Af/NfhEOcjMVu4kVfu/pGgrgga
	CqMpmoyU6vuiNbRC90iCXLfbCcUEM1uT0uRPofW0D9uZzMwYVDSoS0KcRNQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu6fewg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800 (PST)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd769cc9deso722013a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024000; cv=none;
        d=google.com; s=arc-20260327;
        b=LN4u7aq9Qkv14DPENgRml3qv3LYe0kPLeNE35PYy08TvIboBju/BD91lOoABesAgdc
         wKydsOqb6wOjsr9DxIbXol8bUhAk8LsfWr7ceuIszXKvcdT09cIoJdv2Ud4BIgv9OeZs
         jYLD1OsBS+tWU0OJFDPKZO1888vOmLjg+CzxPGgak9Q/V2ZP37lyw3Zkxjpy45Ig4Bk9
         dbIAfQ1DwdysdPfSO57v4jNLXwlJag7b4so2Klp7pxF7C3qAOUZP6NkgG7u1zb0FARew
         MOhvJo0/s3hcFOVFOXPWR10gp4ycoJGlVETGTPEmI83uQ/vFD6h6duSV4ogYHjIcdWUX
         Ku8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        fh=rw9eth1GFd+wS/EOH4tHJD0Be5Y971FyxU2GxScJDyE=;
        b=XDczu0FSQjjxVeYASqqyCfRSHszyOjW44hHabw7FFaLVSy0pixihW/BRtKdEOQTabB
         ZaJXBhxBaEcfKiRncpDOnKutMpWIsiZE0pzelZM9WPmnfknBun4MIovfSdHMB7w4WGU+
         trRNOepvloqhNXEP3vIvBP+gc4sEfMGPker5dNIbePSqLjE/W/n+KJHuXxxXNyAbL2KW
         0qrit7a2DFFZ7JH9gTl7EfYVJaCtSRs3/vS0SaIuzVO3XdiBOqtLawOnnQIXZYaze6V2
         MlNeKuWcr2l7nFh0de5smg5/ncEXDYBHeYUxwW9wAcrmNENrvtDhL9581JUTnA+DPTtO
         41yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024000; x=1795628800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        b=XCt7LcjwghyTGo9VB9BH51JCy6jYkDfXcbu5RHGxsl/Piv5w67s1r6NdywNdEZfedr
         MlCO5H1+3/m3GGIMsOnsSLRN+Z2JeXJKe4xufSVxDsnvzD1zaEJfZfaW3eFpIcWULsw0
         uTw/eFqePQAUhND9ZABH6hKS4LJZCyd6yJjaPs2xlEn4V/ruYSQ/5Z+UHt/nsejbxwpy
         WLe/WsZtFH36ZB3Gee6jEMpEAJwc3RsQL5hhjjvVjC7okkNZrlCWMvv6uMaRip4iirtJ
         arjaKdyuIpFtdzHTHdtx6+BcD8oBRY9bNei+ylA43bGwMOdAGv+Qad4BGm3Xm0VWVz9P
         x1PA==
X-Forwarded-Encrypted: i=1; AL+hErGNfZpfjjsAZD9Qn+GOe0onahxZ8E0fi05GaNkYVC7AqTx12wrU6oKDT3r2eUfKlYeNK5liP3CnwcS9IPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GReS8s924q59kthbKpGridKUsaiRtVABJgo1J6ArMxTxTuJmX
	IIZe88vCe4qPckyoGRKS0iQQDrFyMBovdJ45lo1Lx5vDqNGW2qdy4j8m4Lkj+KFKlm4u7X+oqMK
	SoVDSg31807yXEcED4w6lkDBw1s1ZGzFh7RfhxErDywuyr5rfmq9ydFETdBBS62WhgphBnZ+6TU
	WYlrzuHYY1gle8D5tipOu2mMtihM5ZMMmUfbTuQSw=
X-Gm-Gg: AYBFou29hFBGHN4AY84jT+bS46pJJqES64niqLwo985c1j8bJ0KgmWyVGXRWUnCiaT+
	f6royHCtujTKBgLjct5vTjZKYla3elwulpsMZckuqPtsWVPxJ6xHRjmeA5oUInKHaMyD9kuRgdW
	qDNfln936IIuGKFcO8wRDOxAPcneBgFr72comArJHKd4e2qfBaophYl9qyTD1KYzHNkj6UPsrcI
	Ry8pCwF6hSF/Dip9cYDMrc3dBZb8odT
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id adf61e73a8af0-3fe970fb016mr3351000637.19.1795024000251;
        Wed, 18 Nov 2026 09:46:40 -0800 (PST)
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id
 adf61e73a8af0-3fe970fb016mr3350979637.19.1795023999775; Wed, 18 Nov 2026
 09:46:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-8-toddfreed@meta.com>
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
In-Reply-To: <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 09:46:29 -0800
X-Gm-Features: AclHuK933nJ--reKuON_iU7qOJYXtOh-j2OhgmEp3HOYoG1ZpPxZFsfMEYfL2v0
Message-ID: <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 7pT45uYZ1baoQt1_mHm_CqgIcGtMnNbc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfX7hWX6PyQLCCm
 qr8F1/XXN1X0Wntn35zApP/NIryFHo6Jwubzi+uAGz6SuW02ebGSoAcumFfLrSobm2/VqJMT62M
 ws1puWCeavmFOLiEosTENHzRZoj4tPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfX2rygltNR5FUP
 z+HexCFJ3O1z2sTeeeFUDDnxEhlPQ5IlMQ0+OSt3nQZR9zoiqpfC6azbMTynqysCw/vAWO3wA7+
 mv6PKpA5YZ9b7rTNNDDltgRLBqfpIU5qUEuySiOsaX0LOl7OCGe7oEPL8VkbQz1NroUW7HBUTd7
 r6j38ILb4o3WxeSyHSQ4o+K5W2/5FFes2K7SKKCqYXypcd5/AlpXQZwlcVI8UFXTONsTmMwhvk+
 Jxq0MhGD8RU4mtjfWw372nkbkNAwG31D6tm0lgwVQ3rMIEz+k6Mev3tpCIKLqIIrsHR9IaF7I/d
 o/SYePEWu8ExdUAtwemgm1CosyrkQ6VUgBWXBJNcZxv0R+j0t2MRF/HJFZCRmrD9qE912v81qQj
 j42XwfOoxsrR6bsgm2BYDBjTlu4iHeosJ5LEWZROeGf48BQsmWs3eVMHWuUd435q4G6yBG4EP77
 rYeWi4+53H2PUSdLD/A==
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6afde481 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=XWTshytv-yXGdKsk3gQA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 7pT45uYZ1baoQt1_mHm_CqgIcGtMnNbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> > +     /* On transmit, decrypted asks the device to encrypt the packet. Sent
> > +      * to ingress, the packet would read as decrypted by the device.
> > +      */
> > +     if (unlikely((flags & BPF_F_INGRESS) && !skb_at_tc_ingress(skb) &&
> > +                  skb_is_decrypted(skb))) {
> > +             kfree_skb(skb);
> > +             return -EINVAL;
>
> This check should rather live in the bpf_redirect (and friends) helper e.g. after
> we check for invalid params, etc, rather than here which feels off. Also, it would
> probably make sense to refactor this condition into a small inline helper so you
> don't have to open code it multiple times.

Sounds good I will move this check into the two callers
(bpf_clone_redirect() and
skb_do_redirect()) under a helper.

FYI this patch was moved to the net series "net: don't redirect
decrypted skbs to
ingress, psp time-wait validator", so you will see this applied to v3 there.

-Todd
