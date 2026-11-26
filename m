Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682281;
	b=JF6aC6Vr3t8uWFhASjzbxdvd7YLcqYm+xuTEeILoF0WPuLVuQpe0DWMjQ8uYlFRqPUYH
	 0NdFys6USV+zuu2TeV/yeYm6NIbWQBBA9L+y9xGmCCPdDOv8bpez8p/n985jyiiWAKD4z
	 ITd2rLa9IM4qj38vjZzkdB0zTuea6+hJss7lycsSx9Ey3yAT41Gm2bvRI1ZcyXGytcuKi
	 QJD7z0PHOWpN7TTBgY6LDCDHWSuwpZylwEDnv5D+q19lKmHLwo96kBVI8jenAalwhXhnu
	 PEQkPHCmEFGDWadu5EJLU0YPRf5XH6yUQQ2qudkfkRYlL2qbaFRwwDpVBvkUOjhXFWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
	b=2IiU24AogiYmJfScxBVw5reo0eYsAGxSD42+KR38Dplgio+eVF6Z6hEIOXbqjF66uheG
	 eWtuj27nWRl0nRp6ZhoOSUA5q/Dgm3Z1eVvignyc939+H4eRsf28VVI3EZj3ld/hL4qZV
	 1655yBG845RRDfVadYpgz8CqKZaV2B9y9PF/gUh8Pq6bhhCIyuFvSgxCnhGHxhiDCo3Kk
	 4+8iew8OuLs2BWAsLMDM/+eKnR9zJTIMv/hHWKlf0ZIlgvSIzQwHeBK5j27Nr5ygCxr55
	 eyi9z3Sj1j9Ibqj64lobphDCXzFh09alyQnC1dhxp1lIbNI8B/2pkOQNtG57JJsWbPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYh90MYQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GVTp2J//";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9303F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9303F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYh90MYQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GVTp2J//
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3MP2210807
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=; b=IYh90MYQ3BooydPj
	lmmICp9sjXDYkua6k/s54aDqw+LTxDcRg6AthdPfGBeBxL4bb/fragqUeC9pXY5y
	q2FSXB7rRA/jLI08D+1qaw52bMEV6YeYEzA5Gl1jp9hwjzJV2FcsWnlizajRcpAa
	eNgzdTV6NYp9V8OQAVYp3ro8tmrrlNiVyJUjeZOR6nGyfIpqCLVFHf5O9EXmW/SR
	urSHgK63WakQeerxufqly3AxOWF+C59i22XIOTF6fvExOqecSVF3scELaNHrmsIt
	dLGl94V4yDJFrm01BGUr7UzhXn9kkdjPokYedGIT/L1WuMUtFr2TBxorERYe4QAP
	fkQRIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfa2sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:37:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b421417c3cso5928282a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682278; x=1796287078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
        b=GVTp2J//feuTS69QNBIdtWZlI9YhU1jyLoSSg+8YESjbOyJ9UxuuGNu7LfMtjo7Kb/
         k7hIFnK8dRZZ3DJLvwtdR25ZmYjGPpTn1o+Ay3TIkKTyCfCxkYM9R5mP7HLVNMDlGRue
         QuaGrjDipztDkmO0n+X+Rr0L09r7GNryypj8kGAcXXi04nrHvKwOUlNr9n1gsFHnKoZf
         yvqAstp+qrSNG1DAhnAGld1xC55yo7FqipGZKBNSW1x0Z1525Av/yvcjQ/M6o1CDZ5jb
         znDUnAVHXVOsTN9Anfb/hf2Gx5FkN0PhZW9S8ISQqjHUsvyxstTzLqWWN0oTN88L0lM4
         QRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682278; x=1796287078;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFKEHfBq0yH6qyz5rw9rWrDAF+QnfM5yr8Wb9TGOvFs=;
        b=X4lRMYpI/mUU+Q7YIZaDq6heGWXDkhp3MxW8uM6rv5Z4+ieBjhDhdEknYrX8C1c4rE
         bXjd9XiylE+UCQENSelzcH4RobMasESQ1DV/5ur33SyjoaI/AmI9p8b/dlJ26Nv6qAW4
         Mk7gFOLwJUCP7MQzxqa7deIUGDMh2ilrKDLtVoOOnSMo65J23pvYlgjEuxdRz6B/mJPO
         wh0z9V+TWzAqrGs/sbRiut3DFcWXnixEJlpY3ADlbgOK536E/2wotbI6h9ZyW76cOz5A
         GtwhDir7nNiNyrU0bvohiKnNvVORNJgh4HbVtOEOXLadiedi8gn2J7GDOri/ARVrlNv8
         YN6A==
X-Forwarded-Encrypted: i=1; AL+hErEpgtW083rOr5QWbOwjRvpR2P9kL5jPvfnDxogLFpqwfJVfDp2G241KS2Wqd1pAvH3CzNQeo+/AyRXFqfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ISirEz8o6+p4krndp/s7R1kDskJN5o02htlbNSrwE54VvwCXD
	83wKFsAaZQ18Kk2Pr6TVtu3O+igvy4RMfvdRsr8+TdTu4GdC+aBdnOLXMX2CvkcKDFRLkoE2zwH
	P1KbQeu1DBE61qdooGX3+71/FRf7+MK+eEDkW2NUH6fGhvJeVNnJapxdQgqpUcHcbteo=
X-Gm-Gg: AZFdTZeTn+LT11BgoJ+QoNWUG4Fapvns3vOOyh4qCpv4XCHxDrYINWntd52Kmkl8a3L
	N+f9JyRR9qE/iAXJq7XvKsWWcM5H15e5jjgB9qcG3bx758SeS83FHGNc1DcNw/M0latWaX7rLne
	xOD0LOuQcJ+PIzXJVIsUrufZ8QQAO0xOjcbD4m8XncfgJbcCO6vjBOwJa03n7JZ+8HmnYWV7kLR
	gurKzHzdf96UrLuY2J4bwWlme9HOb9co37I+gr6EAlMRW+Mpzzu9a5VW5DgMNxo2yRzdhOppOGJ
	OmPlUYXFJ9xTwLoUfCQOjRzvHQsi6e3l9TtXxFVV+t7BgRdDbdYsPDUKib0AaBfop1zRfQ5XpI0
	4Kco+kte851YJu9LHbV8eC75hyXWlurchyscV3cTZHA004fEdPjFoKhrfQggZiXrLgChBvaRdeu
	p8HuPV
X-Received: by 2002:a17:90b:5289:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b41c92c416mr21023353a91.42.1795682278191;
        Thu, 26 Nov 2026 00:37:58 -0800 (PST)
X-Received: by 2002:a17:90b:5289:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3b41c92c416mr21023325a91.42.1795682277617;
        Thu, 26 Nov 2026 00:37:57 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm4170993a91.4.2026.11.26.00.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:37:57 -0800 (PST)
Message-ID: <6dbec0cb-ac36-41b6-9a8b-12da800222ab@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:37:53 +0800
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
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l7i4OFR1GI9YCOtqUBMc13mkGikTGASg
X-Proofpoint-GUID: l7i4OFR1GI9YCOtqUBMc13mkGikTGASg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfXx2fKLqvdQQFE
 nsmkDHJGE1c/bAA51P/xtevpjNNmctmWZOEaGr3+cqtfv7VPkF1WaycYMK8J0fvy37YKEprHz8p
 STkyPJ7XOHiEHpn3hrTz1WKU6vjrocc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfXwrVT+8QhM/Hd
 b4eizMoS22fxMKtfAVmlQVF8KIu4TvDSBTqeOQIf9r7Zl0sy55t1jaVhO0lICZk2mg741TuyLDN
 2IyHFhWy2XICyuod4SuDyoJNH2djs8kd2oNCSkM1PBOsdyKYhZQdCvenx1FSAYmA+qnyQs5NSeI
 s1ZcxkUEPkFvW4w3rLrqnDuQkvALE2C4mJPHJ5YmWj5UbETUcIsJ33SUNlVlKsACDD64km1T88d
 fb557oZV0TnsprsAaGfS+csyEKof3I8g9fpE+C0pOXNgUqVf96WyGXDQma3G5qRlmkSSBiPFe8i
 C88PGVKgtSGqq+RHAPm9fVp+aZ6L7je5shqYUHTs9tfiEfuwTIHkFN1ayIskX6N1UombJnodic7
 e9NLyzhmupM1y1hE9TMRi8ktYlrPTE/LruaKt/0CoqrPSOW68ttGKBigncAcjbPJFkFBLm+YfGI
 fUfeg17+sKDFA9RTPUA==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07efe7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QFfjU7qKHf57nAPH7roA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033



On 11/20/2026 4:41 PM, Kang Yang wrote:
> ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
> schedules wr_async_work. The SDIO sleep timer also schedules this
> work, and the work may re-arm the timer.
> 
> The current shutdown sequence does not prevent this activity from
> surviving an SDIO power cycle:
> 
>   - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
>     still be queued before the card is marked disabled.
> 
>   - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
>     cancel wr_async_work.
> 
>   - ath10k_sdio_hif_power_up() does not clear work or requests left
>     from the previous power cycle.
> 
> As a result, stale work may access the SDIO bus while the device is
> being reinitialized in BMI mode, causing errors such as:
> 
>       failed to read from address 0x868: -110
>       failed to read fifo/chip control register: -110
>       bmi communication timeout
>       could not write board data (-110)
> 
> Mark the card disabled before power-down begins so new asynchronous
> transfers are rejected. Make wr_async_work drop requests that raced
> with the state change instead of accessing the bus.
> 
> Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
> during both power-down and power-up so no request from an earlier
> power cycle can run during BMI initialization. Factor the queue
> cleanup into a helper shared with ath10k_sdio_hif_stop().
> 
> A dropped request is completed the same way as a written one, only
> without the bus access. HTC messages go through
> ath10k_htc_notify_tx_completion(), which lets the endpoint release the
> skb. The IRQ disable request signals its completion and leaves the skb
> to the waiter, which frees it. Every bus request is returned to the
> free pool, so nothing is leaked.
> 
> As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
> non-HTC request itself. The IRQ disable request is the only such
> request, and its skb is owned by its waiter.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index fdf19ce4b55b..f0e1feacb629 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
>  	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
>  }
>  
> +/* Drop any requests still queued on wr_asyncq without touching the bus.
> + * Caller must ensure wr_async_work is not running concurrently.
> + */
> +static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
> +{
> +	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> +	struct ath10k_sdio_bus_request *req, *tmp_req;
> +
> +	spin_lock_bh(&ar_sdio->wr_async_lock);
> +
> +	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
> +		struct ath10k_htc_ep *ep;
> +
> +		list_del(&req->list);
> +
> +		if (req->htc_msg) {
> +			ep = &ar->htc.endpoint[req->eid];
> +			ath10k_htc_notify_tx_completion(ep, req->skb);
> +		} else if (req->comp) {
> +			complete(req->comp);

In ath10k_sdio_irq_disable(), irqs_disabled_comp is on the stack. If
wait_for_completion_timeout() expires, the function frees the skb and returns while the
request may still be on wr_asyncq. ath10k_sdio_hif_stop() then reaches this branch and
calls complete() on a dead stack frame.
