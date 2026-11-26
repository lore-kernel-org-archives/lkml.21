Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706665;
	b=3ov5N0JO8kUx+Vt9E+XFWVUBh28ax19dL7ttqBBTnQi5tpNzBQWvKwoR8sRWUmpTkszZ
	 qWOgP8Hwws35bfXPi8ZgSWBxaROLJBktt0JgDYjRQrQIe4pXF6OhRN69LBJyYHKF1GL2q
	 jWqLJ4KAlsBJ4byCMqfZPTkHqN9KvVg0b/N1jjizwkp1wHdlYkgwBekCvVr7MFzkwCPdc
	 QvONSIGQ867Z2Z66TatK98aPEEIZnkW1xgcxDdv07WJAOd4EDkzaLgSB++atowvzBTPPk
	 mJPhjvb3fD2dk6QHrZhpIpHx3rwUnWWdGWdGj5g7kG2kL3ipjgWh6qY7rTYRdtjKPEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
	b=1haQB+hXPQUPDfKIYVb8/WGPMEKdCv/qXuBlxrsq7jw7nEtVYO2VdWDf8LshkIktHfXe
	 M5AxlxMWQqVrX+AtiiZ+TTDYQGTozCyvTP8leUCi9LVtOgoLTS5Jv/ZP8O6WgRhW4SHRZ
	 H+9LNK7dnwEx8xcJKc3w9lsUebRAUZpdaPN/HgGwfHPPSzPXXMNidZygbQstzuu/3D5Bq
	 0PvkC8vwbmgNkr30BcsLj1hDCX8LIVdB/iKTVIVP2sd3FVDhiTkARS0EvVIAR4kq/oA0d
	 xMsUk+Ric4Fk+8Dw4UvrDsataOePv4+MkW9UEOhLzz/uWzqJiUF9kJFvMoC88Xd08+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMZn3wmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECnW0BvP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE31606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE31606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMZn3wmA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECnW0BvP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV1VL3170405
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=; b=HMZn3wmA0wZXV+co
	kEEjut5SBIKnG2l8a3tc0xXzgztLSWul/gruZ4XlZRK9pF03iIRt5qCK7iXnp3mp
	gHm6XD/2vGq035joUC5QBAxbk3OgBsUB15/pZ838ic+KFyATqel+3QbmsAiXy2K2
	i+jersnRlrp8NLjGlNIl7RE87mNML1FUUPWu5qU6YwonLKxE0riJTRFM8G2rcMST
	u4axiocEu6OxJujgj1+i59w4egJPevhilAgCGF9KzN+nvu9txF1xvzo9HKlV/Fra
	cwDpPa8qceF185j2aXZQAtFqbh670YVVb5ChPQGGhzMRddpqHjBFS4PKj9ccWeWv
	19r/Ig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbg2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:24:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so65722185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706662; x=1796311462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
        b=ECnW0BvPj2WJs8CFhKhE8CLSVmm+PMeOpBNHgOLbSLvhO6Y2Pk5ycmEXxAitFOtGgI
         2QASRdQKskkfQzPEQqTRy4qaBYs4m2iEofsMy1BzY7z1LjPgflkG5ijgkNwyJvSPE2mq
         +g9VJevZzDWSsWyXA/7iuufzhVhIISqS+VTEKzk55IbIYwddwdQeeDqgYOMYZkyceAzB
         gIw2Ewt+LIhfzhrOgLjLdpSLhkrixvGk9wMAwxRHqwCOJlAGQolyCNaGULaFYmmjalZY
         mS6Mbjqx1gRyZE2msmiugVcTNxIXrutQOZJqfmj1hjSwJzSANikCl1A3jzzINnq67VOR
         Iz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706662; x=1796311462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
        b=WRQT/gJyTH07QOTlhM+rxXFAgCHhP7aurmHvvoHbMStL7DBWQWEKQtF0xf9yCEucGI
         2zXVhQQYSM6mCj4HjCv5ELUfpo5EbYEimiETW9OfOkFO0CMC2HdNX8oLq91PdPXgcvQ1
         VPvKqQdAz3ldibAvW+NKfyRxwDR6nrH+DWoolUrqpQ/R7eOUMpay97Fvj/9lqFWf60DM
         +tgH5sSnY2hrqbNvEBd65dK15SgMSk/EGBYW/bjMDfG7fTHcGzxJLD6IOusGHFdClvVJ
         RPBnG4afKYZbTa9qlxkUo0S6UO5J1FZIcjgodqKmopaEXPoB9ermNnLLRbnaqVTm1mjQ
         kiSg==
X-Forwarded-Encrypted: i=1; AL+hErFQBiwkfLvdfLPc/q/nZHfVyxivbd2uqh1CbHm6IkY98C3suNW77IR4DJoLvznh10/OeGOfYorRycPU+gQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UglRoEKn7JFKmLEVDwoPdQIzO2D4lK24qnmHZcbIMZ45ZnuKq
	QA6B0eRSBxige3cfM80JNuZnnEcpl1oDcA/u8xKIj1xrMdyzbSyK1xvpRb+U0DML9qC6Tew45Mz
	WZ3HGOyy26DWAyChhmwQ+JDKeKyx8mdkfwkE3/qWVf6QNZFnwGhRipvkR6i5ZagzfUv8=
X-Gm-Gg: AZFdTZfI0wVfaqj2F3z6XBJiEb9MUt6niK5u45TjHUspcBzHwabBQYDnIcmJMLRtQzx
	SuOgJpfxtqo5Nsk6NTe9DSfQ0pjkoCHNfSmwxvY21pbxY7vBlirwkjJNAkbE8Mh2+aY+gHxgQ0o
	DzkDxYS9WIJamKKRERhT2hlxwgdicrZdhu2e0jytFjzy5EC74s7QLp0W9Weo+0Dnp2I/n5xJQIB
	6WUSIgHIRz/qTUcl3rxB+em7BKU9PTLOyMuF5pSgwUpcSbfgy2jSbWBHAK0Bo+VtPFEbpP5ufn4
	qFfMnrysqxrT6Lsl2JrhRFnaoYoHyoY+OmqE0tpHCsB9LdcwNyYX8XRAqL7HCgq6I9OFSs8c0Px
	QVWeNlagxekVEOIzCFQZD3YvW46UgGi+Hmfq+dTef3g5h/eBikYzGaBs76kyZjl69aXKuDU8=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3540534185a.1.1795706661792;
        Thu, 26 Nov 2026 07:24:21 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3540530785a.1.1795706661313;
        Thu, 26 Nov 2026 07:24:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm744107866b.13.2026.11.26.07.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:24:20 -0800 (PST)
Message-ID: <9bc0e617-6840-4be8-93c9-3a4429bfa3a2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:24:18 +0100
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
Subject: Re: [PATCH 1/2] media: iris: check the packet size after reading from
 shared memory
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117204946.21359-1-dennylin0707@gmail.com>
 <20261117204946.21359-2-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117204946.21359-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nx4vWCRH7YTLhtyyHEwm5Mf9yXKsQQcI
X-Proofpoint-GUID: nx4vWCRH7YTLhtyyHEwm5Mf9yXKsQQcI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX9ZjpZFBso0Zi
 QCuePGX0ROhuikWxF+bqxINRm7LWP5BEsJKTD/BozqAaQBEsnZb5KYqNqiVbCda/ZEv7hkX3+MM
 tMQnOUSk+TNbWfTOjwCRd1wTCHivq/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfXzaUVTEwbLWgF
 2/FxzsCvtTRYdQ22ZKD0XQ8iWeW35r+8i+V7NGhDsE4gvdyDJuShT1EuRTnSelmfNtK+jn64VLd
 jGg/fbnE7AezagqaFyJQ4p51rJSU2Ah7NBtIf6Ucci2RIYFzh8Oz++YVVk4MI9bYfhdQkV/hk1x
 rUGTTnGPd4d0DcE0Ut142MIJ1o4RbLTXicuKRMppjOcX8GGNArjfBX2CcLEH6mFy+pwSvGoKmmH
 q1HW9XUgrGIQGivs8qpOWRAwTjIM/Xtelrw/Hit38P8m8OjJl8IGYrW2s8jwhxCZ34HOJ9lh6Ra
 VM13ZmPlzKzqwCMdR1KK7hoZzEhQGv900wC0bIgeMI09jqjiljSdz4U8p/lusmstMx6I70CsRBS
 GhJiooQ5Jmljbwz/bWFKKzXlmvTVOpstkJZjXCpnOOp38r0UNKmZurXCKAqltawIfbPZYreCDb4
 VBrPMCiJlA6LVUtPSsA==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b084f27 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=s5JhuylEIwHktN9E_WEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060

On 11/17/26 9:49 PM, Hungyu Lin wrote:
> iris_hfi_queue_read() takes the size of a packet from the first word of
> the packet in the shared queue and then copies that many bytes, including
> that word, out of the queue. The firmware can change the word in between,
> so the size field of the copy can be larger than what was copied. The
> gen1 response handlers use that field as the length of the packet, for
> example to walk the buffer requirements in
> iris_hfi_gen1_session_property_info().
> 
> venus got the same check in commit 49befc830daa ("media: venus: Add a
> check for packet size after reading from shared memory"). Compare the
> size field of the copy with the size that was used for the copy and fail
> the read if they differ.
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index bf6db23b53e2..5d3315f71623 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
>  			       qinfo->kernel_vaddr, residue);
>  			new_read_idx = residue;
>  		}
> +		if (*(u32 *)packet != packet_size)
> +			return -EINVAL;

Sashiko has a concern

Konrad
