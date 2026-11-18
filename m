Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043349;
	b=4T3l205c4cWPg/i0/LdVc2bZVqH9q2a+A4FSz88NRxu6bnY52yjXZ3TJ+a3/lCavMMmf
	 X0P3EW+H+D42Cks4w7/JKRuudBzKkuqLBu7p1nmY0+F1MtHtTCumSl+p+s4tNRzLiRYt6
	 nTc4pBX0oVirsj4Hi7ek7D0+EGvId5ijCdWEjLUpVqJ4DVoA1Y6LmNQf61jG7KQQxuYXL
	 W9whJ1ngF0oXEqMIlQfBq8OfjqFCbVcK4ci+Mq8F0vSo5YMQKkTUweOWaq3n3LSH0gzpk
	 3aq6SUVu35vUsui/NtRmTsPxqmW/meI93+5qi1pnjaNGSRr3lNXcldu+Lo90rXWfFcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
	b=voagiO2w9KTdr+3Qg3JtuK8TjEkUu4PQbBMXgfMJ5X2W6+1766gFeaQjnw156MtdcbGE
	 NJeNwcZSwo51h6xSYHVl/Dmm9S09rJmazAq2+kD6jV8ESsqqLLK+KDGRmbCMdXoWc9kdm
	 5ig9lKM3LBvnd1E2Sx6RFc0NBESaLo2y/ueXuOL1lJ3viJlWTM8NUT+jWnhLH7Cwakxsr
	 XGZ74ftmNZ15oe+gESgiPSSLRA2ReMutqQXhPshmRns/J48Utc4QyfHjFkc0WeJQzcj5q
	 QaqM281XMj6JwNLGJ43D9MvqwDRWJ24aD73aMpnpo6JfY0acKK4Gi51/YHCYOoJFLeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5CTr3cC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7WqHvEh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77033606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77033606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5CTr3cC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7WqHvEh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDPdu771845
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=; b=c5CTr3cCu2FYKStr
	IDAWiyoLLMlGs24hDExVv86kk3CTt5p5KvWMs6lghByCC7bjG/bjxH0hoC5ylIxc
	8O3xw1vQO6LH6zH69oTlj8JZERWSIrYRRTUDHZFwgLeg45JWgy0RzTrI87TsjvTf
	kitnkjRvBXooTU6nkvJGEpSPLZR1EcG7Kq4qCaprDsq+fh5xBxOJYe36x5MWj6Qe
	eNj2byYDGTF1l5ofcP8dYVfKgTftmntsyeyJYkB1ZYRZvvPYoTTnhT3LunxNJxz3
	KL9v+lbjkDMTqMUVqshdMGY1PnkvLMt84/AatdpiUPNYsaizsJ6/zw0xwdi2CY44
	+LmwgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kse6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:09:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so235868eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795043346; x=1795648146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
        b=E7WqHvEhoQLJp2mj+TW3B9uWF3q51qpnXX71DPokgmDOwNjFG1chmdH/CmTv5fquve
         QbEQpxgekNzfkZ4oMkvBb3IIu1IHOPjqcVgqz1UOxs6EhkBtP0gaRVNM6VinZMdxvt3F
         5oEMyW0ZzlWxlbrLVSgdi4XRdPLryg0d3SNzqN0cMuSegEydBNCmG3APrgogcaWwHJRR
         +Ondfhss8+CkpiumFa32s2FYAchB8SckYgLglHPDVfTdkQ4q4zFLAQ9KLaNujci800BG
         2hhROjmaPdeq6NFVSZRT7xK23OLkJZlE6dU5OQTS8PrTE4encKsq54rCMct8j+OjgPRC
         QDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043346; x=1795648146;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5SRrjS0ISmPxiJwygwJYGHhzJgVWzkQZHw/MAOFYYM=;
        b=DM8tO+sQzmyf3dnEP9eex/AXm1YCx/Btn8rQwrcL8Uf3TJlavR7CFQ9RZ5aoWtFXlc
         6JQBJqZP8qpYfRI6MEDDAuzTGyaSDX0Sqe/ASzFZHighyeQTWiNnamaJZeK1YV1RW5Yh
         hqKiYQVktJT4O/rYE7lIuvMPT8FVxZNVSu468cBQUrcmn4g0reP1zzGaOByuvUVT+FsH
         3LZKtY385M6urGffe0R7H8GkQBWAs1Ur/JEuW/nkwDbUowi8lpho9UD+XdC9eL/kTWdN
         Z1nSozh/ZkJ3h5RCtPkYhYKZCDdHYThSBoQO/tazyjHtS3z6jnJnCWfqCb8oKNpp5mHQ
         cBWA==
X-Forwarded-Encrypted: i=1; AL+hErG0DDfnEN1/EqRTPPiwgo3KvsQvDCBhViL7YV3Jkbci1UDRK2KdpT/oiF91NjXOTPTgm0eDYf+GkHpALiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w60teEnpbzvMQWXlBlDeaPHCPpUjnKC/nB8YwzhmWlr/9IBgj
	KOn0wZmDsS9TCDKEGwITESPKmTv8sXAdeATs54iOiFIeVl8WkgPOkQamj9hN+ppgkWi08WHDvdp
	l813d6UDMxPIDupE4BNZfmXAtfpvZSyPAw/5yJpgFyiIULiIjyt885ywGSviSmZ15qaY=
X-Gm-Gg: AYBFou2ifmuDi3jlhRLMzTtpbOataerK8A3QVmzgI7l/s1eiBgIK8AssJdp3E7fr4Bz
	nStXEFHxrKuf8/DVk38/UGnzBotlKhevT6gSPBh6+8J5+j7Am6GyRTCQyn9B3X6zs+Ha5XfaKri
	KIpU/+iQdGc7dA6b2ZuDHvi75AU5xU12kcS7EFROsM6ET8Wc9b2liR9xw2hLKPOiHyB02uCreGH
	ezsI5nujKpXh02Oc3JkdUFU/mwzSU50RyD1bp5x2vy8Yxl3FIwSBtHqdYTYsXLQV8KPL967xuhp
	PuMxIEFbRLgow7ch2ZewYvvwHRt1yFZ+i6O5Kj5OPIM1mHM+FHnpNunvAMfZGEly6d21iw+KDR4
	iof/XgMlXLJVhMwxuUArD1On61OJyJFYFNqGQAPleNC/X2nhvklZpCX1Rui/mxI8Rm5j3s87o5G
	IK22xjWotmVpFdg4Atc/J/Us88gYah
X-Received: by 2002:a05:701a:c9cf:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b54e68f727mr241224c88.3.1795043346106;
        Wed, 18 Nov 2026 15:09:06 -0800 (PST)
X-Received: by 2002:a05:701a:c9cf:20b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b54e68f727mr241195c88.3.1795043345438;
        Wed, 18 Nov 2026 15:09:05 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm9253095c88.4.2026.11.18.15.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 15:09:04 -0800 (PST)
Message-ID: <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:09:03 -0800
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
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Changyul Lee <lcy8047@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261118052116.3901761-1-lcy8047@gmail.com>
 <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
 <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX8ea6neeAYZm0
 BZdhgylZDa/xNIgZoVKxAUbTG0MaqE3L9tLZLwQ9YACKDllWusiJqY0Csf5Hd5yj9RKWfKkQpVi
 3Jb3NMEBIbxKCp9Y4Tn4sg9E/YTo7EGrvHtQpv8vYc6kFg7SaRUv2ahMXAeU1ULWSYnyukSRcN+
 j8tE8t0iGRAhb71N2VFamHXrh5EjtrCB569SCvpInpDvEy3HPEotkzbe1m+wG7r3d8DDnvirh5X
 zavNpLQc2mWbLC67CCcNnLqWJ0GYb8aZeAD6REzrCA+QWMGLdj+NCWonxDvBItPBe9o+aXvqcHu
 2vlII8V6K1Q/C0YEz2h/RrTdaXkBUQabXemueSU2znAZRWLPJx/R0vHt42355GkyzdLqYJdmUK9
 HHrsgeTHlldnzzLC64IYHzjHrBZ1SD3nZzaLXVfBQWTfS1QMmuIHsrzO4iUWUCRbJfviP6VLcJv
 YVavMNVKXoQrBBobBsA==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afe3013 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=W5knxR3aJgrXDdnN61YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX4ZC/6UEwbjBi
 1N82SGbzYSaJFb2YVw/OPFE0LygNBxSRDthjSxiDLQ4OFqLbf4kdhK7ZEE6GPzfTfhiWc778Wyg
 Fu+oKsopuJd1fS8YgvPp1ABse347o8A=
X-Proofpoint-ORIG-GUID: XRGDkOpqMu0ougJJs-o_UHX9dRJYEhPw
X-Proofpoint-GUID: XRGDkOpqMu0ougJJs-o_UHX9dRJYEhPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180085

On 11/18/2026 1:56 PM, Changyul Lee wrote:
> Hi Loic,
> 
> Thanks for the review.
> 
> On Wed, Nov 18, 2026 at 9:53 AM Loic Poulain wrote:
>> The above message looks too verbose and confusing for a somewhat
>> simple issue. Maybe this should be split properly in two fixes.
> 
> I originally wanted to fix the msdu_id leak. ath10k_htt_tx_hl()
> allocates an msdu_id in htt->pending_tx, but leaves the entry there
> if ath10k_htc_send_hl() fails.
> 
> I also noticed that the same error path doesn't drop the extra skb
> reference taken by skb_get(), so I included both fixes in v1. I think
> I could have explained this more clearly when covering both fixes
> together. Sorry for the confusion.
> 
>> If this is a fix you should not target 'ath-next'.
>> Two fixes tag looks weird, what are you fixin exactly?
> 
> I Cc'd Wentao Liang because he had already posted a patch for the skb
> reference leak [1], but I left that explanation out of v1. Would it be
> okay if I sent a v2 that only fixes the msdu_id leak?
> 
> [1] https://lore.kernel.org/all/20260917120112.2150211-1-vulab@iscas.ac.cn/
FWIW I've rejected all patches from vulab@iscas.ac.cn since multiple folks
were using the same e-mail address which is contrary to the DCO. So I'm
waiting to see if there is a repost with an individualized e-mail address.

But I also don't want multiple fixes in a single patch because then it
complicates backporting to stable kernels (unless both of the patches being
fixed were originally part of the same kernel or both predate v5.10).

/jeff
