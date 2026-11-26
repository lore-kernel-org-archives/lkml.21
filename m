Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687322;
	b=LvUkdv5DNz5X3/yOkA/1bxMWStU+tCyESHlNhslTOAraBWYjhwnWI6tCHwsSEaGGnxQ4
	 SkQeRrdV7gK5EW0bdh8Oxl0W8MKt8/xiYdvC5zi5EfYqu/pR6mQkymLmWRCHweJawnrx6
	 /xYszsJaxJSMiKF86p32KicqkW0a4E/6k6ixhVwg343xI7gYxT1FGzYDuKvae5SXPw136
	 NGIxem7CgBksN7Ohs966apLuRGDTxfiFeoZvYNpP40NDwECZrnly/3ZBPYiER9pwESgCP
	 jr/tIwqnBOFWly7uZ6YdaPGAfmHtqAMUY9GocD62zHcXsO46FdrVBxRmAIQBIll4eAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687322;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=;
	b=iKmTpsjTEGAk+QBTHnLXBGVpIWNGKmYlRsr/B4x4OBp2XinkhH+cYIhD5p3r1rmyFfDl
	 faUx5/arHxuaV3WDcaZ8eHJ8ermlgdA7EaJz8u+A8jvjq2RiHG2CH5/idRkKKectfZpEo
	 d2jNKzmlEBNRQTgcUFc8ECOPwekDiYPWZi6u1o96nsLRzkO4tGIs95ZhNDs8pDgecSv4K
	 mMF1InVUURh9X10iN126g+jp+vryl5iTc7O2dziut1sKB9RIW5xfrdPXbLhOya6PWgrrw
	 LYXhyNwrdLM/qlpBUzbCLom4kBx0mUNbXyt6dnieporot9qKBSwkmwvbGoLScQuy/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIqrv1xi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMrKUgpV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EFF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIqrv1xi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMrKUgpV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Av422594863
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=; b=kIqrv1xiKm1lATnb
	V3fIs0LfKN1tWvpn+Rzju90yECmLYbecKJ2+6MwC6tPyzshP4iadV83QlBK3JWkA
	PUYDegmrQaMzgaUGIvh0nUqpUT2RtUg3FuGgYKIMayuoRCNmhw7H8yarU1/TogEB
	f5fSGSYPZhDS1NosH774tDGlEgAhFYTcd+01I1WGapWjETTrArTzy93VwqsrWYd+
	HWfg9tItIPomUiOuIrS5ITSC4ZoRhi1CP1B3ecT87ie7OdeYw/xjcirAIJoFRzfa
	e6ItWlW0vA90G89BgyIp/1Glhrq6mZNaPnL60mSyd68xgXw4/eHdGZsJem3DgXi8
	HmuV/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sakwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:02:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb96533adfso4172682a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687320; x=1796292120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=;
        b=KMrKUgpVNSvKBZBU26KkXl1m73ufmqI2g8ILiOJ13u4eH/H6Jbq0f/6VurtoqYNFkS
         lxT4FPDSb/sHKGgCeEr2xDPfKFmQwIZFQXkF6H+3y3wrYS9HDi6n6Dx5SxSJLzMF46+l
         lLB2kJ/hETJkWUOaV3o/mjS0+wXUJ2+qAznd341XnxvGmq0bjguLPHL7CxPZ4GSuw5Q5
         cipyv5WnIdePi35ZTtLQi+W7mB63zNRSWG9cIcdtD4AyrJITqqIScudI8IE8Q6Z/nq5x
         NtcCygs2EXsmCoip6lqvuKGQqUwETP5HRcoQv2z0KhdxlcML5QnpjTCW1J5N1se/8nGO
         pw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687320; x=1796292120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCeVeR1v3tRG+6HG8mO/Yh755lPb9lEu3E7k4tsScJU=;
        b=QMJxYJyysPfMB4NygtdUEJPeknwv2lKgvhAXGTR17csYftxH9mYZIKRvq/cuALSbKF
         6mJbjsE9xZzM3bpnFmFStV38KsPF7AIPqFuS//O0L2ykQQZYx8YuyxzAUGHCiVhm8HPe
         UgmBNi+zo+CPtmzPYqcAiVLpX4comqWnC292Sy/FBZqJ1Aby1enxBF5DKsCnqOcKhKFq
         ANavIW7PaB4yqfX/ZGzK+BoVPISwF4MaGT3Vn7VLMhwHZbtMoN6OrYPRrCC0x4/NHKkS
         ycUe7n0c6UiwJD9oI2Eeo812MLXgKy1LHQLBH2NSdIppuZtKntsgIgKOx8sLa+Wm/M70
         oFpg==
X-Forwarded-Encrypted: i=1; AL+hErEEoydr0Kr8PZ0F9qcYg0tlK8zV2c0froT18Zo4zEHSE9BZQJJK00TmHDacQcIwG4CLsq3EqocEEsB7sNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B2RdOivJaJQKLWL9YAUQjOeJrW6WCQCT0j2sfPYCcxW0MPefa
	z3oKZoSuq2t5Y6C+Stwdw801e06dh8LblJBzXLqsQo35KmzLklTjr2PzrSfy9a4GMZcYfLljecD
	ncfTx+XLQiw4C4U9Q+8egmbbHWqEQgnQw2vNAbsm+Sv3Fs/dIoOtySvYTRQjzGuLc6SA=
X-Gm-Gg: AZFdTZfbB0nUsdPBCSAkhBJczPIBNyuYcdY+sKIFFrayGSxFfNbvDqhs5UYbibPCMaz
	A8a325YnynbyG1RzOVHacn539ka+JksT2gQiJ37PfOM8ohazhBHAZqTO0yRrBpN13Z7RqPnPghk
	iAXdqHMuzxzgYuU0p1o94QW+9tvZRuK3TIllORGYdnaXB9p1Xt9IpPaNB3zxOIPH7N/B1k0wxTO
	nBPhJcOETgq+gbvYjROvlSRgFRwhQiqqfzm4y/Gbh855eYqSFgsg7IU1Qaoiqt78d1Xqw5dq/Dm
	+mR6BvzGVLLNvLU5qr4TUxgqUVnZMOPnhTqQPEoPBt6evOXPT5D6spAdFvQM/Dve718iTu6Z0O5
	U7sIPtjmM4eYTiwfgSrWWv6XNrT/wH8rwVGUhiaZAAeGK/bLBfH7j7B51199N3caSoOi1pg2Och
	fNkBgT2Y1Ntv1X3PWzbZZUK+aUQnfDiV6LN+DJb9v5
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr15845863a91.58.1795687320316;
        Thu, 26 Nov 2026 02:02:00 -0800 (PST)
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr15845831a91.58.1795687319727;
        Thu, 26 Nov 2026 02:01:59 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d002a77sm10286301a12.16.2026.11.26.02.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:01:59 -0800 (PST)
Message-ID: <5a38be6e-09a5-4955-bc96-190a9ae33c2a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:01:56 +0800
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
Subject: Re: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
 <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080399 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2bedrVyz5QLRwlh5c10A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: gp5wj6ra96VmLeSkBC5OaC1PkDTEEsJ3
X-Proofpoint-ORIG-GUID: gp5wj6ra96VmLeSkBC5OaC1PkDTEEsJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5O+H47eWfd2F
 1lLr+xN/5Rj8fWDdRDNLAKxA2nwRyy8Vknkfh8mVc+Cy37BmbcYNhrRWQsDXPl3T/rDINxA9bRJ
 sujoaQkMqSmcdzUtZ8A5BeXuNj0p7dmbH5Q1Jpi83+7olEgLu1hO42sMh3b9Q3++Ry6Ka8kpgN2
 CMM+wUWwETiyeQDB4BE/N1qr3+KIwyWKBwa4riKOFpV5MijrCPA7MW4ywnNHhcu+bK5jvxjShNx
 qJqnZdbT8xfgzt3nyXCDXXc4i7nilTdYbDcKWolpDN5puhiLSd706G7NHvXibIJLwac7VH+qmMh
 fOloSnQniZiCst6/kjzD8SYzXfh570yeWyYs7S7C7QsOqQbAhZcQgrEqOTO10AlRX0TgzvhOoO1
 jn7a8zVJPCpeCRg4ospz41aKukuknkQ4lgYE+ZgFH9Yq07D/JTbGMZNQpr1Da2sEenMKwmez7F4
 4+fu07ccJiszmQjXE9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0zMu3LXVNAJZ
 43dCE/+AsRRniZ36sClEpxRfzWp4KqazPKKp8Ed5A/qEKX6J0tbyQTnIPZLEKmpZ2yZhOaxLMNf
 Yk5bQghMHJ3y9wNiCQprJtkzpwCW0ck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038



On 11/26/2026 4:37 PM, Baochen Qiang wrote:
> 
> 
> On 11/20/2026 4:41 PM, Kang Yang wrote:
>> ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
>> schedules wr_async_work. The SDIO sleep timer also schedules this
>> work, and the work may re-arm the timer.
>>
>> The current shutdown sequence does not prevent this activity from
>> surviving an SDIO power cycle:
>>
>>    - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
>>      still be queued before the card is marked disabled.
>>
>>    - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
>>      cancel wr_async_work.
>>
>>    - ath10k_sdio_hif_power_up() does not clear work or requests left
>>      from the previous power cycle.
>>
>> As a result, stale work may access the SDIO bus while the device is
>> being reinitialized in BMI mode, causing errors such as:
>>
>>        failed to read from address 0x868: -110
>>        failed to read fifo/chip control register: -110
>>        bmi communication timeout
>>        could not write board data (-110)
>>
>> Mark the card disabled before power-down begins so new asynchronous
>> transfers are rejected. Make wr_async_work drop requests that raced
>> with the state change instead of accessing the bus.
>>
>> Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
>> during both power-down and power-up so no request from an earlier
>> power cycle can run during BMI initialization. Factor the queue
>> cleanup into a helper shared with ath10k_sdio_hif_stop().
>>
>> A dropped request is completed the same way as a written one, only
>> without the bus access. HTC messages go through
>> ath10k_htc_notify_tx_completion(), which lets the endpoint release the
>> skb. The IRQ disable request signals its completion and leaves the skb
>> to the waiter, which frees it. Every bus request is returned to the
>> free pool, so nothing is leaked.
>>
>> As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
>> non-HTC request itself. The IRQ disable request is the only such
>> request, and its skb is owned by its waiter.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
>>   1 file changed, 56 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>> index fdf19ce4b55b..f0e1feacb629 100644
>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>> @@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
>>   	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
>>   }
>>   
>> +/* Drop any requests still queued on wr_asyncq without touching the bus.
>> + * Caller must ensure wr_async_work is not running concurrently.
>> + */
>> +static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
>> +{
>> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
>> +	struct ath10k_sdio_bus_request *req, *tmp_req;
>> +
>> +	spin_lock_bh(&ar_sdio->wr_async_lock);
>> +
>> +	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
>> +		struct ath10k_htc_ep *ep;
>> +
>> +		list_del(&req->list);
>> +
>> +		if (req->htc_msg) {
>> +			ep = &ar->htc.endpoint[req->eid];
>> +			ath10k_htc_notify_tx_completion(ep, req->skb);
>> +		} else if (req->comp) {
>> +			complete(req->comp);
> 
> In ath10k_sdio_irq_disable(), irqs_disabled_comp is on the stack. If
> wait_for_completion_timeout() expires, the function frees the skb and returns while the
> request may still be on wr_asyncq. ath10k_sdio_hif_stop() then reaches this branch and
> calls complete() on a dead stack frame.

This seems to be a pre-exist issue.
Got it, will add a check/clean for this case.


