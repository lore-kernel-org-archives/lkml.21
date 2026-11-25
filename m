Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598664;
	b=0hpfnVtgZOvY48ijLAQmri2RMf5zXYpykE50OC0vYIZT6b9/O4nci8guoj2Pk2Q/UQo+
	 QvWjrtHYeCYOx/TuLlo5ZdRdpccyWnwpeR75ETmgN8iHL0P1ytjMRRi0sqlbgYMkvyvHZ
	 rz3JHK7P9wOLOy3JlYNTI/6RZFCHgkTGg3Xto6ASkmsJpFdS+GBOFSDBwSbcxj25MhOux
	 cLi00LhFCOYhLcvk21AxT/tqkWHh7AvWY3jp6UvZsD5xnVyO4uZE5nq+mwlbaYOP3CWRF
	 sebISIQghcs6cvnmkQ2hrmsO53PVvcTzn4uT2tH6Uti3U43x0mNh0RrwTV+ISHJIZhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
	b=gpU8peLzjMW9IN5W6kJTrA9jF2CiTftrZifgVYJg5ooRoCnrNefj6Z9SaEJcJx9SJOsI
	 hdp4eI8a8NztEa4H3x5XjJPRZD2CqgO0Ox0QARIUeQFcoPCHewGiygeG+ddehAB9nfqv5
	 pxa+N7dc61j9DKAtdAk8phnoHD1zZjImoNvLTQagp5TtcArrl4IdmlNVrtAr5L2Eg+PXj
	 H42lhXaDMhE0NwMuLqCvmepR3BffR+BTb/buK37FGrBMXOu6SPHQCjLYKJEqdDI8oSzV/
	 /avnQQpqqVWEA1qXRgKTXiqQECp8L1jZT8QuuSS2M/bdvtkZ+VcFTJ4dNz2LwB5v7Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izRxgdwI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H/1z8zyP";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9F606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C9F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izRxgdwI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/1z8zyP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Xfa300003
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGmW88CnQl9hiGYpiWfwaSM6
	NmzBZwZKuT4WR9HAtaY=; b=izRxgdwIaLNM3iHxISVTA7KguTx+kGEdEBtikRrK
	MhyFqFTUXmuohngSfhyjMQRqLV3C2Ov5posISQWNN5zezJZZL9hIGuIvVOROcp0l
	zbEfCI6lbThcjsG7ynObKk+W8dQiTQBCvMALhZkDTeD1hfv3VmbsehFvfmxY+b3Q
	l5zCWmHk2e+sjRBgXwvkQprmuFSpW2AF2TBjYqVLjrZajzE08FdFxardJOgfOOAu
	IGYFJjRZy6fnKC8qq9RU73BEPpDFgfeXq7PKqxHFE8VFVdnkkBD7JeGKcyZUth0C
	NcH3hNd7H9xDXPM9enm1j9DmL49pTBpjt6nDiPyB+/9ifQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsx0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:24:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so4301164a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598663; x=1796203463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
        b=H/1z8zyPwKf19jB4zZimqLWeS7jZx/NBhViUyj0b/kkF6tjxH5COr/MCH6AEGtBSs3
         xm/RirvVu2Dx2+Ahvk1mCR2WTkga1gL3KrQvcIWOhCldM/pZQ9+0jW2rxXnmxA7jbL7S
         rC/trXX3BsR48xSUYrhDhg9ORVKVDEgOCtj83FnvGD1txO7Zwo4ovNIBe7/6laEBkeiU
         LnUe8iXM0Elc1hOwbwqkHQHCY1UPYeFc4KP5F9aRK+tfcRzwTWtfwWhHkrwbguqBA2aY
         RSAs8XZhAo2ffKhA51N8nucr/RBwLcFmF0eidKCZ3jJHzLM8T9A6fbmZbZ2Az7+JD7G4
         pnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598663; x=1796203463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
        b=1GVVppIklLWhuCs6JhqbP82q/DwiDlf3vg5c8vzdzXUfKm2VTAKqcw4nmBD0GdPqP8
         2bzMaAbUBFxJ19tVXefuAusewQ45goDchjFl7Z3pbtj2j8+x5I8QPAHudaynHlNi9dlg
         pQhK74c2Zbir1KtEa4zbTfssAuXcwOyJGLPKhhGDLSGrQZ7Bbsnavb+67JWA9PpegGUJ
         RNIYaioqoAdznFcdV3i6G90DapBLBh7HN46t5qftfqvRIVtovnDEOGMPAsfWZ03rkQ+H
         RAlGm7gsXY3U4OgmPXidKOkOm6UKW+8OQ9B6fF6rsELW0OVGbXfgzOH2MQVwCG6xuN9m
         +PEg==
X-Forwarded-Encrypted: i=1; AL+hErGhBP/kbhCd/PLBmux6l8XXFtHoCTVtoHDjvy9cS8fdodBvhOiiI82II7nvKcWa4J6HByGd2RZOqvt0wkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9txP/27+PsW1gJvJnOF65ZjM+rGPaEJd8LmzRB+AQ8UMNceSr0
	hPm2yUH5nIImqoReI0V4EdnxE8FvTi40c7nyWt2GKp2pTF23kkTObvP6ixKbPF7f/cEsAgbMldk
	p1yux8tNxFqRQzrWW/4hyOaZDVxOTB6tMEqLRO5s4G4sdoK2imABZwH19nNmC4MByAXU=
X-Gm-Gg: AZFdTZdtUNH9zHCudki92hiY2e3aOr/G1SoKXYNlV7iytK/tkIhKH4QqigCzt2q/k+r
	zkaOkn+iq5u6O19vPh7n4WGoijsjbhi3S/dQOtwv7+P85HZ1Wq5vDC0lvKSuEjMWrTYY4qIOJ2o
	FpvFZM9q+RyTeTIp5NU+U7JsVFVFQExaJO8E03EwVvqZxVgxQHqN5CIY1oMINYW9kD3ce6yN4n2
	F19oUkZM5lb5CNR5ySURZpK/GVe0Pph0SdHEB5k6BllimKl3rklUXzbixz41/nNwG0fLOCvRfTf
	8JYlwkzAbNPbDhfhpFRxt+TAbLboWPS5TLjy2LmpWdnVZiifjDhs844+tYXBFCCYm7TYCdAUFCM
	uYyrYCjOPrMCrdPS+gwfNxrqbe+tHdcL5UIWo0uvL5I6AGtD/eAaX7FOJIc/7G6tqoyZtBsBAW2
	A=
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr16297567a91.1.1795598662720;
        Wed, 25 Nov 2026 01:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr16297542a91.1.1795598662124;
        Wed, 25 Nov 2026 01:24:22 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm27225013a91.2.2026.11.25.01.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:24:21 -0800 (PST)
Date: Wed, 25 Nov 2026 14:54:15 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] arm64: qcom: Add SMBLite charger support for PM4125
Message-ID: <awapP5FP902jwSJ+@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <8dd3d211-d5c9-4a8a-8b48-04de60922b22@kernel.org>
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
In-Reply-To: <8dd3d211-d5c9-4a8a-8b48-04de60922b22@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX/osflTyiWGsQ
 hSx+Q4xZdQ01Kah0cu4GElXcJMGtaI+85l698eicY+VNYFCOeocCKW7W4fZPJbo5tF/sO1ire6H
 /hETxA9M9Zpf/EymsPfWC9vPZxK7sPlgf4zeWUWE6yYQZuDkpJxD0iR/L2nDPsGOvpQXd4WxV7g
 HfXPncip1WSt7zybjXpLnSTQ14jfML6NhSPVimfWR0RTWUpuyzUuK5W8uBTSq/jaUHf+PkZPHNC
 1FGMb2IMebZizJ4t6e52YxrPuSjmW+ag69+Z9YdKnaYCEEviCrmvTkHQAgtDTek75Oxn+UuKPuq
 BszQolPh0P/y2MNM2m9sf4lrkMUTNWruWmpHZ85MA6zSge29beqcdKpk/7ay4WSnNySBQ3u3a5J
 ocTnj+wwznvx98GWfA6C7g+ZGfphppRIW6qKIbOjK8Mt3bAkEPmaPeRjzFtCK+nP6V9T1zEDfdu
 Y1SoHcxfXynFvlee/jA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06a947 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=kZJHlUTYguviTMVrfrAA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: T6O46DFsQo-KMkkI6vsyacOWwiP3-YXh
X-Proofpoint-ORIG-GUID: T6O46DFsQo-KMkkI6vsyacOWwiP3-YXh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX0pEfrmD21S2Z
 ZJnDXaP/silljhs9B5Bn36ILfPLqS6rF68yxX5umzvKSfcur/q1O/wtMIzAFzg2GrG7NI63Gq1/
 fC3ChQgA472PJETn56966Jxo0lSzRqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On Tue, Nov 24, 2026 at 10:48:02AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 10:15, Raj Aryan wrote:
> > The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
> > integrates the SMBLite switch-mode battery charger IP. The existing
> > qcom_smbx charger driver only supports the SMB2 charger IP found on
> > PMI8998 and PM660, so PM4125 currently has no charger support at
> > all.
> > 
> > SMBLite is a reduced-feature variant of SMB2: it shares the same
> > SPMI bus and overall driver model, but uses a different register base
> > layout (five separate SPMI peripheral bases instead of a single base
> > with fixed offsets), a different battery-overvoltage status
> > register, SOC-based recharge instead of VBAT-based recharge, and a
> > different JEITA configuration sequence.
> > 
> > This series extends the existing qcom_smbx driver to support both chip
> > types side by side, selecting the correct register bases and handling
> > logic based on chip->type. This keeps a single driver and power-supply
> > class device covering both SMB2 and SMBLite hardware.
> > 
> 
> Why do you have unexplained/unlinked dependencies here? Why dependencies
> in the first place. Does it mean this is not reviewable?
>

The dependencies added are for charger type detection, without that our
driver wont show proper charger type i.e SDP, CDP, DCP. I apologise,
I will remove the dependecny in V2 and mention about it in cover letter.
 
> Best regards,
> Krzysztof

Thanks & Regards
Raj Aryan
