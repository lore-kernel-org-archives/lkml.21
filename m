Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788727;
	b=5kQB1kCgFcuS6dS4QsWMpGS8x85cqyWJLT8bNClSgi9cEIvEnSR7S05P+5mHserd8CAo
	 84Himj/wRE4Qgo2NnGoP2jxLZaiJ+MJG518sEQaqYvkMMCrzAxapb/qL3HvJqvNDMm/mJ
	 a25LFNhQbnZ3UEJy6mM7zYh1LsKhgtKn7kXpowQMUkpToAifBJ3jLwfk/QtGlfbWEdDzj
	 rq/PlQK3IkW5XAUgAhbyW6sKSam7PEg0sVl4hdecFmlRKWwG34qfGm51gHfy4rnqrXV7h
	 vimIKHBaJ2LnZyanQ4BMAZehXMLhLWbI/UuRCdiyi+90F4qzbB/CYc/oeW8V9eXiEJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
	b=lReKFnFeIz1SD4fEKGv+leZdOvu+7D5v6yC1JtcOPjEQ/D+0QfGjkmeOw1h4kl0TOo+k
	 rkT34xfLWqAjIuPcl0HVxO17ctUekhfMCyhW2XsyrhT2EvZU3csEckkAA2zR3nWY3DU0l
	 OGpXWaHU0U09V6EETrkOBAwiWOw8oGhsDv8y4nh8+w4LJEVqPsM8B9jIhXQMBXnBv7pbs
	 O0LQOOHvbB7Swr51Arhl9LuSiGqANxO4e1OavjbwknUUovlG6SIpDVwRZNUshD5jseDxp
	 6UiGH/gzsx+gL/+maFPgU/NsSl3oIp1dNNMMjHn1CvnJHALrzH+H9Mlpevhc6rzREJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FWKwwD/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA23606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWKwwD/j
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1P0K686109
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=; b=jJYtd2Efx/TMqsM/
	44YSUe2TAlE+lM0Wn/MRJadaQkVGJ+rCu1ZE53uNPIoH+BBmGkD9we6/3bkQGY02
	Ctdy4SgJnz12dXnszVZivl6NdAlRlGLdpbojCZesdncurHhDyjEBfQqG4N0bEXO6
	r8Cj3x9P3ACmzlxMGzYFMMQlamzutk7AQ27zHzOPv6PZXBi0Id5uXmA4FZxuCQ+k
	YSNxKU2MWhXBQsilKx1mMPkeWdcFtT6tF7YdTZlYD4kuFPeffD7nnHcGp4O5zbGE
	Zsjir5L2bvslUuQxwS43fBMfnBsSKQNJ9jE73wSa1NJts5wRLmmAAtOR160Exvii
	R655Pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bb7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso111151885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788725; x=1796393525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=FWKwwD/jJK969UN4Fo2CRCh1Q2YKYwoS7oF+Oa3OIt415/YNTQ3PvNwIaLGdqkyhwl
         UjowUc9iBOvfi18rRzxT/27aie2QSwZGLgJ17NuRwMdIzSJVu39XS2rql82Cu1a6GRh7
         WD8WNHsT1uYyc24DYYGZ2C4YVQu+9gkutY5VSaQgu16T/n5fGp3/Fry+L5xm0zMrfuaK
         IZ8aQNSWG63jQn8/9n42KXm++VzfbYeTGSWhdAoNXpqazGWxtMw67ofq/isTEROZBVNc
         ++1FTN6TRkdFVLhkR4UdEkjBXFzJGCirOlAkGIFeUqcJsNmz5YHB51RG/hCIXTKpvqVF
         eTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788725; x=1796393525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=egeKtVWYpHNlpGaEAvQic9cUQnYi9G9DOyfqYZUV8PEJ8/O6PMrZ0WxfGVl4HCeC8M
         ro8akemZiFsYrgOT/7BoE1fOy1pk7fNrocK1r8++9zItUjz+virAjxYu2+5b2CzfcNdN
         JQ/pQNSd3S+s3mdztwtDrsYpmuUOtxPK4V3d9CgwJpnTnjG8tljO5W4ZWMe2EJWtTBck
         h5w5d2OZRS7EsLzduN+ZQm3xOfqJF0s5ZsB05soCgm6BAV9F4L1eMNmBn30Saevj1D7J
         oBn2KzO5UirA7/U/hmiyoZ2L42mHwsUTUC0n/OWzM065ie5nD1HJ0FDVRhnHQZZu99FK
         RxGw==
X-Forwarded-Encrypted: i=1; AL+hErEAQdSrq6ysbbUWWERAlzXnWWQoMCJx+x/9p54RiWJZRwpr5ZwdyjFhk/yOl+iv2jNc7i0xldU1z/KrP4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n51FgHa/d5v9aATbMsxYTcJxnGkJWn4yLO9j045cFROq36pic
	PlrbHhYUS0+aj6vQi4xph4lvCnBUoVQdms8NLsQQZN2ykGR7YF5ReDfPONum+4aju1mCVfAGj2Y
	m1zMcbNkURo4hJLEs9NOG8vbU6lXn/C35WpFfVyMkBEg9n7umcLsuoIuhkq8aPnwfSOo=
X-Gm-Gg: AZFdTZeb8/FCoQ8sxATAmSAT6JTC70ARMCD20qayA0T80dWVS2jj3a2SnhImE0c7e5+
	bonbHmQikuMufCYvL9TYZF9CKDxhBMf9mgR3u9mnCGN+mXmieOXAp74CAmDD9i8xicQB1RdedGl
	5Vg68qJW1Bi28wB37+7o1oEMkfNvbt/SKpjopiEEJts7U5RXmsO89j+CNFMM1ZIFEu71JhZj5td
	L4+BAQoCatVvTMcx0JCi6rkRk6Bnx+gIEj7WzlcaPBbSyKX8nCFluLOIKLOJ6BXecQL8SZEhLAa
	/Wtngu1e6EJaGORxeYomSCzCy1SObgnJgmK3TMuev6EvJNuc/pqLnGhgsEw4YDn7nwAhM0curq2
	6XSgpNAg+L2psv8OxQNBD2P5NA5wg775OXldb/Y99qlONe1tr7izKpPtrpF7Rx6ucjccxwww=
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506626d6.2.1795788725023;
        Fri, 27 Nov 2026 06:12:05 -0800 (PST)
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506076d6.2.1795788724547;
        Fri, 27 Nov 2026 06:12:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80572914sm58914361fa.39.2026.11.27.06.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:12:03 -0800 (PST)
Message-ID: <03c360ec-fb3d-4bba-8c39-2dd476f87925@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:12:01 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GxB5GEjQriydW8WZnXjptexCPR2TZqt6
X-Proofpoint-ORIG-GUID: GxB5GEjQriydW8WZnXjptexCPR2TZqt6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX4t5zk9YNdLWb
 L378gyS6wnJBxbxYObjGDpCZ+BaEL2XtuwCEfYOMV5wZ5cM9WU4scamSXYqAmTn1vvUgQ/rs/Ch
 w+U0KEhEobUs42tKFm3ZBsMsrTX0L5s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX8wJSm8qUmMT8
 xGl7v8cbEN3Mlp3QpkwIMKxJWbss7JpKhPZ+BDFfLv1csWwpaUxf9To5fxDy/+J/+uixucg4f1c
 URpjqRTYwU2BMxCVRB13GW7/sWXnRZPrr1yyS2h1zyUrztJg7KRiWS9suW+393lV6TdgGgSpEtz
 B5tuRv+Nv9T7jjt+NI6D88H82WT2cjlg9Zq/+AxmXv96leuwPBMlhgB1dCMXsAhIrFv1Z0pGCq6
 n9Z6ETs+NE9svsG00b73jlonXX6G7vzEmirDQABMDmI2lHsxmbZuQQHleJfwuc7RVhkJAYzgBLr
 KOR49fPdi9PC++TFUPZfJsx1N5wfXqZBd0g+TMGHzcBlvtAR8jgGAC7s5spihSW0SZSdwfaCky9
 BMlWIAa+hJBGCeO7KON15KhpeLzZTxTa4+5eDy9pnP6dq/xoLUvpPcna1ZAcca5DFJuBv2kUZ8Y
 PKQ2Xh6ovkYv0RafMcQ==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b098fb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/16/26 10:24 PM, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
