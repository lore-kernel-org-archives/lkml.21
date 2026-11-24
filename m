Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560242;
	b=gnKQqH+jUdi2ytbuA+Il2Ems4X74ZDR1npGiD6cFSqaWVqxgDHLjAyAn6KQJEd0+JhpM
	 Vbf91jgn3Eo6m3vSUQXQ7K9WV1WPwI4fQZFfIUiSCDBfQX8rmqrR8nvxFh078L4GTT2wp
	 VCvMi0jGEWq72HFGVgZKVCOhrqBEaP1gFVuHXrAdCmQCAkoqML21qh22Re2A789i0SpLF
	 /7LSBwv0/QLfGK3jHw/KGv9iQ6ABcKVN5eS9C6Z1N/+6REjFqRb9m69YKC4vrz+2VZLnc
	 L4dqFkFG0+/F2kNVQtvK5/lVombCmMa8Rx4Co7A/H6Cuq1zI+wH11aaHZnEQwPs72tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
	b=j8X18XQfRTaflbtMUaJYG8q4GRuz9dKcUIyJ66JqrjiAT9cuYodwFgcCNNZbnqL+lkDU
	 Mhgi+zc7+xol9oTqTJrWUeBV6EllvNoWaXhOoQ2jvprB9ZMEatRli77sa0SxE59HyWt0j
	 Y06Xl0XQHd3u/L9jf/0Noe2xEqkoeBcyfYvJzVhhfAjZaBnzVZbNN8nMoKUucUDNAy/QD
	 Lf4OkzsTP+JtV0+gVULKKPn8S6RPmYfED0odj0qt0MDY7tq9SHlMyBGKPoXPq7Kmsnh2y
	 w0KBt7AJUMXJKotnrXBL3ZTDeSP1XRR3wbO3IAhrMiijqFbDkUU/T1oiZTKUhhzDbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HFmRMel+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a26x6jD5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A8606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HFmRMel+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a26x6jD5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMax882558281
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=; b=HFmRMel+kSNMaBNc
	ecE/2xFlKYK0OskutL/ZqSgBBf413VS8uQk7MyhxrLmYFsklTZAN+3n9ErYVHlit
	UOvS8/RnRYEldAzYSy1k4M1Tcauqs64z7XjJZX/Y6GPx4im/wwHaPSfj3gC2PY8L
	nF43g3luwvIfJ4gQdcb+5Bxg07LaOaNU1iQnXtWv5Ltbi3GScOtDnatTXmmn3Jdr
	QWkM/BbGkKt1a0PFQdbMQqfn0StZW2I5p091+EiMZnDbEWYP2ZVLSY53AEJerchJ
	bT0+H2R8a1Ui5JW7SqkXQAHD8i5JKI9tBFDlZWJsJzIKYVXGiC7QMLJ5OeXD386p
	J392pQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnghmp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:44:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b60129a46eso5581136b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560240; x=1796165040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
        b=a26x6jD58KijrZa8YLMR3KJNKlzHJAonv4cTZA1RIgO5y7ifNHexMXahTVJAv+svKf
         WF621p2Gt/y6Fydw8fRWRq1LToFSRLlHztqrqACAIXfUKVXMziHJTOg1Oyi0N0/LrPdQ
         Q+PWmvZ8sPyGOUhEdU2w5GCJ6IWIdltLImW7tOWWdVj4ik2xoMz3kTH2CIFeDp+Xu5TB
         QdeHCmk5Uy0CyNuMT5v5xm+Ks7NrjQ8LXqH8mKC02yiM7IBZxO63csQ29SnTgRZzW4gO
         xgB7H7bJl12FJuu4nOPenCI0ZSouDu6TMr7Jk0P7sWDW4T4AzIviCzSOCDAxIL4+u7pL
         F9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560240; x=1796165040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASw7SC9wV/z7vgENMCASn+3Pkx4XRveXsq5V8cY73js=;
        b=SogrOMChJsgdfR318Ul0tpnp0+IxCgCl0jcYUtnw4CwKaodkXgUfwTR8BYETB6gYyp
         UHleAQmp00mhT0vug+48AjiDbaKX5ohacKdBj6wzZt4/ZW4Brg7LrVGXQi7/c0QlL6zS
         CohzsIoRK+1qXq4gWmj/93QfpgbF00G/g5id7JAVy1Uwk8Dxfb03Z6Y/HffR54dPrDGI
         L9dhULAN0VS+j2G7mSw1yw7XHwYs4mUjMj6ANVv3IHfPnGKGSjHzJMspvaZ3lKVlLuFu
         5QJMQBTk34fS+/Mhr3U0SVgsS7uxyaUCgI+qYHrqfphnj05zizjrSWAJKrYsrF56jlDF
         Od4g==
X-Gm-Message-State: APuU4Z80ZRgUKOeJBhRE45kcXhmngrP81FW2CrSRwv/n7AZ6s9B0mj61
	yyAyaFVyhBalVwpgKqE0u8UhwgCg4AqjJvEosomVKBNz+CJGltLFXV57G+OpODsZbHb+JN0lb+b
	H9Lr3whG7lWgRSqcsIZmAmCnWpyHKmz/7wyE0Oeruo98XG27aTDhMbB+DWuYNSjPpSisdZVOYl3
	I=
X-Gm-Gg: AZFdTZfbUaZhSCuuTpoYJL5hNAclRpG+inapvt2ZknfF+AvfKp9qhTCnMNzLWHA8B1I
	Ti7aj3J+mhjgo2Ci2AViDuvRWWEulansbhEnH9Oac3dj3nLrsx6i4Mq2S6NSV+3H/3Dm09lR9uf
	e9l1gu9B4P37OVNf9XwQcmv8mEBnTm3Odnx2Vj5ghgw6AtzwNYqQWWiKYOZ7vaBdIRdCjnj9Tt1
	OPk75o9v+sIRxbPqWpeI8mULJfgNSQjH/ZWKRq5Z9kwwocuzeoIlN8xrwB82YPKDYKScQzNmp+l
	WA9iOXsj9nx/24aEly62CbmPVG2pDPiuwp6uogI7Eh1kBylqnSJ83EPfwp7OHDyu8VfK9AkAK/A
	zXzjBnrtDqpn4TR5Y0pI4b/wjiR8AVMZcn7rZQGNAW6ZlTyUha8T0z2MFfteNccX/jdpNnLvOBR
	mYCwG6PonFc/HNK2tc5xoAOVuDPeU=
X-Received: by 2002:a05:6a21:7704:b0:400:554c:f8cd with SMTP id adf61e73a8af0-4014dd67354mr15681386637.54.1795560240423;
        Tue, 24 Nov 2026 14:44:00 -0800 (PST)
X-Received: by 2002:a05:6a21:7704:b0:400:554c:f8cd with SMTP id adf61e73a8af0-4014dd67354mr15681370637.54.1795560239982;
        Tue, 24 Nov 2026 14:43:59 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm7644525a12.9.2026.11.24.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:59 -0800 (PST)
Date: Tue, 24 Nov 2026 14:43:51 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
        philip.radford@arm.com, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Invoke proper protocol cleanup
 on failure
Message-ID: <20261124144351.000034dc@oss.qualcomm.com>
In-Reply-To: <20261124185111.1022322-2-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
	<20261124185111.1022322-2-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX5SX4WLwuSf0N
 LcdduCnDQuQeEkZW34pKDI5SUnzr8YITIQObeclDi+GHG4/MdXsIYUII1UnlKYRhoDDUABNkWGC
 kkqa2D80gHsEF59rf1gpbxG9fAP7Uxk=
X-Proofpoint-ORIG-GUID: KUvcVW8RO3wQ9C-ejCQhqHnC0l6oXIYv
X-Proofpoint-GUID: KUvcVW8RO3wQ9C-ejCQhqHnC0l6oXIYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX0EU1ALypYoUF
 upYyBH98NqXhPeLvM57BVyRGqfxvcaHnO+DcV+WZLIl73OZFZtqS5J2/EGaBuFUZ1PMDgU1hYpd
 AbWsW4yTUrUXIofjA99tlOC6npZGNT70BNENkXP+Pki6OEfrhSMb2g5JhdpYFeRnMuTZw1Voj5O
 hpP/MfqsfP8019R1ZtlS1YMU9c/jHspt6zWK2JyC+rHt/R/0+b89cazGGl89wbP3c69xTl710d+
 1s4xqYzZplVIW8T3poJ9Gu7GXtpxjoLDbuPzaOO5eIkdjQM2+aDLiwZIm8DeCuBaoI4mxMEXo7e
 o6Ui51bq1lit0wzKrVEvdpQ06WU2zJexy3thKaFlp1pDEtTopKm7lIEvObtuAWeNO8oO4WDN/DK
 XRN/jAQ9AF3DKd0mysZ6l2Qj2tVjzIclEDN2GAMS1sy5xkeXlN5tTXH4uLiD3rFtoq2x6Eaa4nD
 NJWBDi+j1OlSNLyd7Og==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b061331 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5v6MibOh_TyftPwQeGgA:9 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240089

On Tue, 24 Nov 2026 18:51:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> After a failure in the protocol initialization phase, invoke if provided
> the protocol deinitialization routines.
> 
> Fixes: 48dc16e2e52c ("firmware: arm_scmi: Extend protocol registration interfaces")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-12cc0795-af8e-4d0c-8f6a-780a6728de7a
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

This function is 'fun' for it's mixing of devres, reference counting
and manual cleanup.  Plus why is it responsible for the
scmi_protocol_put(proto) when the reference is grabbed in the caller?
There is no reason I can see we can't hold that reference past the calls
that follow which release a devres group but don't hold anything specific
the protocol module. 

Anyhow, far as I can tell the fix is right but if anyone has the time I'd
take a look at whether this can be simplified.
So with that slightly doubtful set of comments in mind.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..2c4424aa0d37 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2303,7 +2303,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
>  			GFP_KERNEL);
>  	if (ret != proto->id)
> -		goto clean;
> +		goto deinit;
>  
>  	/*
>  	 * Warn but ignore events registration errors since we do not want
> @@ -2324,6 +2324,9 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  
>  	return pi;
>  
> +deinit:
> +	if (pi->proto->instance_deinit)
> +		pi->proto->instance_deinit(&pi->ph);
>  clean:
>  	/* Take care to put the protocol module's owner before releasing all */
>  	scmi_protocol_put(proto);

