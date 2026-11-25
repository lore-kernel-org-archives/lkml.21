Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624945;
	b=lkuJ5GVOf/bl7G3GqrcRQI1DZB+lGhqDe7sGmGUPBXO+WgeaZTG3YQoEkriRSzP1bGzy
	 pL0PZDY90DXHtPK0gkUzK20BtWP3IbPYSxhi/Q29USV+WIOTGs3vBvDlaAVBN0iNCOyFa
	 +V0xFY82f29WuWsfivjvKsysCpJDgNH0RKT/SPjfCO/YkIWsVZwmQS+ciNcqtYgpChiy6
	 tJJMPwJHGhRTNn/nO4AtZFCzC/kBhzG7XBdlegs2ZOu3Ajfp7B8Wn9jZiOEUzeWjUWzuu
	 r05lsNe3ZM9+gfWiTeakvuH0PHNXuR4YTpF1o0FLTKB/cMe873awMRyhAlwtAXkzwLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
	b=DXY4O93wXw1IyQdXFpbgf734gJ/hYWhzOya+An1vk62JuK48GCyBwN8iDjegM5SIEpyT
	 g/aWbtfkDMjhR0jI+ivDbdxs2MbQZyvmIDjDmXjpatTyq5HzPYZsyL6nYbXsfSzEQT3Lr
	 oe+NsBwc4W8Z3XZ5TXLsUNcBSUG5Tq3bif3wDf9BlCHu0YsKDQywceA3Td6qHsUJqJHcD
	 TPwXJoQyg/6Bv/wyPIDk/3Sj7vaOmqYHpkUcW52cWeLOVfW39/J7+JOhKsvjEPLNewA8h
	 YQsCb6mLFGq3/DJZTiaZjv34enYSDuuUmA4n1MzEu+zuDVWWZNh2iKdknNrGc1EIRCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drMVhEpn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doUBacFS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2524606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2524606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drMVhEpn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doUBacFS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ5mi3998633
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=; b=drMVhEpnFwL8Gqkt
	7RKt53KLEyUkxcy60KNEQMpNgg9PXPsPJmE+lCJOHR9pHU05qKyqn1BijgW9VeAe
	DEiNi0noA6y75xlwZTowj6AvFG1z9s9ikgpz0hxeGKCbMmNq1yUQk6goDRqgNA+1
	J7S/jq5n/g6+FsHKSjpumJ6F5Zdz3yicYlT/52g9fXagqW/HgVbTxKREJLRx9Oe7
	mnAx4egl/1KuLs72YqoaVts0ImHwr7IZSexY77XGi3vuUpU6JJjhtZiODlai9t2q
	XkmP0SnUO57L36mNnEPN5jAI/vIxCpG2f5v4vvlI8TgHDQIMAbE0jKV5sFLFEtdC
	tzzlyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aega3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:42:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so915141085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624942; cv=none;
        d=google.com; s=arc-20260327;
        b=aCJl0e/j4BpOdsvvgxo1A25FBYBOoeQ5kDCm4XZ8EMmcqsBT3BSTp5bBJ2dzyFepV7
         vdpYTIpzK6lCezzwnuwrUs0lAO6Q6dqDDi7+j4KShVRp/cRprL6JakZmN6B0x0venA8R
         hcfveeagBJI1kc3KSuoLkT5fBsXIDKp9bfC5OTMa0M4gGoq95PDbGNqy6SEaQQybCBcO
         +aziK+SWBOLe1UbDQ/nJNNyHkF3M7cLM42o/WL2O+7e8XHVXP27smNElQzX/Y6pGfTF+
         CaUzrY1sTb9yN/4hOtPBJlYsgPU9dwqH3eF+Iicycn4put+sSJTMzOPqkVoCukvjb0FF
         o6MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        fh=2Q9jr1y33eOjrzczUdS5WkmORU7MXHsMMp1UoZ59DLc=;
        b=U6VoFis2dO053JPYRlQ/tX6W2o5xIc8ftAUJns2RVDplJ3h3nVKkr/E6+aTtaHOpGh
         3ghuIldW1otBM2jM6CJJOy5x7UUdCxyiXzMkqhgkKoyAKjNG5zOTt7V60OOEo6a6p9EK
         U+Knkg793NuOeOTtFHWkCCI9f0ksqj8hOLItmgwg7ameycG3EOfyicZNPs54wnFnT27B
         ZreK5gAItcwJD5oYV7J4YECPduJTeakrLQIjQarq9nwJGfaQ4UHkk2eAhO67hbi/cIf9
         D3zIhpTB4lnX2or8G2hiVK9ZQJfn0f4yN2xBQSZNxmIKdv6U9qdUTd63TpM28VmHhgKe
         AUJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795624942; x=1796229742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        b=doUBacFSO3fHM9jm2mASyqKgxVBnSEdrleIXWx6gUzeGbHZP8hymE/gZE8e9eyq0Bc
         WJB+btPKKFwlzTb+ul7G+6dNWnXZ6WU9wV/tnpCSdqP+KNZs8ACmYU+dcdRlkWMTAjrC
         wGFaFP79ZcyAc0F2GTWFqkGcy0aLj4MurMXl7F+AsKmm93OmfBvIB5++vCoMW685Hkwq
         VgqvHTYJSwOjyZh6QYz1z5aQX66mRXirOrq3jX6vpK275dgqMql1f7LwpGDqPgw0e8KJ
         3s5ej+Ej/G05nBB9ryWghli1OLRpgDXQTEDIPKjTDWFAYbjx6LC5znEPymRMebEcV8+d
         5WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624942; x=1796229742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkZEd21w22ytwfXvATd81Pem6F6SKIOvioc0T8Yq+UE=;
        b=AktoUUE54FJA0MH+7K6KYCDKBOeQOMmoL3FxyRxSorPcD8PtjjBvUDxghZyVVgLf3B
         UWsdKNaDE7rVkGcy7pWw0aw3IEffexroXNL5IgoGKzwyf2v4UaSC6Qwja4n1n5JNWwHO
         mflN/aF5+SZvTcKGXyzRsqGB89zjTD9SfPkSH1vtH9Fn4lr6MCD+TmE7q4ko8Bef3dCh
         9hHfOzPxDqYjb5dy4QtS6xz+nzAvWNdIBUxd3DUXs+rZOn/+AWidz7xUw53j5rdesm7v
         NFrfFrwH1t/3UFV+UcLDExmPoNl7+LzTHpNKngAyb+sdQYGFW4iIzwM/nmBSM8tCG7b9
         QIfw==
X-Forwarded-Encrypted: i=1; AL+hErGpFNzy8rXT8A8i91C1U16pIBmt3cUV+97EjrkmN33INo2+R9WIMr3TwOPlCO7mA+d/yKu/sIaUF4e3NgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99NN4kJ7chMJ10vtGPYPpwFWzjceK8MrEW3upnF9R8iRqCw53q
	7hygNFhvnRjzok/gO4ls7V2bc9x82vuwf5BbS0XOz+Mz8ztnOPrhWxyNbXP3MQBFs38iM3XCrTI
	4dTyH6lWfiVDiT9j4luo9JnaYuFqDN/pskxXzqymVzARL5QcqhLDQ5ltLkgtRORQN+JfnaxVaL3
	9mtxuNNnzh1awCLVHc3HVsfdjW80dCAhF911/1SgdcLg==
X-Gm-Gg: AZFdTZdMKIl/FzQnIaf2RolRwC0T8OPt0F2CCV3u8lXu8pLxE94Km6OOFBkgJhpub2+
	MBxSbMpdWLp5ZScrF4+pJAPjiaz1ikNoRQGg48YNUNyRFhwyOM/fQZ0iseI/R/lrPhL9g00+0MH
	7CcHnFrnFgZFHr2rH5v1AcK0TSgcS4QFFA6UuyLLObO2lPyg5kl8+0rdnBsVsB+ojOwJL3U8nXW
	IwbLH6fKUV+W6wwQ+fwC0h2ISEfyjwR8LpTXBJQ56Iv7oj1y9hx8i6djO4aSAibXKPDjlSM8OA=
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id af79cd13be357-949bab14280mr3203108985a.70.1795624942119;
        Wed, 25 Nov 2026 08:42:22 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:945:d852:1618 with SMTP id
 af79cd13be357-949bab14280mr3203103285a.70.1795624941624; Wed, 25 Nov 2026
 08:42:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121194939.3647400-1-morf3089@gmail.com> <20261121194939.3647400-2-morf3089@gmail.com>
In-Reply-To: <20261121194939.3647400-2-morf3089@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:42:10 +0100
X-Gm-Features: Aa3M54pON6Dg34vZZDiCdbMrAyUpRK1E1I1B8NNIa1Qr3eqV_CLiVHxkBaMNstA
Message-ID: <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip
 channel stats events
To: Gianluca Boiano <morf3089@gmail.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2NiBTYWx0ZWRfXysDXrDgl4oTB
 IQZ4HN3MIoqGGTZd9uXar/VDjMirTRIbICM7uLh6PmqW5FX9xGNYRcN4un3dKwhs5dEPy+VUBjj
 X0dMYPjRIt/5w4cDS8TT1rOwrZC5vb/qaF4GatIwI+K9AmDbhgLBsp1HyIJL76cxAxLgLhY/qHV
 AcmIZ7H5MwVTP7xgfIZZhbw0JEipqFvqkQY/kkkcnBOfS2L5scnYZCSw/pMV6mEsthy61Za8pRg
 cMLf9QlPIK/gt1sEp4UathgDJhck6mAnnLuKpxhFQVwZOrDw3Nfx/LydLqejoumumkCpD2viBmx
 t9rcWjW6Ytk4V8YEu2hdg83esYo05y/76oNFaecGPAdw82kFIVwY0osDyVm3v0myxs4geIesVDR
 /CJry7eIw7710HCT1gRxYOCcbAn1xa/WLKTXERhrctplT7T71E+IvQ6GCV5919+zqvXYL+ZsFTn
 JUIdOH1/fwjQNM7E0BQ==
X-Proofpoint-GUID: l9LvHShY2SdGM3K4p8BnfIuCgr79NkVF
X-Proofpoint-ORIG-GUID: l9LvHShY2SdGM3K4p8BnfIuCgr79NkVF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2NiBTYWx0ZWRfXxEe2rQWLqCxD
 yog85CiqZ6GOY+crtm+tEYK2mYpR7ILSfWpZ9XQDpSzMPp9BOf6ZruTKdIYFkvfWGRnsq2Z1Dpi
 eoysc+oe0CVIgR6CD8ivYyEGnRMvxYM=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b070fef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=Wc1NDcPGuWUPlOtgj-wA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250066

Hi Gianluca,

On Sat, Nov 21, 2026 at 8:50=E2=80=AFPM Gianluca Boiano <morf3089@gmail.com=
> wrote:
>
> SDM660 WCN3990 firmware crashes during scan when the scan command
> requests channel stats events (WMI_SCAN_CHAN_STAT_EVENT):
>
>   qcom-q6v5-mss 4080000.remoteproc: fatal error received:
>     err_qdi.c:459:EX:wlan_process:1:WLAN RT:2073:PC=3Db00a5d88
>
> qcacld-3.0 only sets this flag when gEnableSNRMonitoring=3D1, which
> defaults to 0 and is not set by the vendor WCNSS_qcom_cfg.ini, so the
> vendor driver never exercises this path.
>
> Add ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT so affected firmware images
> can opt out via firmware-N.bin. With the bit set the firmware no longer
> reports per-channel statistics during scan, so survey data is not
> updated on these devices.

Are we handling or using the CHAN_STAT_EVENT data in the driver? If
so, which event handler or function currently consumes it?

Regards,
Loic

>
> Tested on SDM660 (WCN3990).
>
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 1 +
>  drivers/net/wireless/ath/ath10k/core.h | 3 +++
>  drivers/net/wireless/ath/ath10k/wmi.c  | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 2aa18adb3..d37add4cf 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -815,6 +815,7 @@ static const char *const ath10k_core_fw_feature_str[]=
 =3D {
>         [ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] =3D "single-chan=
-info-per-channel",
>         [ATH10K_FW_FEATURE_PEER_FIXED_RATE] =3D "peer-fixed-rate",
>         [ATH10K_FW_FEATURE_IRAM_RECOVERY] =3D "iram-recovery",
> +       [ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] =3D "no-chan-stat-event",
>  };
>
>  static unsigned int ath10k_core_get_fw_feature_str(char *buf,
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee43261..29a4c0d74 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -838,6 +838,9 @@ enum ath10k_fw_features {
>         /* Firmware support IRAM recovery */
>         ATH10K_FW_FEATURE_IRAM_RECOVERY =3D 22,
>
> +       /* Firmware crashes when asked for channel stats events during sc=
an. */
> +       ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT =3D 23,
> +
>         /* keep last */
>         ATH10K_FW_FEATURE_COUNT,
>  };
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19..adaf3c80f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -7095,7 +7095,9 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
>                 | WMI_SCAN_EVENT_FOREIGN_CHANNEL
>                 | WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
>                 | WMI_SCAN_EVENT_DEQUEUED;
> -       arg->scan_ctrl_flags |=3D WMI_SCAN_CHAN_STAT_EVENT;
> +       if (!test_bit(ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT,
> +                     ar->running_fw->fw_file.fw_features))
> +               arg->scan_ctrl_flags |=3D WMI_SCAN_CHAN_STAT_EVENT;
>         arg->n_bssids =3D 1;
>         arg->bssids[0].bssid =3D "\xFF\xFF\xFF\xFF\xFF\xFF";
>  }
> --
> 2.56.1
>
