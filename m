Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602606;
	b=SrWw7Vbq1pHSeidxRQvPUgMDRYtbMQDn1uAlS118QPDjg8EhSmV4wbdnDJO8jJqpe070
	 66Xy9HxyjVQTPbTi6yhM2gCgRmR+MXS9bqqPKcDTDKSvwp7YT2Icx8iXLKzL5jivwh1IP
	 I+vp76uXjbixyBbeQ1ozlk8x2pEKE/9hx/OWYuAUjcjOtPBw3YwM+S8MRLzSQ0lw2Q/f6
	 EHEI+h8JoWLi7rTkpvMrXMaNxVUSIvMfLf4T+wc1I+EYBDhO2hE3UTjSxPx+2drbYzHKM
	 4Bfd52DRly3vzJgF61h8LTDinetkk+z0qe+oHd3I0ZyaIL+v4XfDodj5tanzfaEEeiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
	b=lsgKYVG+D2mSI6i6s+qTfvkdmE0cBV6IjpDeBGm/rsYR7U0VNMQARCk/r1GpcuNL1AKN
	 /ojUK27r+uqCmPRO2IWl7DTAIt8h36gm8MwHc6r1bJW2a9XMGNAIELJiz7JbwkUmkYN0N
	 oK4cXR9iHdVMhSQB2ZAxUmLXuNAzKXOytWn8+18KN05aNPkNkhOFkfyoYnnxG5u2L4hvJ
	 qRCjUUtU1yByBHLKCjF7MF0OpJfJ0sTydrtkknYuPEEM2HcQsNWXdtydIyWcI2l4PlRBQ
	 u9uSHAB3H93i12nGbgta20HEjDLFgCwlz5aV5r35qNrEnNfiZaOp5Id5Le+yG2DUQvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hS/j3m3N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V/5fuywX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F9E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hS/j3m3N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V/5fuywX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMtM2356506
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=; b=hS/j3m3NMdqSZNmn
	H/9F7AGBxeactUtknaWoOn92yBBi0bRfu+zo2N02aqxQRGFtbrErVNK7sFs2mV4+
	2oFBBTsKdaIVXaP+W8rYALcSTxg3wt+8+8gkcjFY43TFPhMS/k90svZG0YMOUTs+
	hv63zRTnzGFYKrM5z/EqI4jXPPvZyRTgpovS958JcOWnMBL9I+zXaomNrZX/DgMi
	VqBTIi8ctPeWKMEHRlP51MgTW1eeCh+O/4rQVfRtkCug/gwOc5N7axw+p02AgJ2s
	S6OfBzov599DVY55CVtxXrX9D+CP0yGmgsLz7nJotvFEFPfDsLqCgHCMOheK4BLB
	/Ie4jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a29k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:30:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so882697985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602603; cv=none;
        d=google.com; s=arc-20260327;
        b=jcYRq8svOq3moYpi5MsJ5QO6G81G9ya8wzdbWMZDej+DwnarX3qcHzUTiIzVWJlqI5
         L4y+nIIk4I5vqDx+myKDM7ug8HSM3MkckYlRQYePsC5rd6zqAcakLeDXI3lm+kJBJdZF
         4riUbCuUEoqmS/3sRiaOTd1FuSWKD/gsLu2oAFDM/AqD6tAXHJtj0ykparX4fHrRtL4O
         JOe7R56sy8GLy7vLLP++OybWrWRDTqxQ54WeQ+1Mosl6myg/8Yx6JiEsJjfdYUVNAV+u
         viHBF1ldwW9/V3eUlRYrw2z/GfRUVRMqM5MK1Lrp7VvXUzdiXeLqaszn0BiGFjSP6NEb
         UlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        fh=EJy2MEIr0ZxwS2F55t1lhuk1GkPct1NfH6HLMLNPgZ8=;
        b=Mij+taSiwQZi6uVYmYRTdchZbNGH5S7uAzOytLoQ9jQVyjSqdhqJlpeejCf6ZYUxBA
         i/oJv43iqfVOTjlUUhROGFHHLbJGMgbINtXzTjY2zvuQyuKzqnfYkWKBJuE/Ueq+aHem
         vUI21/qF2+YLL9/z0OwFxbwePxLfWEnG6CuLEkQBb460fbmt4bWHKd+z+TMn4MGS3NMl
         MOhTQj2KBqZKF4zjdI1MZcv6Wio3XBXm5V6ea1wTIThLl2a4H8vthPU8ZnfjOLJ38uii
         6rxshaCHKniR+0gLL3IeQhtBu36EVoTN/LPttpzCeHl1DUH8iHQySb2siclbZR67nyL1
         7iqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602603; x=1796207403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        b=V/5fuywXAKfgqmXbCPaGXPqNhzD4J65tVXWNvnevDqPzWczNaigwocUhzgXNN+TPkn
         XEokL8wiS3O67NyolQao+qAivCt25z3nRCspQdcokDdH5+drjisCnBBrKSiRg0aoqpXr
         UzEpXqZiBVcaxwQAJqdkuwJEzgN/4d/8dg8pjLEd92g/1XpAAm/vkzKVE4e/W35Pk8CR
         j2Tw5zhBkPv4mb0MBb8EHmPvWNij+h7JGM+eh6lC8i+3xTBZdYFqFQf8FOs+lQErMa8B
         BAyM8GntMyU3N/r4KwsCu1OeY8ccODr6V6gsflbrEilp/DYzcKXHskpLSnZflRij7B6f
         2zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602603; x=1796207403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDBvWU3Bn9MrcIEmxc/mosjYDNw1HBIrT+DK63lwen4=;
        b=lnPk+OH7rADOVNDjfwuhIH+MlnDdfZ6uD4reJqpCElD3mqm3yWpYumWLfCG5fCwkhG
         Tj8LE59dfVa5VLxF5DX5pWKXmUkrY+P0WlNYxfH83Tw3p4IkLEUVj6rf76Lef5rsNjMB
         Mu6PGI1w5Bd75jZ+6kLIWgMmoCgYczGwv57PD+QAQc3EinsV5VNDb5LWyv5eFRM9YXmF
         DordrJXrXhIyxMv9a5bpd+5obAIbWpN6v34OiZ7hcpZypUZkSJWg9eV39iL6CnckYo0D
         McS8TuE/BVUTfgTHgknXOwti4X0cnKwv9rp7YJ+exaHRiYWQ9jv8TslreqkiAOlJ6UV2
         9uHw==
X-Forwarded-Encrypted: i=1; AL+hErFGzimWhzVGqLlwhpZIwh6rfjbqdSSLd2Dq9YdL6zN8YMPtB+dFqnzwCElm+uXPXIAZVgtg7HwZm+SaUjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PdvC31UrpQPSVd/i7owSpWJQm6iY9xzbuIXmwwOjxLyXYQd08
	5z0Zzmd7Bpjr4+Adv4mxcDLV2uhTx9B7MXvXs6CoYgvZM9lZ1bdx9jjdBxng28SVfBVS+RUwesB
	jFTCGIsT4JeVfMq5oNEBCaBBD8fPt9Z+KMMXWZTYzQfQU++SU/8xgyI/73UvG3NEfDEthzaNMfY
	pahftACtXDE9S11Q7MgnlMMs8+TDLGVBgj0ybsX0aP2w==
X-Gm-Gg: AZFdTZcKrMZZk1QSSR62p0dkUgef++Uiow71WZYKvNJ2EryAAscNypUgOzaIU6YDZlI
	Zb7TwI5PZeUl1NirP5WayDtTWwymWUrY9LA6CiBJ3/d0fyVYA7stg6GU4bvmyGQhUrpgq9mvwLX
	AxBjGFFG76AEOhAv9zktli6FsX7q3OEQOixxaBQHuQ10cd/asEoln2NHAqBXZHWOoXRHjA4/FPL
	rbAypuw87JvGFn5hTcan+wJfO8xmBLqzV9Wcl+f17EiaALBvDvNUAZXmzDaFCLFGYPG7Jh6oFo=
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr2961756685a.52.1795602603464;
        Wed, 25 Nov 2026 02:30:03 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id
 af79cd13be357-949ba9dade9mr2961753785a.52.1795602602972; Wed, 25 Nov 2026
 02:30:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:29:50 +0100
X-Gm-Features: Aa3M54pGufnYI-QRJO7Cvakq8nMpzAuX6uVfz_ev6QiRakiuPxsV2Dp10hW8EKw
Message-ID: <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5yfQrOyocwiG_eugPcUg81Rn3lK-7jZ7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXyTdFrMkF+qEI
 9kaEpE/nk6IFqgczv1nVBFqhI4ir8/fZnhp6UDXDYVOdX+XqNnmuPhkiN9lIUb59C0JsPw9KLCA
 pFRgYieCwaCbmnjn4HGXrYI3yGEzXJk=
X-Proofpoint-GUID: 5yfQrOyocwiG_eugPcUg81Rn3lK-7jZ7
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06b8ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=a4m5kgtdxY4tjFFkCegA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX+DQ0980X1O85
 W9FMWrbIdZYQGnSFd4bzQOnNYCUcrkoHIzwxi2zbsHDKgaZG+DaUxHkm/FognHoqsDxn75lBVRo
 aI+JY+cQ2bRJFf5IyISfhzXPCrIOB+zg/gn8fMvYyjX2oZj6f24uNJhxauitwI2L3PE8Fx0mAnL
 bRCBoQ5BFB1lf6xYYbyIoE1prK739zxnrFRmRw5CruXJV5aRWkukbQzAPo3ZY+7Tf50/KCsuip+
 bmuLy517YX7sdK7BoDr/52cUWKQGIP5eO3jLqw6Wxya3v8K2bPTwMbTsumypQ6RJsEYcJ6cA/y5
 WaqWP4ROjT+7lSsB3Hm0QBV6zKJhu+WanOtlH9cUba3FGeLiRR5Ft40OgqDueUTvZuYdx0/EGCH
 wZeIBufJ0YG7AfAB/Yfsm+Usaio451YkGR3C9k8RF8rS/tkjjqVKb0fGpWvIeVtsGfhscbbSd9c
 CIiow5l2U0+gOGCOHog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
> hardware is unreliable") added a fail-count based transition
> to ATH10K_STATE_WEDGED after repeated recovery failures.
>
> When recovery starts, ath10k_core_restart() sets
> ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
> the time the failure is detected. However, additional waits
> may be created later while the recovery attempt is still in
> progress.
>
> If recovery ultimately fails and the device transitions to
> ATH10K_STATE_WEDGED, those later waiters continue sleeping
> until their individual timeouts expire even though no further
> progress is possible.
>
> On suspend/resume, these extra wait timeouts consume watchdog
> budget. Crash logs show cases where one or two such timeouts
> are enough to cause the suspend watchdog to fire before the
> driver finishes shutting down.
>
> Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
> handling when entering ATH10K_STATE_WEDGED so blocked callers
> fail immediately once the driver gives up.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unre=
liable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----=
------
>  1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index b536c21630b1..3bb4d2742c30 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar=
)
>         return 0;
>  }
>
> +static void ath10k_core_wake_all_waiters(struct ath10k *ar)
> +{
> +       complete(&ar->scan.started);
> +       complete(&ar->scan.completed);
> +       complete(&ar->scan.on_channel);
> +       complete(&ar->offchan_tx_completed);
> +       complete(&ar->install_key_done);
> +       complete(&ar->vdev_setup_done);
> +       complete(&ar->vdev_delete_done);
> +       complete(&ar->thermal.wmi_sync);
> +       complete(&ar->bss_survey_done);
> +       wake_up(&ar->htt.empty_tx_wq);
> +       wake_up(&ar->wmi.tx_credits_wq);
> +       wake_up(&ar->peer_mapping_wq);
> +}
> +
> +static void ath10k_core_enter_wedged(struct ath10k *ar)
> +{
> +       ar->state =3D ATH10K_STATE_WEDGED;
> +
> +       set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
> +
> +       ieee80211_stop_queues(ar->hw);
> +       ath10k_core_wake_all_waiters(ar);
> +}
> +
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
>         struct ath10k *ar =3D container_of(work, struct ath10k,
> @@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct =
work_struct *work)
>
>         ath10k_err(ar, "recovery did not complete in %u ms, will shutdown=
 driver!\n",
>                    jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
> -       ar->state =3D ATH10K_STATE_WEDGED;
> +       ath10k_core_enter_wedged(ar);
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
> @@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct=
 *work)
>
>         ieee80211_stop_queues(ar->hw);
>         ath10k_drain_tx(ar);
> -       complete(&ar->scan.started);
> -       complete(&ar->scan.completed);
> -       complete(&ar->scan.on_channel);
> -       complete(&ar->offchan_tx_completed);
> -       complete(&ar->install_key_done);
> -       complete(&ar->vdev_setup_done);
> -       complete(&ar->vdev_delete_done);
> -       complete(&ar->thermal.wmi_sync);
> -       complete(&ar->bss_survey_done);
> -       wake_up(&ar->htt.empty_tx_wq);
> -       wake_up(&ar->wmi.tx_credits_wq);
> -       wake_up(&ar->peer_mapping_wq);
> +       ath10k_core_wake_all_waiters(ar);
>
>         /* TODO: We can have one instance of cancelling coverage_class_wo=
rk by
>          * moving it to ath10k_halt(), so that both stop() and restart() =
would
> @@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct =
*work)
>                 /* hw restart might be requested from multiple places */
>                 break;
>         case ATH10K_STATE_RESTARTED:
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +               ath10k_core_enter_wedged(ar);

ath10k_core_enter_wedged call ieee80211_stop_queues(), which is also
called earlier in this function, is it expected and harmless?

>                 fallthrough;
>         case ATH10K_STATE_WEDGED:
>                 ath10k_warn(ar, "device is wedged, will not restart\n");
>
> --
> 2.34.1
>
