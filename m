Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168271;
	b=ZKrrLgaA/iTpL780feOoHR95+bZditCmP9cdm0iPFw3ejByHy+OwEiflTaGGSnX+0dZ6
	 F+vHnupoXdCEkUuKsbqfUzvXs/oNtf2cjTkULM5ENo43V6lB3mZ3gTWObTuscDp8hcrBk
	 TnkK3Fx7zs4hi/7pLgcIT/mLCckZiEY0Kq3ik5VFYJoXtzaUh8sTLfm4OIn3IgUoSRJgy
	 ZNHB9FvFyAaLoi2p2sUF4oTHpqMMjtzPByEHAFM3RPTa5gse5xMTY83UoFzoxovJKP9XN
	 brkoIuV110G/HE5v/zqG9fsJh1IHeIypBozsxvNcJZDYL9F6+wqPXvDhHNE/lNW9lnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
	b=Haq73wzSqPJA7r4Vx+M8jVIuIKqZFmIR3vgaAiVVFR7MVay6n3U5FT4PCt72/BJf63TO
	 ohLdhYwehchVSiMOIiiuq1FqvmTgHFzSNjXjA6vlViEGWtff8D/x+UWKqD7jpUF92yU8u
	 LNHfdMthY6wRZzpPQ7opnUoHQTH8fAIceI4189id6Ii7sdJHLP99RiH7jxf++dKf6MsN9
	 hr+dgWgJfL1R1jR4lasjQzI+ZWYrZizIxKWDszGl9CBSm5ILQh9K5MDK9eVmLrBL2g1Tj
	 jg44b9gKinKkYnpnLC8UL/Su+IEhPDAn5gR4l2i3jFtn5XecojTwobRjqsUxyAGE0OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLQhuATv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dvk3/9w5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C795B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLQhuATv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dvk3/9w5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esEs2019478
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=; b=XLQhuATvbqxovLlT
	dL411IJrhlAJYPNrAhk0mgGnBLMSHr/hV8iTE1AqWbuQQdAoTrHyzrFCtxbrcwQf
	DY6xYi3BhFoT+o5+BDMztoA+oWyYqEiqXXKJOkkfL8JdScJdLUQ26+9xJvl8Whhi
	+D7eRf7/P+sYWAztIAEKOZku+V2bVaYkRqwj8ir6fh00+SejGPOWLEtKzmPxu6F0
	VQE4cGvqAWhoRoiSUKqmRHBbrIapkRDF1fJbBXVBvj64RreyBBgssxLA7mXllHZh
	SPzEv0qRcSOsjfTytxwHjef0zixTExVJc13XINk99ZZTm0kCe+Q2/0WeNOTQ6SiR
	Fa8FgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj95n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495af07676so116182185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168269; x=1795773069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
        b=Dvk3/9w5vlyQrW6bzgGEPRiL6LM4nsYAPPPR+Z/WIgF3SFtDs+uLIhxTQccYGVY25v
         u1caU8w+67Nvso0WQeuc6rv0YpaVF0EkV66vz05Ngj/cHljxL8vjJnmFGakcWIwopEgo
         fF9JpuC4y4tnO8XXt8zfFqzrB/ge47Su/1CfH03QByoswU69ITaCC1LZFe/jpHRqYJT6
         lPij0qEKEL8HwcjI2RNlqSiKuFfgdpPiuEApolXmVBI/Z4IR+nVt8SPjsrramVjBs4x0
         HvFhrvJlhN1lLJ8xEb+jl1YGJ58+/yD1XBlPmaKeeG3wx+wxLhtYFBOCDgWVOoWvnevQ
         5GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168269; x=1795773069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
        b=QCvm6XNKrtBmOnTNXael9qjT7Zm9vHqv5QBZJ1xJ2jyyfo2+Ko5c72FGFiMOhP8p/6
         wK+H6zjDcFqQvD7hRqb2Vutx8ALVKJVcKELo2jxebWMArZD2G5c8gTPTeS2FN9NrwZWX
         qvo5o177yCwwD+NWQqSwz2mzrJDto/4LiJylohCIzIbfKYlC1fmQrUcUEJJAn1cLHMNl
         as0PhrzO4LyvDFdAxbQ5aTGN47MonzhCBSSuhmxWiQvbAhO/iUBGBqS69VYZ19+kFJ2L
         Tdx1vIKGFrwydRTF2icVKIuJwNVP+5FWSl9wCSAsmnR8Db0wLD9RXFpEJDWcJ4vAEXKG
         xT0g==
X-Forwarded-Encrypted: i=1; AL+hErEQC8YPezb9P3ybq1EoVd44CMr87bumZAsov+3rC2thg3wCjIHOueBThbf1v6cSPIEWza102BGeS19Xl8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qdWWOv04Xbj+/NVbLYqv06sYbrczbH0IJk20TjwhFQTVg6VGp
	B+aXPFPVn9CPde8k8T5uLph01bHbgdeP9Nm4TZCEieoKj3+IUuAN10BaD3mR45JgcC91kGs8O14
	iN45fKqQeb9ys4A2G9gOP68i+xhEvKIBHhSw7aESs9wNOqbrvN59f7kJCUbYjVKU+vUg=
X-Gm-Gg: AYBFou3AI9Mf5ihqTzBCVdsk/Pa/ZOBPYJyH64gXNcAX8QA39BdoRRdYeCf4NPOTx4G
	N8cw4dbrbC+YUbTJYnzYZeZIoTPxCY59io4bAfxpMI06OFA/JUvp8+u5oiEYINBgf4ixttqo9bF
	/wgoeQwSxUfo1a22fWkgkqRdkz2sgQRBCvuVZduG91MyscBZ1h0BLcwTkR5/WF8nFnt/xDXIF02
	HP7nqkpSW6lLmdxSJYHI1F9FCQBI8bUkMMGW+A4IciJumJnuXqbuSIGTp4TgsDsVlh7Oeva37Qr
	QBFla+vRWzeum+xbsMvQ1XQUf0xPmMONwXVAZBbIEAxz/IYDwcknla4M8A5Mnx5ZSJr7jEKDtum
	EzynSXcfdTZUBL6QH7crYFDnvnT1y0zi0bszbR41cGOmHLtAWbZex1O/FoR4vG5aP
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr372403585a.56.1795168268954;
        Fri, 20 Nov 2026 01:51:08 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr372397685a.56.1795168268270;
        Fri, 20 Nov 2026 01:51:08 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4524417f8f.3.2026.11.20.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:51:07 -0800 (PST)
Date: Fri, 20 Nov 2026 11:51:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: nord: Add GPU cooling
Message-ID: <ajoxvv5enftdx6phawevgoky3hijrk7asx5g55u7cmcdjrlntx@syh2k5q27bwc>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b00180e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r-Xe3uw014UkFQyex58A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX5YTijM8U8PpE
 0e3ju54KNCyCyHQQ0uPkRCOW4cmmecYlB65EyWdZZIgoPRpX78962skjfoDDNew68zqWcVNxlxf
 zxbtc16GDRNqU7Fx1DtsNmmeILd5FZA=
X-Proofpoint-ORIG-GUID: QlLfegVRWoMYXzQ5WuxXWdgG66HGDsLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX4tKWeyZquNQu
 Nkvn+dkO93YAeyy5DEdBVFMJXg8Qlsir4iKW6S0wdzTZ6xjlaXsivU32aPfOUz2Y6rLFnq/Feiw
 PEV83FuenNF2c+gmEAACmuaeA1SuQbnaoDm47+8XJJv0xInh32y/irjsgz6Y/Dlt5fnNDmU7nvQ
 FrS8mJ8I2oCCp69cGhcXCBgRonVFTDpWrU1t8UAzGWp8eCfd7PXWY+M4Ehc8ENTlY9wadWqym/w
 FlsGE7uyHlsLLddVVauitXT4EbHQhkL3+QR9HFxudO3mErL65HQ5reWzqEj3IQChtkcZFOc3wdA
 ipOeamMAGd2qczzL/Ja+VSe3T03uoLUBAF2p5eY028uL5EbKptKJGU5KK8OjT6MCVTS7tTmzheb
 CzaVnFpTRH0IMRxUUwcGkk+1ls/6NFPWb0edJQ/QP77NYxJjRbZSp41/2QBcMU4U6QX9mGPa9DK
 cwA/RamJiNaZLbPbeiA==
X-Proofpoint-GUID: QlLfegVRWoMYXzQ5WuxXWdgG66HGDsLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-18 04:30:07, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures.
> 
> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
> reaches 105°C. Label the passive trip points of the GPU thermal zones,
> map them to the GPU as a cooling device, and add a passive polling
> delay so the thermal framework can monitor the zones while throttling.
> 
> The thermal zones and the GPU node are both described in nord.dtsi, so
> do it there. On the GearVM variant the GPU node stays disabled, no
> cooling device gets registered for it, and the maps are simply left
> unbound.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
