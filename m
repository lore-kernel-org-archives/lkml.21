Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451556;
	b=wME1uZBrf2aUoktYt9o48xgsT3Kf0SM/hsV3B4n5E9H+Q+hm6cmZcQ1/dDwqjMAbPEeT
	 qeGYqwVGJmD0ulYqdn521KP7adULat5gB6LqXTZ4rUd1elXYO2Pe33Okw+KPDVG+n89r7
	 rrR8Own5MhYP6ZqurJ2/4J5M3XE0HtnmPY9Xih40HDFMAEWAPWRCxm3Xa1rZd38KRDA/i
	 uB26U0XzgLdJxGGSzdhi0F0C1gT31hu99vWmVVGg/waEWiJi6CGCnF3HTC1k3HefX9iSA
	 kpWbWDSvVEhPIX9AemSudc1xdnlZttBOL8S52FuiGAsjxtUkBHYJU0SLbBLVR7tV7Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
	b=dqnM4NmyTUQNDFSBSVflK4W0FjRDUvRIjtqKkZ4Bl53ZI/YKHPTrycLGk/fBo4I4YKpO
	 D7m0b0s1Y+8tCinji1jJHfMuNEXnERJbDGdgFodmv5W678d4P0v8ral0ACPxIufVizL+d
	 Oo2HAXqcnp6eMjMUsT1r8F1jOQtiqSBjRotdavmIv2Eblb824vkZGfc3gcxoyq5bVuLoD
	 ZGSfvp0sy3efYBJAaexrQOhpd12RKwzKQHjfcQpFYE+reSqmKFx9IieXMDR0uUhkTAZGK
	 dSRbq6zl4+Jg903Y7e1izvvLqxgqPZBeKAGyTD1SdTHXg2M3YJtLU95YhWKpVIBKcQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3HkjXy3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfpG2JD1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD3B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D3HkjXy3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfpG2JD1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnJd1861249
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0TGuUSV5XSvPI1Dd46vwu0Gs
	nPiDPUv/PqFpk/6rYNU=; b=D3HkjXy3W10L1qlo+hyEmhVwRgOk3zPtQqTzh9uE
	M1oy+ZWsMKYlZtTuKh90FT4wnPX70amVLGsqSYJSKCPLFrfNPYRGNwWSmxSfs88w
	AgsQhCOIQrO5uc7K7mvQknbPZ0dZPsD3OJ0tWxz33p3URmz/otBXB9emU/mvAoh4
	/KOpgbZMnt7ufWVbzqtTNGLl4BQgJ+0GB9Szas71vaRSKYcyanCUAAu8nrGuB3HZ
	kkG2tzf8KNNvri9WjJ6O4ySPA8gKdTJ6XqiaFRLt7W9dQLVPGaMIJIiI84lat9rh
	LKvkkhMSf9ivxuHo6VDeh54XnMTi/Z8ybZkgENOhHExwKw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2b2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:32:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so3401900c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451551; x=1796056351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
        b=QfpG2JD1Ghkj6EsUNcejcnPofkG+n40449kVAJ62FaCprPU6l7+Zr3riy1z9Urh/if
         MtyqHdpswPUFdnxqN5FSkf1pHpVdS74UmnMjwPvKXtalDyY6HC+A1D/H6wQ2iACk9kaD
         Ri/ZsxOnjyQBs6/DW5A4hhhjVXGTqG4mQ52rqeUgSpvEAvzcdXd6eMTVG7gO3DNiPreT
         wmQ/iQAKH0s9uRAacpTYg2wvVjOCeX0rRGuFZW7Ax1BbsHbT4oygypmjNaAbcLP6pD/+
         6TxbvBKOWQnu4c4dXXsdDduDOPc96qU/N0y3r3P1IsRukSHLc5uRD1E3pD/nqlqCIiNF
         QZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451551; x=1796056351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TGuUSV5XSvPI1Dd46vwu0GsnPiDPUv/PqFpk/6rYNU=;
        b=g5HDrO2pS+JMzxxIMT+jZAD0vUf859DHCFi4uSq/ut2rVXkwSCk1ZtYdILp9nRQbBK
         I5PTs4Yk+eSpwf3CprIBJCnLIDKhsL1jbA8QTddtkOOrgf78bM/ejfo5abD4ZV5leCyx
         lUePTxwb59h0nt0F5z4zMs+EPLitTGejj6K52EiCXFxOUoO7j/HZLm4Ewgt4ILFeyv4w
         XOWnvbA8zHBFCfuYcVVwe5XwkujAsv7A5OhKbipDBS5hjtaIcfgUUSFrbYqq4BlA4lB3
         YfyvODH9jRUxkTsF9NiY2cN6qySPZB6SDe465vSD3ck8ksg6RjkrKB4Hb3jwKqq0QAL6
         zDcQ==
X-Forwarded-Encrypted: i=1; AL+hErELov7oGzQTrKRtUQy0cmvstgk8R8Wu2NhKIcL4NDDUC5aPhlXLHemIBOD8lIZbeodO8zmnnw4VOU8w2Rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dnXy2sRYfc0rsqhO4gK7Zd4FxVpBFtWxuHV/o3f94N/OkbhjN
	ao1IcLviECmP9Mu5JDP1jRRanguYqLSNaXfsPu6HSM2ehYYahiZpjR9J26eGIikhnHo8exNK1K7
	tDwU/lmc6Eo3/x4bfNqOTdJAzHsXmv1XjlmazzC8QrpOW68Rq1uVIJVyzmogH6WLRgOk=
X-Gm-Gg: AZFdTZf8oDPF8nLsWElqxD9su2+65lMUYVs02OlsN6t7fCn1DaGKBp0ncd/ZsmQa73M
	GnndcZ060v/zV01b25QR9hYlIdJmKxb+Vyw5VScdVH2KahTFiPZLl3ijM1xyku3BH/mqKzObqep
	DLg5xCcNHxm1UpsO6+e9380BrIj749SHhteIxcBv52G5ggYgnGEbV6QQw/zrfXVp18JQ7KrmdPd
	wQEf0SSKFmPEECuCrb+u4OmhO6Ac0Brc2WBto0mrQeIWAOd1/H2X1VYnYuHdwJRp5aya28+qy2i
	yppfLCseMtkOyumO3OPiY/YjhxAHdRM/o7gSy0f4abee98NW5doLoZ/HC4urRJa+YPyJHF30XIW
	x9hWJu11O3yKkQAhCOobt9Wll2MhCInGZ6YF8H471kUYhclkIppY3zxGG+vHeMg4L8ud8KyN72c
	vD
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12572071eec.36.1795451551210;
        Mon, 23 Nov 2026 08:32:31 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr12572034eec.36.1795451550583;
        Mon, 23 Nov 2026 08:32:30 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm3867956eec.9.2026.11.23.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:32:30 -0800 (PST)
Date: Mon, 23 Nov 2026 22:02:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6375: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163221.sau7phw43zc2mo7q@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
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
In-Reply-To: <20261123-rpm-memory-non-wc-v2-3-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX+XMJVgAVOchb
 gKhj4TjlpXrcGPa3bsUYZBSkKzTnGOBr+GXi7XOWruS6njXS03WaghUrUsdC3bhCE0Ig5oHgi7y
 xUKmRGrMCI1aNTHQJ7d0gIrtA+7ymCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX5ddnQJrd7/wo
 Hm19S6K1cIJaeGdH2YnXkR8pG8ix58u08CrGhvJw8I4I2gp4uo0M3KVMslEbXG+nqM7j1qh6OgJ
 qfhXjUBOI/xnvalQZPTwsABu07uizPc2AV+g1Z7BmzbaZEHMXQwwMvC/xvDES0T0Yzk1Xt756o3
 /YJoH72/J9mxZq732JYpilr7ZOvUbCpG7Zt2AQaGgyi3X1YgJ8kcul41o8k2+JG0STsegFFsW4T
 6yrTuS+TTyHu5/0X18qKnUFOvFlbS0OH7jjBfjIRovLqf0nU8p6CfkZXBlTeZPAJAlFRCcAclcc
 1iWDP/awpETK/xSGk1RhccoRY0hIOFxmbRkPPUWU1UwflM76gInxJtjodxgcOoYprTuV2CnJJsV
 ovghU8NmrehQpLpKQPHwUlFrD+PhU7qHtVU2rnDAVO6S3UD3ITOS5kRXaxmv+fsXVfFW8g3ALcR
 QwhxQZSRBRJgpJg9abg==
X-Proofpoint-ORIG-GUID: ELXN4JXX4FBMPmOmjCRqgKKeZDQZrz-x
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b046a9f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wLgbqfl3iQV84jYfjRYA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: ELXN4JXX4FBMPmOmjCRqgKKeZDQZrz-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:58AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts.
> 
> When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
> and the write-combined mapping takes effect, so such reads can result
> in XPU violations. When Linux runs at EL1 under a hypervisor such as
> Gunyah, a Device mapping of the region at stage-2 hides the issue, as
> the stricter memory type applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: d3246a0cf43f ("arm64: dts: qcom: sm6375: Hook up MPM")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
 
-- 
-Mukesh Ojha
