Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507678;
	b=fqrXX0E5eW5cTb+8MWc5ifuJv6Xc+JhAKnL42I+D8nqTDzLArStSUPF8dj4K7wr0xEcA
	 Xfa8frsA7MXkBVeONTipLQpFcMkWKr+P4MC7wJkQDzI34iOmY48Beh8tBiFFKrVA+NDqh
	 0kZk8TThUMy42NJmhoXep5RsH5szLt2YQE4544VGIrXHaUqUahEO2cAvdcTppl/URulTK
	 STWoibMPIdPo4OWahZPtlcZYQTdYUfvY9joa58V4QpEJMG3BxC5Lg6euTbGOfqh3GsnNS
	 dl8UvB7mw9sQAKWjWyDkck9CL5nrGn+uiW8BhePh/H/FxZGTNRtc9sOow4KR2BKHtdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
	b=EFrXdLvId++4zEupcw7IyO03W7oMUK3kQafXShu/ZkyxP1hpNiirkkcQV4idX5ppFxSG
	 Lx+KTbb1ItxZMyZ+wZmg4ZW1dMNvow5ARLbrmQbbqIjSDHS6dK1brtV1zHPVzwbKn3u4j
	 v/McqIYJzGDJa5MSoO3CZI9Y9A6+U0o+cnC43qFt9ANWSME5/y9pVTpw5CduCYV0AzYUA
	 vSA5E+ZE0+UAdHVF2Ikr0dC4bDF2JlvEolOD+mg1WYWns4PhtD10PQQ1Dh1DfyE36okNl
	 Wum12qW/HX0O+0vfFRLVYmwcjE/qLzJzwnMU65HZwOflfR9ujtc33Uq+gJK0hvZ7FKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLMGCQ7q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TahY9ZXD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85217606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85217606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HLMGCQ7q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TahY9ZXD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k6rM901973
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=; b=HLMGCQ7qLSGC+CT7
	y3fCqbZTy3Hy7+rV0pTyyNja6XcXe5eljYzos8gItlAtsNnoRS6OBIiOhV1L75DQ
	EQa8KCz+nH1w7JNCqB7VVo71xpgqMX7Ru7Kvab7xDVWGdqdikObqIM/WPgb6nXjk
	QHXunjwoEzz4FtrahC20fEFUGLX+b39e17WnAqTCm2/36DwCiUuDgWZn88rirlyh
	Ym8fCz24R/4E7PqsprfTDpY7VZ+Ar1MN3Zc1lbGJMCIa1pcVPr/vbN+t0bIxjuhK
	Feh/6NvPkhwPgD3pRm/FIzjcsqwYqMcsNFSYbTWh5w8L9YSu2wL/XJPKeAEhEuSN
	oxdSpQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6st4wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:07:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso1543678a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507677; x=1796112477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
        b=TahY9ZXDLYi8ptClYdysF51135EDa+hz+KYLpXODZx1x6X7z75AWzy4Gfg5mMxLWrf
         M49QHQ5yvSE+Mx7IZZktzZTeCqBJd41izDPx3gtwJ4oG/SOqyk9git17UbqmsKM1DCG8
         xG0B8N7EKorhP3F9xD3psMCDq5A5DuI3QJzTLvf01QNY9+4rf+dj5j1GvI+d+xmVcfEx
         TTavpVslLvD/gEa7pb88MEc2farTDHt7Rm9K1KIA+k785r3qf4+8+YS6XnBJDclVTHl4
         1VoNd1vDTD497jM9Ox7zjyxuYBzlCN4eIlXcpr7C4IBn3khP5ndirxDSVcihsusrvJuv
         jcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507677; x=1796112477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84yhX3202Hm26D3ZONtukb3c97ZAJn5NF6Z/NQzpluo=;
        b=U6dozTRG5Iina9Wgnef63fZqQrQ+9HNMFPDcPPo89KSbiHEPwrZWyomor0cZxNcunx
         HpN0FwJQr9c2ZojLFELgee01w7YwM7wVgz00u6go0xozbbAqNRWvQM5sg3tMFGLTBQm5
         LSjM09xhyEJSeIuuy31nxY2vnibNJTksQkgQ66zlYbSERw634RamVhSzmswWDZvMByPv
         GgzKmzlStfF7E6eVVvWPNn/OthWFyxiBKVo2NSEUQYjplcK64xvSKipATql6tAZXoIHe
         wNvGCujjtBSc8s6dXYiQfNMdLop4BFu7dX4Q5BIYSdkQwzYFK4kk6iFrX9r34K3PYkMe
         rfFA==
X-Forwarded-Encrypted: i=1; AL+hErFj8MZdVIzzCrDqA+dDYm1LHyjyVASMNNKMSbiPJSLa6gJAmQ3bCsOGrlcw8vc/zctZ1nCGzflMKbp2pqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zTmtTvEfq15VhC2F0yaPbMBRI9N0PTtP6EpxRWDXXRAst+CLc
	RPybWCuPukrCJpuzRgN2Z3ptOO0hTv5i6Nt97/iNr7l16FdnUCsOHq8NuoEn45uBLssQyfWhQFx
	PieZ+FE8VCf5j6FpvI2Dx5bAaZJnlh1VJuI29+jQ+VynNY9OeV0P+GhyJnEEnvVweOvY=
X-Gm-Gg: AZFdTZfdoM5mbg+z4U3oDVFBIVgoJop6L6MbcNvZrtYVN7Mz0YFWCo8yI5tG12RDXT0
	hG1vyXByNFO4byf0HJk83tofdNK3ofreNvMIfnqryqfhrfViqQKyzkgUJ2rU5sQORUbUhI5Ggcn
	m6bSZY6uekc7MIvMwr5+y6eorINBpLUTC1miq1vFHIaG+azOG8F1APnSCVId+uGNWiYfOgU664i
	kmGih3T9h+IYiG9mpp74iqSnbXCj+LIcFyApZmUGcogb3YR5PtzWS6ZMdbd/Ye37aNt7+jjtuR9
	8emN+QvMSMWhLYRVAPS1iwjVQzfippVwFO4Ob4wvFi7o1727i+TVnMW4XIlupVM8gVRYXl8AqQl
	Hy5MnnJOASb8VjNzNtMnUIaF64HwfVtfcY2/DbtYbWPdtkptvhZTKwvTHINe+pAfi+dP8pyic+c
	nvNg==
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr13197129a91.5.1795507677036;
        Tue, 24 Nov 2026 00:07:57 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr13197107a91.5.1795507676577;
        Tue, 24 Nov 2026 00:07:56 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm6563865a12.19.2026.11.24.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:07:55 -0800 (PST)
Message-ID: <d4e405ee-0e3b-453d-93df-dc216bdf6852@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:37:49 +0530
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
Subject: Re: [PATCH v5 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
 <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
 <179460940931.590303.9395310796576570677.b4-review@b4>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <179460940931.590303.9395310796576570677.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vqyPh9JtuViWdDWauesZE_DZ4aXg4_N6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXzcMLS5P4oE1m
 yLsmnqHfVM/gaPPruYBVYmcHdGeJUUq4qGBvcHXg+dsquCmowv7kLUJQg6FrB4FtR1+Tqhy3bmQ
 zSAJhCeANXFrqhdU51eWxSHnCnSfuIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX8hebrONmhfMj
 k/fkkHVwGVnOWyXEcNO7IpcJozFeP02UWi0zBdrtkSNmTQivb80cNaKQsx4jI+nO+FIb7fxe8Jp
 yaMyg5tDs4V2kYycs7yztSnt3fTxwyE81CXVtpQkQJrBbEe6uaDDKm2fDl+pJbpRwqC0ktciYPI
 M5TlPOiUAy2ZGvRMOQD3QDwYiPsX/6njxFlyn2WLugafSHeY9WC3eRZ021kaFe50hjmEHx+ai6K
 9lo+1XSkM38SmWh4OzuTiD8MlRy+0o47OP+Ma+AAMv4A5qwiKHN9QxQRZKdTr4wU4txY48ze+HU
 b9PSks+n8L/P1WMnHEUHX9FUMcWyiUcs4n/UgrzNc9yBRu1p9ziGsTHliSMZJuyWZTRlueKeeEX
 Uu5QhQTbaT/9O3fJjvA/pHOCEO2iowYeadl09xJgYAwjhIAt0y07SsmZdEQ8zCjnkw4YzqeoDtf
 OqyiCW/7lmHFqHEkLGw==
X-Proofpoint-ORIG-GUID: vqyPh9JtuViWdDWauesZE_DZ4aXg4_N6
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b0545dd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2fnjfD3pYKcczP1kFF8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240032

Hi Mark,

On 11/14/2026 4:06 AM, Mark Brown wrote:
>> Some consumers rapidly toggle a regulator off and back on, e.g. a
>> driver that disables its supply on -EPROBE_DEFER and re-enables it on
>> the next probe attempt. Sending the disable to RPMh immediately causes
>> needless power cycling of the rail.
> 
> Looking at the code here this doesn't really seem at all driver specific
> - we could implement this in the core around any disable and enable
> operation.  Is there anything that really ties this to the driver code,
> or could it be factored out and available to everything?
> 

I think you're right, looking at all the comments now, it makes more sense
to implement this in the core than in the driver alone and there is nothing
tying it to our RPMh regulator driver specifically. I'll make the
changes to implement this feature in the core in the next patch series.

Thanks,
Jishnu

> There's also a bunch of stuff from Sashiko a lot of which looks valid
> but I didn't check it carefully.
> 
>> + * @lock:			Serializes disable() against the teardown
>> + *				action, since both make a read-then-act decision
>> + *				on @debounce_delay that must be atomic to avoid
>> + *				queuing @delayed_off_work after teardown has
>> + *				swept it.  enable() needs no lock: its only
>> + *				shared-state access is cancel_delayed_work_sync(),
>> + *				which already serializes against
>> + *				@delayed_off_work.  @enabled and @rdev are also
