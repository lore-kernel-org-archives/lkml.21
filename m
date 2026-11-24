Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478661;
	b=RjdBt4asGM2g/Z0EZHu3wUNHusWaz638b+RUIjrMAKE8yutB52/TTBtDdIAh8uCmPJUT
	 //7drMW0a2zozFNuVg7HS7CcX1B0wR4Ekk0+5BFbimIXLEJ3T573S0mPZMD93o/Doewl0
	 sQ0OdjO7+0p7qWonOLJ222fxSRhbVVo7E7zNd5+OFGcr3/13LIpZRAW7f7gvNbKPPpzor
	 OiLzldbFJ+XdvC4r9ZG6Pd9nE8teNxj5Q6yoLiKWDYINIIcG3JfapBtYZ6s1IKlT1WY3m
	 BNsJtaCLKf6/++dM3mYX7HBdFjUXS+bT/bTN+qxyK4s/dT6qJG1aRKFletlFU7/OfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
	b=Nx4+oOkxech39FhlxAzOJorbu413h5ZAVZpTLz/3qGjthBrisr1p+bu0rvUH1mtSvD+x
	 2ni2Rl3kPPDCXblAUZnyIE3dXaI3rnAxBQ3lI8r5UEZL2ybr3xpk0oD2kDPm6NmsCPSTo
	 n4jRXxnqvX6wLedw6DeSbmilfZYvgZFXckB84AxmxI9zvWecvBDq5cjhag/ju1r+r4dpM
	 4y3Yf6vSRLtaI0a2M7MHFLi8gP29VmzlX1pEBB25YT/Fa1M5fhanw/YxhfgtoXPsPom4k
	 puo196O6F7dQir60EE67vqrkfGyx6IvGbQVAKA2Kje0rAddHu3B4IqLtZSbZR4TlBeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsuLAtoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFXVrNQc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1A6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F1A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsuLAtoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WFXVrNQc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJua0u1332805
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABM
	CjzlVzYU=; b=WsuLAtoBPvFCnvZOFiNOb7w6/tgENSRqbkGK8bz8EXAvevvza7f
	izgoRuO7tjbvhGrZvBEWOAq7uqjWK/2R8W2eFbEWnZ56JIJmgM+L289khjFsVPZH
	kaIV838m6IqVtnV9/MJS6BMjBhA0B2k/erOxB0tXLHtVS/qDBGZ6WgF0RRoJOVgu
	0cpG3XnUvxc+yuHJoZNfhWUwu/SPrxtJq96kZ/mrAHwOpKYzhw4TR8R9myOvQ82S
	yRPfT+5CGNfzpNNyj1AnbxpzGw9dGEbCiAyB6NouuJz3JF2FsMlakHsr9Zuu3e1A
	ooG2vOuyPkjC8MmvlgTHMK5Eorw4h/nhNhQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g744126-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:04:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso6950201eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478658; x=1796083458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
        b=WFXVrNQccPNkigzXQzLWbI62bprrTJ2FktkZZV0txywu0DjRYx1Tl6gCP7c5LzGvZN
         k/1G3nKh701ShcRjIYvUUwR92HUBZtH2WwcV5ktZWTOTPG4o6BjRi9Or3+7yFSWaO1JU
         v0wJHbrRY8fzYvpNIRzrgyp04ZJNPgxbiyw6z0tfKySAci/t7DFRS5jT5FLn2/+HNo9u
         K6IH23fpiPloUmGpXDUidXRqPxakiRP+s5FbO/63yXaLg6LxjRh60fkrxCGIv3vKChIs
         PZr41bMUz8kj7N38RFBuNUsSgQSH2lYYOt3OjZzCebfw7qNC5m7O+ouJK4Se/scAHT5+
         16jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478658; x=1796083458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qm1RQNetAuFgXdndilb+UqjdnHPgEpFGABMCjzlVzYU=;
        b=ZC4aKJTtdzTsWtGmMjYtsxZ22CydVfs0XFDYwCfhtVO9apU0e6K0L4oE71OUQjWCQu
         HjcAT5Y7r9/BwAJHqOadic4gamYJUG6+iKOMrWJmgpVRaN2Byn6pDVy0+oreo9oVpo3u
         CNX1NRD/vRrOg3Td6cyraRSm+A4aA1OYet3Ea8P9Nx9exwIEswl5xGubT4dBXs8VlopO
         75rKLEmqzbDHRO9S9d+RI+xLmycW2azSK+uReLxjlPJZDMTaY1kgyWEhpUg3+T29ILqU
         NVJpNN8m2aJqmJp5fH96BbX6NvIjU7VcPC5WmDruIdxI1eEPc16onotyqSnTU/rdMoXp
         hiNQ==
X-Forwarded-Encrypted: i=1; AL+hErHW6ysVVxwicbxYtu00apdqK9ky4sHsaZxzMkqedc3uIxmiwJeZq7K+/xQIJoQq9Sx73EOZUSXKFai0saE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D4g/MF5MyXS/tRxwRwtWv3KKCBR+Gl/R4xh8QNct3cqVIcfk0
	PjqYliHvKkgLBYrGPpUVeuX3xLZ73ax5y+T4Y6CVVfJGvX2uyqemD1qRnPidoIZAx+Dc+iBUi9o
	LaoLQ2D+FmTbg3zWoA7t3jtSeKcprTkSjYwYe2TEm7BgMvw1wtJGcgB0mjm1kEwLGjBM=
X-Gm-Gg: AZFdTZe3uQlAqn40LJ/3SfJ/rGL7ooxPHi4MKQpHJt1E0EmIzxuiHHE1zyRHdOTiQQH
	tLKCAXYv9faV9TLwvAr0SDEPfmm1gV+ywKB76Aac9xS5PkoQ4Y3G3MksqEgSnx8xYbtagxUQ4O9
	UKrYRhronCpLI1U8u8hpFwn8JhiUYADGFrKXyIMPVU/10JW6iudS8Fq3sMQcI/Qdg6oCbNkxBHk
	j9qIUewzdA9vKePByBK1ss/EhNYyDAEKIISIgfHNZe4MS5zG0/IaU3fb3FFonAL5B8e+24hFV+G
	WFOs8QVM1PGE65fjbK0Krw9nLCL9vr/FGKsCgtG8HKkofZzXD6CQNdA0sncoIGQfELxWGrZdH2O
	of3ujmsu7gevBtIw8IeITGPJJcCsLSiG/kJ7MYvnq3ZUirDbJGdSLw4BFhF6lBAtVKfs3Llfz4n
	bnpg68JPt3cF9wx9lifBKshJUFGu0grT1pMb4=
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr8920264eec.11.1795478657528;
        Mon, 23 Nov 2026 16:04:17 -0800 (PST)
X-Received: by 2002:a05:7301:4281:b0:386:a193:9afa with SMTP id 5a478bee46e88-386a1939c38mr8920228eec.11.1795478656983;
        Mon, 23 Nov 2026 16:04:16 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:16 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 0/3] net: stmmac: support up to 16 MTL/DMA queues on XGMAC
Date: Mon, 23 Nov 2026 16:04:12 -0800
Message-Id: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WjHxW8BGT5PqYr2VDGryYA4zaUnNyLwy
X-Proofpoint-ORIG-GUID: WjHxW8BGT5PqYr2VDGryYA4zaUnNyLwy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX+ZBUeRwx8CWm
 VITpnzQpB2KyQLSn//yeVzl31uzPPjaW5gWWiMb1dSsI2sr4GLpI6PA1uproGrhpHlF3nU+hcw0
 RcQmhCHuIsLt+4KVFvNwr98b/dH+gq0=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04d482 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=j8eSvQKXAAAA:8 a=fBzlRZiCmRc88xsmlxcA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=j1SoD6Fdrn8k65qUt67a:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX2saFNoD+S7KS
 roT3o+zArz1oSi/SJMzy0l1zYV6ui1HI+of93MsY290SB08zlIQjlARt9sHW2psoQTeU8GoLt+q
 ImIIIoMJAL2Nn7Ftjlsiq1UvgFWWT/cb1oFTwvgtmZ20wJgYvDlbfqvax9HzNMCuI9UdjipECpZ
 BPkE6ssx5vfSBxtlOZzw5cGxFxVsZ2MUAdxn+i8PXawgfzqJOL0mif8GREVU8yo7m6RJjiUbMwT
 kI7zlZU+r7WmmTnM6eXk1Aj43RRSdz20vg3IEZGDGOyJntCxRK0PA+HvYIzXzzx5bfjIzeANJnz
 QpjJjAra7sJo9NJ+EHPe9WUdpeYofoU15E6ixp21wmB6HCilivCSF4cW/Rt6lcFhUcH7FIkU6DP
 5E9DW/YuFb5wsa1hqywIi4UisYLxW90sbk7VDY8hyzGDHFF0JqhyIAoSyoNZ1qEg4N3ccJFsNaI
 nvQFCy/+C+kGUuK0ynw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095

This series continues Jakub Raczynski's v2 series "Extend MTL/DMA
support to 16 queues":
https://lore.kernel.org/netdev/20260601162537.553512-1-j.raczynski@samsung.com/

Newer XGMAC hardware can have more queues than traffic classes: Qualcomm
Nord is a 25GMAC-based SoC with 12 queues enabled (the core supports 16)
and 8 TCs. The driver assumes one TC per queue and bounds every TC
register write by the number of queues, so the DMA/queue count and the
TC count need to be separated before the queue limit can be raised. This
was raised in the review of the v2 1/3.

 1/3: separate the TC count from the queue count. Bound the per TC
      registers (ETS, CBS, weight, TC_PRTY) by the number of TCs and
      the per priority registers (Qx_TX_FLOW_CTRL, PSRQ) by the 8
      priorities, and do the checks in the callers so that errors are
      returned to the user. This is a rework of Jakub's v2 1/3.
      tc_setup_cbs() is not changed: CBS offload on queues without their
      own TC needs the HDMA support, which is not upstream yet.
 2/3: extend the RX queue to DMA channel mapping to 16 queues (MAP2/MAP3).
      Jakub's v2 2/3 with netdev_err() replaced by WARN_ON(), authorship and
      sign-offs kept.
 3/3: raise the maximum number of queues to 16. Jakub's v2 3/3 as it was.

The review of Jakub's v2 3/3 asked whether the other cores, whose per queue
registers only cover 8 queues, could now be configured with more. They
cannot: stmmac_hw_init() already limits the number of queues to the
count reported by the HW feature register, which is at most 8 on those
cores.

Changes in v2:
- v1 was the MAP2/MAP3 patch on its own:
  https://lore.kernel.org/netdev/20261016193823.2711773-1-sagar.cheluvegowda@oss.qualcomm.com/
  Following Jakub's review of it:
  https://lore.kernel.org/netdev/atXhR0sgdW84YxcQ@AMDC4622.eu.corp.samsungelectronics.net/
  - add 1/3, which splits the TC count from the queue count, as Nord
    has 12 queues (the core supports 16) and 8 TCs
  - add 3/3, which raises the queue limits, so the MAP2/MAP3 mapping
    in 2/3 can be reached
  - 2/3 is unchanged


Jakub Raczynski (2):
  net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues
  include/stmmac: Increase max DMA/MTL channel count from 8 to 16

Sagar Cheluvegowda (1):
  net: stmmac: separate the TC count from the queue count on XGMAC

 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  | 17 ++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 21 ++++++++++-------
 include/linux/stmmac.h                        |  6 ++---
 6 files changed, 70 insertions(+), 22 deletions(-)

-- 
2.34.1

