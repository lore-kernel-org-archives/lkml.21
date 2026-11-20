Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195081;
	b=QpIKY7u72apuPde9ITkZYRuq+qi6i9g20itmpcEGJKOXnRzTBjKqXOcZ0KCAUM43Mow8
	 16kbTKirWC24zCxpK0YGwhQSWBOWgEshO+6+gendxbMpga9bApdE1ccuhm+iYF+scfFLp
	 H9Ro6ebdtRpBYL3NgSJw6ktCSRUC4/K76uD3MleYPvmDbrxZW1KWxnEcZi8hhJNzRWW3U
	 z14x8IenUJZZI2oaBW9QEGQVpJ40u56yMys7nvysa3ZZYVWx+MDwv7JSiQh/vyej399bX
	 QUWVsMmE7DhB6Ea6ylCk2GLc7235j5D+YQGJjJ6VqTSnFt3xmTcbinY37oPKkoy2Irw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
	b=NZ+UBxTm3dIcE5HFOS+GKfaxh7hXO/bitSZFGNfEdFhHEjOEpUtDWw9FJ2LSHER53uNl
	 v57/RZV4Ah7Y0hFzzuqVrv8PO51NxpaCYh22MXXKErAJj1Db+bMsaH+bjV2qF8Xm6I6At
	 zoJG93rHLuBL2DuRpmFYL6GnYYnbhfnj9G81YD7I9gxuRgF4l+NRn8vebx1R9L3Edq4to
	 WBMuHcHyG6kEdsAXUZUH2+4cuoijsIe2Qv/C2+72z9JHS9URbHRfYaUjTYp7nT4MsnFwy
	 YsqlM+Oe9G1SXLEMON56bk8RB4TNWTlzeCOgMarfjmzlZezI5yjT+CJRyohlBzcTRlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HvFsqWth;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2C60A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED2C60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=HvFsqWth
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKGs0VO3858815
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:18:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=wjfu+1o0XY4
	1QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=; b=HvFsqWthOwr5IFXRc/Tsjs2JhU2
	waqs9ZKQnjldht7nZxu9zYt3XhDvdDhpIYEfiGJJJrEARGhYqP4wrclpQ6/0EBg3
	lRul39UgevRZgaQs0bGKuvsQi0xfHdWI42hfp2dMFO4+23ry2xekopDamDQ+QHRO
	mXXtwTWmKRWeGnr/fcfD6YmZLWD9v7sb3z+OTz4taeyADWFoc5O08MrAVa+2lhfG
	EBi8+Aae6qA7wuabHWw2J1neVqtl3Unw9VQ1tfsa9cHkvdngACKt/gZSf3Yp+tsQ
	oC4H3peNvc4jyK4lcsQdMFqAsEQWukxa8zbJe+Y9Ra7kS18gy32bPs7JW4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by m0001303.ppops.net (PPS) with ESMTPS id 4j2t4j06nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800 (PST)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0592d4539so1508713b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195079; cv=none;
        d=google.com; s=arc-20260327;
        b=AVfCxR0/ajVlIraS36Jm2VzG2DRBM8l6TnAoM6Euc6s1WG5Haex4jaAdLk2wo8/ss9
         e6pxJ9dt7bvgvtiAePS1ys7FZQjcLOoR0o8AIlL2dn+thak5RDi1cnz8c+wmZNSODFMh
         VIBmmHDW11hXnL03dkIzIS/55Ly9GYTfXs9wXF2IB5t57L70ZmgzGquX6EW3EIuqgM4B
         GOB3+kTDvPKCfLIYuK37KSq9PTY8JspioSSLWdySMYmou8xRAkzQ9D5DuR8qPTUzQPgh
         a7YEJiexa53K+gQzbIiMHnS/Aa/MwtG0xbxrI756v9MLP15cUvxZtwkWP7dlglSvaE9h
         fVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
        fh=5CnkWErvWzuDpPNOAjGMCtrpua7gCD8nB3aR9EJFqgA=;
        b=eBuObdJmCK4I8aN1wAQKrecL58MF6QEpCDe0d4KMs41SD1jTxOF0WjiypJZjB1ypNC
         Deo3TsA4+S8ucCl+AG4m3N/dp+H9PNVzqD3heoJ520CqhFbbRDrA56rz5CWL+DAew8yC
         I5l7buVVVMI5uvMgWNmAix54iXwBBKOBKZqdw0VaYBka7Zjbzz9vbKroVe7dDNkacXAl
         9q3bXhcB5ZVNuU+6rZsNj/yP9HJNoNmpXVw5qHRbj5BJsx0fwnG3tWfuFJ4tSuJOZGtC
         pF39BQwpkNGfWkTNCiBQhrrH7ovFnAPONmlf/kEdHtY6Gisn7AMQgk4NFUaAvMRZaccI
         MGTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195079; x=1795799879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjfu+1o0XY41QpFEK0UkLoGoO9C3f79CMyE3qI8pCWQ=;
        b=20AdCI0tZ8lbIaNSZ0cC3M0yDISp+Qh7b0RjLoZiAjrrisPIXif+t/klZIeeyXAwWN
         BwYGImFziMPAP+Nkk5hAk+wcEq7kwyNmYXeFOn6cE8G9aFeBspssqFVPgFRkj8uEnyY/
         2eej+vX4j2katsK2XYIiGQAytuxkYmvLoTdyPXFceTrdtC/xcVeSJFNbKGphLvSnNXUQ
         gH3EP/j814vxP+aezvnCsCwwWtgOqiaMzLk3yqcD5CdIpo0ILT+nHCsERkN6O2u3ex4a
         1slIJG61u9nfqTxfb7LjER/CKq4chYrAjSgUN2ZkXeEw+110ZKYkhuMRE2pdegpZpK3k
         6Wsg==
X-Forwarded-Encrypted: i=1; AL+hErELG3C2xQAlsa+Aaaw7mRM+8S3VhtuDwrOcKVpQDN8glLzu7DshrwuNKj1E73NjlUrsH5cn6xKv/wpohmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8byEcIsa72rw8fBNuVF/dpA5/AaWQ1ZlABDcvQb80Q2BfWLG6X
	+AVUFzjReRtjCyEROpgj/rM3opCOSJQPawSatqfRidlI60ST7V2qc0viXSYTA/YdMxdZHcdJcYF
	e0w4E9WmEPv9oI9k4uw8eFJhg6MvIn57zjXiEV1sn7K+W+GjViXuDhX+xhPVHmiXyp/qKtNppGw
	9v8ciZa2vtDKashpAhKXO6Y7MMIoE2Ik8GKEVecx4=
X-Gm-Gg: AYBFou0FCgN42ElgsrY4MpChkllRExW/z9/U2Fuzue7fvp89GTkFNft7dyOI1oPSKfL
	xVaErvtBQgPdNmihgKltv5/b/hVi6ZpyEZuxPsdNRHp1bRJqAt9SLYg2jm6GAtNLiRynWLrv4M7
	wsmL0mcrKTCfkHQUCbMfzkx5prXgmws8CuPxN74a7It0KP85PF02LYecd3xnSOxiRHk4HwMKLX3
	mP5isDdDYIcSefh+DznlzuCRqFPsNC9
X-Received: by 2002:a05:6a20:9f86:b0:3eb:39fd:bacc with SMTP id adf61e73a8af0-4014d360ed8mr3745384637.50.1795195078618;
        Fri, 20 Nov 2026 09:17:58 -0800 (PST)
X-Received: by 2002:a05:6a20:9f86:b0:3eb:39fd:bacc with SMTP id
 adf61e73a8af0-4014d360ed8mr3745344637.50.1795195078192; Fri, 20 Nov 2026
 09:17:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-1-toddfreed@meta.com> <20261117203137.804424-9-toddfreed@meta.com>
 <906302b6-facd-43c4-872f-ae40bc59714a@nvidia.com>
In-Reply-To: <906302b6-facd-43c4-872f-ae40bc59714a@nvidia.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 09:17:47 -0800
X-Gm-Features: AclHuK-LgS6otYIsEJ3X0_WptWHRTeRKrRZOhEbdUdT3ro_BhN8Q7OlgsXmfnZs
Message-ID: <CADh2yMzLDMEOupGJwS8=3JbN-g4LR3ZapyBNaJx3chNT4_6pDw@mail.gmail.com>
Subject: Re: [PATCH net v6 8/8] net/mlx5e: psp: tso: replace only the length
 in checksum seed
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
        Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        Mark Bloch <mbloch@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
        Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfX6W6vlu1XNdbr
 leHi9439T3wVljgof8W3SHMkZ/BJNWFMDOns04J4WfkfAfZ35rPYYPpMv6GOtd+JmIOnxGBht8I
 0iDV/U3Xy3gKOFqOQoEaHSCkVWh1MAuhuDu2697Q70AqM0gqL6JpXWRov3183do6gRd6klTVsYu
 NNAmsjyeGqf2mtvoTD9JtGmUYQVWV4PT+QlMdwuauJ6ekTNn/mUR+t0ClQTLecierl4nhtxOtja
 MOPMTe1YL0Ar3v1k5Z80bbyf0op48YAPaib7GL1tZ4f9v82X4wygMZ8pba7Aqbbc8yn3lC8b1A3
 O+x/zOfMEC8J8WxtoRqN/C6vqjQIBDBi8/bSwjUjJw9Um+ajcmDc/Jgm4nLGhaedqffYBZBe7fo
 8N2GuecNPCxlfP6sUDZsiw3QxMcKhl1idMl/smC2eh7cMAX7IVFXRbt56dxRoPclT9LjPGY4E5l
 cSaLftorvpMsiqt/zjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2OCBTYWx0ZWRfX7CyZB55GzUR+
 adM3cmeLtfSso5s8qaO77JJBTnZEjWAV5ZAMtnwScDqVgOAVjjtM/7momF4JLo1dilOwANOAQ9/
 o770hblgp9gWcTPv5sHI20WGkaaPh1c=
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6b0080c7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=OFRVtpLxHUNKrmO6MooA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-ORIG-GUID: MmfLqrtYjY-kdpdo7EmawJ1luLs_4YSC
X-Proofpoint-GUID: MmfLqrtYjY-kdpdo7EmawJ1luLs_4YSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

> > in these cases every segment of the tso packet to go out with a bad tcp
> > checksum
> What did you mean with "to go out" here? Goes out? Or is a verb missing?

Sorry about that. Here is the updated phrasing.

    In these cases every segment of the TSO packet goes out with a bad TCP
    checksum.

I'm not sure whether I should re-post if the only changes are grammar
improvements in the commit message. But, if it does get reposted, that is
how it will be worded.

-Todd
