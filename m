Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953838;
	b=DQM+SYvDPDQvsz8+b8ByPfTyOro+7wuX+VjTM837cyx0zhjan0WZ/6sGXiAVUBDbp5yn
	 Lw9KtdkJngi9hoaMzln4Xj8Q5muqiK8H/jPNVYVwj9Iay01w4srGusyLK/y0/LlvNmSXy
	 PKmAutywnf4noQ7NwFhaLA0jyleQRCwKJBH0Iyi5zbUYArZchA3HvsMuxXOmuHvMfiESR
	 HSIUKKphxX7qJpCdAJrg9yPk3HcghKR3Ud3XNyTkk7sD3lnSCF1QoDUuH9G6xa85VICGF
	 gyZVwYKsDrRkHKaketF2s7XmcLKAg1QDVMINCqKRSa1UImyoPbWJsvUGFo5IcNgBPmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
	b=QSSOatru5MebrV9gJbhkJxx7Gp1I+QxkRSX7j9j4N59a95nEQQWsWkc2EHjz+299RfEJ
	 LMl/swOoHu0+TZvd7MLXC8VQzpufavmtOdDWrwxS7TLS2+V8Ow+5HLn5peJEkPiJMOxJd
	 ZFSuSzB9fziGB+Ev4nE/55RC+YFoo0Hx+Sdw9JHiqD37PypmSCgjM6pg4DWVhDmKghQzM
	 mqQrzOuYiBYRjT/vI3Irdo/kayBPwtxQv8JAZj+u8f4hubiJtGsjnK99HEQlu+mhNH1Ax
	 qa2OEiBSjF6gWecrzbrWJXxnwbzCMt3qPKhTT0I3ULm6KzoHbvyoWYfX2SCe3wijvzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46914606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46914606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1u9s104893
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=naIMYO16Tb2
	J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=; b=EvkMrAlmrDK8ub69Xg7pAjpcfhg
	bZmfLUAoEXVsHI582DX2XvH/l6wGABdG9omOSqhVscA/IEoGuPA0CuKpLQIwkQrd
	hBEyFCYOGEXtjyA8x3b0g3YTHTx/sHwE+cQmDTvaKvteMtyAtX6dmBfQkCozkLZf
	p22cxMmQsz7yD32uSvOi3HsnxIikFWp62dCypEtCz6SeWEqW8jjr10TkF5/Z4PeJ
	/8L+8tNnAtQ73AhwuAwiHeC+vacHLSuhs6/KyihzjSuZu88a3UB0O+P7RJ2pM+Pq
	VMyvbB/nLDYMAxlh+5ivYxFI1VuB1MRuJ0Byb/cV3VEMNBGlBCxo+Gavfxw==
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	by m0089730.ppops.net (PPS) with ESMTPS id 4j0p7y686n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800 (PST)
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so172062f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953836; cv=none;
        d=google.com; s=arc-20260327;
        b=eyQBKOx8YNknPwVxqEJ6hAGO36f4xuGpBoiNr5nV5H5cDtzduCISYFklZGC7vHYYOh
         7ctJlTzP702O9bh7IERlm5c2hWPaCamZZ4yMSljEa5AjiDuAIjDqDhU3Fvz+tvBTSDG+
         6qzQr9VPSrtCCpdsxveUgEBwJuJvfWSh2hXrxyOEbkS5VIqAHemEfGr+KQT1hSomQx76
         cxjjj2Q41fSRsXKXkPyKGztyg65PEeFKnmHHuo07yiuWV5YWsbFqQpd10iRY3o9It85k
         edhqg3pn+rFG0QkkpFeBI+H6HDlXBay3/hxWQbAH0UCnP2QcY5WPhzIVimpOR74tG7Z8
         XAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        fh=J0RLnnw4rbUXpKqjJsi6F/YezPsUyWYFU9YSEUNAN4E=;
        b=ChRLLVE0NdFRZnvjxGEFPAQTwiVfv+7xN+vzpI4vUYrL7W9lEEtcxinX+k/OKywbb8
         AKyVeFHNCvSEOiTTZmb7FMcXgGjKAvDNVjSEDfXlYVbsIJBrIqHsObAfoiT1Gwun9VT6
         hiteCzO7t80rfigir21YELt7uYfoJZp8M2xtIODydcWcfPimcDp3KRmAErm9jDYDd89V
         tsIGskpqQJ7mLiFWZsM5Otg06uhM4YvfmlKKICZAVERpUwgupX5Ezi/nZ4uMV6v8nVBQ
         d60UrWetkqP7TWy4iamxK7Ja4ZdRC5bB2pupQ+Fzehea2zgmRiO+wPbSoQ4Lk9OwmUQq
         SJpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953836; x=1795558636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        b=Xriww9nbeIiUgu4+V5MdUPe1+O2wOm4VC6cqw3U/YX7eZEKWvi4ZWDCk7e7B3Fihmt
         Xqy7zWA3RnUpnfLYqyNbKBCX4JR/wU0y73Z7gVmsdtF3gxM7UAbSZQmd5KN3xx6yrbRp
         QV/RmsgwCn6sHiOpD4mx8C/qBj8B9Og2GOm5MBJmPaGyqr9nsFtXDowySgHVCTLbwyVO
         ba6v7DakyQ67idkrljt2gJiuJ6IE+/p5uXRktyxqB6JjWw+0cMBuTKQuRrZTgbWFKw4M
         adYIlxxWmLcj+pmmFZPrmzara9KJ2qK7oSH8MEO0PR/o2S1rAFWHBUrxcdY5qLMiClXe
         uWZA==
X-Forwarded-Encrypted: i=1; AL+hErFr36xeVNFI8uL+VFYt4c4j7+DuUIlsiJt1bgCDtEoiBc+B6VnwO3Di//85zFTOzsHVgWFdLpoe2VZmnHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dfddd7svO3/vyTUdxkvHoI2gEGDHfJxPWAB1Uqi+TxomwWDof
	qMLSK6K/1lXHDZ29YkKhcB9VMZ1Uj9AaC86l4F8Gml1urcEhhZgVnWb/hTe2Gn+HKDgkiqygV47
	HCQmsTo2o0ZF1ITZe/IjkjHrn9tS4SMgcjJ5f4SFAfkRT83I9jDgcivPck63AafONpognFXsWqD
	jqtFSVdJW1fQgpr6524Ic/+I1zMmW69ZvRw3hHQug=
X-Gm-Gg: AZFdTZc7ak/Qkl7p9NyuHCdMSXERfMt90ozP8mvsdb1XcQaZYpbrmpxp+Wo2KOXsHhS
	w730YigfgFehlvbKs17BWJ5/ItCTrfRQGPKvkQm87wJZou5dHfzmYyxgE+ZKso2WoWw6xfHKKv/
	IaPmDkb7y1YBTG7GRAvWLXn2LUZVM4CZ4+M5JehBTjSmd32tIQStZFtQFIFHMuW/c5ndnbi8zOT
	9u1368/0A3ETwuTIGqkPeXL6zLNI7EFei2Ztx69fPcs3tuVdOI=
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id ffacd0b85a97d-4a63d2cf7f1mr1645591f8f.22.1794953836011;
        Tue, 17 Nov 2026 14:17:16 -0800 (PST)
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id
 ffacd0b85a97d-4a63d2cf7f1mr1645531f8f.22.1794953835465; Tue, 17 Nov 2026
 14:17:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-3-toddfreed@meta.com> <179471269307.2199510.1215468778950936295@kernel.org>
In-Reply-To: <179471269307.2199510.1215468778950936295@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:17:02 -0800
X-Gm-Features: Aa3M54r5Hu3045uljd3xO655IC2ADA2xeFtOm9g-Da5bBZKD676NvfeHASL2RN4
Message-ID: <CADh2yMznmWWJsh4ArEhrm2n9fG8i7o3u-kjLrvs_dwsBPiFvtw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/15] psp: take the psp nexthdr from the
 packet on encap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX9ubwr+8uyGOb
 cKVga+rBZVFYTvr8hehRCox/rN5sr2EQwEiEOBFnQ5BKHcpplWqwvem9LwFeYfSysFPVRB1icFg
 33D4VeFAtJdmnXNDAY2/PiVokMEceBQpaGG3nk7B2SQ1T4/L7I3+l6IXkiMX79V24JxSb6xZmag
 lf1CFlDI7mEliRiJjL4ewF7rzzTK97hShAUs1xML8oIYw3J5c/w3uSWkssj5v+tduS/BfEhqnYq
 3rrHEzNQq8R/s6eyHIF4pcRwP9XnL1oa8033Hx6xCUMzfX3Byj+N+hrR/VnLqJHGKbtp2jWRnV1
 zuyJFZKK/Md7weA/fLL6g1GhLNZyBi2BXp7jIghc3X2pOgW3NazdjY8YixrLRSJ6qsBcJIlLKuS
 3fmxcx1cru1M0lGn2Q0RoHZlFqgbplTRFJQiXgr/6BAU2ODyUNLbIaEGv1jGEgKff6bFPjBGHLY
 6uEF40X9+yjANCIB53Q==
X-Authority-Analysis: v=2.4 cv=bJyDs/+Z c=1 sm=1 tr=0 ts=6afcd26d cx=c_pps
 a=I6ewnrIBtnKHmb6SxpX7Vg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=-eSvoOO0VIkvbIxHXOgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dgrdkAEN7kQC-x5sQ--x9h9lppagjzWy
X-Proofpoint-ORIG-GUID: dgrdkAEN7kQC-x5sQ--x9h9lppagjzWy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX7rnmzDc9auDZ
 r6/N/eTx13Ktdwy8Th3nCN3NC+qHRwq+5FG+3WNWZuZv3Al23f+xdFEhIe+DmOVUbX1PUgFwMv3
 04WiBi0TB0o307cRbOTjzCeZbH31GYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> psp_dev_encapsulate() now accepts non-TCP packets. Is the outer UDP
> source port selection in psp_write_headers() still correct when skb->sk
> is a UDP socket?
>
> ...
>
> Should the sk->sk_hash path be limited to TCP sockets, with other sockets
> falling back to udp_flow_src_port()?

Yep. v2 will only use sk_hash for TCP.

pw-bot: cr

-Todd
