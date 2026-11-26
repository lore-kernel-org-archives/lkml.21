Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681245;
	b=o/yGRJ1enRLaSImYl9s73V8eicHt69qBcrGMuM/hNtdKHnOUnPmuHnt2DMORHveS4LVj
	 vr5m+BD/rRNbMgTJ7ge/SYIOcpcV7jTwOjY2ZU+av2MFcquZ66YXmK85v/B5V82bMeR9T
	 VoMgY665IEp0EPvVoLBXO7a7azR3w3sQ9fqBgfv/MGqeueY8+Q3h2cNweJxB92nviDF86
	 ASgDLdRmm7mLBTw7vj1mmMVQH4V9YHs4gSTd8lB/6MdtmbtnLyic6ldKIbi2sr2wVx4K0
	 6b/uk0JI7rkeaRCelJLm32XHzZ5imLJ0v1qKSqp1Br1iTQqBPTGubmzC/wXKtIunT4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
	b=ivhFsuXYY5fqx7ruuoyhvJZNEQAns8AU3dW+4WjTgGu4TvETSThRlrCAOJJYWwWz5GHc
	 eur5zUur7BUbt02EoN3UfQePfO8nxUWthennbErQvfpEBmikeBpzRc/RRLMNESAHKbmXE
	 MVDNRF+hl9JtByfuWf2FFzyCzPn15zH/Y67HBDY18WnOwekyC+2M3Z8stKnP76jXF7pnc
	 WtQfs9fYCCF1P3QsfzBl0mCuJULLjdCLw0WbJboaGdFCkNZo8NoszpOhT4jZFunK3R8CR
	 PQD3aPN8HAVwA6mPGBEy+B+7NEJCrS6EVH3ZXpFpXdfG/qhFOOaS/OyLbMuKBjjK0Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a/CxQNFM";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fiYAkdrQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D7606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/CxQNFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fiYAkdrQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j2DQ131497
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=; b=a/CxQNFMriG9cGh0
	Uwrg1wb5SzG56ytKBsTmjizu7ksS/1Q0T4kwwJuAvd1obBh4CqTyVyYl1yZPcjZ1
	BGB0bbqCxYk5QEKY//XiJnzI+1COdtXkgoUqQ/njF/HxIimIG5QDWJoJ1oLHoJO5
	CjJmrh/Dau9D8pyz9SEIj1u2dXn3HJr8DSAf5lpRgOewV4Y/Ax8kdQggjZBQFPDn
	NgUIj3UFJVb5X5KitfSBdn07EYxbK8LZmUyKnJKsvAcPHyvIjtPA4Y/mNSIF78u2
	Szoy3udyy6VCumDjFWnlADcZK9aXLG/ihbcV+iJvRMJemHa2uTYw8Vv6Pn7w9pki
	1SAtlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne049a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:20:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so4797128a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681242; x=1796286042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
        b=fiYAkdrQhXrHZL6VakBgdD6BLt1rzJtI3xPWlFFF75toyyhLC4M0Oc1qUDtvpNirHJ
         mEZQDrtjdpc8MyqZFHTP/SdPlz5J78cm0hP1+6khbNjIF/Mf33GmadQ0/3QBJqdwikH7
         s07FuS2401uOFkcEmYAQXHrGZe05JOaM+jjiy0/b9zWqxAI4hx4CmDjfK98bEolYsivH
         g5hAd60PcbFizRCTsbpkdL2PVdkHVvs8eGJnJTXZrvw7GOWuM8h2eTQTqUVwxY3ENnI5
         iaRlrovXoAi7tCp6UWWjuZHjb3ufXHFA0rbX82muOdhBSLJ9AfB1r9IXr39sLO76tYjM
         GPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681242; x=1796286042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
        b=n+Y+yXJPU+CTs3F/xpnIutk01xi6gR/tzs0/Clarao/IWjbhcF2D7OhqPJO42SuMKc
         Sqs0rKrsRYAjts50tfdnACkxuz12spV0ZQEMNYRQ+nS+/xirj/yTcpeDDP4qp2k0X+Jv
         PWw2TRH9rSvSXKhhwxEh8f7yUvco/pvRkBTX5G1U3a9YOzB61G0Xk/oZIhtWQqhNxCD+
         SQdS2mYN/qeZ9uUk+j80EStNAtuWX1hFs/nstA5jcmGakX50r+yhQ47MrreDj5VJz+Sp
         J4tRCDbW+pYku2lCQrryCMcgyORPwpZOMruU/IGSukRtQOL0wg7bobiAyUFeX9jeQeLn
         Qkaw==
X-Forwarded-Encrypted: i=1; AL+hErH4Rd3rJe5Yyh1/pV70K+icC0sFQJF0HXAtlUlDXTnC71DpIvvLTGLxrAvdUQyXk5q/JGxd6Cx9QxaSRqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oqlAgzzQS9gxgR4tFOekuLnsPPCZNXJ34iP5Hhmyy1SaLwLSZ
	wmVAhLyUE2nV+DobVYzo+kGhEwu1k57MqbNQ0gAS6FqMuX/zsy1kYnwlEtRFuSDtRDu0EIE8neF
	o3sa4CjNt50C2E+VpTLtiYDUv+5iTTm9ZGiMbhPc3+VEUa70JzoZrCrcD0gbka16UIiQ=
X-Gm-Gg: AZFdTZemD+tAuG5Vy+zTqRbXv2N0c+a1XfSaP6b7CTVKqLVckDGktHcm6NjJSkdN9uV
	VwfRu2qnXE1bJ+sAdVMCfvXAhQ16lyzPuihRkHJhfb3CLZtsU8VYvrffnjYNbrF+yxyd6uMBo3m
	Hz5jHIaQSmwdVkK/Cbc7lleuhTvaoUcQLEdpf9iUzwF3O09D0d/ETQWk2qR0njBD/sgo+7ivxhH
	SRxfUJR1l9ZkUektTezOnElqxebI0acpZjWEZ3h8ITEtbq4+1gIoWrpvWAFfO+NesMQEMAAZzCP
	Tk8qH7siK3CFs7+meFgiwkBhyQPNDXclpkEoQJjmHwiXQgcNM6/GvHuWSN9wCgEYNg9gEzg9fSn
	H0WZivD53bgfezlQqVsjt4OT6Yz166RLzSdK6mBJ3mzab+0XIZpurLiy2JVkIBTQ1RixFoITMvj
	XdaZc6
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13137429a91.0.1795681242359;
        Thu, 26 Nov 2026 00:20:42 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13137407a91.0.1795681241797;
        Thu, 26 Nov 2026 00:20:41 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm34518094a91.15.2026.11.26.00.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:20:41 -0800 (PST)
Message-ID: <187a8ba4-3c90-4fd8-80a4-6d2994786f0a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:20:37 +0800
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
Subject: Re: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07ebdb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZdyoNSFhri5ofBwUGgcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX3jF08GJlBwnN
 PaSsEMoENTBaDBh1EBYIK1psx/DbXVYsrRcdpX+uUnVV6Z/adIg4TEDHitp+OvvOERoa3IiY0nf
 RSoi9aSBR6LvQnHSCfL/MXnJ4/ptiu9htkbv4V5yyO1APtNh7pgT/r5ISNx/5tgZdDeqnSeuEDk
 lWyKEQvvdJenLfR2valWHXXBAvEngWJcN3LsY9VPPiXj4UNiRHXPL8dalWoKTTb+eyOov9RI20i
 K3rAiVGl6dWmuw6dAXoL5xpTB+m9FJ71pnI/yaRu4RrG7dV/v3l7g9JRJfI2uh0qA+QG7bHD5+t
 cu6PB51TP3Hkn8S53S3WcFXPuvAGxT81JcL1c+rF8yjbk6dFfSumddItxntEOCZhw0cXsB2eoGv
 8lLyE5Qvfk/Jv9HrUXO6cqY+QLhE/8rIj/TGtJMuP+LcpMKqs8RmrsnlGuEWpIas6teij0Jb7CM
 asG80hm6a31kpImEddg==
X-Proofpoint-GUID: VTO1iaEaYaXWbp5jl3oThlqMpvaqy9Gn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX/SaL8Y1jT08o
 DrHIH4caXnqNhi8+eoznCC28itqROrb++KRGVplTgnxVz1lQC9+W3Me758RjDwINmhdc4YeSWcL
 s7Ibx61w7h8wDZeMffBeklTpkuVDWRE=
X-Proofpoint-ORIG-GUID: VTO1iaEaYaXWbp5jl3oThlqMpvaqy9Gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031



On 11/20/2026 4:41 PM, Kang Yang wrote:
> When firmware crashes, the SDIO interrupt handler may read a
> corrupted RX lookahead whose header reports more messages than
> ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
> as:
> 
>   HTC bundle length 2322 exceeds maximum 32
>   failed to allocate a bundle: -12
>   failed to get pending recv messages: -12
>   failed to process pending SDIO interrupts: -12
> 
> The handler returns -ENOMEM without consuming the mailbox lookahead
> or checking the firmware-crash CPU interrupt. The SDIO interrupt
> therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
> processes the same invalid lookahead.
> 
> Stress-test logs show that this interrupt storm can continue for
> 15 to 20 seconds before the firmware watchdog allows the crash
> interrupt to be observed and recovery to start. RX remains stalled
> and user traffic times out during this interval.
> 
> ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
> lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
> A bundle count above max_msgs_per_htc_bundle is the same class of
> corrupted lookahead.
> 
> Start recovery as soon as the invalid bundle count is detected so the
> HIF is reinitialized instead of waiting for the firmware watchdog.
> ath10k_core_start_recovery() does nothing when a recovery is already
> pending, which would leave the interrupt storm running, so also mask
> the target interrupts.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 748ba6749339..fdf19ce4b55b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
>  	return ret;
>  }
>  
> +static int ath10k_sdio_disable_intrs(struct ath10k *ar);
> +
>  static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  					 struct ath10k_sdio_rx_data *rx_pkts,
>  					 struct ath10k_htc_hdr *htc_hdr,
> @@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  			    "HTC bundle length %u exceeds maximum %u\n",
>  			    le16_to_cpu(htc_hdr->len),
>  			    max_msgs);
> +		ath10k_core_start_recovery(ar);
> +		/* Recovery is a no-op if already pending, so also mask the
> +		 * target interrupts to stop the IRQ storm.
> +		 */

bad block comment style, please check all such instances in this series

> +		ath10k_sdio_disable_intrs(ar);
>  		return -ENOMEM;
>  	}
>  
> 

