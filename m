Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170132;
	b=OljtAEhxmvVSpulWwJ9viugEju8ZYpXcCYdS7RBfTQiZaGjdtdUuYDQMyOpTYXDHYQ+4
	 1eyAaLu5+5At41P0SlGy8gQ1W5p4LkgAuZhYvbQBQ+nBwRAlr/eeM1TBua1UxAg2pYvFV
	 8W2Bneehz/ygQEbmP+w9B1GW2HA/LbWUMqTARtFCM/GecRH9U6xCGOxqq3H5UOd8guMGk
	 5WWBCK5pGFrpn9fMqo6IjNTcKbEqydplxle4G/VNrynNtk+rsotZUavnZmex2Y/HgQ86K
	 W7Vl8d0aL1kZgiUQ50tIcxcngBQ5sIaabABthOifA7CrMS2/SYLRbUNNuZRwQApj4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
	b=Gu8cBHiULohioYxXX61CYltKZvkTFsjMYRgQqxQ3sTh2K8D1MkUN6gwFujVlvZD3Tslg
	 anSG+QCC3WRAMpzLOEXOEQcZqJ77YPSJLMiQNfswpN0RJHC4M82xZh0CiicN7A2QuZkcc
	 +52qnz1NRKGyTUTb0GN3gPuZr3mqFU1v9CdTexfaIIefNC7zBjFAK9mMOD9RfB3Wpn+By
	 eW386CoP08iE5Y3BVjzttXwH+B3PfV3sd1OqO8LkNK94SyZ7LWNumhgRYEgtmOm0QsTDr
	 Hk9HKZYwZfjIMf2A5pZGyH3PrYjn++sZuOoe+3niUvQyNCjJCI+1Po2shTUBm+pWRfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82D606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D82D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7exvw605993
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1MGMcXxwJZ7aC9YYQ26OH+G
	9qkkBjw1QsP0VNbDjno=; b=YEJ2QkekzsvzilqybtrIOF17/qu5tiMJz5gYXq2i
	HFShxDd8O8TMOBOkrs7njtl6bDfpWdwuKea9Q24JMTx9P8lJdjWKehmYDU+PNtik
	ztS4KTSOzgkKO5nylH2EMOUPcfTU8fyWF67Bk2oHWAss21DgNZ/1kF4AC7AwIUmD
	05HxTLs/r4sTBFOOgNwI8Nj8TDohDLI/1aA3EoAfdvWx0ODmOeLTH7m31aSEuRBf
	ihQal+uRFTomuyo+Tas9ZZ8zKZFG86yL3lk5tjOoglZkI8UFmG0BiTrIWRRX/4cg
	mqTjVlIDiyWg4hjDu/Vw4MluqBu3qEvAufJyjIZHNmDz1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs27r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d7544d113so16454521cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170131; x=1795774931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=eWOo9ers7osRg2E87cOLSOUzN9Mr7Qy4uMu5swGFJzBnqLl4QHUR2FGhMYNEDfRnAS
         VCCvW2Lhb7VD+bo9VxG84uoGq0Dp3SCQ1zI6dfxLshkb+n726dnJM4DqjkRv2hoDeO3A
         rozocKOY1Lwn16dyFg5l3obFE83VeTD1gN7+9Qq0ydqbeorBPO8BtT7xcwqPxcPbBGdI
         bOfEk8DspeUd9fyQB7UyHM2gAZjdHCNZtAp8ln83ustNec6D+h+EPly3c3BaCKEXeLM1
         3PmRPpAVxsDmQx2vQjIgXGBdH3ZE2THQD4ZUyVHKTJZ6gRCUchj9OIpBscglP12kZD5+
         KoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170131; x=1795774931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=xLySg8ax9qUf9K3jNxZx8s3trI6DK8fco1H7RNCD7n+vi9Jo7rlchRksSUKq7qPLbe
         FxBIIsjgrNpkM4Fb/+XvEJ50G1ya6B2qB3aDc5AiwViwcO8FdXvWONLv6iq2odChkZLz
         FAbnEjzqbEmQO4TZlAjTGMk9gbzgcUEmlRtSCLYxRNJAtae8XjDwM4QS0fnX9+J8ubTx
         iVcHuuA3DGgzVpjLMlqV9DdNonOQiEhi2ejIDsnM3rOhECWflkDdQ6qugJDisd28Ftbs
         QeZPxzpMl2KRVbRa7TpNXf52qLudGHTGN7l3By1Yf4Msp+P6witcqzjsi/ZGjE5NwGZ4
         OFaQ==
X-Forwarded-Encrypted: i=1; AL+hErHikuQrv/qS6LQKTUAm9HU2lNm/EdhalgGjJLCUof/Nn8T8Pot7mLJ6oLxatPVZCty/eDfX0RenDcjy1l0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+exsgwnvkOIYFa0w3mRwExpp53k9YCRu50pBufarxzRi4tA2UR
	qBt56PCd+kio0SO1CFW6aSzYxIj0aDLCKutYzqNsZpVmm/RIPYf2FrmwFBwz45CheDwP9WTHDCL
	2PMWd3ysR5vkOCaPCw/RpXtHF0i9rgbJSr4K9qnbY5V7jCu/Am64uFoV07C4U0UUY7d4=
X-Gm-Gg: AZFdTZfojo69aN3/jVx/i84pOWpJJ9okx3bieqsPhmddvgcqSQX+syqlYwEazaApGK/
	5vRsQfGIKUFCBSYqKRzvUlH4JbUomp4KiOHQXUuIwgTZPswOnnv9traPRuHZH1LTyPcHRmrYDsV
	U7B8mvWP+w52JmMMgSFn2RyhOhm/on1RP+ekD8STyPYTawzqbeiZcWIf4nVlC80KSEMLFwXiWyo
	H9Lw9UPuIEwcLjZFkF9xyGvLdTttIYQRzUubezViUOuKvYGsU28cp2J/2APOH7V7Lz86tfgOrBz
	8Sx2lq51p1KFYSwQZ7WRWaXkHiPDAqedGNyxL6Z3s81f6quLvxeXw8E6OFV0PxDcaSINod60EGK
	EAcOjC/QQ5oQGOMsD98CsoqYoi7S443nMff8Wt3FhOQj9PM2na+AQ8RVBizFNzs+Q
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563391cf.23.1795170130490;
        Fri, 20 Nov 2026 02:22:10 -0800 (PST)
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563001cf.23.1795170129811;
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm3906179f8f.46.2026.11.20.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:22:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
Message-ID: <gejgvl5guwsdfexjqnq7aafesxjn5tjo5xc6ireh6xxi3mkt4y@si3fqc4hj4cd>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX6JJ9JPAIQu/T
 NFO4rx9mFZeRT6ZcattxQNJfaQaLJEaN/xsuRQHqhx4WT0Z2PWY+SH0yica/0tJJkA9n/dgC9Oa
 Z2u0/Pl4rxA/5bk/+Kso3mARPYOBeH2Zd1EM/yThAUNl3wJ5qHCzyu8/3QamuTJ1NCJuDC1q6US
 vx40BqSg9vcR9X1f1oCnVg3G7dqMR47Cx/6VlJnDXVOa3SGndFegqKDPusdPOcIwK1krx2WCUMt
 fOXdf4WdqejKIDoM7e84Aw8tXf9XNvKp7mzY9wfporHg+qsp157i86VO5BWCUPazDsO6dZmjCv2
 qifU0TVG9OODak0FxB8aXGvhc00+bfyhGEkxS6x54fk3/FYvQm4sfedbaB1VknAC5kwr3AuxMj3
 /VFSjZXTvmll3nolCblkNtSJ/IycSms33zy31iKyLBn49P5+GrfxXhyK+2IRjTMp3y8+oQp21QV
 rL5wKG43QMh0inf1Cww==
X-Proofpoint-GUID: Dsf2YN3YNeqWgvUIgZEQUyNTCNzSWqiE
X-Proofpoint-ORIG-GUID: Dsf2YN3YNeqWgvUIgZEQUyNTCNzSWqiE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX1hg50Uhsf8oP
 FgEcGfn98WoFuAXoU6zLYTBSMibN1M8wogYPOSIIF32JZpoSehpQtDCm+INAIMsqBAPGBG/vd20
 pxyDah2qU925aKfNxb7EqpSysJ+tbFI=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b001f53 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=M5Hs6WqG2zr0kzIIc3sA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041

On 26-11-16 02:19:48, Luo Jie wrote:
> xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
> clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
> However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.
> 
> Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
> There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.
> 
> Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
