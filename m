Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602930;
	b=T0nzXONpa/+wXirGXD4kpE2eknpmz0kk9cEpTwK/QALIkDEIPoBVIVelehTgxdVXBQ2K
	 GdtVZdYdCqpSvBwZ4gbrzRp2BEr8V096nx/hR2yLjx9ZyTbxgvYkbQY6Harsbp2zMwMcL
	 MXYLcC39XCFZSPGYEvY3zvMPWwjfBubYU3Rc/inp01z0jzbmSv4VrOCerFKocj1l8LztO
	 7v7H6aQFjFAftZjPGcvMJl5hWyW81KoouhIqD+t9qDPTvmEtsY27RzHttnvt3SGO2hiuP
	 qmI88qqzfPF7UEvMMerClPqAJY9aEdrmgWLRrMYFqxyIOcuyBUop8SFGewvS7KNkpXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
	b=kIXrvh2jFKcMy0rRG8tHygbChTaAQp2giVSGvpurku5X9a+lm696iQAd8U5jgHeAcbDp
	 9QOXhY4vLsARnHVALGRMCvkQZ4AljqEuneLUHOtGsy+lgtEL2REyZfXf9xiaNX+PUVgRV
	 gN30noPlHt+X1rcPLeLF+HQCHqSC63x/3pJHDHdPvgUhnYPR0LR/eV0SpRARWuF7rVeuc
	 i5Zv9eB8gLECW2H47AgSPbbqNKvbTDy8MHcpG4EDQoKj6GMFsn0nqLerKA3bT5iC1hYjG
	 fmJCF/XfN8IcNiJLvjwHB5Sc3W2MSty6lwAjGmCyV6rMDr/m7RF8rdM8Gi29ulySbZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPS8S8Ii;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgkaCQ+j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE3606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDE3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPS8S8Ii;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgkaCQ+j
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nkbb1505181
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=; b=kPS8S8IigwGwHRGX
	S3Zsyb2MOD8LzaMZmtRaGhenxVSZg3ws2mnfSLq6/b7sCEhuK56sZRtoMbhTHWxV
	VSY01FTKZ3U+1F9uj73+Kyc9WLR3iHq0x9dl4w54ZGuZedR6eD4gG1fYGcckN5uI
	XhEuH+cinRpmOnzAaz04ZBYbrgsKur9f78LY5sfWld9wQWRjMZaaUIWIkFPCK4LU
	/eaU4AS9QThcWtz0HjQm3WidZRCXqEcVVegn/R9gKFYGcR7hS+eeJhmwhGwx5qRA
	+q7vgEDGPNGVaXzy+OC1lHabZ0bM6FbzfpcpacqI/ha0fj46EOOGkO9J3+lzyzii
	aZG0LA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29s6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:35:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so627783585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602928; cv=none;
        d=google.com; s=arc-20260327;
        b=TnFd/9utWCrujxx/l8jCDryn2F9N0ge/nsmIEgJvRYAxTaJMA1ldYHqyS7d8KkDQXN
         sDkcGtCO0QMBW5w8WH5T3LiSOl20AIcfM7D1tMTGpjCSZq6DXM0f/nwyseu5HOSgA0WQ
         aiFn5H8wEoRlpIxjr0AdmDwgRY/RsIReNAKHNjg5WlJ0Rz04jgOGpwGac6XCRfLqT/rJ
         lggwL3BnE/qD83IJ25sLsbMbCHpi0l5uh/t2oUy4RSOkiYHAqM6KaFvduMi2/hd33XY5
         /GHM9y6XSTWhS3rN1xZI/EAg7B0GKFWgVnov3e+irisAfbAzTcpNhf8WIlew/RYwa+vq
         eh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        fh=COkYn7NJVZwLtS0zOhy8QSsoEr3rKcCedK/l4XPwvp4=;
        b=YY+3SsQKfwDjVzxLkzHHRBapr28XbWq/G8lwy9PihEibc48Rndk3r8aRjt/Pm9AKwa
         SnmaRF7Tl5fbO4Fse2zVtSbqkes2l0DEsx1uA3jjQ0TZALRvJMDYwOHDPynNy1aQKbjZ
         yCHzdk1QpPnupAnkUxtEzHqALhvaoqgxxh1/IXRdL67zNVlf2q5VA9azJh3R9YCykEtZ
         A632PNMFEbPVH5pedra9MAe/90+BKrxXBw3sFaCq8M9p0HdtfPupjh/CNflkEu3YZBtg
         LxtvvnGH1sYOi/RDerWTEa7TkhyAgoLgw9jBMi6Cx+LmT/nareHRB7+W+qlHmdibKYlQ
         N2dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602928; x=1796207728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        b=WgkaCQ+jmbEeceL/Y7/bwqn1WXNgzubFaYXiTjWZw7w/FHHghXEcHO87W+oUdZJqGu
         y+bCW27aM4uzEyvNyyLQa+va9Q1lqPttgq+3YklTOSMEiWdyntXf4fOa7+9UNHQWlsrK
         MXsl9Ben1IXXPDMooBWcpcGz5qf9MdZo7aCih5GKRfkb9rOVQ5nSNEoha2f18mrNewvI
         s9VsV/xFVZO/8huyOCAx96PVeJjdQx9UP/2LzQ7U/Um7MeDFzLq9sOCpBm0JU++Ax6IH
         +1ZsyUkVOdETEQDohCHAvkcMplzDYRgHdEP4XSt+nRBsYCIzi/1JjEJw2VUZ0ggm8auP
         dA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602928; x=1796207728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlCvBinW+taD1U2DNQUvK7SZc9L/PjkEBBiRA/zNd6U=;
        b=Gunxg/LoaDgYoEz8S/XGywo2Jt5GmDW+zrmFpFSXC+UbyETBElkxo3za2XjEkp3957
         8KF4ovfTg6YjZmUHPGccsNddg4SPxUYnqXymu6EczQfklhIQkTkyRonKBObiLsJ9S5zU
         OZDjbI3zyLeupObUY4XhIz/c4JHbB4hULUmAiLKlifNQ3aAUJzRk1zRyVvYyqQ2X47ih
         xbkg5FTrJga+4qcVWXsPoR/8cP4ufgyj4GOlYtFrl2n+as2QBEFZ+C/sr7fKct/P6sSr
         CnTJ2BPBdkFyU4/uMV+D3A8b5ZI4rFdGosSLO0w7jDgbRl6AVizLUhIo6UlQuuBJp5dO
         lN9A==
X-Forwarded-Encrypted: i=1; AL+hErHJuK40l/6Q+sD8x/rGEteTE9bMNkt2xGNssN/NOzIjoKtZtDN2xbKxka8RDFJ9smCGhjwbwA3SMF+90v8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d9yMNRopn3XEQe366BMNnWL1qm5AFBrfSvYXhI/+aZ4EFa55u
	Hz6N4E5a6VuD39nMUSIwcAgbt9aLDIeeovHE7Kbcwm2x8TgLHhUlJqtsx22mGubOTSONs7wlALt
	717OFMF9cFirRGcJeDxXH17fV8kPrvLSE9WUaH4otP+DsgzgMy91KkTJZnUBOph8c0rtssMQNtd
	iW2OSVZ57pNtQwhffBqHc7lQcW00Igk4JTF8mGJ6bR2+YcID1WUxBazZE=
X-Gm-Gg: AZFdTZfxql56+HAbh45zSb83hbhpQyN3Z1io9h/1x0G2JpLxbO6V+89LfTDgPLRj9os
	hdKglylQA6FCs0rOv3xUszp5xYWc+DmFnd173FbsAfsX7tEkyHoio6XtieaDyc8xFnQesK/0Wze
	QlY/FsVTXWqcOFSWzI8HlqT0OROD9EV3dM8N7NtNm71PoSmfc0ZBU3l2HFlp+O1UtCXJ4ANY3aK
	sDLlDLgNCI3MkNEZw+U5S9eS3omUng/Z2HkXDMM24Wy8Vh3njO9zimmn90VmqLf7yiEgEfSqOM=
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id af79cd13be357-949ba9b99a7mr3132210285a.26.1795602928320;
        Wed, 25 Nov 2026 02:35:28 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id
 af79cd13be357-949ba9b99a7mr3132207785a.26.1795602927857; Wed, 25 Nov 2026
 02:35:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:35:17 +0100
X-Gm-Features: Aa3M54re0FQ_0fXLMt1bXHOoqkxsP0SiwM0GqLy5xHbvAlYSumBJKK5qN-6KKNM
Message-ID: <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jEqPntlZbytIaZYVeGkIu4FS_E61-KbJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX7sTVvfYtVR/R
 cmTWLjiyERquXt2lolr1anYnC2kazcEH+1ITaUwyOhIqjkmPw99JMYVdouZ4HvLVGiNFR6OWsI+
 ElcY7MrZINVgealQqpe6EN1KffruEeo=
X-Proofpoint-GUID: jEqPntlZbytIaZYVeGkIu4FS_E61-KbJ
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06b9f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pfe4PHYFt_2W75ZQFz8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX9+khbYTkmpYX
 o9AO2eiJ7wkADmmhro06+KozwxNOK+yphsFkKVlCrdWHYAq0U4Ic2hXa4MOkZsnrekNvcRUulyY
 8SI/bQ/BpITixihEP6aZY4HMtBcOFvqt8/4mC02V0U6dBHt5haorMf+/VzLWt21WD+ggngjz/fo
 L8c0eumkOV0xQuITTq6X0AzCr2xFOl+LBrvJbpKPilY9dZ3WOYrMCyPUaIwUovLNePqlirBnt8s
 f1ljHK8u8eWG26iNbQcVCCARFhdzt5FpYUYutjyN0t3Jg6nKRaxLpdnGfgjvZohx0vFXeAVi0tY
 Y+vI1iSA1SXK9rO6P//1MBdHsO8gX7mg/iJoqP7MHkqQsGFqdhWDsgsG41P/GVVmz0bbP1Mam7n
 zKfzqpzhKwwS4wl1Uuc02BZvJqOYiBj2XRcCfkLJRYxOTr2SOjClV3DklhqD9gw1m502gkgKixm
 0Su2Sx945wgi9NzeZpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> ath10k_core_wake_all_waiters() still misses several completions,
> leaving their callers blocked after the driver has given up on the
> device.
>
> In particular, callers waiting on peer_delete_done, target_suspend,
> wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
> continue sleeping until their individual timeouts expire even though
> no further progress is possible. The WoW and suspend waits are on the
> suspend and resume paths, where these delays consume watchdog budget.
>
> Add the missing completions to ath10k_core_wake_all_waiters() so the
> callers are released immediately.
>
> peer_delete_done is not otherwise reinitialized before every wait.
> A completion left signaled by recovery would therefore make a later
> peer-delete wait return immediately. Reinitialize it before sending
> each peer-delete command.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 3bb4d2742c30..99960f12dc66 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct at=
h10k *ar)
>         complete(&ar->install_key_done);
>         complete(&ar->vdev_setup_done);
>         complete(&ar->vdev_delete_done);
> +       complete(&ar->peer_delete_done);
> +       complete(&ar->target_suspend);
> +       complete(&ar->wow.wakeup_completed);
> +       complete(&ar->peer_stats_info_complete);
>         complete(&ar->thermal.wmi_sync);
> +       complete(&ar->wmi.radar_confirm);
>         complete(&ar->bss_survey_done);
>         wake_up(&ar->htt.empty_tx_wq);
>         wake_up(&ar->wmi.tx_credits_wq);
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 74aca0af11c8..695df1821e5c 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 =
vdev_id, const u8 *addr)
>
>         lockdep_assert_held(&ar->conf_mutex);
>
> +       reinit_completion(&ar->peer_delete_done);
>         ret =3D ath10k_wmi_peer_delete(ar, vdev_id, addr);
>         if (ret)
>                 return ret;
> @@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>  err_peer_delete:
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>                 ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>                                                  vif->addr);
> @@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee8021=
1_hw *hw,
>
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ret =3D ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>                                              vif->addr);

So it would probably be cleaner to have a helper such as
__ath10k_peer_delete() that performs both the reinit_completion() and
the ath10k_wmi_peer_delete() call. Avoiding duplication.

>                 if (ret)
>
> --
> 2.34.1
>
