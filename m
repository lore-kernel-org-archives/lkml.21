Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782595;
	b=A+8ZeZfSK3iaFvbfDrfGzbAITovZsbaHJdgNnqT9sk5ncTpbLCkZz/7NQXAoK0sJDNvq
	 5g8dkVxyZwlhe+NDH/8HWaDF+fi+13Vhb+Is9QMfNV5rBvVdeB2M+SN3ZIE4aUDH3hGnf
	 MgX8eF6BP96kqCF+ExLaEV9ElBATVKsjzU9emycZFecp8c+0snUAWdhQOAYq0wjOSgbNC
	 MsUZTpMOOU9l/yFSXPMtRXs8q+oS1dfQD+qCjgPWwLcAVzLIYBr+C6z5uRju6mzS0Akdu
	 xgAYymjgq57KqnSTOIpgtbEiJcZ4YS3OCX1u+kT6j/rHv6tWg5EWonNObtRPThFhDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
	b=YNHXCWt6soGy5vaNvV97erjj065K7U2tzNbgekckKAcilYC9V9a1kAvzfwweDkzFpfd8
	 UYqMFrKb/qMlVbVQ4e/oTs9We8z2pJtK/qwcRhfazVBb8eZ7/OJXgjdF04aroe2u3T9iQ
	 Gm9h9bW9GefZKjkV/L33Lx+xw1GICmMOpdPaw0EMq0lXRkE3UUtAe86eUv6a2XGpBNVE3
	 wzDD+HxpRV2VvSkzldmosf+EK6jsVs6egIoeuUmSb2Oa4KMwUHs/t/esM50OwnhHN05pa
	 Ju3IkOFkJ7NhQxM+OdO/iEHNJHtMN0w0Cfz+oe29A7uX6WAw030A+QjT6BIWbKdQv9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn+9XV1y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EppFsVea;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C2C606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C2C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn+9XV1y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EppFsVea
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp0NZ1961818
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=; b=Kn+9XV1yfjnhjYAM
	m5dYVj+P/eXoYNTYmNSJH1qNZWewfhkm0SM3xTcVKOtag+RrHL9id8l3DRyn8Q7O
	2ONwELDprTsYla/i9ui+1TVLcWQFbzjO3C68qFgbHOcXBUhdy0SBMATrvTZUSCat
	CTaF3by6QkmdyMSPq6b0f9hJL5lUDTgvcJODsXNUuGaL/iDqEjdFjI4l4mnwK2nm
	92kOtxtb+2P48G7jk4CXiEccoPlQVaiXwduyk4wLe6LabqRTFVIaEid4GDF/WSSI
	eXPRh0CAwhZI5q+LuVJtNKN5rM5P7CZuyrTI8MTdLChjDt0Rv9YbLG0a138evwZC
	Zp0qIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu0jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:29:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so3943215eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782593; x=1796387393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
        b=EppFsVeaV6N0nyrh8SmbFWlD92Twq6ri8bcseH1Hw0ClUXbUdIDXnx/zhICNljjxhn
         IA21YypzKDFON5Zp6zfX1ouDiQ8pqNO6Hjtf2vbYPTmDOjnuxThEJ45u2JtaSqxlhd7C
         dS/VtGZI5KK93maBCqh9fWx8UNk/y0XK/EUhg7wP6bBPFQlAYglAenmT08JEqbzPXYT7
         cKkpvwBDM3g1rlqRU9sosv93CovAQd86dJdaaG2npd12uSl2HE4snBQzawPdmeerHNCa
         xLX96uvF5pNFchbYqxa0A8KL88t/2g+ZmoN17EG+7HrocVlGY6FkOqYxC6WuAyntVF/S
         k51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782593; x=1796387393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti4eSTBDmZFdm+uBFFei0a74Hc85Zmg8P5LMfNCYnHg=;
        b=ko4mMmAIkDtaCSgRkw8Vqoy1aW3f8p6Sxy4Q+jbFDyX91WVkqCc1R8QIDulKRT/YQm
         1yyOq7WQX6Tz5354uM/kQGYmBUf0SPcz5cSRqD+lIC2L+/bFhCunV2ruMaxWUrjYWz0t
         LSb+Pf5lOqXrP9XbwCWncq7Pd7NYwLPLUhRd8hC0Y/V7iOsBlZbL0L14EpVxYxIoTXnA
         YpOn+skpEIAuaAilmPcUp0P7swtmgOeC1jb8prYWBqMKBj3yMf+nTDtWyBk2ZkzvJvgS
         5Xt92CmRR8aj9GktwFN61f1qRPAYIoS4XcH3KRFdnHJ/2qv/i+j0bLsN4yqnK+w2JcX4
         hFkQ==
X-Forwarded-Encrypted: i=1; AL+hErGBygXq4F4d1y/aTqJT/eaK9oqORZPjqq/EV/GTyVlBKmLIW2xoPcyna6GwEfrkuXA+Frps0zC5gb7X8vY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5hySiofVNQ2TNXrD4E9H9B3FAGCHVBWswGtL2m1+59AadIwTW
	pRs6pu5Bokwu6n6rGgF/F2fV7RTnKKz4kUbAjekJkvEvVfY/z1aYSLQZ36pOkZtws2I8bCpqkpy
	GOUQtg+NNzp6OomYN/bvWrS6CiDtp1UoRRnDH+GWXUuAj3QjDiQ9j/9mathjfviRLPvI=
X-Gm-Gg: AZFdTZfshzP9YdI9mfC9Ofr9DpRVeGQLP/u0Ff7bKk1B402pEPOiKBciG1fsaEg+EnK
	aIP3egz+GwRW5FWfyLuHrbmBK/I8opBUnb4L7ML4y/h3TpuDCNQWje678Asz6NH5GG8lTXo39wn
	LOk4Qrh5iHwGw9Riowj97cH31ZDsjqHXlDjVsprV+1JU6HuFpzWWoH5F0RRB3N/6ANl/hbvaXeb
	cUefkOhd2350OssgkLRZTmBe+FdR6qPho9vRcBwBdephlIO/ba6vuRGecYsmEA42WcPw+LY9d01
	mc7UQMmFT/5tGsMxMVmyFywo/djdBW8fnphr10y0n+aJ5Ay5m4yVT/GkayisQEndPrA3YM3bqWH
	NzHDgrMJ8gazIVX1aafnG4FC48gKmN8Ky514fuPB60deIBSL1hEmMEVUAXHcioD4kyS9XyExm0X
	kO2lB7MA==
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr31457728eec.6.1795782593328;
        Fri, 27 Nov 2026 04:29:53 -0800 (PST)
X-Received: by 2002:a05:7300:2156:b0:386:42f5:37c4 with SMTP id 5a478bee46e88-38642f53d72mr31457692eec.6.1795782592750;
        Fri, 27 Nov 2026 04:29:52 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm60695792eec.25.2026.11.27.04.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:29:52 -0800 (PST)
Message-ID: <042b79ad-6036-43de-8157-752db5d7734b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:59:46 +0530
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
Subject: Re: [PATCH v3 4/4] media: iris: Wake up blocked clients when the
 driver is removed
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-4-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX7d8vqBlkjWIv
 k5wL+JB/Fu3Bx+Eo2EIUqUmZQXHwaEboq96gxw+JvMsyq32m59qCxTrV+MhSxBwnBl1EUmOtsOv
 owPy6qgBuN98rd99RRmFxkXaKwx75Mw=
X-Proofpoint-GUID: TVP0iV7JYufVeTjJfALlNd97tFbh2z1i
X-Proofpoint-ORIG-GUID: TVP0iV7JYufVeTjJfALlNd97tFbh2z1i
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b0977c2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oO3DLwcLetx5d5aH5KEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX8VrFGqAquFWp
 cj70nKkMwlBk/syJmo8jwEgW+o0vCagCZusvjAbKd7K1PIksQ+9CRXBIJwldv6ouwr7Pwuh/QHA
 hEdF7Og9lOrStlDLbQliv4fnaToSuPVZB0gohbMWMpQkLnJjBg4tRYB+RkBOBBFEzBSgtM0b5gX
 kM1Gx2L5vgKbztIcWfZyZHyO03J3mlRXgiiCYzHJusmfkH+pWoBTvkWhGoWeEB4r4jqBn3irxuH
 gOnGYn369tKOMRjMEbK4+YNMvmELjOLH9+hmMArKrdJMUYaue5GuVNJZbSFtvzBdn8NUo6HJ3eK
 eH4HMCJ+Ze1vTRFcWUPwW1k07exzkLK3aT4vpTk4dilVuQlDXt8ke08Adao3dTV148NhOzkc9L2
 +EMPmXr+5z9p2nbJLsVeJVw1IRG735Z5ESW2pcmxcWlJ7DfVw4O3GcuPPfraE0FubgEzpT7apQJ
 qnpqN7xHNtDoZmqnDjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049


On 11/19/2026 5:15 PM, Vishnu Reddy wrote:
> iris_remove() does not wake up a client that is blocked in
> VIDIOC_DQBUF or poll() on an open session. The client stays blocked and
> keeps its file descriptor open.
> 
> Flag the vb2 queues of all open instances as errored after the core is
> shut down. This wakes up the blocked clients, which fail with an error
> and can close the file descriptor. Skip the instances that are already
> closing, as iris_close() releases their queues.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
>   drivers/media/platform/qcom/iris/iris_probe.c    | 16 ++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vidc.c     |  5 +++++
>   3 files changed, 23 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

