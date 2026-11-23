Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462411;
	b=ZrGvPQ86hshu94RNVhQNoPnIpwQkLzI9Wkn+NGc74bdmkV4t9OsAOmN9nJZ5YXQeGtdL
	 THSDqjHjf53thpGbyaJdmKHMlyhVlPRcvEw2BVycp0miZZqm/OVF57yKgMlrO95cJV5Yf
	 B0XlfWTvef+JcFANzaZSmli4/clnSGEaBFk1VJmii7yPzyCv83GV7hi/qd6heAj/YjziN
	 Re8Wv8zpgRxvh4SHd6Vi7aDPAhDWF9bPdG6moyiggaAgT6419crRgH0vZVkkpa5fO4Q9v
	 T7xDZPa97C2W/XtqR3hA0hDnZOB8+s2qdPACxcRX9r5/GWmS6w/wTJBr8TQcocAw1Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
	b=mWGQnC7RVdnpkSei5uBQ2YxzcWcNcgVK1JD9ivJCdzWwLVYuHhnUuYvVF9nv4zaVga2F
	 JVCAF3nQvljRsxxWQw52UaGEolBBw6wWy/CgOi1+Fk8RV5Qx+b0WNovJDzK+jTp8CwlFi
	 YYc8prfdJa4F2tPmUuhX4+z1hV951CufWzwPUSLp2T1sICzzD+3gXx13dwlFxBBB4FEhw
	 PbP4SDZT6IygxcBGHwWRjhi9UiOCWkMgiZwneLS+BjFQIsKGs8I3biPRuJ81pC8rmd17n
	 0AM6CfqrUH4/2EPk1ucSgv5SvN8vR2h+9hGIXr1GUoMo+wM9S8GEXvv1lf6AW8B2CMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lbad/JWJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B16606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbad/JWJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGuba2340291
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JHSEjavsqM39bkuCvnDFdHwV
	3w2gEjGXKFceSnNzYy8=; b=lbad/JWJZ23cBq/OixXbP4rSo6w/e0xsnm36Ki/+
	/HM51Zy3lNuoHUVZ3PkJybcQulJI04EEcxSgw9tGFNWpx+foTSe9TFxMc/zUqm1W
	92LK1CCCln2ZrcP6QuF9GZiZGAua/iJllR56i/Fq0JV7q1xqP7Fpp84YAPzUdRT8
	Owx0HqCj4jMgqvMmsrgYct3nE46PmYB4mz9uker/P0p9aUBYNa2RGAfqvPsugBmt
	BSyJ3lUjKHNWxz3Npz5vswwEC9OcGPu8p9nAZcGLWmhNgd49ex93dx9Ejo3qvGcR
	QGY1a4eugZUay8SX4qcbJNMm4wHxCtFVsuASfKj2bO1g2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3a8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213c7a506fso8440176d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462409; x=1796067209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=V3UJkNfvkYFEiT3bOJjoBztZaUrSNwinbxmtvpvrnOgcBK1JdpnWw3JCAvOixfqNfV
         emxRSp8KGVOoRRnvJANtA+FLzM9AA22v9hIHjw/xQvjC7295xWlTUYm9spXSXexvSNcS
         Og5ZrzoBLMPGTfpprr7WeqV6Vdh0kFfXcJblAONM35qpqNUPzmaf8OqE1BcRTXMRibnj
         xYoYNG39bkvp87ZoMiL1MOT75xwd2m0yqzaXBgPzFs7rYSRKFZD9AZE8fT7goEK8FToY
         oTk5O01rHcfND/Q2sG9+/AK8VmtQwu0TK0HpL1UDRcpIrbxhBhtIV/+Di7M9iziPHo//
         a79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462409; x=1796067209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=OVVNUcqxCMOPAV3VnESQaM9xyUeYuZvaNHJBwLI8684wiEjl57wOANgOJbaHQNZnP3
         HfAsU9xMuuRPxgmqy2nu3AfYFG57Y9XEHnVf19YCjiWhUxLAKi6tRy4e8OpE5HYNYBCr
         fUF5bRp85NUW+ft6SzaibjEcs8S0cpUdh1khF5NTZY3crVzfXlrrtp6cwpPJl4ov2Wzr
         oDi/7pXTCqx9/b0j3zE0lJYwvJvLdS+8dJyBV+P3Vzxc9CO92TRh9B+N20iOvlTQRzVq
         NI8hLlmnTabU5c0DOir6Q7Uogs87VMB0mASvQt7VabcqbfsOHJqjLGmWgzfkMZsFzXEU
         Wrsw==
X-Forwarded-Encrypted: i=1; AL+hErFrjPNs3040LeHFqDAsUWAzoXv2Bi9ATFXGpoJOu9q2m/F/GOoiUgSsuR+X7w+z/1VvKODWLCcF9SyXk6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z92EdS34H0Fl/+eNmwY0bZieAauIcNMcnCnJVxt+4qQlmObXhYA
	M0bplDnABotlyLvS4wGlmUVOq72Xxd7POcq3zIQWeQd5HO+eDHduzDwUXPd6FgsKHtKvEgTHn15
	xW6GOMdcMrbwehSoUc0OsUcKMYCPyZlA+ctdI+9jbpsvlozzB7ymzQuSEt67i8PxVt4g=
X-Gm-Gg: AZFdTZeLNnxX9wSI7z4DRuw/fIgw8Sp3HmcjtZuZHAVuRWY6ZETiKNcvAI/tDatou9H
	lObSGKwpsynls3gwK8lf3CmsiJhlzRvVqz+NRITztw3VdcLY0MBjQTkuX9jH5JQuvUq20EeGvXc
	VTWpnSqJeFs4XzeXEvs/J9hlv2+MvLEtXdAoVoDUYBn6MOoRtbdQ0pS/5vLVMdhoKE4DyBHeLO8
	qjTDAojbeRF7AmZLGkhaIROCS4KV2KUmkMKgSjW4gWu/wm8f33g/dx8ridVHMlp7sj/FOEN70pu
	uLs8dk8Rt+21TMlKN8TlKSqqvNQ/DG7auXIoHGHB33OxwikwFyIOFZKL1skevy0MB7kYyyV5aZi
	Xs3KPzI05tmEvH1xe4HZeJomDwn4gZ60dp4Jd3/8Ma8r7uX7/N5ykJvmowEjfoLZr
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962698785a.0.1795462409190;
        Mon, 23 Nov 2026 11:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962694285a.0.1795462408555;
        Mon, 23 Nov 2026 11:33:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm153451815e9.4.2026.11.23.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:33:27 -0800 (PST)
Date: Mon, 23 Nov 2026 21:33:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <hlj4ucudy2shejlwc73qtviz7yasoyfbcrkp4dnkan54tgzru7@tfdtsgz2zhck>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04950a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 8kyyhdfFECLwBMvthhsFnw9k8QWFHLbU
X-Proofpoint-GUID: 8kyyhdfFECLwBMvthhsFnw9k8QWFHLbU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXwSM89XAbnYPg
 las4Lb4yD9v1LbA5pDEiEDCzPiS+4Cjn4sGji7ch3cVbCqzdc3wRSLbPbOiByjgeIjfkhLbEc/q
 PTpq2maF+ld8MQrTe9JA2kWgmZ21Q8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX1u+AafPizaeN
 MTm5PC5g/DBp0F+OwYnzE8Yj2Q7O2m8gI4V8O9YLYRLaeC53LicARgQRP8NVMVrRJUVePQOLYwd
 Z6exQ9aMO/7UHj9YmODYZQeU3CX9vXlHHotDPovVCNC0soh5o1CKf/crF/JjwWaiU7c9o2sixrZ
 6Gt2CbO5dsl/GUJk/1FeTb2yGYfKX8gCyQUGZ6qiWSFthaSqtN/YAmuZvyhLVeDqaFaGjIpONYa
 NNV4AR5O+ms9AeDb0df2QjDeNL3q2WUkG7k1TmDlTl5bzMh3rRcEN4H1BglEHfTXMKyuihMhNUI
 HMhamkUnXEh7893CzVhGEeJcOpg2suYlEMMtPA/L07V/apuT8ZSFS73I3MFlOKgYTdWmhrCJO27
 pXoADaZV6li0ooZWeLrGWMClRt1Nhtqk0R10C042xfzTs99k7TJTrSqdkPFK+YQclANk0FexgqJ
 dSraF3/iLXPERBnW8Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-20 18:50:53, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
