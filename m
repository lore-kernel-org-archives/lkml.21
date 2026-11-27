Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811212;
	b=wf9GvW9uc23GTsN1ajb3OKs5xj9dSns8Z0t2GZJZv7k9iDGd4RZhxVj5sCuWsEGR0Y6K
	 NdmzY+0/csDb9q87KMUHc7BVBM4wNtVAHENcIyWbUuGWOP1EGjK6MUN53lC+BP0/Q8UeX
	 gX0PmaRcd/DWA7zvlkXT/qym+pSPQmmTWVpMARMqGB6u/c9isAmm3YfX4ooACnwwkNDO2
	 QrfOVWRp0Oxz4Q4lIzZjQfPLVGu4HzTxHa/jNkjoIe8vREnXm/UEc7t39J4N0TA8OscZP
	 VkVhYeTBFTr6NxIormQzZG2w/EU4f5b42cuoxh/GOTkrQJj54iICypG/u2dtxm5TcwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U+MQls5F39eaWPhjl5MOMa9YQrhfhFVoRGXfaTrSITQ=;
	b=TsDhfxIvvWmP3qr1vpKQALmqdFTLAOlhH6nymB1zM1QewlapyGH8bCAu1w267Kj9eqBL
	 fDC5uW2gvj7tL8UUr+FnYpvuBDTaFsQl5hVVc+jSjs5gcx3QWT6VlDADTmfAR5tux5y93
	 RcswJKc177e+GlIb4gp1Dpw23uT+n1PQiJJcEGI5jT7RamKevuORtg9wGraWgKl2XAROD
	 gkIfjbct0hmP4VF46IZ6wvmLSgnAIrnBnipvB+PX8lf9FS+AUHamsJV1/3d7j/yQfBV8P
	 iiOac4iXnee9DHURATFZ6/J7oqEgT38Kh1OVoWs9I/hwtWBItlb2cMk/Qy0nlwrHcrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQF1KC4P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N9PmG/wg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQF1KC4P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9PmG/wg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJSAiA1382741
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+MQls5F39eaWPhjl5MOMa9Y
	QrhfhFVoRGXfaTrSITQ=; b=GQF1KC4PbWynR9CJFchk9/7bYAyxHQue4mwXHVsF
	vRzaJlreZErl4vt0XczOpaRgow+JUL/76U8iCfJp5YetHXnfJQZvOEWB0D0CVJbU
	1/4d12SPitQLg1XhKvSCyxKVqSlXDfKJdVctW0WmmcKuG0KA/JTXWxbhzZypc4fU
	8sjN6JHCqHYvKqoj1RDou0WzTHtFOCh6wIdri2ZeCivWu6G7rKDuu5+U7oeoua3v
	QP9q5v3OG/r9r2OcTDqkfgolF/rXtrINenLV/7utOVDWBYyBBdRKYhhrimvkP0W6
	Xc9+RxLIKGsxJfj/amHeAooG04zXWMxunBIDuENFNOUj2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s8409-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:26:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495a1f5e47so1253695385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811210; x=1796416010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+MQls5F39eaWPhjl5MOMa9YQrhfhFVoRGXfaTrSITQ=;
        b=N9PmG/wg9Dierrk474jvYJCorYV9x7dQl+5BNO/bzXJ3tiU6t08ibET7rGQE49+9l+
         w54rA5a6POcILHzuDA83Y2NfW2rgyHAa0jbugRhjciJ8sBHLJ6TkMSJ2okSffXhMmyp2
         jVjssoy8fCijw9B3Vyug1AXCjjz8v0bR5Wiv4Erku89bgIQLAsHKeq/xv9VO90scmXjz
         k/vlzRVk58sEv7F5VnM+9DJXOalywbB8lF3xflPZ4ebrnvkzQ/OLTI4cZW3Gcv8D3rwI
         dSu7ghavTEj9mRYCe9cJDmuDIV3s+F2FpxKZkF8RzdSY2XbGYss91puIWDE7peyYwQFc
         E8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811210; x=1796416010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+MQls5F39eaWPhjl5MOMa9YQrhfhFVoRGXfaTrSITQ=;
        b=d9YwsFesulaECnM+aJxXinuZM0ckrGoxzG/2vPqgvc5hQLoLZ61t/JZgi3yd1SgB2T
         /5AnVc4s+P1bHVpBatzVMSyCyZ5J5I9TF8MLQ/CXJCX6AJfn/TV68z6CqGlj0cua3zId
         aGVchAdmIZyMO7Ib52Ai7wM50l4/EkOSCW0afxdF6xGKaxuf1kozAwBL0/zMJGu28yUM
         jIn+E35I2lbU1ECofbwUlVpmT3FU9Ads5dmvuVwBGyaloeEFBWbS+4PScQhZnMG9Vwsy
         K2p/7byp6K8K6WeEeK93Ol8tLdUdPklqYLpw4vETvPdnPYCuM/J1x73aQ89TwLBpHpzM
         TfFw==
X-Forwarded-Encrypted: i=1; AL+hErFjBNf4XoJ3OcpvKqql1zgkjx2HhvoH8ohkRsXVJm/sOkJEGKiifc3ceZXpN4KSlI2IKihBT/5YHqlzM7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+OzefY8vBU6AIaJszU+J66T1gWUIwJysv3pynpPIVdYzq4qnI
	LmIKYnblv7pK8RJi+9ds7ekunWrJpwB/9oaCTfsCDbX2FGLr7M8npfMOKxWiRk/q5/uo4mpcDLZ
	p0yNDrblU0s8m/uH1WIRb02mAPDi9RRdaewR3WUh/PndIQ/igrY3egqn4MropvFbQ2w4g7atYES
	HZzi/Q
X-Gm-Gg: AZFdTZfw7+cp1VTifoTMzRMihIY2H4BZzGoVNpMiHYBqcnZA7r5dZ/EPUrS0MdMk9aU
	6m8x02CcD9p2909URHiHfd7OXjVPmaTRpfHsVKt/MuLptCeCqYGUWQlwj49VwQjygD6M86wyVZ+
	E1lDtjyMdV2YKQhp1iBTHLa5WVcf77uixEdgUM/U6pJ6gODgWg2ivctgv9Hw/cC3KrzbgUgAnEC
	bDxHx3J4RNl68E9TnCTo//6kUJ6FsOuqaYIhtN/OOIPzm1IspNTmc1Azr4c5YNpWwLqN4u9IMut
	JoWygxYkDoMoJUqzLvfsz4dIAs2dgwcSK5D1RNbq4Q4NB8N7pXlTsfi6BaGdJuR23WQhFysP/Eu
	j986F2lx/hCJ9vzzmIzsXRDy9wy7OR2aRbor+b79Nez1ZXF8Unpyad3CHCrdAVTbmmMwyAiHVBw
	nt29fo5wvMDnQKgR5l5qi2kKO0w68lwLKltQML7qHWnvP7j01saS1DpEsxRLzj6A==
X-Received: by 2002:a05:620a:8386:b0:945:d22a:e82 with SMTP id af79cd13be357-949ba96e395mr4809348985a.27.1795811210465;
        Fri, 27 Nov 2026 12:26:50 -0800 (PST)
X-Received: by 2002:a05:620a:8386:b0:945:d22a:e82 with SMTP id af79cd13be357-949ba96e395mr4809343285a.27.1795811209895;
        Fri, 27 Nov 2026 12:26:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e00dsm69683951fa.3.2026.11.27.12.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:26:48 -0800 (PST)
Date: Fri, 27 Nov 2026 22:26:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, liujianfeng1994@gmail.com
Subject: Re: [PATCH v3] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the
 first PHY enable
Message-ID: <oj34ljpmxdycfa6igp7bw7ruk6fuukyxmpnneir66eagrm7itl@czqpnm3r66d4>
References: <20261126052049.1544229-1-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261126052049.1544229-1-xiaqinghuan@mail.ustc.edu.cn>
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e78b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JdZ7eC64QEHxXyYvkNAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 8K9DWvByfhWoC9vW9sDoDynlCtf2Iksp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX7+MqTmH91bCk
 Z1ai6HZxDV+5WcPA84ubBL8i/gbcv0PsQxq4T8Jo2wwoysdi1XM03w/KkEDHSaI7hWliGPH2lmL
 bp5ZVWIzbjObgL2ews7mjB94pUlHkmrswMuumXkKBedTfR8cSB+UWkhSNJqIpo2DwsfgMvmLD2c
 Bo4X2BT3UrfhociMK+uGmtJJDbj+fiIEjgCIjWpTcJDxGOdxawBAoa0kFDRv2C1TEtN8ggHny0/
 5fY+kOcjwI8Qle0n+bpiZ4lTHCM6nnpCglrjMb1gStAySQ9B39IUuAw/9yID4yEAQZeZa426sjv
 sw7UtmjwHbZrTuF/CL3KVRMpSl/TsPNEAgYYxBBi7ZRSl6JMKlTZjKVv81KGRg4Y/wzpPfEq/s/
 jyyvlvdB2KhQM1KPINMh5YcT+iUDEVJANX3hnYlqLhENLWT/JwRdwCBt62kB8zW5TpL2CaLKkuG
 WH0JT6ju8YTboB6ksAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX0VA2uIOvZEgM
 ZSKBUoDxi3S/1YJuKHNnu9n+DcRSwdHAW3FyStOjBLZdVhZeUoXKapK/5hXyEP/lliYHveciyn0
 I90wtQ3WSC0KiGTTnPYowKxys5N6OK8=
X-Proofpoint-ORIG-GUID: 8K9DWvByfhWoC9vW9sDoDynlCtf2Iksp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Thu, Nov 26, 2026 at 01:20:49PM +0800, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> dsi_7nm_phy_enable() pre-seeds pll_enable_cnt to 1 while de-asserting
> DIGTOP_PWRDN_B and PLL_SHUTDOWNB, and dsi_pll_enable_pll_bias() returns
> early whenever the counter is already non-zero.  On the first PHY
> bring-up the bias helper therefore never reaches its
> PLL_SYSTEM_MUXES = 0xc0 write, and nothing else programs that register
> before the panel is powered up: PLL_SYSTEM_MUXES keeps 0x0, the locked
> PLL outputs are not routed to the lanes, and a panel wired for bonded
> DSI comes up with the backlight on and no image.
> 
> The combination is old.  commit cb55f39bf7b1 ("drm/msm/dsi/phy: Fix
> reading zero as PLL rates when unprepared") introduced both the counter
> and the pre-seed.  commit 93c97bc8d85d ("drm/msm: dsi: fix PLL init in
> bonded mode") briefly dropped the pre-seed, which made the write
> reachable again.  Its revert,
> 
> commit 44784327815b ("Revert "drm/msm: dsi: fix PLL init in bonded mode"")
> 
> restored both sides, so on current master the muxes are once more never
> programmed during the first bring-up.
> 
> Program PLL_SYSTEM_MUXES in dsi_7nm_phy_enable() next to the CTRL_0
> write that powers the PHY up, while the same lock is held.  This only
> adds a register write to a path that already programs CTRL_0: no
> existing write moves, and the counter, the locking and the order of the
> rest of the PHY programming are untouched, so the byte-clock regression
> that led to the revert cannot come back through this path.  The bias
> helper keeps its own write for the paths that raise the counter from
> zero.
> 
> Measured on a Lenovo Y700 Gen4 tablet (SM8750P, bonded dual-DSI CSOT
> PP8807HB1-1 panel, "novatek,nt36536"): without this change
> PLL_SYSTEM_MUXES reads 0x0 at panel bring-up and the panel stays dark;
> with it the register reads back 0xc0, the panel initialises and the DSI
> host starts receiving interrupts (41 in /proc/interrupts, 0 before).
> 
> Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---

Cc: <stable@vger.kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
