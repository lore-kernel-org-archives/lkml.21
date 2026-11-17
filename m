Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947506;
	b=iz+plLu5Zxr6d0xMkml42Q98gXJeotQKS/g8n+YIyA7kv2/Hg63/jrT4n/lcKS0bnhMt
	 pqEM5qgEHmmy3xtYv9NetDtqvJ0CeyOxbOP2jfY5hRz7KqymBJz7SnDXTj62UwigK2IsA
	 LwoYyFV2Ac48oP9hShRw4uLPAD3A6h7gEVf2Tg5qQLtJlmiN4mC+VXgiwDhDa15KZl0jB
	 RZjhdUN6geIbm3Uk0qfADSgy/9GpdMhtoEapswS+7+Um7WDIrocfD/6LTipiCooyzyeSt
	 mBsZ4iW93R9Hn6/3gtvRUHRIJ5ns01WnITQzYDScJUrYGLPM9sRZfK1zjkMhx3itoGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
	b=M5f8HvkYfCfsgh4x7f60UESjARmilq145+Bc6hycBX2gflxEuGMDYtiLZja1qKZ2ouqH
	 KMINYSVgULTgujT7DVkU2mkcHwcgj685NoHAG4Z9zD33FF6vl9p1HLQBFZCRT9MKtcitI
	 sJXTgRyC47OJ/7+3YDGWco0Nfy3FbUnY6d5mZ3h47hUsP1mcPIjOsHTX+YTtHnzRHYApn
	 s9ozjcP5dKbbXxQe1hIfiefpPOEGv6c+QYDRZd8g794vtK2vpaRB9mZbGJp0j628SO7hy
	 4m4+aAb9i6q3glFqaanfU8dFdYUTC8QWu0cUCqLJcR36Il/nlviZi7DzNpkHLjv9Djw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="S/cJHIGQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E08606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=S/cJHIGQ
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ9fxo1818132
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:31:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0kZrkgBlVJ6
	Br1d2+SootkU27cD8cvHld5OQI8t8s/o=; b=S/cJHIGQUWCeVVmYPfyE/H3OXIr
	C+FScFtToC7kEonJ53c6uQzVRAxI+YJlYPGEYds54+MNSr4IEMD0mKcHYDxXAdrE
	SEPPGDvtNUrayxoC4QQ0HERmpoGw2nbQFj8i0wXIDSkLcC48lml+1DUk+GS04s17
	aKXAK1VVdtpBWIznDhE39mOnzZWejBo7iGvPAusT2us4vlKH6wzzDmgv16k1WOBq
	7BA6KrN4q5VJd3ggyZYAvNrpidhK0IacxKYfeeBTXagj9wn8nUmbKXCRAx8g5+bB
	DxboWdy/0RNdniQY/cO3+s4SsWdcJ2VbpTOWc2QySNjCDjuPU8XHOnM93MQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0vrx113d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:31:40 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b97460a133so152017b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947470; cv=none;
        d=google.com; s=arc-20260327;
        b=HMnHwQXNyCFMTxyLsQt7mChqbmxIcN2o3lQnsvjrEIzcw/EqL91D4GxKS8sXLdvLF+
         u7WzCU7iH9iL/U5a/VHvGVooI19G0YTPWHpj0BudOBombi88YfMesDoX6N97xJWKjgLY
         P6P4U42Rk9+Rs3zLCsrAqbkGhfTYw6YRkqvqjZ6mBef2Yq+SVsNFZNenmww/K6abJQST
         a6wXq0h4NiZIfp3B2VcHLV5ILRMACeznY/jFaCWLoEa+LY7JRAevhknEIOu8NFpfCerK
         LSkuZKkp7A+r8LVelxT1WcCuEQ3MPk5H6y1eJ9fjgHhy+7xHEMzXgwGTOu2NwKi2gJYN
         oNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
        fh=cuDZqkQSw9vOMyoQNCL53abn2Ow5fWHq4CSSvQSqRpE=;
        b=Lq9vOj+36zT7x7b7vvFXzR+WVDDFeBIc6oqTawNm7htCj64Z4vbzw7SPK8yB9ztLtP
         dE/t58Zjm2b6i+IvM/7CUyVqjYaqfyLkiqhbvPavxRgV13Uiidj3A96DS8u0zyu/1NUI
         MfuSeYoSY1DWPYiPaLt7+whXwUSQ/NIfqEMjSjtdspmNTWh4wt7HI7z1AVW6Vqd76vDs
         bRbg5h19JyhLHSJaXvCLi3OkJegc/0niJAN5K/US1wd7O+8PyRekIcecY/gZ+H8LvwNy
         teCdsGjewF4vxBBER0fB7tHruUc6SIIo3PPAmDsFoBxt1iZmXi0AzL9cASCGBEtpqvNM
         0IUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947470; x=1795552270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kZrkgBlVJ6Br1d2+SootkU27cD8cvHld5OQI8t8s/o=;
        b=Bm/DCy/5tDLrO65lJqyvl0nl08K6FKPoy61Np89JbMb7Z2usozcuLIoiQM/rwamaWA
         vi4WMq6fOBmoDmqBVRLaqZV1ftibAxs3wShSvx66FK+9r9mGM15a+hJe4LQJHfYbhBQ8
         7/xn6BJKC9Wx8lTV4y0/CsuGBxud5lgUTftb7Mz1Vclc2pPU98OPafZIOZ0MROVrf/ad
         evQKnpoebD2GvsM/n+R9rUnmP8vKrovP69XuqmWsNh1qLdXvrUzTBaW2DKY44tVlkBIW
         /gWfPELxRaTYTfGdr0OM/HKzheYXRK7lZCbjRZ3+zSIyOHSvwOtzI6FdvupM6SF+fG3q
         8kzQ==
X-Forwarded-Encrypted: i=1; AL+hErHSMfwBGeDm425gXokppIvSt+kHDzPnTiVhtTmOoFN1wKGbDcCJh2oI0hAlzlFU4z1WsjrqBfy294e1GM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rdKsyeFuL6jNGifU5LhrG2XI1WViClqr1yDT99/WtLCTt92Kw
	y//V6QxWF/TwXjDv+4dCXvyqqc9sv0oh/O+Xo1zdzhN3u8Dq+eAfswtLw4ksFDP8X9KfS8F18+H
	1kTIiznUeLy241zEHCkKYEbMZBORCUbug1Burk6XkrHB1VUhvaQMFySZKHn8gD4AF1c1BzGPO3i
	tk2jSntuExz82qVCxzDyBOzBfdBFlf04vjYp8T2bM=
X-Gm-Gg: AYBFou1ft63GUP75uimmlFVR6DJigGqE2QCJh5S/3ZIaBRC8ZlYl3atrII9yroUjfTh
	gDD/rruxNIcFucADXg7kxUG8oOTfh8RpfPc/XYYIkx62Je+5zAnbOGF+KamjGVwtMdWI2qw7I45
	J7SpQ57LVkB8F3CMNET1GB9NdtqLs2jecboUzjnyO6Cw9Gv9mZ4WU74w9uo/0x2Ix5sCjMQusm0
	5FXl/aEwDflDiboiEMvmrlwVdCiZJsF+wn1Gu43f4qs/9JC74I=
X-Received: by 2002:a05:6a20:5491:b0:3f9:bcb9:30dc with SMTP id adf61e73a8af0-3fe976e2e5amr393692637.38.1794947470132;
        Tue, 17 Nov 2026 12:31:10 -0800 (PST)
X-Received: by 2002:a05:6a20:5491:b0:3f9:bcb9:30dc with SMTP id
 adf61e73a8af0-3fe976e2e5amr393672637.38.1794947469714; Tue, 17 Nov 2026
 12:31:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-6-toddfreed@meta.com> <179472727319.2199510.15887061947101112689@kernel.org>
In-Reply-To: <179472727319.2199510.15887061947101112689@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 12:30:58 -0800
X-Gm-Features: AclHuK8h__y1ykH_oWn3mQ1fV3WrPBL6thnn5AjT_UEvICUWUOHi7PKgkI-L6EY
Message-ID: <CADh2yMyYxVE70K1BnbqzDB5h+7vDBzpL7r-yxnhq=7Wgb4480g@mail.gmail.com>
Subject: Re: [PATCH net v5 5/8] ipv6: icmpv6: don't quote decrypted payload in
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
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX/AssbH/yJG/f
 MwvMoe/3BtZiCEK9nXIjGk/XZdz//KTlp6ODsqpXLKtzNcoIsyCwcezAmqvO77c//T3bFY7HEJZ
 O9tyvClkR6Gd1P18X8MG9G8fUYQ+Rls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX6/oNqTO4x4Ug
 8xEowlBbvEtUr4Vfay7Z5UaA7Z60jM9MwE8kfKjZj3r+1HACalo8pn3oDv3/XHxJt62chIgJ6UN
 ISNoOMd1FW7jDKUiNmKqHJCj8sA7PDCq6KhrfjdDW848EVE3NPVNz6NEg2EW0vobUnEU5QQh1g5
 vE7606PjB1zYhyAQFJhSB3UGRSZpqNUHYJAWzaE7SnuBIRqg3aYDKsRbH20k7r/IUoyR5iRA73X
 WHX7zlr6xhyaNi2ODr/U8rMH9wBOuot6uBw5ki+4bXw0GffRKCjAlxLcXcYMcZR85h6mVjLvGYT
 gHNxqQLps9dN4dlK9Mr0m7kswugurHCViV7M040B0pVGg5c9PJ1hr1DicLEOwcdh/jsvn65BaDS
 u4gB6RsRBwyS0/n6L5+oeFQOqijCnyq8NEctcblCYIPCKa2X65x0S5eWuCTFybs5C5KEJKwftzo
 D3nr89uqgsevdH9z9PA==
X-Authority-Analysis: v=2.4 cv=duNOmFg4 c=1 sm=1 tr=0 ts=6afcb9ae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=Ve4a7iEx9DEsMjZA-ZQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: wakT7X7sj7MvqnZMPPxtqMRJEsd8wrL7
X-Proofpoint-ORIG-GUID: wakT7X7sj7MvqnZMPPxtqMRJEsd8wrL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Does this cover every ICMPv6 error builder that quotes the invoking packet?
>
> nf_reject_skb_v6_unreach() in net/ipv6/netfilter/nf_reject_ipv6.c builds
> its own Destination Unreachable and never goes through icmp6_send():

This path is covered by the nf-next series "netfilter: don't send decrypted skbs
in clear text".

-Todd
