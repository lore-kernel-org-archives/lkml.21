Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564792;
	b=QEmO94v6NZ961ABHN895QNZJ728CxFhfV3u7PkoOnz8ZJih3en5hYl7huoEl5ec9uxti
	 5mCsyjSrH6Lo5CNuHCcTHymYsCf6AC0UOOixRAf6vJVT1R1ib5aSmE6kl/tmSblYf/bPI
	 Tw2RBfRZEP23LBYhnj7TBONNXcEFPQ6KGKOIh511FH8zW9v5rW0gpBcI5K7B29iSlgexd
	 1JH1amdr80dNIRUs3qz9+SQAqqv0xvy2c8jfhsLI8REyx8/drL6pkuf+AizEWf5HAK8Qh
	 O/AEETV75WPdJNg5n02lR7AO3f6SQiL4D1ZKQYB9twHXMYYTVrkSAkDdE2C35/6XGDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
	b=oQj2ShwLG4JaQq021QA64MNKq7ScWfRdkQdbJjC9baqbR6bjWnKvDzEMxecK8azcFxoc
	 gP2yj9dFrCZoiq49/xkwDXBYpmPga3SERQVlSJ9xFxpJkbZKlemAcFNtTKlilCQ8syHsm
	 5aWzaTphP2KHHR/7uAIXQmjCBs8R7LCVGeKvc+QyyykP1Oz0RawbYR8NCK+l+EoLueFsS
	 j/q7AUATIV5N3MbweaxNNfOK/ZKyUBBDqj6SzxjfkzyMMySbnMUTrn/StsybADu/S50dJ
	 NxNohVfLYCXmuDTJl1HMEyJRPDyLg/osJ077p5ivlOYi9Bn3BbS9Upl3Z1XE+6zaPaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvTDaTI0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1wzSz+m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82AC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82AC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvTDaTI0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1wzSz+m
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaiiP2656149
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=; b=fvTDaTI04iPBE2tG
	fT2dwxkTu1GMDapg5uyWy8BRGAZHsY0cNlcPM44To5jMPkYrRdBpEUqcu8bSIsEf
	9rLlSv3gScNWirlesMvhM9T4LRVJWij4ad5BTLcH0NO6WLRtHiL+uANnJV+dan3n
	5KjKUEEJZ+C3Im2ixhvi4jaRaZ0HJhtFTkESP1MM0erMHPhycuqBKlutRxM+xr1n
	AJ4Lj/ZbsFygB5XZ05EXlGtJhWQLZgBSKa8qrDtDYLwk1HeJfY1pWHa71i0j9XOU
	DEm8/9PzJBLysnAyalWivhojUx54wvDnIJ1yF7OrctOXRkA6geGXAPpufSFWBeFk
	bbh7qA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b802nps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:59:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so3957721eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795564790; x=1796169590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
        b=L1wzSz+mxj7v/PUNvzFmam5Moij5EPD27ScRLRSDcdHM8ymQpWRy71KTiuj++t7brb
         7Ffnc7/Wu17vmvJ3f28s34D9sTRSgAZLJr0x5UmDUjCbiM1sVL005FaVxci5gG1jz6WU
         fkE32DyvLNyLWgtP/SmcXrNnr8S0vCgwGgl0hUUQNCMoa0xVlmEjMbGCDbP6PXKO6GXo
         yzbU5jXEazksORzdnbFK4sbxTW3hmCL2Toa0Uz2OygSbFDYj2/c938lavtf6UledxQhV
         YRF6NAn0Sx+C3FZ5+XF03qmGwd7AIYXzDZd0sSOZKK9WPg1Iyz4X8s5iua6iwbdTEp08
         uZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564790; x=1796169590;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
        b=N8lYHmgK+iSbW8vtfGJ9hkUXF16llRuPiXOzfcGDQQJa9qyqyb/uT3PysVgQT5X1zt
         oTftBOFwwCjEMqmm2H8iRLP/ZK+XSfUDVQOZSs+w7qZ7Hh4fXS+nhqaXhEpbtnb6tYP2
         nsvs0GXsEgLMaxK14+B8qCeWwpL6twNPBawNq+nuZdrBFrNK0AFxK6cVMQmzakxvX1B4
         RideUSw6IIoI6pCzwM4FJtjQlVKYODNm8hqhXs+BTpTn9+zUYYfg3rDL4H8Uh4QO3og7
         fj4OD7/4aijjgWN/cJDpW1U5iSiMNdbx5K1TRXZ0eSFPbolXjn8TxgI6q5BvncaJ6GBn
         6eSg==
X-Gm-Message-State: APuU4Z/363KBPjPBpwTe5YfSUeVO96jXCiErtU+4TSUrV0tmJRtANNMZ
	dzPKe0SoI0ZZ2WixI3xZFw3uB072VDDZJ/K2cC5M21dkOVVPEnvCST1gwmRtdjpZWuXZLmgE/8F
	Pk/odE28dJNnj2s/6JBhZx0Kzrd+roqFtDjNLJkXEW4igf6adRqJ7SnOgjPmrxUcApIg=
X-Gm-Gg: AZFdTZdzfEfYLxKYoYPRPFAveVYSrKMtwmx4W29xEUhEvUTljUntJL6I5qdhzhGT59u
	4Vs9j6scoyejxBnBWmcyO0KJNfoM0FwB0UuwmEBs0Y0ULgADMeiex7iLtQPO4GF+whEqu2KUEVe
	1k2/e8sQqi71vKbdYMul3bDn0RzEm6vINaikPzbLqc8aBBF96xEDb+xXq5z3lEIQH1M/wpRR0ZG
	OLgVbPnvGNqkQ0Zq5mEQQ9zRHJ/Dn0VbzsQnkezp2ITSpfyIAJp8kGYc7Rry8+ep5XaFAJ2EWSG
	4bvvXzeCkND92nTjS4p6wqauXW0wCzpkJ7D1UC765Rnzw1HKMdJ97jESytx7hWiwEOAYs/2xUZ3
	1QJ7j/Y7Ec2pi9Htr554K8RzOV9tRLilcuqbvD2eWQxus0/T8PEHMsCdg34UgsmTnNHbE0DAzpq
	oC5F1IZPe644SaT+NV7YGHufKu5CU=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr14495382eec.40.1795564789546;
        Tue, 24 Nov 2026 15:59:49 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr14495349eec.40.1795564788926;
        Tue, 24 Nov 2026 15:59:48 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm15214484eec.9.2026.11.24.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:59:48 -0800 (PST)
Date: Tue, 24 Nov 2026 15:59:40 -0800
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
Subject: Re: [PATCH v17 11/34] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261124155940.0000336d@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-12-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-12-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5NCBTYWx0ZWRfX1MrwccueD6vV
 M68LysuXIAdcfEqU+dEr8BAkc+ETzrvKfyvMmYkgBAgLGLMDK/TMoMqvLZeeNOTktKgrfi7Diim
 WwGDxYuhulyuVAW1ZDVMAqM/qPJ2Dyy3fWiBJYyXiy98+UQzc0AH7YOK4cGfOOP0R23fk9SaW5p
 h0lLUNBV6yyGLdX+mYMSMUToewZzJjpg/nq5ziNtamHu+v4m6oyOYcsDWD7PVzSJ+ZJ3Hgz/dWn
 HMgejJtIunEtM4xGJ2Haq3FmrdwvXBoyJcevZjl14F6u3dl9xO8Ai31Syx8NtUBDF8qh0qIZIj7
 eyJaMm5lUxxlx2WRcFb03O2Hts9W54Z7ZsMEG20+PQxDRLHUYcHOJwJoYkB+AP4otBVMKfrnmhz
 7r7b87nTGnAWoEGudRBcHbJ8QqeNPZzg6f0341o9g96/HkP3r7xEI5AKkVTqgllhUHVSomavow0
 x1PJWD/+i1IU1JhdGNA==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b0624f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=AXIch-7a5tO8ZeyO9HQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: -4RLX8U2o_-7GFAm-5zmtdwDS2SdQRJM
X-Proofpoint-GUID: -4RLX8U2o_-7GFAm-5zmtdwDS2SdQRJM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5NCBTYWx0ZWRfX0fb00jgVrAtQ
 meTJkciv/0VlN9b17tcFDiON0dWMZDzjVSaaPJt98vUjgkNfHRBIjc6iTH8ugA7++He0ZCOxQ/w
 og/Eu/hQ4IoDsHen3ZJGlR45bF1flG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240094

On Tue, 24 Nov 2026 19:48:17 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v15 --> v16
>  - ignore groups

Partly... Need to do a lot more ignoring to make this true and consistent.
There are a few things in here, but key is we need the whole framework
to be as unaware of groups as possible. At least up to the userspace interface
layer where we may need to ensure extensibility.

Jonathan



> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3f7cc35eb861..f076ce5601cf 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,17 +2,19 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;

My gut instinct would be to introduce this only in set 2 that adds
groups controls.  The best form of no groups is no reference to them at all
except in userspace ABI where you stub them out for now.

> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
Ideally grow this as you add support for things. num_intervals and num_shmtis aren't used yet.

> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;

Logically without group support we don't care.  I'm less bothered though
on whether you rip out a simple support bit but if we are going for clean
separation this would go as well.

> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};
> +
> +/**
> + * struct scmi_telemetry_proto_ops - represents the various operations provided
> + *	by SCMI Telemetry Protocol
> + *
> + * @info_get: get the general Telemetry information.
> + */
> +struct scmi_telemetry_proto_ops {
> +	const struct scmi_telemetry_info *(*info_get)
> +		(const struct scmi_protocol_handle *ph);
> +};
> +
>  /**
>   * struct scmi_notify_ops  - represents notifications' operations provided by
>   * SCMI core

