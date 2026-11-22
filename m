Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795359918;
	b=Nxd5TUooSt3/ycdORYYvRcfdQ7jXg6g4gMj4T3ZB8a5T6YtFrM76q64N5Skdy75+VF51
	 P/3sw8LPYBHDXHGHgi8dzxVu6ch2ycfptDBEvhZ3nRfDYDBOxeZXcixhpVHRV1eNNFwzq
	 e3xbASNM8ke0zUByusmy9GWmrsk1tiEKelHJZBIz8H7Vv4jv5amw+XgrkjTUFBSZDSSIu
	 nXiMefiQzPUHsE+Ceee0TaUAXGOmVXmL4VuxZs9WQIUc7UnllDhRflOVgnZ7FDOs8hDZ2
	 rHpbCOjwsscjKha0kSHSB5ynVR5pTVfCJ7jlh6wuUCeYNrbtvyJg4RKRjDsJyfd0zeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
	b=KBRL8VVQYuIH+05mv8BM70SF0rYHzsrljbI1lNYOzIxYCkJXJWSaJIhdm0ycbRifCbUv
	 MJwRO2rUMdG5SrdKHGNu/lzjM6cAeY47nt8Zn3i0d/C7uaUKlMbFyliUcfpbuHyWg1WiH
	 7X4O83VsPWdgrURH6Mnq8PcQuyK6/Jh2NNZQ5cOHVojoeF1oBL1thO1AGmltxxRLKs99d
	 G0Admjw6/PdN1OBvokcuHNeHrBZyAxS2uIpe/D6uoT8xyGAGQjGA+ETjkXFA+wCwNtR2W
	 m1RsDH/iOXCBnteW5iQTOCMfSB4mZwL6u6kGiVvwPUw2FWRKCjxpOcAEWyYAa2OTF7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqV69S5Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/4ftxKM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFABB606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFABB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqV69S5Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/4ftxKM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBl5vY3343903
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=; b=TqV69S5ZkRsdsqAd
	VLC2a8JFbZUznZtSZtyqeaXkzdeA+CxvjWzTHDg4diPq4edORZ9Ajq3f5nnSCm26
	QFWVn3goXlQ3UcBC1PB0pzRAAUj28Yd4CLQRXvZZ0gaLLL7+9iAURke0ozKo91Wf
	LWSUOFJ4d9vnlL4JYmhcKkFbusN1mmR6IjzMW1RP4JOaFysoMWxmxleG59NZ1Iee
	1C7ilFrbCphRtkUi4N13ppYwfPz1mUPXPg+RsxcAJFR9+ADhkuNeXlpHt1125Z+p
	aMvXdDqaWDzDk7WRVEB2RR5OGkQRoUO8/57bY/NJtqgc1VqB7K2VWBxxKzGzg/6g
	nasuCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h33m9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:05:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-947a607ec40so245439985a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795359916; cv=none;
        d=google.com; s=arc-20260327;
        b=GZ+4i1qPQKS4/WZ+ekR/W+v3aw/McKmdeY/5CoVaJtNOcMDOACbtLBL8FaCVi6qLni
         b8eCjQ0MtMJqnLi5O0QdoPQ7gS/4EYBBJht0dU6uO4DS/Cphz7TzWZ+HhTO1qEMcuQnA
         rere+mhMl8vJBBTEmBYcI6G5QgH1TOTS6KZdh6pVCHyTudXrxPY/Onn8nKqu/YLfEj2E
         +9g/6loKSbdnWDJG3gxJIj/czeHEKUKOPgfob995fvbCh6oM11Xj8oAP1NRu3msnQtlf
         CKP5yrMg3cQ0blKQ/5GGWl/l3JY7tbc/e3pgtHaYOxhWOJ24fRzWZk1JVcvUPaPDLcpP
         NDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
        fh=kfY1TWTY0mFwS0XnpEdtXGb/HMzIc8UCyaWGSCGVZxQ=;
        b=UAJWmK3SWPb85DeUJIfajRgfyDIWVFA2tq/hDKpcTxOAJbmMwHy2/m5eAvX0ezJik7
         b6OtbQ7M4NJKVPxlqSztacwLgntNOeTo6bls7cxQmNJcnrtnmbwYBRtR6fqyKD/8S11n
         jcMvmvvUXrAOS5dHwhwIRm8aPYJoz/vN60GFGnh5UGFYwVruoaDMgEFaJXsIR0juaW3e
         MtZV70WEhJc3vsj1zbQaCsSEhZ4/v63FD9wUBCcpns+SYDFo1kHyWWHc+PPJZCFk3qvM
         EmRxLnz26zTwF6qgD6z9BJbxdXLpVldW7SQW+e7lwD0ftHfrbRUeu4ve3JEvfDe+RTpY
         bmmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795359916; x=1795964716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
        b=Z/4ftxKMtQfOIb2KP1kNzDWz2Y6bySTaWgPKGRJAREYzXnuc+3+38Su9eyDZHBZPQ4
         2tgASRAbv8vQ4rzs9SBr6PVXjJQqIdszphP2sHV88HE2IBBsH35EteM9EFs0oP0mbxGF
         EgTaM20xsayoC0N9IC60sYb9YYgOj5u+hdvqmqD2aI2/xn2gPiZcpt2gI1eyTmIoCKVT
         9eMkkRTIxA4HzkRV02v9Xx9YPaDhr7mIDp70pD8jjkdrqutGQwTuwdl72KPM3LQOJ2kf
         lAwg+SQduGZo0Ycnfe0rIUJU8vZjAlTYc4zB34pAOQAbp+N3B9L63YR+GmPCdusmRodN
         Ctng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359916; x=1795964716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mvu2hRSv9VNrtPorrCskxdrDA3PVFViqcTkCEB4jfAI=;
        b=MF8ckkWVISuEqYoM7DlmFD5QVAHxzZPk4YgSGi/BqYqdZebLIDLcanlDVjsKLcWnIP
         LfctIG1cV3/vKhoiQJKA9H+M1sIzbHv3Dnfn2PfzZeQTWmadWPC4e+QxwXTSvweXBxEX
         /lvczbtJrwCps+PxdV7QQYlLVotsu3yD+BDXL3psmBhlRWgPxS6WO76dO0fUM2yFi3DR
         AjE/KG1mpFUkHiIFiSRq115hjg+61rI86mJin1c82uLDHTwiFM12usNAmcXOzIZAMCZB
         0CA1+eRyRnNnfXLS/aTAApv+J1LkmO0gS+5qxK6ox/gQ3sk0a91BCkHApXkjBel0VOjX
         aN7w==
X-Forwarded-Encrypted: i=1; AL+hErHzv4GEgfXCn3+qCdwvuaLMU+BD3pwiU1XNdkPQNrOw15GHhwZkGkLNTfeKOfUVD1GwTpHgyCvYh6LeQbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pDaohMcx0/BtTMbrYlKifMTJq1FJ5ODhOjEvF8t3CFkAi10wc
	gNMp4MuOtTimx5PjeZPtbn10R4kFWQ4bC1da2apo5e+5wXxZeFSZK+4OlW10yXoLNzFMpnKuenS
	jqyTZyKhwBEc4b6SCDqMfWMvi7u+Oxb665OPsnDmyN+/gaCWsxuJjqVgdx7jIkh2xj/gQuvcfZT
	iWDUoisSOcVAGvMe8zrO/aGpAYFB4GkXoFGUhX1j1AEg==
X-Gm-Gg: AZFdTZfDQVwLWRalaszv/qTxAYyyO/6nCBCuyO6/Ce/QH6plo3W59dfT6KphFMTBFhI
	oSJBD5rZNzDiMVAf9zMjJFUnVNBGLKLPa8Ta3AbqtQbctT0nwSC/BmZn9h+jJS5s0+JlHTMV3dv
	eRe66gmekoqYNJMMhhjszFFfr6eakf6D8RFqaLt7KAietOeiCGcICu/fbsW9xYTWHgs57ySi4JP
	ihWd0ULemGBXOD7QHA+G9QoTG5OKI29w+BLmPpb6Ao/uMLzqnXWPG9MVQHKsMAE7VVN5pz1L+EP
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr1472738985a.17.1795359915834;
        Sun, 22 Nov 2026 07:05:15 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id
 af79cd13be357-949ba9b8ee1mr1472730685a.17.1795359915203; Sun, 22 Nov 2026
 07:05:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122050039.861287-1-davidlwesten@gmail.com>
In-Reply-To: <20261122050039.861287-1-davidlwesten@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 16:05:04 +0100
X-Gm-Features: Aa3M54om7_Bu2prslwxgzjqJgGVDuwBMZkqZHvyNbC6f6bUZvndDC16atbuK-9k
Message-ID: <CAFEp6-0_5YwOz6DiRKi_mNn2fCg7rJvYGYjOrVd903wdKZwCHQ@mail.gmail.com>
Subject: Re: [PATCH net] net: wwan: iosm: always send the host sleep message
 on suspend
To: David Westen <davidlwesten@gmail.com>
Cc: netdev@vger.kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, m.chetan.kumar@linux.intel.com,
        mail@maciej.szmigiero.name, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b0304ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6kzURy52d_XsnYN-:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=KygpZSa6NscGoRIuHFAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: lnwvQRiYh1NatEC_6VvN2JYg3E1NEHqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfX/eFHu1ahSkYI
 /3rUCJ0Lq+csKMeVrqzVh6lAi2AD0ZxGOx+drMD1J9tktdYHqL01rwl0BIWyrhWAUR33m6vk1Nu
 oLupslZcfeTSCpmKcTf2zHtluO8FYUY0OIrP/ZE9eaiG+LGMqv1MPdpVDw7ng/ytm0t4c+sbCsp
 56kdEG5fnQoytjGhhzdCsT0RzHGDWr81I4LDZcbIfkBq3qzBblvzWWwedM2HyG//8a2NZX0HkZf
 bWVWq/OXavKg5/CwfoQxVdULNoKC40apHRF8RCJwQYi+iXyhPbH+4ZEvBTYdCFAqiYvPBiEIQ9p
 BxSt4+nC+10CaXz1/M2RGUSWBj6gXsZJYnNhKyjb8njsDB7Ws+z5PohnLCS9gFChh23WdBf6wIa
 1++OyFvgTHujST0KnyRib848p11OB91rTf2ZRYJyxI5cNsggEUPtML8U++u2LgfB8NafMgMJfyW
 td7ZC6/C+NmfvLcGSbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfX5OQB36DJB89s
 eszeNo8KOaP32L8oGSMVg2xMerEbuJqoYwfP9dL0B/XywbcJ3d6eBR16CLQ8kXGRKwWePycGsjc
 ZYQHm3lCkMJW+YcEARST6Nl8DZaKXOM=
X-Proofpoint-GUID: lnwvQRiYh1NatEC_6VvN2JYg3E1NEHqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220059

Hi David,

On Sun, Nov 22, 2026 at 6:01=E2=80=AFAM David Westen <davidlwesten@gmail.co=
m> wrote:
>
> Unless the BIOS reports D3L2 for the WWAN slot, the suspend callback
> only rings the FORCE_SLEEP doorbell, and resume the FORCE_ACTIVE one.
> Neither waits for the modem. The driver doesn't keep the device in
> D0, so the PCI core then puts it into D3hot anyway. An XMM7360 in a
> ThinkPad X1 Carbon 6th gen doesn't survive that: after
> suspend-to-idle its execution stage already reads CD_READY when the
> resume callback runs, and the first port open fails:
>
>   iosm 0000:03:00.0: PORT open refused, phase A-CD_READY
>
> The modem then stays unusable until an ACPI reset.
>
> Send the ENTER_SLEEP and EXIT_SLEEP host sleep messages on every
> system suspend, as the D3L2 path already does, so the modem knows it
> is going to D3 before it gets there.
>
> This ignores the BIOS RTD3 setting for system suspend. The setting
> only selects the sleep protocol; the PCI core chooses the power state
> without it, and here chooses D3hot, which the doorbell protocol
> doesn't survive. Honoring D0L12 literally would mean keeping the
> device in D0, as commit f4dd5174e273 ("net: wwan: iosm: Keep device
> at D0 for s2idle case") did. That was reverted, D3 being the expected
> state.
>
> With this change the modem stays in RUN through 2 and 10 minute
> suspend-to-idle cycles, and its data session keeps working. Platforms
> that do well with the doorbells now use the messages too.

I don't find the commit message particularly clear, as I understand
it, this change effectively ignores d3l2_support and always uses the
host sleep message path, so could you please simplify the commit
message and more directly explain the problem, its impact, why the
d3l2_support distinction is no longer valid, and how this change fixes
it?

Also see below inline comment.

>
> Fixes: be8c936e540f ("net: iosm: power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Westen <davidlwesten@gmail.com>
> ---
>
> Notes:
>     This is independent of my S3 series ("net: wwan: iosm: fix S3 resume =
by
>     re-binding the driver around it"), which leaves suspend-to-idle to th=
ese
>     callbacks; it applies with or without it.
>
>     Maciej suggested forcing the D3L2 path for suspend-to-idle earlier an=
d it
>     helped another XMM7360 user with the same CD_READY symptom:
>     https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/work_i=
tems/992#note_2938256
>
>     Tested on an XMM7360 (ThinkPad X1 Carbon 6th gen, BIOS reports D0L12)
>     with 7.2.15 and a debug build that forces the D3L2 path, which is wha=
t
>     this patch does, logging the execution stage and the PCI power state.
>     Starting from a fresh ACPI reset, the doorbells left the modem in
>     CD_READY by the resume callback after 2 minutes of suspend-to-idle.
>     With the host sleep messages it stayed in RUN through four cycles of =
2
>     and 10 minutes, two of them right after a fresh reset, and ping over
>     wwan0 still worked afterwards. The modem and its root port went to
>     D3hot in both cases. This patch itself, backported to 7.2.15 on top o=
f
>     my S3 series, then passed a 2 and a 10 minute suspend-to-idle cycle w=
ith
>     ping working after each, and S3 with my series still works. Built wit=
h
>     W=3D1 on net/main. Not tested on the XMM7560 or on a platform where t=
he
>     doorbells work.
>
>     The investigation and the patch were done with an AI coding assistant
>     (Claude Opus 5.5). It read the driver and the earlier discussion, and
>     added temporary debug logging to record the execution stage, the PCI
>     power state and the messages around suspend and resume. We wrote the
>     change and the changelog together, and I ran the tests.
>
>  drivers/net/wwan/iosm/iosm_ipc_pcie.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/ios=
m/iosm_ipc_pcie.c
> index 49052eb511ba..dd7cfe3747ef 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> @@ -406,14 +406,10 @@ static int __maybe_unused ipc_pcie_suspend_cb(struc=
t device *dev)
>
>         ipc_pcie =3D pci_get_drvdata(pdev);
>
> -       switch (ipc_pcie->d3l2_support) {
> -       case IPC_PCIE_D0L12:
> -               ipc_pcie_suspend_s2idle(ipc_pcie);

So ipc_pcie_resume_s2idle function becomes dead code?

> -               break;
> -       case IPC_PCIE_D3L2:
> -               ipc_pcie_suspend(ipc_pcie);
> -               break;
> -       }
> +       /* The PCI core puts the device into D3 whatever the BIOS RTD3 se=
tting
> +        * says, so the modem has to be told with the host sleep message.
> +        */
> +       ipc_pcie_suspend(ipc_pcie);
>
>         return 0;
>  }
> @@ -427,14 +423,7 @@ static int __maybe_unused ipc_pcie_resume_cb(struct =
device *dev)
>
>         ipc_pcie =3D pci_get_drvdata(pdev);
>
> -       switch (ipc_pcie->d3l2_support) {
> -       case IPC_PCIE_D0L12:
> -               ipc_pcie_resume_s2idle(ipc_pcie);
> -               break;
> -       case IPC_PCIE_D3L2:
> -               ipc_pcie_resume(ipc_pcie);
> -               break;
> -       }
> +       ipc_pcie_resume(ipc_pcie);
>
>         return 0;
>  }
> --
> 2.56.0
>
