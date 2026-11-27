Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788451;
	b=2EkzeFVoVNBSwOQ6VP0z7wmxcnslHTCfhsJyUaT2eSLDI8w8ARgblW6X7rAL3SpHfaRJ
	 xJ9i1AoaLaH4rQELRntbIUE/6H0gMKheof71F8Qm8zqtw18ad9GVLOQlDh/9vdDXqpkVj
	 +hkTD9oa3k8iDfIo+sCC3U858M6moaTyJST2y2CgIaSQG1Smm5AAwR6gTaPJghnmOfFbu
	 BMkQOL/JWralXc83QgaQifhK0Z7LQufVGVLfWIvo3PK2fKeBRW7uX5vpzozjMUcFByLKB
	 ghfDQdnFTlp76ZUGCxW+XUBqXwTC+bxb4YkGH0sc2+RozpqlZ9CvWcszKkLOvBBEjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788451;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
	b=BGDJMCe/8wjKYY5nnRvxH42H7Ne3KnKP4HnRVMFhvyJF7yf2M84Z+Uxhk/wpl5khjqHq
	 6AlIf6jXfJdPk9G/UDbAXZ/YNdMVv5yVp5uTRzXC1u4JeeGZ7wc9MvUklSQSqXac2FNTR
	 41JDoG1JIkSVumWaObMMZgP8JQHcT21xJIvjTDHOUZoSUvrxJolleqXrHfw4AzSyDmbBC
	 3Rv0Vzl603Ce7aqjJc+zrIEVzQmQ/u+0WkqSnlUPBp3gQB870jEsTlqMya4sJdlJhVT1B
	 /ZSgQVFEq+alOX8f7DIC9Y5E+SP3E6kYkzn16+zkCFo1Xm9mXFDFve9Sq8ts5YTWvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMe7A6H7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xnv3NMK9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD0606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEBD0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMe7A6H7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xnv3NMK9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Ksl1462572
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=; b=bMe7A6H7rINkNX6B
	tJyA9vfBd9gPTs1oO/dYBnZpI3HzGyk7uzG12g2E88LZkqyOjF+LQiFT2XHonoe2
	zNkZnVcZxmGmWfXAgNOH5iTo7w/m5scnVAqaPbLWGXoSUxYoKL+smb2QWB6c05m7
	GD7Tu1rnekQv4hKH9gO06IDsoFiX9WN6OKmKrWD9kiRJfbVeYAqpcrQqR6Qp6Z62
	BDxYiLfTLKvNCTiWYZFe3oGrmfM6x/ef59MjmJshz8mCBFx061w1XR6iou0D7G5w
	HyBBSR+3St9M9O4cItvHhIkz79YUml+ZeRma1O+wPVpool7OBLn9QOJ9gKxu4kiA
	usJXlw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqm9tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b129194aecso176598eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788448; x=1796393248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
        b=Xnv3NMK9Eiil9yGrafgxmdi3RhQ70D0RVMepl94sRnyPL296QYn5DXXgrf8Lu8g8ee
         qJHsWOCNUb6MWl0NLNjB1DTyGtUZsEoT/cr2Bd+01uOW0I8ZF5ux+tTpBXPuS/5eMgHo
         qZv2V9UMJbMu5JKJeDrv4aAHboXQxCBsVhKevoek1NG5UXgitayd+RikhAXfv/1HnIvR
         QeHKcmLNLozsxfjLkf1iEg/xw8cNtba6j4uklUkDNaXSbtuedBnScQESaLSDwYffVmZv
         L6ym6yPX5NGWKV33s0Ux+RETCFMETHxOiJoXVUQB0tRH6xolpyJPdjtZ8ixvLehNeKHw
         Mmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788448; x=1796393248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
        b=iEg7tl0TtS++JAwRGmkp332DB6Jj6Heu2ljbjvuATGt3slJf1Qddku9ZB6thAZaq6e
         1jpir9UWv5fX0Et4LpJfj/tJHVF/93iPVFgWSCP2pQSp4aD9YbTHEBVd/0VnlxsOcT+Q
         J4LraquQPy0QKbTFG9FUKPAtJAq5veLZ8AfiztW4c9S0/484VjJSF+c8xF7qh2Yrg1wp
         Z4Od9XsvXmULV6lYiZCsoCWklBNdHunqPmn7ust+l166T/k4kUdLSxHbxtbfb5tvBmI4
         08GolnHiZvrWp1P6lAVA+rs4rj/GZnbFdBQzhQspk7XvLvTFdz4nQ9eHn8zG47w3KnqB
         oZwA==
X-Forwarded-Encrypted: i=1; AL+hErFEJTDOEL037aNS5BNluC4qTdHOU1AAF6Rhf2l7d22bpQrStEYKhQMYK4ZIusgLfDESRs5dnO4e5QZOb6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uC1TT+Ltggtr5P/R1BPDexnQGH4iuR4EBx4t4Oz8V6O6zbjUU
	umIohy6qMmfOoCaB4MDW7NfDPTqePSIoNrFGz7/6wrh2a0tve8c0FfUEEPPx78W/Gb570avoppu
	44EhJUSKkv8ulxaIQaPaKuDvsddtxocPln/tSGbwBdTQAoJJ7FzpRjNeRQl4zIM0CVLU=
X-Gm-Gg: AZFdTZdtHb98KrWPzPeNI6BZ7mQ3d/KUBtZGhsp1UIuc7fTwcd7P3tf3U218qsy+TgL
	SlUmHI4kod4Nydu086Ch4CRbBG//z/xASeFUMrFWVPr5R8STcO3Y7MU4MSjTJCBVlCWVRu55M7X
	Ec0dpRgE2NngslbF++3EPYqWOdWlxplS7Twx/SlqWCM4RskPbIwqMfzn55We6uWcDnivba7DLjV
	IQJexJoCQiLJ08nVtv4N2Xo1UlAr1uLZpMcBHQGqAYZ3IANgOtYBLdGQW9M68zA4oHAhfOTCpYo
	WYWOWyLtntJ9OXh25bsyrQlBPOIeC7vdtUfhnD0RHWK1smnlomXtfv56E/Ag1A6cMtARAZjsOrB
	Ed7ruf/2Lsj/TUnPcVo4r0NBHukcGkyHVfYDAeJih7ZHfiFZ7M2psqzVC/OI3ysoJflQw1s4=
X-Received: by 2002:a05:6820:c0db:10b0:6d9:f62c:2698 with SMTP id 006d021491bc7-71b392f5007mr22283696eaf.1.1795788448193;
        Fri, 27 Nov 2026 06:07:28 -0800 (PST)
X-Received: by 2002:a05:6820:c0db:10b0:6d9:f62c:2698 with SMTP id 006d021491bc7-71b392f5007mr22283631eaf.1.1795788447720;
        Fri, 27 Nov 2026 06:07:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0776edsm6211739e87.73.2026.11.27.06.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:07:26 -0800 (PST)
Message-ID: <da7b034f-d1e5-4e37-bdf2-22364d5c045c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:07:20 +0100
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
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AMWXV_UMKpqNsmxIWSJcMErOjYWLLtNI
X-Proofpoint-ORIG-GUID: AMWXV_UMKpqNsmxIWSJcMErOjYWLLtNI
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b098ea1 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX00/OYbpCU1+Z
 aKVwCkneFjG7e5peHEblVrJlfLFG5HaB6qV/zyGwNqQEJwNWdyKFZ6TH5J2KtXKfXg50z2QqbJO
 rj7QvEZUjE1Mh7kj8AW70jVX+a3d3Rs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX7BAjB/VRAvAS
 H+OM41f1o9OBmvF+9ojWNNyiIm/u0qjUll6RIRD/3ATV0kARXOW8pDZhapsMBUx8U4WP2qHlLx8
 dqB1ZkqTl17gpfJfhiFmjuBqtWjYfc8e788PnWTuYL/nkmKunJXGEaB/DonTZKuYd6/Ox+fvto0
 dDz7MsEdm9Q+BPfwxJqcwENiOJiZmQpNdNm+1leEMqlnHYu2+T+K//+opqXYxl/cRyuk/D9mSE9
 6bklg7w2P0/cENuqFUmlgan+2IvxcUQL6rKC4zRw5lrvE8lDv/6WbwBTRh7PUmlWFabWEiAibsY
 r+ZmfwgeDHvf/xjYWru5hUrKEzbFAsTT15TWGYufZ9MjYuxRiTEWrz8TOaMWSUDj3fB6gnuPqZb
 gA/zrZiwJTV684ENEgY3crPAwQMfwpdMhzzOdoP52rPdJ03M10+OSe076Pf2GPIIT93MiAH9LJX
 iawBNE2j/3YIHiHI3gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
> 
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
