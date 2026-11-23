Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446206;
	b=hj4M0W0LxqBbZX3yWXOUYcc1u+LdtRAEWyprGBmDeyXWZk55DU9QNqIA1y+4RojA3UUv
	 pghzkzO+Zjl40qz2X/0uP66QvX1o04bLr4V6a3IMgXdN7ZgUkpXHYUeMLvxSJhLyQso3t
	 aocbltu+Mc3mS+vaAAOlosR/6Lu8o1IaiyALvRoXnZYs4QRE1BcZxhNvF4ojEyhYXV+F1
	 HeUWCQ1YhI3EmKej3htNF0Mti/x74EDnk2L/oNpweQtS7brfXu2FAVJcOQedj9DAO0bDk
	 E4/NaedzVbekwMzUw+QP0Y97ddScppW1ZCh8CMICTT2V+Sq9uSDb5gYwSIGGzEAHKhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
	b=TAmP31jwedCglOklClmlbc2V7Z8Ud1tUqCp8gO/OIx026TyDS0gVMsnUgtqsEsaXhiV+
	 J1uBa4vm5UlpjfkRb1ZvXs+wrcxP5GebguwwgQtdX2KtOB72T2SdndRz2iHrlzD97aCI9
	 C6e2F3J1yOuEGNHiRZagJue1R1OZcXF9uWhq0tVZ52786Go7Y3YxXNI9+aiLpaqjA8dpv
	 mIiFMayRE3c2aU1tlXY9mbP+WqI7iQLbRZLG7VPI3Ba+VTSMv7qV3o2T0xAlVu20oL1hk
	 jS1bQyep8FdqvgAThDCjnthJApKMYbbyatF3p+gk1mdTMXqRL/9N8lKSYbfhFgmZQ/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbfO81VA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSVHDmP7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B46606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B46606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IbfO81VA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSVHDmP7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL1xC3072386
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=; b=IbfO81VAygWqws1q
	TyYwzZLUHWgB64GgdO9dyaTt3zpAjoZJTDLgfEK+Re46q144zQ/jXm7UXcLujI3H
	3704UyUwCzMPStRZkWgk0SAvSYRVpYoQqPVCPMbG1rBBjNGXvQRthDqmm/VLgGmq
	eua9pk6y4yQJJboujmd9FOPeCnKeMLAi1zWreYZmb4BfbxKi6k8Usii2edWf3Qf2
	TPZ6mQvAySOhb7U/BEnLigjn1K43367diJYkpo40vAtzLfnyiP79fe+z1XO1Yckd
	yeY0KLT8BbSG1ND5//lKn9wXU+qJrzCeCaaZuhg7/Ttmcx3Impz72pohCAly1rYE
	5wYCbg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7sk4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:03:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so25984245ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446203; cv=none;
        d=google.com; s=arc-20260327;
        b=BTHeigJjahwXC0Unmk8LLBVfy7jkFO4arE64+L4p9Fw1A9uCi18lHcbt//t608C26M
         rV+tdONzWu28aodu8kr9AtgMeOkKygWaBT/VHIE733KBsrItYwO+Ti5/Toex1q+rWmxv
         EQdWaqFZOL6YWppvn5sSdxTIWbKQVzbaRRY3QUlanFWMTz6V6OFdoCyznM1z6bX69NJe
         +zBpAaN6vN9W7E0mO5Y5qacCdxoKQOvRzuE4Cn8GR6zNepM+f/qFQPDDe6rHyPiDfxdy
         nlWSmLIExa3+2YkcVqAg6t7mQA2Je8bmzzQq22gUpohY+9E65hCIa/B9FbkIJZthfcsi
         TZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
        fh=q19EjCoORz2lzcb8jeYax4Zw7A9mKE9m+on0OS38r58=;
        b=ItKCma4TqTntLYXK0dZkFniOBFGlb6vCas4EUjvSaRI0ScApaMNAifp/9GuRCTYztd
         hZ/b4J6aNjKKeWEWu5rmCxIQ0LLtDLSFUDjJEB74uraCNWoliK6D6sME8xt39irqEU1x
         DwBBKXOmboCKEcXrvur/nE9CZ4ZQQ5OYOFsDNVqGqe/o8YWM1776z3FbkWS/AnX36pez
         UOrjhKmMLf+n21ia3YlSWi0mpuv1fBWuxlYA6wBRY6YTj9MoBqvapp4Nj1J/QfjI44Ph
         0DRxz/ILYffTg2q1/6jdnX54i4QbglYuCFGIHGadYwKtN28dr2Cbn1rGs1deHM6bzNXV
         bBBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446203; x=1796051003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
        b=CSVHDmP7FW2y/pOLoDB6PNBCVWcw3+h0ApgWjjBwGoeDiywj+f4NwZ5gjCsEM90OTh
         yWotG7pb6GK8viQ+bot4iKVZl+zwziyrqnt3qhOerMTFLaUizSbxru2WlldhG7VhihEB
         B3SboJsxLnj+JWm+vIwgpg9woP7vB/DJoDdZu2c3FJpoXTwuvCWj2/HZrFFxrdWoUZ9I
         w9v0mvcw5pzEa5jfcPTukaTo0Xoshl5lNhoBg3kIh06qcaTvRwHtmIaiHSlr2TCvVLbB
         EY9BHUaJO2sHPouYHdls/aHDfgCgo5LqJs9GXVN2ONmqveECgqN+CeOw4JVvgIvcGpMY
         d+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446203; x=1796051003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZmn/sNxwAfKWKSIqSCT0pljBWlXHOxHLlaVhxvwNo0=;
        b=CHIQNCoMIlTynIZrLRY/BCeI7OO+SXwPjHvw0SAsHDbF3Zpr+GGo3G9pgQpY8vaiaa
         /4Rt6ZQ27boLhlpPIQnfbhBIfpxBWZ8t6KF2+UpUrdQIcCm4oIaKy7azaJ1JrKi/nsxW
         PkayJ/gWPcWwzyBAlrnWcKAJ0aiUU+mmYMqdznC+RQj8U5n9u65pT0RVBM5GKZ1v+ZwW
         Z+UEt8yf8yNUnRiJG5A8JF2mU1Ipg2J8dPanU1aAo+ksITJ4fh61EDLoKwSotKeOnKSd
         AmEuOuBd3fmLgWj5vr8Jpitx93411614k+D+5/xbWTiseww+56OadGFHDWmHpYLZD/zN
         U9OQ==
X-Forwarded-Encrypted: i=1; AL+hErHn1YMPpgWma0DWvH65AX7V0huNpVWl0WOrpneeQwBS++9ure3Ywf4+ooG+FjxFaXFAWMvSEBfF6kxgDgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vp2gcQEG+tHdOyp9kAg9O/ahNcg7kEq8kT5QGpJpexYgnnus6
	JpM0jvFr3imycAUFFN/H/B7SyJxrolmsY+KkB0qcEYedw5dua+3Cb4KwoB5VinPl4R4epdzT1af
	0wUZULHmw2ISn1torjF0Y0I79C5CPFfyWrtGFbXDPkAucDu+Rlma/IFFYWgI1sifSuosPk/gOfJ
	m/vJzz/G+nzJcV6NXZAuNGTmipV7T0uI+xsjri0At80Q==
X-Gm-Gg: AZFdTZd3AuA5RV/fFgH2HFiToA6I+4BHkI70ExGHkgPjsiZX7fptR95tD5oYq+g0/N+
	LbQamDuE4RNES0EnCR7OkagaxdskoV8cm5fiEuPSNE4zBzVk+6j/RWpu0Q9TN0hFHHAu30GGWhb
	wEDds0I4fKGktz3wdiM2Unq8mTm88U13/ypwZwFYEetYKrK8M6iZc8OE92S1prn9Z39axuyUK/E
	aOPv4nobMmvJaXJ
X-Received: by 2002:a17:903:1c9:b0:2ef:fcd8:df75 with SMTP id d9443c01a7336-2f03f18847fmr120968175ad.36.1795446202925;
        Mon, 23 Nov 2026 07:03:22 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2ef:fcd8:df75 with SMTP id
 d9443c01a7336-2f03f18847fmr120967425ad.36.1795446202035; Mon, 23 Nov 2026
 07:03:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com>
In-Reply-To: <20261113-pmdomain-rockchip-v3-0-b7039ca30b87@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:03:09 +0100
X-Gm-Features: Aa3M54p3bvaqL4-4P5a9q3TQOKbyz1uWNRpSG9PtFinKLWfQ4vS-W5Tpi3kneLA
Message-ID: <CAPx+jO8KYfvm+=UXKYZv+xBAmGNUU7xtYH9+cJRtOrnQh3GmrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: rockchip: fix the probe error and
 deferral paths
To: aiyengar1990@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yao Zi <me@ziyao.cc>, Igor Pecovnik <igor@armbian.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0455bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=0OowS_b49qHy5rEh488A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX05nFG8vPdTuh
 HKNJ83sCfzaiwf2bbrCBIHJNfm2zPDJKggyy5c7ph3PuAiqbSnfGFkgqPOp6WD8zD/yVFjSkZCc
 jW07kMWgVXvwx/H8TdLXJ45lDdu/BlddEX4D1FD5C3m1YCa3y0OEAogFg+y8jv3gLZCNOrDYv4n
 sRkuW7zKTY9Q3/oeko9/nKgbkgL+ezWUDK+03hxulrk8KF0iMhY2WjR03WIkAoLM11wDF2difGp
 5iIXmQW/pObNm6AkZ661nBIMtIoc6vwf8PaoF9J7rhYC8ancvIwIod0TGLKI7qlnHaATEGYb9Rz
 fm3hMsDj3wcRcMvUomlLfFW2MI0LQ6yCbgxC31Oq1vdLcXVAGYK+iiGvPkw/N1S54PBxxcLmk5V
 Ti3B1wiN7ZEMtzl5ASlAMfkqldOXlH0l/2IsFtx5Ff+HchxLCBSkHZsITbmEuIjFR0GvVlqhSbf
 6nK3oWV1RDyZsFWgXsg==
X-Proofpoint-GUID: 6n2tHniIHwvPzlfBcebrUOeBtllEThyf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX63cM1RB8O/gm
 c13Anr0YCweeDiahBsxp5LMKxMAGCvS7De94IZPaem0XCTn9S4J15TDAec4RhdCZjAL7artdG+o
 VxnN4x9hhJCgMprDZQQ6Ha4oRfm6OFI=
X-Proofpoint-ORIG-GUID: 6n2tHniIHwvPzlfBcebrUOeBtllEThyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230059

On Fri, Nov 13, 2026 at 9:42=E2=80=AFAM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> Fixes for a Rockchip power domain controller probe that fails or defers,
> for example on a domain clock that is not available yet. They apply on
> top of 1/2 of Yao Zi's series [1], which has to go in first; patch 2
> replaces 2/2 of [1]. On the pmdomain next branch, 1/2 of [1] conflicts
> with "cycle an optional power-domain reset on power-on" in one line.

This sounds messy.

I tried to apply patch1 on my fixes branch which failed. Please
re-base this and send a new version.

For changes that are targeted for fixes, please send them separately
from the other improvements.

Kind regards
Uffe

>
> Tested with v1 on an Orange Pi 5 (RK3588S), v7.3 based kernel, with a
> test device tree that makes the PD_FEC clock appear late: no freed
> domain left on gpd_list, no -517 errors, and the controller binds later
> with all 26 domains. The v2/v3 changes are build-tested only.
>
> [1] https://lore.kernel.org/r/20261105001257.1368266-1-me@ziyao.cc
>
> Developed with Claude (Anthropic), which wrote the code and the commit
> messages. I reviewed every change.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Changes in v3:
> - Split 2/2 into the fix (2/3: deferral, pm_qos error code, callers'
>   messages) and a clean-up of the other messages without Fixes tags
>   (3/3) (Yao Zi)
> - Shorter commit messages and comments (Heiko Stuebner)
> - No code change from v2 apart from the comments in 1/3
> - Link to v2: https://patch.msgid.link/20261112-pmdomain-rockchip-v2-0-5c=
d942a23df7@gmail.com
>
> Changes in v2:
> - Dropped "pmdomain: rockchip: put only the clocks that were got on
>   error" for 1/2 of [1], which fixes the same bug
> - 2/2: drop the callers' messages and use dev_err_probe() where the
>   errors happen (Sebastian Reichel)
> - 2/2: a pm_qos syscon error keeps its own code
> - Link to v1: https://patch.msgid.link/20261110-pmdomain-rockchip-v1-0-6b=
9fa6ebaa86@gmail.com
>
> ---
> Arun Iyengar (3):
>       pmdomain: rockchip: remove subdomain links before the domains on er=
ror
>       pmdomain: rockchip: don't report probe deferral as an error
>       pmdomain: rockchip: use dev_err_probe() for the other probe errors
>
>  drivers/pmdomain/rockchip/pm-domains.c | 131 +++++++++++++++++++--------=
------
>  1 file changed, 76 insertions(+), 55 deletions(-)
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261110-pmdomain-rockchip-3497a2e7fdf5
> prerequisite-patch-id: c2f0c5eb6651baa744f66342db63485a6685fb71
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>
