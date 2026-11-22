Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795357971;
	b=m6lCzPxcPhZ+a4pAJTvcHIqLgdkHAGdHFQxceoVpq3dJzUGJSdVULIfmnVHYpYvkiXkB
	 sKuCdkykHSDkGTKNL3Vy3J5p1j4ByICWBLunQKzPx4afYvgc1bVUUpBIUmiaQN8Pe91eN
	 aBM+AyEgsJweGyxZOeVzH7JBxiKLuLyBywa/JUOdYMuE2Mic3jqXZg4288TwYE+IV4hxc
	 Y9NkKkDtSRbKCWG4KLet/vmOsLax6MJ02g4SCOs4LcolFBKlW7d3s11LEpUKIn9PVQuNi
	 DG+ftxgtxq5jZkwLiACT/gYwY6pOj91YyLcPB6xSSGVX2FYyKZGzlE+ifIOZv6dKIMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
	b=Vzx1qYbLy/xrsVWFxAv/2Fx2n0mp8HsHFa4rD9qdQPLDYpFO2KPjLknvyX0OWO8nHk2Z
	 SZE5CbUnkMn5jApm8PauDlOBgO3GBgKoBxbfQX92ZxVB6OY7u6N0yltjg4TyMERYN4euV
	 osTHuhza0R6jzuhTiwECExHYIq9xNpwmry4kxnYCljQM224Irw8MQ0IeUd9FBwcGIN28n
	 +dyevb3N3t9uhaH7RSZuqb22sQVbZzYvZu6nW59+k9zPi1nRcP8cr5eJSw0SgbQfFE/WQ
	 f3m2X9XjjPj2CeG1/qUEh3e8QFDlch7wnC4cUCCf5ru33RmBqLxylafbU/q0uctPrzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U/ma3w2t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gT9xjznO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACD606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13ACD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U/ma3w2t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gT9xjznO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBkkQi3343058
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=; b=U/ma3w2twbrJoREq
	27Drh2qPZNY6/4UUBWGmfvnc454xFXTR3G8lTQPScX79StZInIFoEUylYjNt8gAf
	V6MQh9O5REi7H6uG/pCviJxpTIOP+ATWyK24XsFTRZ+CMDfQITJmGWPZplEsUN6V
	1sD8/Vhh72mA7WV5SUqEMYuZ4zt7xqJL63G1EhtVlDEpY1fev92QgVk/mD/uLbRh
	3aHmyvB4SVo3uOlCl9fVKywsTfm5mBXBKJooPUJqo5oETjo9fh0ebzn5QFK2kdIA
	QIOoR61BG9HRXaH4fTVU61R7PRtD4DqLo1wQB0uh/DiA8Fm5JY9nvcNi8OA9zMQu
	d5i1Cw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h33jav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:32:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211f05706bso34115306d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795357969; cv=none;
        d=google.com; s=arc-20260327;
        b=el6ijKWUMhVFFhFYmpllMnBD86Aot8OhTQj69pGaNuIXp4PhJDpXCEPo6mPGvgTsIh
         +qEtcdU3ZmT4JtX7Mv4oZuRTx9hIPxpEbx7ccy3unFD2ZIrOG/1M7vM6reQ3IfMjJWbL
         JFB35ArLqIblgzL803mEnpmxLmA4rCKX6tpp1XVnS5DF1PeNRscmIgnbU5uCUJ8rS47m
         nCqJ0M0cv+RiYgOnV/Go2UT7klubnFcHqTvkobmBW8Ix1EbtSh30sT77CuEwpO0inqGL
         DAqzJ83BLi4AYsbY8U7Ufw09CzxcqfKvqA+CQv4y/lEC1WyVR5UhzN40lSyWwlmr9Lyy
         KtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        fh=/FCQA3xdsYyaqxvWDxWEi49nrYfZyVb8PZrMCcXjxUc=;
        b=krXUaknqvqlOzpCtveO1AfS73F3tog4p8Ec0qW9N+Z87cC8W9ad4Xk317knVD0JqI6
         Vw553TK7BWT0wG7OnNvbU4qRXYn3M+BfMgFmgeApl/TBSvWy0wgVzdcHNoydd9CzOP/w
         n+2zDvxC8c1aCt51IY99rH1JEsds8bQKhanD6RN3mJ/7FEGNVEy8jFvIHyPPHTHBMcN8
         qcVoPuTopar+di91brRdRPE6G8Q3K38iXEGmwd0pFWhLX44ritGIg6kaHSTeV6EzSb57
         iC2hfve6IMzfL78wZLjsT2WS4271g0FRkNCsGF6k4DxVxjmwTj3erUgd+qPyrIpirJiV
         bAQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795357969; x=1795962769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        b=gT9xjznOfCd1E2Cs7QPDYOdlufiz3o/9Um09u2i58XH9j9c+QbkH/G3ulgSjYjI6Vz
         f5P6GtLAqS+hozLELcWyfBYCH5L2zDshcWBNnZjJ/K1aTPDyHE5z/77GSry/CzVUQYX3
         qbg/NT46LaNyNgfJ2mLC9vcLeaVh4PcbqNfbgVheNANgkL2BlopYpe2zHnyzPoZLvEls
         iB3kKhknDRWNNG3CoNpArlzHFPG5dMr7WG/7dscQSyH6WxI5V8Un+PZOWFYCJDnK+KYo
         K8ltfXgO6yfOiQDMLhYHpo02dwEEm9E/Y7/Tsl+oq6X2x2IACZJfUg78E8vvOPJK8lX+
         orpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357969; x=1795962769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0Sk8nYNVMjcmLmn77+MK3JHOUmqtxAk48JpxbrK22c=;
        b=WH11tLFLTVJjo4B1JfgLAh4b/Q9QmrPBx2fk54tF6jNAGhXBRQz/NGbRcrGySVSAqU
         ojixi4yivn6pOTjQjQ7mlXi33i2+Ltegywj2kRoy5SlqEClupI+RVlE/iI5pgnab9hgy
         AWZlJ0dwfhQTY4uwpk/lHVO78DrFpmg7yOjY5YcaemWzB5tvaywlNhWXH8JgQoZCq5EZ
         hNuN5jdqeqjP2guUSj27uAe1ZiCD8Ms7PKS4rOMJ0pdT1tg3EbXJyugQJRlkwQHu6qa2
         mVaVUFiFMq1N/8CJ9TDHDasg5MwJq/vkrdUF3e+3h1Hi3UEkf6zyKj7tFzT2bHKsh3YA
         DYVw==
X-Forwarded-Encrypted: i=1; AL+hErHDNT6BzMxi34Nm0Z9fj97eqXKzyBwpEj9jTb/njV2sZANdfdwORKRMggdu7r48vP2E7PyP3wGQCh+sKt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F7EmhKlzrGX4FZawTbzUgbXvNrm+efcGxVgVkTQX9hTumXmhX
	l6vqiYQac2cb4H1W6v6H+ipZnvYBz+7tL9MTHLHcqqFkl+Cp4EcVLPuFWOq7LgaHvKhliVwPW0Q
	tvy1vXIBV6FKJ6Vu5ZUbAa/KgbaCqHwdov0EgMUCZs+nBzVV9agfAUvqkUY14Vo7RUbm8F6KzVW
	2ArWaSXULOrSmmymATdkI72W3dcrWoq+kMuMsbpRPCJQ==
X-Gm-Gg: AZFdTZdTEDdxzq77cO3gKQLiWjRUzDzE3jbjzDoGxluY0ryHTtGrmaxlddNh7m8m0nL
	w6JDuEkcxEkDehS566YV4WtBRPKPgw6GzX/zh9JuX3AOubLa4QaU7I5yYI4GSojQtQGARrCc2eE
	S/+km6T3gzQQsMzAXSIjd5rDsfrOnorJcPvcz0sa0+6OL9N2qA/z+Ajqmk5gD6mbg1e94b5ZgrL
	hRVfuZF06IPlntodscw+Gc/N9a/Z3a8wJxWmj0z0RDIVnvX0AlAbSWwFuhzePtFzrpXe4o59V3K
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id 6a1803df08f44-92134b4895amr113826606d6.51.1795357969201;
        Sun, 22 Nov 2026 06:32:49 -0800 (PST)
X-Received: by 2002:a05:6214:8587:10b0:921:21d8:9a37 with SMTP id
 6a1803df08f44-92134b4895amr113826306d6.51.1795357968667; Sun, 22 Nov 2026
 06:32:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121175402.644803-1-julius@bairaktaris.de> <20261121175402.644803-2-julius@bairaktaris.de>
In-Reply-To: <20261121175402.644803-2-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 15:32:38 +0100
X-Gm-Features: Aa3M54rRC31zGyviv_2bpLiuSIAJiwsZBKXXauC16U296yE_pKKkHpVeSXsA4mg
Message-ID: <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt
 mode when probe fails
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kalle Valo <kvalo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b02fd12 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=zoG6pt3vYd9LuZ-_mncA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0c-wbwMOscF1BVdOO-kFa40VWSjMqn6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1NyBTYWx0ZWRfX3LwR+8BqQuzU
 lTexv8sUwWsxHknLeCdOlT+KcDqMIFg6WYbv3swDCGilAgry41riQ1PjuOgiECAWBNs9q4v+tww
 tHHXpgy1wOMqsFzce3/oTEYwsaHCS9jt3Ah/Ehut7zUhDfoLbRWJ3x6PKHQptMInnkmwvYOuax1
 YUG7QfUtRLf6icPaIDdLHhjMhi98+kzJMsBD/9oq87yM+MigpJaf1V8Nxnw0PXTlSm3UxI+jYN0
 AmiXC4szG5DO7kuUpbM3ajV85wNLbBNNkUFomrCVWvMfdyCe73AjIWlNTuWNkNHfMIECJdfX4Nn
 Q4P2la3JNZ7NVj/jseEbUNPHF9kQwM7FQzE96lpkTLWHWTOsq40304n6sjqpVkyigwGJzqJIef4
 fomQieKbjYATbdLh3RyOKxs6ymbhQIYzs+jSR6JU/EvSChAA4stjZPExsDu+o2J79qMHYBnws9l
 SRi5Ev9rACVw0cXM1pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1NyBTYWx0ZWRfX6sx81u7nguN0
 4WzhOKXzX6UwQh88yfIaQ7jZskDWjN8w+dz0n52JfZoahdw1aoPeNOhluN1mt9k5Gq/863A49Oy
 l1Pf7eRhIza3qJbVMilPjZPKIaparhI=
X-Proofpoint-GUID: 0c-wbwMOscF1BVdOO-kFa40VWSjMqn6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220057

On Sat, Nov 21, 2026 at 6:54=E2=80=AFPM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> Since commit 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB
> device probe") the err_deinit_irq label of ath10k_pci_probe() only calls
> ath10k_pci_release_resource(), so a probe that fails after
> ath10k_pci_init_irq() leaves MSI enabled on the device, or the legacy
> interrupt enabled in the target. With MSI, the device's MSI data is
> released at the end of the failed probe while its vectors are still
> allocated, which warns in msi_device_data_release(), and the next probe
> of the device hits the WARN_ON_ONCE(dev->msi_enabled) in
> __pci_enable_msi_range() and falls back to legacy interrupts.
>
> Call ath10k_pci_deinit_irq() again before releasing the resources, as
> ath10k_pci_remove() does.
>
> Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device =
probe")
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - New: the probe error path left MSI enabled (found while testing 2/2).
>
>  drivers/net/wireless/ath/ath10k/pci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488e4..4843a41ea801 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3716,6 +3716,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>         ath10k_pci_free_irq(ar);
>
>  err_deinit_irq:
> +       ath10k_pci_deinit_irq(ar);
>         ath10k_pci_release_resource(ar);
>
>  err_sleep:
> --
> 2.53.0
>
