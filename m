Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515802;
	b=2tX4fVr98ka63cGmOn92O3ost94sJxTLH9SFPDFktKvTOcJ7DtEmAtHeSXF6Tq0S0Ejp
	 bveokgQ95dlSw/l/w9jUMT6NAHVmD9Y06TBN6Zq6HyhCUIt3sQNP2+LRjRRhl9YfKONhh
	 WfGuS1eLgM+2emrZJ2avMDbxzKgxsEdS7lL9z+diyj3oX4gBcp8tPEar0AlFGkVYH53s7
	 wxbnesIwzdk6kyrYFmAz1YAMGPwNhtELbp4w8SrGggMkpCdlJY1tUbTo6EKXn3fedG4PA
	 9vMPxvYlnpbEyAjjsbp/T//lhlDkS6Sbl1pjYJSB5L1U3e3RTGiZgvg3GlBcPhT9Cwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
	b=NXxNIMztaj38+7R4kKOAtHqENvcboPBZNE3cR5j7d4coFgkPnfuqC1TJOtaTecUYjAW+
	 FOjqXAG04qAWpawLx55aGz8Rx58pYNwLl30C45d2ly2cOOpzW0rYO4WEXBD+e3qtwAIpH
	 MHDnywa6+iBdZPyVdU2z2t5va7fkLBWHy8tqLceQjyMvDCXZSRjryZRrTDHaq6LPwi23O
	 4fpuwjAyuho5wBpOryYbcdpaOnVdaIUhAq6lfZVdPpk2H36cDPDfIstoBKqMR/LmMlDWT
	 1dA9l0eaVKXvHRhAUMQnPjunGG0o5/qMij/DCpll/6TocP9tbZXg8tP6lpTUYl+Ag5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63805606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63805606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mT4T4136535
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2fQNmv2MnA8jx1BzEazbxTqv
	aPaImMJgZb7CaQywWkU=; b=Ml7LMiltCJncDzctmpREyOgNpLM8VWutEjLBC8XG
	F96Pf7oPqmuQzPabf3TMtiBprar+icB9tJrAXWpfYMc3qYjiEliC4sh1JsDKA1pC
	nwRue456CG/s6wzPW+sAJmpZGcxWtSO52fDYe5onUPFmtgzYNZ5H2l2beKJ+0IDw
	on40G+N9TwWD5fF6koifpC3k/RqBbR9dOmK/6OU9qG0G5ObGPpvsQ40P6SWztwE1
	21l6Oz1IyFp8vVoKntDvlIdEeEnc1hrcwDxilQBUuBvR/kgTTqXo4Z/yQFVnNM/6
	xbcWuk/di6CNxO1dCHcyDPvJub7bj2zayKEdljt2PuLduw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rph5wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6164491eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515799; x=1796120599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=hTmsE5uNqK+4zartCrrHvMu5pELsf/34GfdpAUJJgVeUq6eMNjBuwNnYEmAiX8UyZK
         Zu5Aj2dZoIdbxrk9D535L8RKhHt3l/4pymBxxKS45OTnHLW8zvsrvpvwvYN0jYNyJhp/
         2twa3Ed136f5yB+/kIi4hvHU5I4MiMd/9aHsLkjBAyNhvrcJCNOmirZKGLQw7mAByZxu
         uUwCWraMUfjClP2Zd5oAs51yX3cle/JA871+i/eqMIbLodpW5NE+crpmYCOIfuDUB/u7
         CVurmdXh5k1ezz41Njkj4FAtUL9WMOKk6P/3kj7gwiBPadBRhp9Jd7Otp40L5sGOXPVw
         7ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515799; x=1796120599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=OXdxtU46xWgEIqB+TSOsrmHdB41t8AsNmnPAfOgibDDKnW7c15mVO06nXLBwQgdxHF
         yjBV9vkVhmBjxzXUVj6/xcnbdaQO1I3TZKfD36HFqMk2KyYbYWEKNFB3ViNjeXeRFDUk
         pnewxEfoAjGkM17p1el+fFR2pDzbjTI/cWyFVEUX2OCtau0SHuSgieSTc+Zp5pDOGNx8
         kjzJOWyIILyU/wgR1B5liL1Nl737n5LkolvbcAPfTAksT/Ku+LG0Va4yG4AUHBTxg/ze
         VYtdbOFpCLIxR165bLsbSqZJpSjiXzF6Fu+37ivTX0DzQovRtYtXDUCXaLIsOnVM2qMA
         htoQ==
X-Forwarded-Encrypted: i=1; AL+hErHGr937iqzFJDF5Bcm2027Jqh5ZmF8VZuaYS8jh12Qv5sHqjCzbUBN1w8J7bxKEEdtwAQLQQhMHtADJC3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yTThE4hfispn3Ok1DHkKfpyGOdu2gQkxcWmarwXj1lkYzgDSY
	Yli8zSXb/tfqQ3eZM7YKXb45jmBGVOjK3rFad2w1+gorvN4EJMAwH4cixhsuH8o9VJwPPJAxD3C
	FjyAYBx8SG2meDpbegAG8t4WPldPYq1lzOFEdwOoK96fgJaJFQgu3hCMkl7UGpRfgPaQ=
X-Gm-Gg: AZFdTZeI0beMbJy+MIei7S7oAU3T7jGzofjIjDhYrb9uvNbR9CeNKbfoDSsOzpRrEgq
	bhlur3pE4vNneH4HJ89BaL/B+Up76fPCdLNHuflNDpy83KB0HF/McABndCfodyW3Mz/Nac0vSGO
	upJnxTarqirNIyF3lypgKI/G3EQX0AcQaMtDBghRkzAkoKHTde9J7aGTGo+5bzAT13FHcFaqDc7
	MTg23kHd3YOxOB7olmPal9P70zbzWoNIPWQFiwDj2UwP1ZJNiEpUEO0mUHAA1rnmVF5nUyGUKqp
	ahUvdrJUPEs9aiBytKuYKDOEd1dQw/eefRgetiC360CgWTmTOF3zYKknWChrth/Z/4Kw44Zoo2v
	rIxpDDAzEeyocswjJTAyF12STiYDGeTalyOnxBnhLGeW+KdAZh1utUpOBCGLPh1HlYxsFnC1ufT
	4J
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919252eec.8.1795515799014;
        Tue, 24 Nov 2026 02:23:19 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919228eec.8.1795515798355;
        Tue, 24 Nov 2026 02:23:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm40252277eec.13.2026.11.24.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:23:17 -0800 (PST)
Date: Tue, 24 Nov 2026 15:53:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
Message-ID: <20261124102310.q2o4ajmvbqddizmj@hu-mojha-hyd.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX1P07lP7rsD+b
 Bpuz9qZVs1GjNkZ1+oXvJj26hbwGgoQB111yDrzBdHukyp+mCI2MJFpVTU7Y68ad6kfxAC0aaVT
 cQ2JwOXGk3n/5Bs+sFHghZOaI/3gS0Ii44EzwRIUeKYPKAQT4NAT7eBLtHRes+JHIpP6ELGFf+0
 u+3FkHAx6Uwlbf7jjGijlloQjpYlNUtglMizReZo/w2bjwqvIHzHIuwTAb0IEgcQZpDrx/yM4FA
 h+T5/nsBSxanLgOLJqyUOhlATMREgiSe7e8VAEl5t3eMEyUJVwLlqA1+b75L8/VKvQ3LGYshh1B
 0mO5kRhcLb+B4g6cBJrnrRkjbiWeCW1hUPgt/pz5EOSOLAM37BvTn2fqKaKCgwuMRd0Q+C+Ec9j
 /VF2rRh5m7Ly3UAYza7muUy37IOOpbxqcFKICSplIC6nLorA+rg5K5VaAVPnNiro+5IsvJjGNjV
 Bi6lnDD/t3X0/MOtB7g==
X-Proofpoint-GUID: h4cy9QgayyPXK_6IK3DUROoGpL3U5kWP
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056598 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mksB-i68-orwwBDzz5QA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX95ZgIC5RrDI4
 zW8RgJJZpZ/ZJM/OvLdAPSPpfHZKIlMQ//tU+IJPcvh4eHq9RloRHOcMmmd8OzX5AmMZLlsLAAj
 Ko7rhUcu5YxCUNbdzdz1/ZXsnGoyQNM=
X-Proofpoint-ORIG-GUID: h4cy9QgayyPXK_6IK3DUROoGpL3U5kWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Mon, Nov 23, 2026 at 05:42:56PM +0100, Igor Opaniuk wrote:
> enable_store() sets chip->enabled when the EUD is enabled but never
> clears it. After a disable the "enable" attribute keeps reading 1, and
> eud_remove() disables the EUD once more.
> 
> Clear it when disable_eud() succeeds.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
