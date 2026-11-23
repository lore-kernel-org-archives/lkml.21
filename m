Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462774;
	b=wh62WWdULX1g3jOGgFEnQEGYJWtBdvl+VNtsp0fmaoe59mFmxZEF2kktaVd3GHDrdrgQ
	 taVNIUnbCD9zQMFrF3JZf55UCDMF3BTwYG/ZEwIlqs21yGWzyPUULnQ/rurbcoic4sjjQ
	 NSPdaoe7fMePq+dB9ZtUdTjYU+oVR4x70tYsNEOp/Z68xWGLadnWU3AKyOPiBSH9Js43e
	 +16Y5eHCdQiF445aa+1zlzQQoEOl8veRyHyO7DjLrG2j7dayxtMjylUYdgJe1M74G/tBA
	 bdFM44uwzr/4qMNheB4xjYFC+OVR8zngu89yUw2xQ9XUNsVzjogs6uzdRfwkKhiDzXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
	b=Fprd0QJYCLl6mfzZmKREPfvxAP5m6I4MQoHcLFzULNtqfKz+6KiPA31G15P8z9DBrxCD
	 ejd+dN8tQkvhdYV8m2vC59080cuyp05NtdJ6M+BVfap2Fpo0OwJc4LFkbJ9jfDvv3g3z8
	 pqzeGGmNd56flk81OvZ+2ipzwaiYS6oTq0sdjFYxxzxikb2M1KTbvmFkKPjegWcwpcQBb
	 Aq851jKOZ5qgziKvNDjRPqvOzxE5NjlyPVE2FZZYPn3Exr0+EFS/cY359reYUpdd5S6Rh
	 SMzEfIY2Qd7UgmrvCMczUZTk55W+InguP+DC5SQiFPjkFz5We44PSxLWh5lPufliR+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=in87BECI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E6BCXqeh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27237606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27237606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=in87BECI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E6BCXqeh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxtx3730309
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=haNVO7gOhf5Ym+jj9U2IyzMe
	C+mkDIqkrVpNRPXkmrU=; b=in87BECI0Pt/FGjGRSYHFDOIJgcNMkkMvbu0rUft
	DqhKb6u4B2ZYJRTDxBc9WD/Zvm0ZaeQ4iYKNhz2DzckJaq72V1QP8O9WFsvTx/Bh
	H9kbwok7Qk8WkJRlkini1eybC70UD5x3qLWr56ftt4+OfxvqrQjWWFKhLLewkIyY
	VC40bA9TDydeNbA+7/zn4SslVwPKq1E6oI2Mb6blc/SB5J6xfY3ecMLcKqyHzX4J
	PLxB7TcTxv2GyskIqpACXevEXNkZp8ZUCDwrEXqKJGfiWbBhlvV8JMqpne2xaHlD
	eSuSAs5vXrkJWTnp7Lzy1pPDv2kABXG6A79WJzgClOAyJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3629-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:39:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so614449885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462773; x=1796067573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
        b=E6BCXqehJ/ur1dPMWVrx8gdfpNjSHjplpiP8C19fK9OcVkeOAuM0dQ44GxUR+r1+Zv
         8oHKbBkOCZeUbUT7UBuc+EIP9lFxn9D4GRoITCptfEaxoutz2wemfjWN8KPMFYv42h98
         MbsmzdpuJTUp4NkfMHjOVY067OJEPcAhUSQgOEycJQ3W9TOT7uyMfDh6irnSMPD6HwmK
         /TAfHN0LChvnSv/cHSTntEdv3B4x7r21co9b2c+3Bt/1quzE3f4gMIUwGVZQ9jsvkpjn
         hHBZboWvw9+yIzZBown5M2oBZeZ/afMyBsBOKmN2WWNtQ1MAnKpgokaAwSN6DiFrHPVE
         MF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462773; x=1796067573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
        b=tLFPHcxJ5NURMb4ViRBht7FrSWJWemijFaGkGw0tx78SbVi/cuZfmHnavoWf+WtAzy
         iU2NGFq0IiF/BJwnVKnQmtmoe5abFx0GNr1jJa6cuSs/mnuNBC0i/iZLPGtS+0aE/RY1
         JJiAhYTgwi1Z1+Xocok8KMbkD/B6JhJ2nThUlp78PaevTrtEKJHfjIzwYp0L/OJjbDBC
         g3m27n9NXSapqkXoKwvvZp/ZgXlOnIZLsxATD1SZ3vJ8ueCCgKmS6EKmQ4Ptj6/T5c0i
         Zgi/1ohuZgMD2meZHwzScWpdpLTvOxU5Y5O/6yjSVzItI9fwnQIqGWvLy1lrNaRx5CIM
         zbOA==
X-Forwarded-Encrypted: i=1; AL+hErHZA80ziDIgQQm+McLJ3/XM/wX+eATVsZHRparNCR6oACbQxq8qV9+K0Uj0Cp6AuH1Hh4CgclXrDLiPH3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KIfR3QFeUsKd2tPxltGUdW7r3/IfHWY+IC+E11RpISYanI4OO
	dq+lH0f4cve57aYb32mnOOwgXXUlCcpSDmM6NG+Q3H+UNyrgOKjC/sRAHsqJnE6vsx6z20Co176
	yadRMh4YM0++9pD0JcZtV5GzYmiqjYb8YBnNicLnTcsabG3x2UQ/lcxMFLiEZ/H9kgTg=
X-Gm-Gg: AZFdTZcRD85rAdzLJDvSVfe9q78/VLYl1KbsRg9VUDl8bsdz+Kf0P4EZUwSR8Y7jEPt
	C58PkVyEZ70nOZa9o5oZuejAHP7zKE/gTG8j+/4WIFR084bmXYP/4CWSy5nQ07oYbzHR4xLG8YJ
	6w+VvzsZIhR5GDqIACXFwNi/pgtfEMs5PInf1PWP4Sh/WLti2tWDSX8EoFQfa2yMz7NNo+JxOYT
	0sb8bnSqHZ0kMF5ph8ZAVVcuaX0hIXMzaIkez+pViEQINQijkFgzrWM5Q+JZU4NdB671KQ9c2k6
	2xh0XcBiz228RQl2FngMpriWQXuEDTIQkqxtaHxUNpZCb5E9hS5TenPHrn64V0GSL1gjGRtJ6Mm
	PPn4I2p/+aipEjKh4jqQX7GJoAxcMQ1XNgC8biBogHVNqFOy+jrNX5iKtRiOoAuOB
X-Received: by 2002:a05:620a:4403:b0:949:7750:6bd1 with SMTP id af79cd13be357-949ba9c26cemr2181775185a.47.1795462772462;
        Mon, 23 Nov 2026 11:39:32 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:949:7750:6bd1 with SMTP id af79cd13be357-949ba9c26cemr2181767885a.47.1795462771705;
        Mon, 23 Nov 2026 11:39:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm550971745e9.13.2026.11.23.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <frzrzvk6blfodotve5lndlqj23qpefqzedq4qeafv6o6fsayad@7o4bskhjiun4>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0Hz1GIbohIgUVaz7uDvKj1tswQvl1QK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXzKJmi47ACKdC
 D7m47JlwDZ06vD+XLnKOCWU2mKrmX6/eSzAA/Lry8FNw5Ra+8aa4hwAJyk6VXGLGS+azumgN7TM
 L3xuRL3rm7XXCcJj2l4kp4Bvt2RPxAq+8WqwKUv0xbwwuyoT4cpeyqpPP2v2V97JLDzucLvVMHZ
 +4ULUzCCsIEqrrWxzOlnuU7g9Jxq74zxIdh/zOttpzUAwkLlJVDpOM0qmsLONoAV0DKPdfYJFMj
 Xs75LHeJAb0ON3Mb4Ka+qwl4pNSndeUHTPfSGjD0oj0f4iChhHmfTO975wlW2Rk57/i6jBB9TZU
 ZkKkpyc1YAQwyNzy48hwoQikrAW2xeRpwsTzr708SnvcxqXA86Jp4q1gR7+UAK+3nm2m3+QfB9l
 bb+ip0o1pO/RSD15zcGSRylhLfUHAKl3XaaX8zCrCf+tZH/zw+DKSxE7WxTXmBnThF4cHA5bv0j
 vWMJhNBZSJYs4h4qYzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxhBu6Ju1UOpB
 1j2bG6DSYTvFs47a+HIagQ7nhx/KZsDdI1aJjujk5/GGXQjgRw969/isyT9LvPGtw6XHLPEn/nv
 sf8eHnzuwLIEIhDF2rbVzEAU4lDj8wM=
X-Proofpoint-GUID: 0Hz1GIbohIgUVaz7uDvKj1tswQvl1QK8
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b049675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PLo3hsA5cR1DE-V2qI0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:37, Bibek Kumar Patro wrote:
> On Talos platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
