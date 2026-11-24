Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560889;
	b=ELweW7W99xZY1YVr8h7A030NAiMz2hipLwZxP747r0/gRw5n5xXCGaJ4xpECtMM2F2Wu
	 /CxQXj1gDU5CUV5CJhiclG1SmnVo3334MroVYhjEuXCmJPtnydCQbnzWzfRH+IxaCOagU
	 ym94r7QREbEeJIHw2338L8txTsK2E1eInsuCtfb+R/8T/CjSG4ipG5vQ+V+GWEZD07/tO
	 FIy1FrSdz5odgqgsi++UOa3WgMR9w02ODdjofOYUP+4enw4EOs9LjoUbM9s3u6ujPl1Bh
	 zmmg9n/O/rzDQqnxH17OLLo5rZazKHt+lJGmKKOh2zOMpLpZifK4JhGVU0giplQThmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
	b=RbvxZdyiVpO76L5zNtkqllhtC/gCeCE1J3iEx5Rsg1+/gSTtP6ppz7mtA0bz+MOzPGZT
	 FGHXIhtMKuTEUb4QU9dm1zpIUDQtJHmUDpChyasHlasVjDzni2I0ZHiSFZ7zLFYG4cQLS
	 MGWLiPIJWeKAqfm4p3plIme7SlL5xxKsGetdMD+WuUI5k1gyPafo9NpuvZiWI9rfDuGa0
	 txfmlEFctoNQfouNKZgC5YAEPQt4w3V/3ZFe4EVUyvMAc6e5lPZPugWseIfTa9MtDnSXP
	 UQUOpTPwwWPuWrCVKj+T3SCI8YxkxerbEPMpIZ/NKr/xy01gECvYOiOrCPOYlTE5puw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="V/w7y3um";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oses93L2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0349606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0349606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V/w7y3um;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oses93L2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMbHKI031388
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=; b=V/w7y3umcyAD9MIl
	VnL1ez7G5fhzewN2uskuv0SPL+7FXEazH4JzJmpVog2kulJYMyAgFa1u4PSpwAqZ
	oSm4VFbgDw6HEaVCYuj1DCfsMAfS7/vVEpujX7FmskO6h3wndc/zLWmCKC2xl4G0
	WRwJFY7/UAOcxMedPFycyUpcPX8fCiTIR6zp1Tddc01VOInHgnV1crSNkNDaUUi5
	UFlOrKHu4002kc5CsA41Z/uS256uKowa8Byk7CyjX6jc03JgYrHj0Q1warQWIs3R
	LlmEUMerP84BYiKvXumNjvkGCgwGY7yq5Ifw9tudErkV5hlAmHonniuUO4yE539K
	tWoLGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7tna7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso5731806eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560887; x=1796165687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=Oses93L2JMO5dpD3s4NITc1NBlis4TbqT8IYENTNYIgsvUgRv2exX069rGaj3GPkAJ
         /+mC260/t9SfZ2wVnh1brZNqemaOmGzJqgpNckpIjGBX+FSFRZLq9KRqrs6DSIkYbTUw
         aG25AkT8PM0phEWzeD7dWvzFlf+bHBQsL/b7QstRvrNu+pGlkWYqUfEYDWFGMHSyvH7k
         18rRZzRwp5f+5yvqXH/I+1AtBh8Uj/5Z7pV4J7tL1FvV31xPsO90n1WaIN0PC1jpckME
         FPUHRwssyMM1srtPVOIVSa0QZAMyKQF8HwYOHTUaYiBrgb9FdGz1ws00NM2+ED1I01+t
         V3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560887; x=1796165687;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=fxWtX7UUl+KMcdLHjUA+DACxVlg+iBSDDEGVzK5KkIJwmUVUHg8AOTnTyjk4DZ3Zr2
         KXVqo+U9Uf12PfLgrUnQtW7JVaw/tzTDaeJE2pyryFQc2wBEuPGSfAuAw+FZyloFjt+y
         5BGT1FyHBO968Bh5dkBJxW7yivSCtB/BAaCLHHUnHP4ozy1rKdJA1azSqQl5dUUixO4w
         aoCUK4ml8Bmfwx8UfGpXE5orLDxAxFoYR+geYLdWzbzRz0fWOmFAdEXhCw/8p1LKH98q
         N41Ytx3E+PlvrzKygvVX8pUJKLMRMmtdnoi1/zG+7V/Orf2BO9Nmm55KQslq8dHHPpG2
         PugQ==
X-Gm-Message-State: APuU4Z8CyN+KjE/uAhcMU1o1rHmjEx6594lIgvtm2LVKel3AQxv6xZeR
	JmBS0B5m/dRFRwQv2G//dkPmtXRJkSGr0DtnKGoLnKJmBZocpRBHE0ELjD0TOjt6DtWfonqCy0y
	l2dOl9/k9HFsAU7vjQmWs9qey7wGiS12uhgIzDvc8KWUn/jFZ3X6HhCMXGfTfP9925Jo=
X-Gm-Gg: AZFdTZc9FneEng4XO8JSWiFoJxgVNFyXdcLzMVzjBc9b1J3uADvA5tRWE0tq91MR4TB
	/RNU6QzSBCMyX59zvrkrwbykeqvQPtmbozKj2oxw5XIoZ/RLEYVtObaqrFtXx/9i+g/nheONxjw
	MZKKUemrJ2PWPxypxSkUg7mn6ILQaHqd1971qdjspKdYtd1TI4q6bPG6WM8YO/D03ViRXf8gY2R
	qOz6c0TMM+v3WbFUej6TtAMPqs8Y1sIt2YW6fvHEEvN6BN+nHbWUoxlsTh/66dB+aTF3ieNyF9w
	rAxV2QJrBEzaHFROm+Bhs6qd0hdGRLGWjpEGKlo2TclV8CkJ7Zi2ZJubEmg9CdF8IX6HIZjxIzj
	jEdm3CkWDzSQD9qmQ4jwb6/Pl0QzWDKEIGx6z6tXuVRefUJ9pREyaTIb5L1C0E7T/STFTd7pQIl
	kBu5FejHO4EiX+pqi7MzOVw+npEA8W
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710306c88.5.1795560886682;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710269c88.5.1795560886049;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm38075587c88.12.2026.11.24.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:45 -0800 (PST)
Date: Tue, 24 Nov 2026 14:54:40 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 01/34] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261124145440.000017c5@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-2-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-2-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX5QHJN1HZHNYs
 1trpRiv7qtlwiNl353YztwstsCvev5ME6e+mAUASRyMmhuK76xzDyXiUNQR7n4PkT9UFqbh06vV
 eYcBy7CFzCSWl4eyTae8K4WazWZQYWY=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b0615b7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=But-FDUsNSCRHIe_eGIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX07D2OtsUsz4V
 OIlaBMV3e8tgPQEI6nu+84jaZtNC1OEBJywp5dz5qtALSc75zX/+JlUqpdA9SjzXCPj+YTVIcla
 8+1vCGIZSRQkMEuYH4Cym3vZjEZsB0RPwi8PhdGj16C78xeEq/oIIr9c35gnUtll/S1LdT/hF6E
 qF9S0LVAkZBsqnZWGxeeVVF6DfZ43601wEefHaoTdaojhFuEyLCdVg/WXAVYvRWQWKjR/u5YKPk
 Ef7BXCVPMq/j95aa0Ge6XgHcdapm8p78bhVxFA4HOt37VCQCPMRkqsl2thgn8+HJFmfTGqsuuNQ
 y5bMbSmkEHbBqUdvsij0IxVd/Gb/3XBqIknB0kx1i/sz+cplqRxAzHbrdpRx5Axnj8G0ERhCzGQ
 8fHJPvFnuJ/F6G7sSlGRddUpMukh1h9Facnp9f85vdFjxPoeECSCMyAHoz59WBlHVd33pcR8cJi
 pPrQznLRcdCXrd3t0Fg==
X-Proofpoint-ORIG-GUID: 4yulnYbE9Bb1hx7ArB-Y43GEFodTccpJ
X-Proofpoint-GUID: 4yulnYbE9Bb1hx7ArB-Y43GEFodTccpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240090

On Tue, 24 Nov 2026 19:48:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and inconsistent multi-part replies.
> 
> Fixes: 36b6ea0fc6bc ("firmware: arm_scmi: Add iterators for multi-part commands")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
You answered my question on this some versions back (wrt to where the magic
size came from).

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
