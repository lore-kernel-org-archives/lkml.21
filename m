Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599878;
	b=rqLWUolp/IdHIoHi8bIEocW2U8n6owb4L2JtzMHA2JJabItm+YKeyYcgAQ0Y/T6W8Xhj
	 9NfaNeZvgrjdA/NfbfPBwsNakDbef4+fbOw+YJiHqrNXIvx9V67JpQdKudVcqVwnSqO3A
	 16HGBmYV4QkkYSiZo2GtW4tJ1s8MMNge6H+RqmYVnB2IR9I9rdn/RPlk2YQngtAskrXl9
	 ffudn4H+jem3z/Ufq1M2/BuvwaHEeuLtm3OG4q9APPfb6n+kuo7Oyw5SiUt+7TqbGn0kY
	 TPl36jYwrntftKKg7n8hHybFrjysEgRmrk2KUPuEZgVrkSUL/NLTJfPEbLh7jW9Vqlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
	b=1IjBmE8FHiUoY/o0H5vJJrpLhQSnSO6chonssKskbzQG7TvyT9yqyaHF50oU+k4Te26o
	 Esim5T7zBbVIlfULs8w1yaz3VzXVrDiFB8BmLMyzAdiH73MOmlpUZiem/9DkOMG8iNFq/
	 zJMg/iX7i/qvcf3lQBebW1q6gs1L1mL0WcD1EyboCLQti1Ae3f7OQrVWCpmV2Rw1HQ9Fz
	 PGSC028rJlsqFTv8pWiBTM3JDIbftjmy6yNebQP2VBNYZxSsl4zi6Bc+tTa0tS/wg3GJJ
	 9qjTiDPu5YTZ1M16ShLyF6GcXWnf8JFZQkqaz5fffSHjFHoDsC1UdIPassWY+d81aVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXqE6E4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaErge1k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECE9606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXqE6E4g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaErge1k
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ioK1861076
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=; b=PXqE6E4gJOEQa53p
	QdVVWNgKbTdBI5rp8j5cXrl28agabwFVxBDjOkkRuVBAGvYtXcJ/t7WCT6f7y8oq
	63FEnqEe2/Q0AcB0KdPEhlpuuthwKJRv4eoAoC89hvBzAXpBxiLCpcn0U6HKGYXu
	AUao4fFsmRvnnDwvguuhcGTxsi78hFNwVHBA70ORje0JA6dXK9P72APCHxWg94pH
	ybzxmnYXLmkQLrz9sPgCTyXQJ6VEtGfB7KmshZyM8YCxVXe8nuU83FEQ2v0VYtmg
	f1uFID+BjjvEf1Ftrg/9SAsDvGugMmSeoAKmA91ycpe1fNswKEoT9u2gPZyNd/oy
	UO6qjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69vd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5476f5bd009so18955111cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599876; x=1796204676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
        b=HaErge1k3+8mY5mz7X0xKhNMXAbL1Es6ljsr2Q4g9eRb5ujVRySZYWSCUWqshG3ZuE
         KFGU7NlV0GAlOaQsTTpIzH2r0djD5jzbxqSbqkgjnvt/1CV25tCCY66SJ8907KLtotE2
         N7BkAkfBvlLywDKpGr6g5a1zDfPcXGPsTh798ymT+eZ2WOAe6yeoZ2E+6CE5+qZErhS5
         eV3bhQBAy8SYyH2VfMlVzJ9bvfy7SxsnQyr12H4KTR3fXrH/pkfqK9Xe631XgmxKFqQz
         sbOS3XYc/fq9th9AbYj9U4cp+yQ7ifl0oVH4zYizbNGVp2iW/0+rIO+u4/vjBSogOt/A
         bdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599876; x=1796204676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
        b=GG9iAfluwz4txCGCC2mMiQCJcC+4AUSJhdciD9En8YRecOYysg3MqahUQwZmG9n9tA
         PeTvaQ6Zw3DBfjkpDsELXhEeKk+3Sj/j0f0t1LI9OT5vQLjYal9d/gE+0QnjKSh68Qv7
         HXy+WDY1Fki7EPlMsL2wJcYtz5PATVa1B2fcuQmirGC3R7ib/wNHLPMy4o+xydhEU/ZJ
         5VIrbTMeSF/HYf7aHsCXgch+IOwLZG00WJF5WFsqWDf10/7kg1AoNLSWGPG+L7g7QvjT
         B7a/HgQEcgjRa5KhfmvWPyN0iZxuI68ubU4Kyi57Ty4pbuABArk+SFbGgVSiwQ6o/oez
         OS4A==
X-Forwarded-Encrypted: i=1; AL+hErHzgTtDidRtApWzqcXhdFO0h7NX69CcflKD1sg9mM0n3++uRHbEVIu8HFfq5NRYf+xkN87G+iKi7vpDz2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9RjiDOYIVUy4l92scx0tL6Sxq4Ks8YxeCKjqGfz8U0rEqvcDE
	p2vHW8d/VLk3wZVCKfHXu1OPxYLEBm2EZwN320/ONvnDVIm8ldEaBwUpTz0yfQQeiuyIF+qFzJA
	yGvXW9n1mh0NMTbwPnywfP/hja25SR1Z+MUYaSdRHNGuGYeBdnqenukFFLP3pcWCxb6Q=
X-Gm-Gg: AZFdTZfh+xKTpNNJ4tvYJiTG3z5sqMqlPsmN/kPvd8ejIL/uVK/DGb6NQ2PfT4qw8Y9
	ct4lwTVA/IU6iNlYt/urt34uK2zv7BG0eHSA/7nrfRHipjtppLwxMd6FUrL3atVbh6UyDBsqsGH
	cxb77oB3yU8krZw8q53mlK/BOGdiqtuoOBxz3AH2ILEvhSUGkll0EV4EifS1UjUxok83ST33bxo
	YVzjoIUhAvZ1GDd6Dd6EIWgNPF56IJ9hVBKNCEXHUsoNAH1mH5LcRx32vUgqjnRkbCD5vp9MQ4M
	sBBKnS1xbKv7AtPuPV5O30n9Ro8p/rjgqK8O6qKcq/AHn51ByKm9W+xtzhHFZ2Zso+u4fovvF3v
	+TnwTZxAsZa7Vzkkr3giYc7MNYLXk25HzXWBl6ur+MJpuR5Po+825ZVoV8LmMckEdJEHMrvI=
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr14564311cf.1.1795599875876;
        Wed, 25 Nov 2026 01:44:35 -0800 (PST)
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr14563931cf.1.1795599875414;
        Wed, 25 Nov 2026 01:44:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afecbb5sm612982466b.71.2026.11.25.01.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:44:34 -0800 (PST)
Message-ID: <3f3978ad-b6a7-4aeb-8992-687264633515@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:44:33 +0100
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
Subject: Re: [PATCH] rpmsg: glink: hold idr_lock while completing open_ack
To: Changyul Lee <lcy8047@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117030509.1708983-1-lcy8047@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117030509.1708983-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vkwj4PtxxdcIhyjxE7SjkQgqqGI7OU2F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX7WTTMJwwa9ni
 wxPNnfeY8BsYWJaecIeo1qnAMtteGJNvAQl7sSdF1+Qb6/mmFj5FXrmOq18SLH7voMdI/Gt10YI
 lmuhDwH2lzPBW4gqhhOKe8NdZQeYTag=
X-Proofpoint-GUID: vkwj4PtxxdcIhyjxE7SjkQgqqGI7OU2F
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06ae04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=fTV-UkdgZ7qUFQ4n9AEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX/RFJ+Wi98j51
 aI1VYv9IPR3Pf9mM18xXK/frCD8yNLr4xmCHuub3cQPCNIu9KY9ZIKbCgFjCtJG3Z+qAsmiosDQ
 nZYGq05r1uExh5c5rfoNXjG1QT8/ZpekxnTYGB9gXLdz6+DaonJ/XtP0Yd/znnP3TDwa5ieJInj
 sSuq/vH83U8NfEyqHO+fN6CIY2O0oFShl+PleeeaosgsYa15CEU7pEMv81MPWYuDaUn2jInHzwo
 JVu6/DbMfTe5J6qPMwrBRW+bKZZ2rE9OOzqgUkD7UIE9MJi1YqKcW5y1Gq27RBnu+WjEsm9ZRam
 hhC7yidIxU52jeQK3urZWdNVj3e6XDkSDLWLlXlirVpaGDVOhxIftNQztgIlx5h9ExuiXyBmYZE
 NMSmQCBXmbxauzc0ljwvzDOpF/H8gj3+2hk06tPjQMgEBZzNJV52W1tnN+PV2RxfICKqGzwhKl/
 9LeAdeYWGG5Dl37XKwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/17/26 4:05 AM, Changyul Lee wrote:
> qcom_glink_rx_open_ack() looks up the channel in lcids under idr_lock,
> drops the lock and then completes channel->open_ack.
> qcom_glink_create_local() waits for that completion for five seconds.
> If the wait times out at the same moment, it removes the lcid under
> idr_lock and drops the last two references, which frees the channel.
> The OPEN_ACK handler then reads channel->name for the trace event and
> calls complete_all() on freed memory.
> 
> Keep idr_lock held until complete_all() returns. The timeout path
> removes the lcid under the same lock before dropping its references,
> so the channel cannot be freed while the lock is held. Taking a
> channel reference instead would not work here, because the handler
> runs in interrupt context and the final put may call
> cancel_work_sync() from qcom_glink_channel_release().
> 
> Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus MAILBOX, RPMSG_QCOM_GLINK_RPM
> and W=1.
> 
>  drivers/rpmsg/qcom_glink_native.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index f848ab46161d..862565bf965d 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1101,16 +1101,17 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
>  
>  	spin_lock(&glink->idr_lock);

This can become guard(spinlock)(&glink->idr_lock) and you can then
drop the manual unlocks

Konrad
