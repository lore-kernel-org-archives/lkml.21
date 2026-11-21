Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795275700;
	b=G86dX9tN0v6+9jz1qzZaal0D7uxbWX+8f6075EcKfFtdoVtDjyk1QIoUZA/GNUJoOfwV
	 N767Plt/slFtQUyTkVwq0X36WL9wYg89gXalwqAHOsZ0KRrMfRqmCVIM3aTVm1gbn0LVA
	 lJdmM2HOt94qMvVYppHSKRj/mipkz1/RCSv98o0fpJAUcfXPypNMMWhoz2HbtovczVOYB
	 uRE0StRm0iVMo4QlP1/06N9Jb7ctsicMHu3iblb4zeaK8ux9h3LveYX/ACT+qSTHtX+Dk
	 YrFG+K0MPY1r3O2fx8tI3EKVtDKEiABakcQKQ3qgteUiOIFLjgjs9UIG/iv+wEstD0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
	b=icKklI1FY4R/98j6rPW62C5eowxYC8jt63lV/Ml73U5omuPR37EBrBuqn3idfLMaV5cO
	 7OdulDpF15b8NvzMnDC6f+pBP+GDO/CAyr9adByFQ1R8P55AWk7wKHA39jWJq1wkrlXfn
	 tbffjYofg6Swy0FyoPuOEer77mS4KyTSFN0SlrPL9dHD8gsH12iTC2uj0ty00hHSzEaBO
	 1vYgMcCYDsY+2hUCwQUz3uyz4vCe6uolUJrxSJmPOVKB8dhJfd8aRcZLdW0vYs+5LjvSI
	 ih7ZurhH2+QzfrvGRB822o4zau0IhtLnVXbrSYarlEy0SRpNJ/uYy3cWgSp0tI4Ccng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zf00+kHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ucd7nsp3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D0606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F09D0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zf00+kHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ucd7nsp3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa0qL3174093
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=; b=Zf00+kHYG0nXv34R
	uTOrosKKQBy6BVaqL1IvPXEI/Uf+CQnI1Ajk6ucZ3ELCIllSNbsgbycGIvtsEzcX
	wCDl1fbGNDf6YLEynk4b9VFFbxsij6jAR9c1tRc+p1gjL4bcU84QgEbnZ3oPL2r2
	tFa6UWHiltGB66Tzk0FSIbu8XN9MSruR/BeP3HGUMFtxgM0RAcZsX8etsEOdlD7h
	j86zbS1agFGHdPfk+uCecXjR8h7CY2JZ4fHq1C1Jbz8TLeTsoh3KhYGAK8br1FKm
	+cJ5iFNaVSzsLYgS3FJY0g21QFKhAj0CKgxp0334cGKnH8sR92kLFrhT8SBSaq1U
	yv2XmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnssj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:41:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so326169585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795275698; cv=none;
        d=google.com; s=arc-20260327;
        b=F9voS02Kq6TRZdReiX3yGzxjimEfmG1Ca2P2I/cs2ME7LUrQEChOZVP20Uyg3PcHHc
         kpUrNN2egobO3qb+AZ/uU+kf5lz4+oT5aOoKQUddwmCpIlThu4MxVuqPlmLMQIEOIooF
         rULhHa/GtFzbkAMqk0Rrrh++zCjUPIh7iRoLr0yatzmEqT7Q12nkqkP7yy/gYVNsUZOE
         WG1v9LTdxxCUXLX60cFxEFioXv46RNS9ydz29PuolbmrRnFXe6B7l6GYbp8AviRJoAZ4
         4VOjWZKNkOBxU2k2pESOAaYF9m3/iktTz8tuVEMRn9CdTgbzcuN4gvc4yKDm4QYslccc
         OiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        fh=cTOIcIKav/C09U70U0fcUeoeDAraKgHClCLnRfen/EM=;
        b=XzGMsgFi3gJqQkB8cyrFaoyxWA3ild/o597lUuQSKm8B7Wx1FMgLjwDUCiNfzG+PdQ
         sB0pObW/XMcq6FqBTj8NGnZ+2nEUc22MHNnXRKjuuxJ313Fd6PzkC8BRxOd6lvwXItky
         9I/0nNmrsQr+xmdiSLWv8XUn8oKPM4HHQryFBFZDRdTA1EZjyGDoOloni/VuY4C86xh6
         S9ETDLzqEfOe8BnQfouCY5SypFk/cg1eC11euQ1Tqt4//7gMA29W2DRcKmLSlt8EiBvN
         PIWOrWWlkw0Ny2mkNL/Z/TpZtCI2A5EW87EzKdikdgHV6fGPdRxZx7XBcPDoWJQ81OIZ
         Wk8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795275698; x=1795880498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        b=Ucd7nsp33L7gDJ6HgiI6zluf6pdT4SRd3Afb1wLoUetypMawHW7fscP4p2PYWca1ss
         11zkLJgK0/uJk+wzsX9EtS438QIaO/asRZy3qttOJsYvG+T/S0CnlSDL3Qo4Lc01/JkM
         OePgBGf8SA08I0DzB7hNnQWJyrRe9/b1TAoF7zhmzWCzZOo/3x0pCAZdBnedOQgsWiGV
         kXgEJ0+eHazMpahOmuxm8JFu57ieKkYhvt3aJYYpIbWwOxG+xyhgSrbLhrtcw5Wd1IcQ
         pyJc0xa10KUyWIad9cI6Db5gO7vGYqYs3PaMMeMd9Jb2xTj+kzVEoFP9w5L3z0H6RK85
         kdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795275698; x=1795880498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnEv+0GadTuzB43O4JsnCW8IHtMKb4P4i06v056VF9Q=;
        b=FOq/6nuZn4B+/offF5XT/KvgZB4ZPolyjV+GRa0PrLt0b+SY4Ayl8MSUYVPfuO1axg
         6AnWkzkR7gx6RyK79weOJwt3xbms+QOjHthVPekoC0rSUVHst+7Uvi2mM8SjY7xiLP06
         pnDkJDRNlJ3e/KKbA7A4UhGVXcoOsAdhDv7ETP1T7z11vQBdb/ywZwHVKxBk34M0D9vx
         q6f9yadioZYjLt4zn0P0nxyhV59bXu4kixTkkpZu3N/oj7BPrSqDnCwOqtAOBstsB2tm
         cx8J0+LfekqjA8gnwzbkIDfXsrRZ5VgUzG+sJQcF7dzIRhiUQ5GWaJVU2eRHVNL97nsG
         wmWQ==
X-Forwarded-Encrypted: i=1; AL+hErGYi1/52AOz7HhpMdimfjP9V0rqj/U0RaKsaev91cSu1mFGBpj+A5iHg75C/3GTp8CiP6/T/wuR9HzAyPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bt5zlg81UHd5yUKxGmFw/rBB/TC3GZR/XFIDSDmgiPiy80Hv1
	ylsN8lqHSmSGFpWAcEQLKExknT9RXDoV9/U5cIGHfdopuIUJwN9JAjseXQ2VqlY9SW9xfRlGvE1
	lHPYswmcjq7syrBUzV2c7aqkZgHy+FVfGgABsCe47u/EWI+DqzR+qc/IwblEwb+g5MCfYNf5iRd
	GVMbuokhXFTUrhiy6WtwuQUwVUJXgfpu8H25IF6398Ag==
X-Gm-Gg: AZFdTZcVhB79dlDEgssG7LYvhM9G+oq9YUyVcteNZRgMX6XGh2mOJmTMCyIRnR6IYaG
	KR+mHJr6neGXxIPlpvb9qooa5rAtcZsPhtuW84AdNt+qNwbB8xoVhm9agFGiBMBdO+RunjUEL+s
	Df6jz4o5Fk8DOO8naHfANNQYcx3C06ywBcWi2Nz8D9+/h8sY7eqjQfHNh227rkwbh2/7DzwMWZN
	0l7rx635Q9lnIjzwms9Nkf4IIgMgr/40zNrCjTmHRqeJLVyGATvyTt2jRK+BbrOV1OCELVP26U=
X-Received: by 2002:a05:620a:450e:b0:949:6fb1:b422 with SMTP id af79cd13be357-949ba9b7194mr1114808985a.16.1795275697849;
        Sat, 21 Nov 2026 07:41:37 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:949:6fb1:b422 with SMTP id
 af79cd13be357-949ba9b7194mr1114805185a.16.1795275697365; Sat, 21 Nov 2026
 07:41:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120202652.344435-1-mick@yoxcu.de> <20261120202652.344435-2-mick@yoxcu.de>
In-Reply-To: <20261120202652.344435-2-mick@yoxcu.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 16:41:25 +0100
X-Gm-Features: Aa3M54pCyq3c11vW8Cv8YJB0fq3KEU2hM8dxCkOG_3zQ7oEIL2UMWXIcnugLorw
Message-ID: <CAFEp6-39PaCm5JoFVwpYQEuM7Eg0xDKwWKnripuDwh8fVXS24A@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath10k: configure the WoW action frame wakeup filter
To: Michael Auer <mick@yoxcu.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2MiBTYWx0ZWRfX5Gb5TsyoC5oE
 X1ahQLBv4if/9zM9UPp34F572n55/9SNKWdIctfs5tAyPvu3fYGWZ9PZYP+zUZPQxImD9IRucmY
 KxXyExX5ea1M6rdRUdohfhIJ7UfCQi1blaqvwwKBykOcooZj6Ip3CCuTLEsJxMCPcjqQOEpLcct
 Sysp4c4VTk4jgDGxA7OK7E0KWumOTQPsxIRl/xl5ebCw2RDNQ0J8oGUH8cs61b26tV4rG9W7ZbD
 aX7RCBvbajn9Otfqta7t+1omeey4GdOvzkM5SeUgkkMHeqnXl95aIfljkemTe2XlZSrzOVA3JRI
 veAzAmAbtrz+cmDjMRwYhFn357f3M0escceP1vuqHLJxmISYbVqGK67WiDV2uk+lYsR24NUyaZh
 E90ae52s5Zqa7vr6RxWE6i8Mkr9bDuiU/AwytEiwNpOhFP/zqcyaqPvx5eLyB/1KmvvVawcMXIU
 t+WnP+yk2x/dwz01PBg==
X-Proofpoint-ORIG-GUID: VI5k90miQivBoVNljMl8zSsrrxZlC6za
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b01bbb2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=K619b0bAtYckEcRTAzsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2MiBTYWx0ZWRfXxvhHjBV7OsMb
 CCBhnUgrIgNPQys7WqvN6Ni/TOs+/Q2sfnzt+HSQR1Jy4QRHr0DoTK4NUqGVkJ9mmk/wBQbEvAv
 W5nBZHngA5IzuYx7Lir94FA4OOUMOfo=
X-Proofpoint-GUID: VI5k90miQivBoVNljMl8zSsrrxZlC6za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210062

Hi Michael,

On Fri, Nov 20, 2026 at 9:27=E2=80=AFPM Michael Auer <mick@yoxcu.de> wrote:
>
> On WCN3990 almost every system suspend with WoWLAN enabled ends within
> a second. The firmware wakes the host with wake reason 38, which is
> WOW_REASON_ACTION_FRAME_RECV in Qualcomm's fw-api. ath10k's wake reason
> enum stops at 27, so the debug log shows "wow wakeup host reason (null)".
>
> Qualcomm's own host drivers (qcacld-2.0 and qcacld-3.0) send
> WMI_WOW_SET_ACTION_WAKE_UP_CMDID, which sets the action frame
> categories that may wake the host. ath10k never sends it, so the
> firmware default applies.
>
> Send it for station vdevs in ath10k_vif_wow_set_wakeups() with the
> values of qcacld-3.0: allow spectrum management, QoS, public, SA query,
> protected dual of public, WNM, WME, FST and VHT action frames, and
> ignore spectrum management Measurement and TPC Requests. A failure is
> logged and does not abort the suspend.
>
> Also add wake reasons 28 to 38 and print the reason number, so unknown
> reasons are visible.
>
> On a OnePlus 6, 3 of 3 WoW suspends were woken within 1 s with reason
> 38 before this change. With it, suspends last until a real wakeup
> (magic packet, pattern match or RTC). In a one hour idle test with a
> push connection the phone was suspended 87.6 % of the time.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1
>
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---
> The per-category array has 32 words, like the 2018 qcacld-3.0 for
> sdm845. qcacld-2.0 and newer qcacld-3.0 send 256. The fw-api defines
> it as a variable length array, and all allowed categories are below
> 32. I only tested 32.
>
>  drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.c     |  4 +-
>  drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
>  drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wire=
less/ath/ath10k/wmi-ops.h
> index f3f6b5954b27..780c2947cc5f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
> @@ -179,6 +179,8 @@ struct wmi_ops {
>                                                     enum wmi_wow_wakeup_e=
vent event,
>                                                     u32 enable);
>         struct sk_buff *(*gen_wow_host_wakeup_ind)(struct ath10k *ar);
> +       struct sk_buff *(*gen_wow_set_action_wake_up)(struct ath10k *ar,
> +                                                     u32 vdev_id);
>         struct sk_buff *(*gen_wow_add_pattern)(struct ath10k *ar, u32 vde=
v_id,
>                                                u32 pattern_id,
>                                                const u8 *pattern,
> @@ -1422,6 +1424,23 @@ ath10k_wmi_wow_host_wakeup_ind(struct ath10k *ar)
>         return ath10k_wmi_cmd_send(ar, skb, cmd_id);
>  }
>
> +static inline int
> +ath10k_wmi_wow_set_action_wake_up(struct ath10k *ar, u32 vdev_id)
> +{
> +       struct sk_buff *skb;
> +       u32 cmd_id;
> +
> +       if (!ar->wmi.ops->gen_wow_set_action_wake_up)
> +               return -EOPNOTSUPP;
> +
> +       skb =3D ar->wmi.ops->gen_wow_set_action_wake_up(ar, vdev_id);
> +       if (IS_ERR(skb))
> +               return PTR_ERR(skb);
> +
> +       cmd_id =3D ar->wmi.cmd->wow_set_action_wake_up_cmdid;
> +       return ath10k_wmi_cmd_send(ar, skb, cmd_id);
> +}
> +
>  static inline int
>  ath10k_wmi_wow_add_pattern(struct ath10k *ar, u32 vdev_id, u32 pattern_i=
d,
>                            const u8 *pattern, const u8 *mask,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wire=
less/ath/ath10k/wmi-tlv.c
> index 01f2d1fa9d7d..2a3b2bc2a478 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> @@ -3713,6 +3713,51 @@ ath10k_wmi_tlv_op_gen_wow_add_wakeup_event(struct =
ath10k *ar,
>         return skb;
>  }
>
> +static struct sk_buff *
> +ath10k_wmi_tlv_op_gen_wow_set_action_wake_up(struct ath10k *ar, u32 vdev=
_id)
> +{
> +       struct wmi_tlv_wow_set_action_wake_up_cmd *cmd;
> +       struct wmi_tlv *tlv;
> +       struct sk_buff *skb;
> +       __le32 *bitmaps;
> +       void *ptr;
> +       size_t len;
> +
> +       len =3D sizeof(*tlv) + sizeof(*cmd) +
> +             sizeof(*tlv) +
> +             WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES * sizeof(__le32);
> +       skb =3D ath10k_wmi_alloc_skb(ar, len);
> +       if (!skb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ptr =3D (void *)skb->data;
> +       tlv =3D ptr;
> +       tlv->tag =3D __cpu_to_le16(WMI_TLV_TAG_STRUCT_WOW_SET_ACTION_WAKE=
_UP_CMD);
> +       tlv->len =3D __cpu_to_le16(sizeof(*cmd));
> +       cmd =3D (void *)tlv->value;
> +
> +       cmd->vdev_id =3D __cpu_to_le32(vdev_id);
> +       cmd->operation =3D __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_OP_SE=
T);
> +       cmd->action_category_map[0] =3D
> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
> +
> +       ptr +=3D sizeof(*tlv);
> +       ptr +=3D sizeof(*cmd);
> +
> +       tlv =3D ptr;
> +       tlv->tag =3D __cpu_to_le16(WMI_TLV_TAG_ARRAY_UINT32);
> +       tlv->len =3D __cpu_to_le16(WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGOR=
IES *
> +                                sizeof(__le32));
> +       bitmaps =3D (void *)tlv->value;
> +       bitmaps[WLAN_CATEGORY_SPECTRUM_MGMT] =3D
> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IG=
NORE);
> +
> +       ath10k_dbg(ar, ATH10K_DBG_WMI,
> +                  "wmi tlv wow set action wake up vdev_id %d category ma=
p 0x%08x\n",
> +                  vdev_id, WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
> +       return skb;
> +}
> +
>  static struct sk_buff *
>  ath10k_wmi_tlv_gen_wow_host_wakeup_ind(struct ath10k *ar)
>  {
> @@ -4272,6 +4317,7 @@ static struct wmi_cmd_map wmi_tlv_cmd_map =3D {
>         .wow_enable_cmdid =3D WMI_TLV_WOW_ENABLE_CMDID,
>         .wow_hostwakeup_from_sleep_cmdid =3D
>                                 WMI_TLV_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID,
> +       .wow_set_action_wake_up_cmdid =3D WMI_TLV_WOW_SET_ACTION_WAKE_UP_=
CMDID,
>         .rtt_measreq_cmdid =3D WMI_TLV_RTT_MEASREQ_CMDID,
>         .rtt_tsf_cmdid =3D WMI_TLV_RTT_TSF_CMDID,
>         .vdev_spectral_scan_configure_cmdid =3D WMI_TLV_SPECTRAL_SCAN_CON=
F_CMDID,
> @@ -4604,6 +4650,7 @@ static const struct wmi_ops wmi_tlv_ops =3D {
>         .gen_wow_enable =3D ath10k_wmi_tlv_op_gen_wow_enable,
>         .gen_wow_add_wakeup_event =3D ath10k_wmi_tlv_op_gen_wow_add_wakeu=
p_event,
>         .gen_wow_host_wakeup_ind =3D ath10k_wmi_tlv_gen_wow_host_wakeup_i=
nd,
> +       .gen_wow_set_action_wake_up =3D ath10k_wmi_tlv_op_gen_wow_set_act=
ion_wake_up,
>         .gen_wow_add_pattern =3D ath10k_wmi_tlv_op_gen_wow_add_pattern,
>         .gen_wow_del_pattern =3D ath10k_wmi_tlv_op_gen_wow_del_pattern,
>         .gen_wow_config_pno =3D ath10k_wmi_tlv_op_gen_config_pno,
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wire=
less/ath/ath10k/wmi-tlv.h
> index ea18ed8939db..2af7c9df4260 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> @@ -189,6 +189,10 @@ enum wmi_tlv_cmd_id {
>         WMI_TLV_EXTWOW_ENABLE_CMDID,
>         WMI_TLV_EXTWOW_SET_APP_TYPE1_PARAMS_CMDID,
>         WMI_TLV_EXTWOW_SET_APP_TYPE2_PARAMS_CMDID,
> +       WMI_TLV_WOW_ENABLE_ICMPV6_NA_FLT_CMDID,
> +       WMI_TLV_WOW_UDP_SVC_OFLD_CMDID,
> +       WMI_TLV_WOW_HOSTWAKEUP_GPIO_PIN_PATTERN_CONFIG_CMDID,
> +       WMI_TLV_WOW_SET_ACTION_WAKE_UP_CMDID,
>         WMI_TLV_RTT_MEASREQ_CMDID =3D WMI_TLV_CMD(WMI_TLV_GRP_RTT),
>         WMI_TLV_RTT_TSF_CMDID,
>         WMI_TLV_SPECTRAL_SCAN_CONF_CMDID =3D WMI_TLV_CMD(WMI_TLV_GRP_SPEC=
TRAL),
> @@ -2202,6 +2206,34 @@ struct wmi_tlv_wow_add_del_event_cmd {
>         __le32 event_bitmap;
>  } __packed;
>
> +/* Action frame categories that may wake the host from WoW, as in
> + * qcacld-3.0: spectrum management (0), QoS (1), public (4), SA query (8=
),
> + * protected dual of public (9), WNM (10), WME (17), FST (18), VHT (21).
> + */
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0       0x00260713

You describe the bitfield above, so please add defines for the categories.

> +
> +/* Per-category bitmaps of action codes to ignore (1 =3D ignore). Like
> + * qcacld-3.0, ignore Measurement Request (0) and TPC Request (2).
> + */
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES      32
> +#define WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IGNORE        (BIT(0) |=
 BIT(2))

Same as above.

> +
> +enum wmi_tlv_wow_action_wake_up_op {
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_RESET =3D 0,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_SET =3D 1,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_ADD_SET =3D 2,
> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_DELETE_SET =3D 3,
> +};
> +
> +/* WMI_WOW_SET_ACTION_WAKE_UP_CMD_fixed_param, followed by a
> + * WMI_TLV_TAG_ARRAY_UINT32 of per-category action code bitmaps.
> + */
> +struct wmi_tlv_wow_set_action_wake_up_cmd {
> +       __le32 vdev_id;
> +       __le32 operation;
> +       __le32 action_category_map[8];
> +} __packed;
> +
>  struct wmi_tlv_request_peer_stats_info {
>         __le32 request_type;
>         __le32 vdev_id;
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless=
/ath/ath10k/wmi.c
> index e57588c19c80..eca6bb189577 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4673,8 +4673,8 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k=
 *ar, struct sk_buff *skb)
>                 return;
>         }
>
> -       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %s\n",
> -                  wow_reason(ev.wake_reason));
> +       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
> +                  ev.wake_reason, wow_reason(ev.wake_reason));
>  }
>
>  void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff=
 *skb)
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless=
/ath/ath10k/wmi.h
> index 7f50a1de6b97..f1a560fb3447 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -944,6 +944,7 @@ struct wmi_cmd_map {
>         u32 wow_enable_disable_wake_event_cmdid;
>         u32 wow_enable_cmdid;
>         u32 wow_hostwakeup_from_sleep_cmdid;
> +       u32 wow_set_action_wake_up_cmdid;
>         u32 rtt_measreq_cmdid;
>         u32 rtt_tsf_cmdid;
>         u32 vdev_spectral_scan_configure_cmdid;
> @@ -7060,6 +7061,17 @@ enum wmi_wow_wake_reason {
>         WOW_REASON_DFS_PHYERR_RADADR_EVENT,
>         WOW_REASON_BEACON_RECV,
>         WOW_REASON_CLIENT_KICKOUT_EVENT,
> +       WOW_REASON_NAN_EVENT,
> +       WOW_REASON_EXTSCAN,
> +       WOW_REASON_RSSI_BREACH_EVENT,
> +       WOW_REASON_IOAC_REV_KA_FAIL_EVENT,
> +       WOW_REASON_IOAC_SOCK_EVENT,
> +       WOW_REASON_NLO_SCAN_COMPLETE,
> +       WOW_REASON_PACKET_FILTER_MATCH,
> +       WOW_REASON_ASSOC_RES_RECV,
> +       WOW_REASON_REASSOC_REQ_RECV,
> +       WOW_REASON_REASSOC_RES_RECV,
> +       WOW_REASON_ACTION_FRAME_RECV,

I think addition of the new reason and above debug message change
should be split in another patch/commit.

>         WOW_REASON_DEBUG_TEST =3D 0xFF,
>  };
>
> @@ -7095,6 +7107,17 @@ static inline const char *wow_reason(enum wmi_wow_=
wake_reason reason)
>         C2S(WOW_REASON_DFS_PHYERR_RADADR_EVENT);
>         C2S(WOW_REASON_BEACON_RECV);
>         C2S(WOW_REASON_CLIENT_KICKOUT_EVENT);
> +       C2S(WOW_REASON_NAN_EVENT);
> +       C2S(WOW_REASON_EXTSCAN);
> +       C2S(WOW_REASON_RSSI_BREACH_EVENT);
> +       C2S(WOW_REASON_IOAC_REV_KA_FAIL_EVENT);
> +       C2S(WOW_REASON_IOAC_SOCK_EVENT);
> +       C2S(WOW_REASON_NLO_SCAN_COMPLETE);
> +       C2S(WOW_REASON_PACKET_FILTER_MATCH);
> +       C2S(WOW_REASON_ASSOC_RES_RECV);
> +       C2S(WOW_REASON_REASSOC_REQ_RECV);
> +       C2S(WOW_REASON_REASSOC_RES_RECV);
> +       C2S(WOW_REASON_ACTION_FRAME_RECV);
>         C2S(WOW_REASON_DEBUG_TEST);
>         default:
>                 return NULL;
> diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless=
/ath/ath10k/wow.c
> index 92af8bc63362..5fc68e6cdeb6 100644
> --- a/drivers/net/wireless/ath/ath10k/wow.c
> +++ b/drivers/net/wireless/ath/ath10k/wow.c
> @@ -380,6 +380,16 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_=
vif *arvif,
>                 }
>         }
>
> +       if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_STA) {
> +               /* Without this filter WCN3990 wakes the host on action
> +                * frames right after WoW is enabled.
> +                */
> +               ret =3D ath10k_wmi_wow_set_action_wake_up(ar, arvif->vdev=
_id);
> +               if (ret && ret !=3D -EOPNOTSUPP)
> +                       ath10k_warn(ar, "failed to set action frame wakeu=
p filter on vdev %i: %d\n",
> +                                   arvif->vdev_id, ret);
> +       }
> +
>         return 0;
>  }
>
> --
> 2.43.0
>
