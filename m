Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595084;
	b=btOM2OpaulIlhcQwOT7lwB6lTT7ykaCVE3AeZ9jraF8Rae/Oz08E2HcOhm0svrPYTOC9
	 dV6+d/YiqaONqePn1DSO1wVB+/AD395izPavLC5jIFX6zlmQXfaktPFEff6XqEXqSE1IC
	 HdX5sWTrjA1UqmfC0HQykjKhC7/+D1zb6ylmjH9qoriiUsHEPuv3tQmBXzvvJOxZ+E6iq
	 a/XxGipEBnWJzmdmDia+cxvrUI75jhbQ5e2axCV12cNojUnG/dwHs3aHfV3PLPag/ItMy
	 h8lVucPBATbF75o02YU2GcqXW6qJderNEpCmHtYc9TXucdnesP88rh2FjK82QE3UQig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
	b=UzHdflbM9C8mEz8vAgu/FTco1ADVW3QyT7NrE6amQ7MTad9+YdrZwGsKcARroz0ZRp8l
	 lGiwqCGlKL0MF+GuA/mJvAsibieK1/on8heztYD5BZbYkBGKh1QqgpT3HosdO3xT1WxDj
	 6jcmBs639N85L5gun7Q9T1+5Ie0J9jC0PrkNsH8z50Uqfr55KH10zIBKr1fRCBUEMJMtI
	 FPC4hEh7gZ7RU7JrEfhe5k/GkUbBX9dAck6XdQDq7mejRALUAcWRAF0PC4OIlefjDt0PX
	 Fs5MKn4iTtg4JXYRFa8TdAgiOWyAAaHVxt2p2RjVP+66g3CyQ1LlfIZ6h3BdRmlt7Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E75606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E75606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2h9MJoW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iCGSPVEd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68aQs3142819
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BdM9Q/xl5hWaDb0Py4CsOxN1
	/hp7PbnoEf6nigrne8Q=; b=O2h9MJoWV/AfAtR5tRhLdiOCEPlZIjiYRe7I4wFZ
	nq9SUokANCf223aBkVUE3agc0E88bGY1LEAtBMpFPh8GWQkWyuvI9UP3p7bDrzfL
	X55ukqheYvA3VMcRGr41rL/17jFLe40l4Lp2dH2r3Olc6aXp9fT6EtFKOnnGBEI0
	tvgn37zO8/0lG79RX1c1qvTJ5ninhyiNGwIWy/4xUZXBOujXn5CteKLRFngfRWVu
	FYpP85RYCAbHxXfHN7CAW/rLDcu6kiqCRozmU0pi75yAYB+fWcz26PUHpla//phZ
	uE5vnGA5KEKmc2Mury7FKdGlJHwPfQSAWRXB1wXCEjK+kg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29r6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:24:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so273355eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595081; x=1796199881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=iCGSPVEdUzQgFEinM+9YpBoWPAecyxV5EmdXArzqiwZfQgvF1BRD1B9IQy71e1+QJl
         YT+xjLDmpoj5aB15NRY2KYoEK6aNc690JcKbaTQ8MiGDlb2CaOEROzSIYlW/9UFLJWQi
         Z0d+Dru0YoaR5clZ1QgCJFwkbV+OernHAZraMhK9s773cVulKiZw7ZIGlFE1Jq/p9mIo
         EraLUHo+/oD6TkrTlA1P8f7gXHO1fWmLzkzkvTlZ+7guRv/Ko6vvR3sJkU+aNfTvtArv
         cI4O3qjIdqpnbYnEf784SmB8swWtLZDcyjdTOQnadcadvw46XozbLsNDVEpRY6f0pcdO
         Bm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595081; x=1796199881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdM9Q/xl5hWaDb0Py4CsOxN1/hp7PbnoEf6nigrne8Q=;
        b=bgq0sFi6W4+AA3lJoSW+BuxTDYXtFWY8dQu4tWL33vc2NlxYzW71YFLEjVShU0EEIj
         +isSmdrItrOTgY6yxSet5Upsa5n+RWckvBaAnSyeeiE1aVxXu1JHmnWo+VhOZvhRkUzI
         chy8da4QOzEtXTOwQ7+kqt9waYtJIjAnVidW/6RPIXKA+szkSWOZlppAkv/LmxiVnZr/
         aiDvZE5cgl5kfv08Fa/vkNgAy6z+6RiCisRvc6vu/ypNKAq9zTaVGHKsC0VK9yercepo
         XmwakogLuSlCXwes422V4eweksDzhHKqDhOwfHliJMCU9ERh7yyE4WsnujYWow75g6Pv
         mPuw==
X-Forwarded-Encrypted: i=1; AL+hErGF7C3Ci42q8XmTRLQ25uT/JFNZdgtjdWLH4GGNXEbWJk0HrbQpPVS+Y8AijVsi5wzBO8GD+LmYB4tpCqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pVj/pMi3LnFx0i/9xFnLEpPXbu4EDplCREDN3kT5u+XweFtRv
	1JXHcJCMhPnQW+kKk7T+Ij4QobeQoY9xPA7ZivUD6om4hTfesh2et257J0zPtBQBbVs41a/+CoZ
	1I1vSv5u2cZMa9uHtDKOzEIu7StOrqdJt5pXbkeNzA7Unka3iEhpmw6mg7KnC/T702W0=
X-Gm-Gg: AZFdTZc3rmEQt5CGsjVp9SEZmcTBYS/wPeLhhhe09GcxkhqZtvNdWjcHq4yjB7hwtoa
	F39cGa5nRkE9exkpCvU373fCrlAK35EiR3m/CbBSimc1fKqKnIdwM6iNlRckBU60RzZbkISjvgx
	reOae6uRhwvIlSDkiUN7we8HylarZL/zFJsr6mxenOTdvZStuIc5lngsJUYiMxdULtIL86Xlwx/
	Rdf8Ohl5L9eOGJWdHMQh0qz16gY8Iz2xbsODb7gT74cpmRR7qqE+q9mqy82LDYPwVz1KNDP1+p6
	YTu0e2FGSSRHy5XahN1YMrk3Gpijnuo+3/METOst5ghMWtan0QogIckhcOe4OIZAleThIQhhD/Y
	GH3a0Ss4xoye9xKdAm9bjP6VTJa+TEZQPGr6Miw1d1BttmIwSyMpy+DCfrvCe1OaNxHS9CWnOOM
	yv
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029657eec.34.1795595080901;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
X-Received: by 2002:a05:7300:1899:b0:386:b6e2:9fa1 with SMTP id 5a478bee46e88-386b6e2a02fmr11029616eec.34.1795595080217;
        Wed, 25 Nov 2026 00:24:40 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm48573083eec.16.2026.11.25.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:24:39 -0800 (PST)
Date: Wed, 25 Nov 2026 13:54:30 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
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
In-Reply-To: <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069b4a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hsWotPrWWJX8LXFSPeoA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 0WQVt7gsnaTg5vElrCqTvSgyTujD6n13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX8LOF/kC+AG71
 JBfeQaueFhZB+XA/GakIoM8QiC/wS5T1EHEF22o0G0t15S2CkeWnmg+HjecAekQLRq938H9dC1x
 wBRbHfN9iWF7tUkINGp7N6V+MhxEjJlE6x3mnojBl8wpKX1czfgo70TZv0sdAMhGclny0Nm2YhK
 h8amCgkVCc3/TqNy7PbpodmdHNoej3zHVAw9WlIvQCUe3OELPGsRXV/WgdFaN3PLfZ0j7WWNTnh
 D/9/cc0e/6gBN9gzOwA7rlnRl8ih3vtCiTym/qGtWHlrd6SI5vQJiI7A4fewY0D/fP93Yky4slq
 BhbzTSl9KaQFZ4ACRy75kYlRdXwQNS4pxm967WakRUrMwgrtxrQj2Kj99+EXorgypRSX879dVQd
 CnTNAX0HlorLTiOKjHBijJ7oM7lgPVbworOIb6mvb5iHzjszI6LGSkQIvxFsuGmAKeBmv71Q/wo
 5NKyrPQCc3BVkDuz6jw==
X-Proofpoint-ORIG-GUID: 0WQVt7gsnaTg5vElrCqTvSgyTujD6n13
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXxF/2Snd21HU0
 k67t5DAdLi+0jSlgvFvCEmWECeWH8mGCb8I1vVPjRJ3NWlWzXsWM6eytN306CMY0hynaS+ao5ql
 X1sSvRxmCe2Lc5Sz0FZhBQONF7fD/1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> On platforms where a hypervisor is present, all Secure Monitor Calls
> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
> authentication SMC to TZ, and upon return maps the PIL region and
> triggers the co-processor bring-up sequence:
> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
> 
> On platforms without a hypervisor, Linux drives these steps directly.
> The SHM bridge infrastructure required for this is already upstream [1].
> To isolate firmware memory in its own Input-Output Memory Management
> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
> is specified via the iommus property of a video-firmware child node in
> the device tree. A firmware device is created from this node and mapped
> to the SID.
> The presence of the video-firmware child node is used to detect whether
> a hypervisor is absent: when the node is present, Linux manages the
> IOMMU directly; when it is absent, a hypervisor is assumed to be present
> and these steps are skipped.
> Extend the Iris driver to support Secure Peripheral Authentication
> Service (PAS) on platforms where Linux manages the IOMMU, by creating
> the firmware context device and performing the necessary IOMMU mapping
> when the firmware device SID is present.
> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
> @oss.qualcomm.com/
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Looks like it is almost two month after which you posted this series,

So, I posted a series to move every mdt loader user to move to new pas load API.

Please review this as well.

https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/


-- 
-Mukesh Ojha
