Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772953;
	b=T1yz2ZqsVAjTGDElx4KOrSNWGBm7e1SomDetamPDLZ3YTcMDqA8IhGji1GNKzVqLZOh0
	 NAUgP5MMh9fElOx4vvNdoRxRJWdun8qwhEwoSgju1XOrYJN3tN/N4G4BxZ+0VAXgD75xl
	 BxxgQDHTgEn/wUOXGsUJeVRsSLRRJg7lKaJX/Rlkq0+leg4rHxNeu6Fk5BzS0cou3mz4n
	 u5uLIv5C3hVg6LNlcF7wmLYUuAlH7iZ0KfkyMlGd73Ig6txsdK3IfA1KudjETsPIvpaO9
	 rwFv+KEo1aRSWdQdtpUfrbetcrRAPWPbRUtwET7Ttr1XZ3O+he94bV7SBuDHfF2d79w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
	b=sjZccVmoR6Z/qLcZqfkNEjQUKqiy+G8Xx3F2qJyTAzNB+gcECEAVAPgoIGhC3w3Iit85
	 R+6XDwZVau/jdo76MmeuKAFwoWr3SrHzFGWETApanVwpABk//6LMTmPdQ/AXBWaKuIteC
	 fSYSikQuVw10/jkXY14/GFCbnuzz48L0gNTQUGKo4YGroNTD1O7XNcrP/0jdQ2EuI1qLB
	 nH/gdBeAUzq8HR463tGwmqNLBYJkb3nHQf530yM3ELmp/bmNA/DpHJK+NkSdROSUkRRx4
	 XI0kMDKvCBjuIqu+YfcfO+2FahWFaAbb/PuCjnayi/ussQBX04etuJRvIFlCVZFArxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pS8KIHNO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRgFUk+9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07D606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD07D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pS8KIHNO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRgFUk+9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcoL1564744
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=; b=pS8KIHNOrymvcij6
	7BxHEPv474G6idlFeiJguPzbiWdeWevglg2akgyFgSOgkSnrFU2DV5/9A/9MeyOO
	8aANDwJPHQFxW8NxZYPqT3wxI5JhlUkkln68A4UKvjFRN0LFg1e7nXROcppvpJUi
	+y2/sf1tJM1ZXK6LXlyzSJvb4l7nMF+SJWxidG462XCebgWUMdUiNigPTjJuPs+F
	DYVV/fLqT3OVH6PMuZVSq02o+IXjSsDvWpUN0LS/MdV4c6+fgtUmhrWUOmZK+rP1
	MAOFzZgdvd4KagLPFPuq6KNLHYOfNkUDJBSuD+dbEmvZlyP7OWo3StiqX5ta3YtU
	Xphqnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garttv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:49:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso5328535a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772951; x=1796377751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
        b=aRgFUk+9DcxBGm1e/EGhIsWAL4kKztfNfweKvFtzQRff14CcbzInEeD9eQqr5X+MD4
         YyiS+y5tduCEr48hd91sBLfIwlkSmdMU+TcNQ0XiIhpSJd8LOoYdjLFF8R2g13AlANpk
         Vfk3ruWdMCs0V1E/3ySM104sSR52NpJtRGlmHdwKqQJ42x3IF0jkH80FUpKG9v064nGc
         3XgLHpdM42IJ65J8/fXlKApGxX/YjJSBSygP8Ufz/XRySHn3JbO0V3yi8IMBmnp/Dyn9
         undEiR0Aoj/3KGEX4Br3XMPHWx7vQljEkhA6JSN8D+hygO+KjecfjhKjNYImtC8pY5jJ
         Sfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772951; x=1796377751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlqWYb0itOLHGsCT6XgTueNQgxMfN9z0WOmdqIPsIE=;
        b=r/Lg5mL21R7vL0hSvdSkWgD2d6aWNLBJAXqLUwtwhdexnlou30rQUvyrREkTFHaJB8
         LQkwkiRTjBW1besrQ624n1ILOT71QLrvyOFEhnnwBE2EFnso9jmQxsBAfFNEhWspGmzW
         ojJlpv12n3IjS9cqiFGF9RxQ3mdSE6REsDlfe80gJuNJIv5NeuvDQ0N35VluRqV67qfu
         pYz0a6ev6Q9j07liTrloj/2mne46O07NaTN+p3Aq0h8y0vkUSAJsXgLkxotNWsokTi1/
         uIMb8sGulf7GnDfPGUjKpIl/jpjkEgnbryh7vnJoK2Z8tY/JE2PSjJl2GRU6pCfDyN5X
         73iA==
X-Forwarded-Encrypted: i=1; AL+hErFJ5yQX5D77raW7YVB87wOIn4RudGF3dstc6nfyZ8DyNTVCoXAytXD56OR+1eZPEU73afotvLh4AM0K35E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AW0Md4xF2YMXobrtGVYDj+WOvZ80QlP8WZGNUauiaZeKU2GZs
	YWzBl9ZKldhWYe/zQTMjl+RHoH7YiTZkOtWK4Obt3XpZ1F33Z/CdcheEq8PeIqXpFJldY+kiNDv
	t8q/foYyOJAHLbkvxI8vdKbhPujTEF9IiUkepm7Dg0Qj+921mj3cadV7gG5O8tCJDqw4=
X-Gm-Gg: AZFdTZcaudaexp2qJ7luy6AXDkSzERW0xGv5zVJrvN09y+XQ2rvyNmp3i6GUKixskK1
	PfRNBxHGuUaOeXxyRWZozEqLxYJ75GTXo4v0ONHBe/2Ka4F0hBJiSV8F2L00kr+oI7t5dyJ0UxL
	5jyCNIZHv4v7OBWJjRhGKL5yryEWXJlHB5T55WPbTH9kb6CILRGc/QSSSuKgpzSPgaLRAfKsdKV
	flaCJ+kLrMCpUdbNvtGUmGjPvUSuVXRlZEDlfhKWhxGH2g1JnkCL/pESv64m+4HlxKMWjQsSZEx
	/tB82TlVhiVU42+mtuSDnd0g72D/W/+0C7K1UV7CJD85g2gV6TK7/5kuGIUiOPUtFIpygDHdNTi
	WHDajQkYKMZ0etzB9czrFa8GYndJ53zm3DMeu3HVESFXUHrPBm5AMG3Jkxjx5uo5+foTFFr306L
	XL6nZo7kB1pvCF4xkw/U+qeBw9AxzF4Bbd9hU3/gdN02pH1XX/qWUnGeYGx16v8bLgrjtZAP3Xu
	KcZ
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr17785375a91.46.1795772950612;
        Fri, 27 Nov 2026 01:49:10 -0800 (PST)
X-Received: by 2002:a17:90a:d885:b0:3b4:6094:2f9e with SMTP id 98e67ed59e1d1-3b4609433d7mr17785348a91.46.1795772950074;
        Fri, 27 Nov 2026 01:49:10 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm37851351a91.13.2026.11.27.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:49:09 -0800 (PST)
Message-ID: <6172214f-c0aa-4c9a-ade4-83dd663028e5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:19:05 +0530
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
Subject: Re: [PATCH 2/4] remoteproc: qcom: Fix bounds check in
 qcom_pas_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-3-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-3-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OtVUdzKNPm3jyfSk1qnQWehSMQ1vydmT
X-Proofpoint-GUID: OtVUdzKNPm3jyfSk1qnQWehSMQ1vydmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX80YHza5gSFaP
 X2kbDYslW8Tujx2fk51chKe1o9ppvMMbxaRLY4XJFq+UOy9vXYEP15hPmbmyc06zdUuPkxhfvoG
 rQR/EKYdwTh3Y0+70STBEicAPZYQiuCdwx3CWeq3Po+vVPyeXlf0aoBBk0MCXiew2GUc9grY/q/
 Qm45ZNu9FR/+essgsP9pdKp9H+uUeN2eqjzdxyBx4aoXnFwTkI2paoiuSrBhYUbPgHh8XQnzyoo
 9mfATS4jh2aOrzwvvm/RxSw3MRByL5MkeQep05UOwT68wHOyL9NgmXnya18NZNNtFL3I6h+ElrZ
 z0XxLg0smQjrDNY5fJWrMW295e/KiH0cuplsT++nKgh0GreZOYvvDpKAHsQTIRk35ITMLT7vdkV
 kbvZ1ZOBG/4H0mFXQAKoVmYVUdVIIaSwpJMtimJVqTpmWeA+78DstQlWUZMsr5CyumLy3yWUec0
 XEZshMKYCVQGWdoAMzQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b095217 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX/DptSM6Lp/Dt
 DcupqzXaxjuI3mCvAoyXexGaumWYqsPT/WHU0H0+Kza0omUBRB8VbPDVkuixnOnXjA/1cCCP1vT
 IfRQ8f2Z67L23cRNq3H0JKyrHJoy5I8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - pas->mem_reloc and stored in a
> 32 bit signed int, while da and pas->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> pas->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < pas->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > pas->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
