Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703955;
	b=3OQEkIlmHW/NdIQlVcQND2R846Lz4twWjj0ri48upO4zl822CDAxu1QkLItp/f2uzRHe
	 Tlo0xn+Zju2wTfZ4/Ty2AEh/6p1RZG6xsQRFUOsDOJP+5UxDUSVSsDur3P2uXkhHehZMA
	 gRCm5Ksrls9FNV11ISZAhIFL1qFp7KcIAtauNBn8YySERfWYX5kjySRugAXBpM75rbU7d
	 ENvV9ELNvFH4pUEnR59yRLJgbdVgto6NBiQdwqCb3eaTKe3vxVO1sTiMxH9ayxV6y+PkJ
	 EMF1vOqhUJS84IM9WEYfntNzNqjy6N2U6GjqE2KckhoKgqjij5iJivrrW4uLN97qzfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=;
	b=kfy0nfEUnp978z5aclqluXjGQWeSmococqzWbg9vJa63nGZUYSHULrK9YFtFRkIQS5ib
	 HimgwASCiFF1xsccBdSZJ8nfFmjf7gw87qNEVn1HzFN7qYRvgf3SSImIDuWzHcvih4Oj8
	 zkG8W6LgPuuCPfqE3NvPWEg3GZZOBHojzzBvnRESjQLqQ32ztWcXa3kkgjumBYOCCRO4k
	 rIN0fupEUOGcH5KzKnB7iutYJEhQ4M8d+hol8ixBjZ/K5yP/Rhs96VqS370GZq5V6YU2a
	 dWNxOQLCV9t6fqLLDNzYXCOfja5+l1DJmFcDmRnvLjizk4ylhnlkxWJFKGk748hnbiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P85f2N60;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToDfsLjO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P85f2N60;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToDfsLjO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV0hn3563238
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=; b=P85f2N60RB5zMg2P
	+AvFLCJbRJr985Fzkg7pQrrcgKSY2y9lBXdRiINvdJr4XDmzs8Ph6S67qW70LG3L
	Ef0IiLPMcb4uSdo8BAXLnV185gKTUGGXAenNHRiJ8VNjS3mXxR9ZRr2R4LxNSuLz
	GaM7u/R8s6wS3MCkh9MRlTmmnbyzGy/dxIGmlseE0P49MVdoDSUJFopIy0v0kllk
	KMf5kBxPHM7kpKEBpJnjUWnkmFnbSeBW86uOnXQLzu3gudybIN2YBd5lWQ4Z1Nud
	kEdntEMbhGx0dxerCrEY4qdJrWvEPDLnfwyGNihMNTQT25DL27tWjeb4dO9r1hnv
	k7k99A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbhte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:39:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so15676721cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703953; x=1796308753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=;
        b=ToDfsLjOYbg3QvAXT/99P3Olxf2QaWOUInnsKMAdeoWh2tQwu+qpTSZ2OZsAynKrYE
         3EkWPKM1dndAwdj3Ke4tc+h1n4s7TihedRkGKrRtjqUO1NMRo+G+KcrsyDys38pwqUg6
         HzXMDvi61uTP0ifP7GPQ9WQCWOjD0T0uTwioAiVnuPWTcF1vRuEIG93QHrTsUIbe0Ocg
         6e6R/kkxogBlA6Kyj69tL4oTXONM9hFMDylzYiR4MsJy7v8oFKdUSq3Al+qs8jpw92WC
         heoW3xUv9IXvsce7UMQoQ4wSDW1Y/yEv3Z4xn7qhP36T8iL1HVdIh3M6v2E1LAYJsj3e
         Pg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703953; x=1796308753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=;
        b=JRNSsAGSPO4ED0uYalZHcNWuJjjvdNEfCcN/sptF7hMsuEC2yWDO+7+YHPEE2RAYCJ
         NQpnohnE1qDqNxQo8aXg6pnzQ1ttQ4uad85iDWdpqmpx2FBIMhFWonKfHbJ8jGJZzTwh
         QEabO0YqxxA1WnHORPVkQYRWWgqztfi7zmsnR/tIU1KECMzqTEGZkYdVcfzia9xPSjN7
         vdOgFJZ1kXBVFtkRuBBwLWR9hf/lsqY/fqW3woEaeLKdBj1rf3xD1vo48q2S/8rd2fp0
         Q3xbEd/+bMXnp4fQdANVab8ZlXwNr02sjeO6qXXoV2fDzUv+TkuY+UVdof4LEIVNKg//
         dZcA==
X-Forwarded-Encrypted: i=1; AL+hErFPy788I4P00otTnKKsUcoeaZ+nGkz2luIKBkgUEdg9WBir7vE7+sWLCYYYzwMN9LM7aqsFydtyKFmaimw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Jgkb/7mf5xU47xNdqTcuzgz2IX0RPOIIKCUPiq2JRBeZntBN
	7CdaHfMYPzlPFI2gdFvZWEY7Y+qk9i0Hh3yWK02QqjcHhX9RFi5DYwjrJLHUY3fGlZNCm64IAkv
	IPivVV4fRWh7dGxjCHnfqdeH6I+i8TkcQeZgLDCoIKGwgHR4BgOhYWzObx9UZ/2h0ZGwFSx/Xyw
	8=
X-Gm-Gg: AZFdTZfG8anutraL10auHR/dGd4O/jDJCmtN4cTsnZTfMNtJ6utFfdG7mYCog8EQ2ui
	yQnhuykxrpEYB8ErOsoCScDYwjacFjSA8hLJim3eJ2as5qG8bBmSLQ067T+8Wz4ikc227dI3UjF
	7EE+1g8Kqm01P76XgOOSMdOgEh88nHPkRa+UBB+jRUYETi1gm/NHZ1YY3y7QVMpcwL6UNjX9XI+
	U0C3jbusAimI9Vn4R7JeJPLen+uLzMoQCPSk3DHcBbt80VIFOYCKlQsrrpviZ9pXuEqmpKcYpDQ
	bFh1Tmer4li5p1ytPJcyC95psbhbLGBV6K3/6BYKEFqtpsn0E4azTJNceex/EfVNTuVcz0MhI3c
	lT7zEh72yd3Ep+sFGGb34UYPZ/Aijui/JFgJT0G9YTFIEqmMv3N39dc7wIKRwEWpFGqV2P6s=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3568929885a.1.1795703952663;
        Thu, 26 Nov 2026 06:39:12 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3568924185a.1.1795703952127;
        Thu, 26 Nov 2026 06:39:12 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm9342284a12.16.2026.11.26.06.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:39:10 -0800 (PST)
Message-ID: <72c567ad-d321-42ca-8b7a-f6be442daefa@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:39:07 +0100
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
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Write the sleep and wake sets again
 after hibernation
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261120-soc-qcom-rpmh-rsc-restore-hibernation-v1-1-3ffd45c9c55a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-soc-qcom-rpmh-rsc-restore-hibernation-v1-1-3ffd45c9c55a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b084491 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jTy422TQQVLZ0cxgXWoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qqyQvz5UIjcl1o3tsEoRmSfzao05i-Jw
X-Proofpoint-ORIG-GUID: qqyQvz5UIjcl1o3tsEoRmSfzao05i-Jw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX36iNZzoxzDgu
 ykWbuk1JfEwgjiAE/wEaIGgdMcDQj2xus6ISeBQzkaeNTMKrLeM3pge+dlFhN316c4QPJqRVbus
 nv0cs+nd9+r2Ycf1mfo2f3LO6qrUEPCrEU4P6PbpceJ/9zxuTier7jucMQt/Zk5wJE9gP7+hFgi
 poHz6wFAvS9PlDMR3zSm7/bu8tb09AjO/AQ2/uaSAIk0/dyCFvmbeoteY65y6w5c/BJYXqxwpFW
 dusBgaBQ9CmJaCyVLypRmfTbzp3uq0nmOs/NITgE1jiMIjcLeZWuRff8mDkyJiF1PlHds7BB88b
 pNeX6EtJxQyHC8pWgDi6H5yJycjWhXlmDPTbFOaiXdnWU2zHcdD6Md/VogNoirEsytU6R5kGIV3
 cd8LGb3wz8m6NQNsUJja9z32V+lzVTeAHYyFdvzh54stxY5I1rhBu0Y9UXYxaRkZPG6xdcEqwU0
 D4SEDjBBa559lGDc25Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX2Lxl8UABQMf2
 QeXNj4Kb056ID5eI7u/zIvfCwn4UDrqMYTF9QPXi2MUl11ar8AkajjDBYtZsCrdYCj3YsSNd5Y/
 6ZuQ6nj8r5cQuAkAovDySA/W7imAb98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/20/26 4:08 PM, Abel Vesa wrote:
> The sleep and wake TCSes are written by rpmh_flush() right before the
> last CPU of the RSC power domain goes down, but only when the cached
> votes changed since the last flush. A hibernation image is restored by
> another kernel, which used the TCSes for its own votes. The cache of the
> restored kernel still says the TCSes hold its votes, so it never writes
> them again and every power collapse after the restore applies the sleep
> and wake votes of the kernel that loaded the image, until one of the
> cached votes happens to change.
> 
> Mark the cache dirty when restoring from hibernation, so that the next
> power collapse writes the sleep and wake sets of the restored kernel.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 02b74c510c3f..3f89857d9d22 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1169,12 +1169,35 @@ static const struct of_device_id rpmh_drv_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rpmh_drv_match);
>  
> +/*
> + * A hibernation image is restored by another kernel, which filled the sleep
> + * and wake TCSes with its own votes. Our cache still says they hold ours, so
> + * rpmh_flush() would never write them again and the next power collapse would
> + * use what the other kernel left behind. Write them again before that.

Should we fully drop that cache as we go towards hibernation?
(perhaps at a point when we're sure it isn't going to fail..)

IIUC we're going to have some votes that have been cast by drivers
that need them and then some leftover ones

Konrad
