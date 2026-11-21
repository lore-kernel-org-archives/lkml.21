Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220176;
	b=kdlkMUrDYtihfbKwSrHiPaMTWn7K+sRxth1nS/VThfS4LTomi3eigb0m9bRiQQXLiTQz
	 2WfkYQ0b2sAYZZSPngjgfem/AMTUVPZOdkF3dhDvUooMQOXRXDKLKBkgmIihxCl1xQ6HM
	 KIvsqKUT6HHOLBYR1dvL1WHxgFlHqP1tjLhrZtSGBUWAAmFPPG8Rec8nh96A/E2zsGZd4
	 QSzUaZ7wQwLFViw+nArVVmDPGC3oQOthWAubN6TC/FbYm3rpjTtnjnW99oeqsWhW/c+I5
	 RMEKaHBuBA4KygFhR3wbuOxd5gLONF0ygV91jONYSbz8QL+kArUxhxGmMzzxhaa5ohA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
	b=j7rMAPZR9sGpnwK7nqBk9FROByGculi0neK5p2Afu/VF+0Qs8QzHCZORjH64j0hhnYil
	 rnruZfZvJ7JohgWQaY+Duo6ZXxZ3Z4nJx4Yp8WD8TsbOZdGjOqQrYsjZ7AaC+8mlbQBIw
	 sclM/sSV5+AeOiSDLfGttpfH1SOKlcbwbJgW4LxxTBM+2ze/gmii0vSSJx7aXWOGAIKj9
	 3ydb9of5Ae/l9ME5P1NKUtHw/ig6z1th8q8R8N5dwzUEmdCveoF/nMTaCoIqmUBzXZjA9
	 FY0pYSzd9ZkIGuDaBsxJUZX7Z0j/7cM1ECHJbPUtLrvVlinXUqQU27C0QHVZkxuFlxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edc0PtUk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO+7QH5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB9D606A6B6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB9D606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Edc0PtUk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO+7QH5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0BJPP2912948
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=; b=Edc0PtUkP9FWaIhe
	lmdyvkougjdN+MSXtPR0+1xryNxiwSrs2TbxSvthgsG5SwZ8lEk0PHo0V52O63JU
	UknBG8+vXBi1B7Awd4JWI0XDTsvU7HHM4Qlz9E/In0ypMqmgrMhP6J+Bp9XC90Do
	Ua3YXOW83YmES7jef7dI4Prg1jp5C/IbX/DzS/9gxVS/JvVZ0n/x0a72eJ98404a
	wv9+KOoRi6UoK95WXYQh7QyK4f+ljHQDNPWf9TEBEw3bSYb2SckRy26xMQr9nazE
	Xcb+H6hqM2wjE9SbOAfFt0CVTf+8rwyRR0sUoF7puJUGJLqXAZpD5msg8aUZ06LI
	+2DemQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2tkn9cts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:16:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38131260a5dso3763204eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795220172; x=1795824972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
        b=QwO+7QH5JU8mcbBb4FX5REZ9kS5x3VFPvjDtyVRMtQv1d/9Jt4HX+8khMTQva7kH4m
         IA/EMrzCD9q1dIGnswSV4K98oU6e1wEZkfCvPPM8H6+d0C/qxu2fVXNbSKzJFlilrwKr
         jYH+y8bgUDI/bGjad8D0EWjplyKvRRDg+EQWY1mbosveLKxd2BL0OtaGtIMBo5jyBrpZ
         aZlzJS4hE37jFVktHn6mYQq3yjTOXxt7hoQMC80arIaLOgHWKS4gi0b7FKBD0WR+C3Mm
         SP0wY8dkiyqw4BYJ2N6P78CE7v6v/0AvH+byKyR4j855V9Oo/VePMA8aHhffPSsnU9h1
         tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220172; x=1795824972;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuWSO5lF81+wvYpAYjE1usBrB0yozSwPs1b5w+/cvek=;
        b=MDO4P8JeY5mViPFg8CipRL+MvkMNk/5WhZbd40HoO+bR2MjWs+tz6xxilDadYsRKRJ
         yGvbU6wteoW352ujPUnCjYEk40eNJH0xM2xi+dXv3L5Vtr3JGjbJNKWjQQ9CmYfS/eIi
         qTzZlAV7aqn8d8n15K/VZoe7LpnjHn7pwiQFfwT+yAw21LPxWFMcKemqXJod1tqcqzTJ
         QVckFgmuu3gYLA0AE6trdsQ//ZqG9yLrNuT0VJPWE489n+5bBtxIbs4Jpw6D7AfPLUpC
         Jle4NFaio+QEWfOnWf2PGQcXugNUTgMWCTLjb/ERSaVmxgn89SHuVVW9wdKXvkKQStNH
         /30A==
X-Forwarded-Encrypted: i=1; AL+hErEZgvFllp5tuHqucu+ap1Lpq8pz6g3bUCENITbqzN2aB9E/BKqupPcBuLghzhw8waZGoD9yhxNa0dw1Csw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aVcv4e3Ewagqy5SUBcvqvoO9FjPUVXBGjP7g6O3WN7mBg17Jc
	hCzDi1XKY3lSjnfW0O/08k0p8b94vA4tUDjTjvZSJBlkxLn53wGg2jI1Ar0A6b5QqLZGRO3HuDf
	9CalMYJxgnc+1EZ5KYk9Tt9o7DU/9LtsXqDGtsspE2Y8AomoW8EYNG6LLvH3Ix73Yysk=
X-Gm-Gg: AZFdTZehcvwsHYhyrZxK4mQdqrD4XYG6ng01s6hUtYhmj111yAxrXxTzBCM9fyIjIqB
	gxxMFTaHqhgg92ut2ROCR3rFFW8MgFZkrqUx6cPKFNJ8TqL/6s7oOcMA7C0NXNpylN00GVrdyOM
	L/YAtOknpiC37O+00l54pIdTct4V4KXiR/2NMlTehp2pdaTKD1zj/kIPq0y2gOebIEgAu3BSEW8
	izwv/i9b3cMc8DqTLHNah6pTTnJFDYGc5v5pwAbZJF5v61WZlC5ltsAqVDRVKhf4HJOqzZSpT8u
	4tB90m/mgileN2S0zNbuVkuzRYZAAbTu0fvVNQavyAyzZV63SzB31/vtwHzH9isHjD6IfSRS+wD
	RCxTqmoyuFBKft+GLXmeEOGsRuEArHly4f3prAoG6HAtWevZJQjpdmxHuq/AiPrbiotpZdTeHW+
	juPR38QATQvdSRzsF2lDlpJI2krXBs
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr4873235eec.14.1795220171845;
        Fri, 20 Nov 2026 16:16:11 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr4873184eec.14.1795220170973;
        Fri, 20 Nov 2026 16:16:10 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm10282028eec.8.2026.11.20.16.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:16:10 -0800 (PST)
Message-ID: <43452750-2fff-46f7-bc61-2f5547602c85@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:16:09 -0800
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
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w6kwDf52onrtGPIU6HwNBZpQmVit0C3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMCBTYWx0ZWRfX62N5+RoLoOcw
 CvDQnAxpK8Yal09PeuzWO8EgtbJgbSfzGoAABmcu1NMiSxc8zbwahlh7kldQBVoBY3Lf0iyR4Zp
 xFKqOHBOblU2SAPC3AOLGCJIbNWUtQA67dl1/7edL2B0QqYfq7cDN/WE6Slquj3nqdCvY6Ewdk/
 NNyyk7kJkXAf1d1PIqLJIOuNzkyfSy5znFSKko5e7X98WL4bL6dbfbuJtrnjKubYLz0iV9rcD2b
 uJygB0AjfjN5pnlve29z3LjS2letk7me/3bbdF6e7TZ5zI2PMiHsxMbERkhywBDyKWAE8+YICA8
 2scP88o4bV7CisKn5krv2ksYpqZVWxP67tVz1LWg6QkTzAyEo31siLm0PIIa7/o1AlE8Ga7exTp
 1FBGqGMO0kkXwJ2iuRlzJS/muRIxA+Sw49rWaoEfv7S+oDo/zIp3Che5q3Jv54Mt+oEBo9KxzGr
 sKCyOdZ9sMBX/WJx7sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMCBTYWx0ZWRfX5TUn95eVwjJO
 yFt7H57yK3+1Y3QQKz/YpoJRGrMPozdKwzbVPQymTV1Q18eCDTK7HyBwpo5EIA3aFngXz8zobxk
 qx8HaObFNuwWZqrCAIPIQQ3Xvuce8i4=
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6b00e2cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=4HNrfPhIyE3k3xtOv_UA:9 a=EUlzmMyR4JpyyxVz:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: w6kwDf52onrtGPIU6HwNBZpQmVit0C3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210000

On 11/17/2026 6:55 PM, Miaoqing Pan wrote:
> mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
> both valid-links and active-links changes. ath12k does not distinguish
> between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
> inconsistent vdev state in the chanctx callbacks, and silent
> firmware miss in change_sta_links().
> 
> This series derives link object lifetime from vif->valid_links and
> sta->valid_links, which mac80211 updates before calling the driver,
> instead of from the active-links sets. A STA link vdev keeps running when
> its link is deactivated. The active/inactive link state is programmed to
> firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
> holds vdevs of the STA, and only when it differs from the state last
> programmed.
> 
> Patch 1 adds WMI infrastructure: the response event struct,
> WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
> registered in ath12k_wmi_op_rx(). The handler only parses and logs
> the event at this point; delivery to the waiter is wired up in patch 7.
> 
> Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
> CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
> firmware replaces the force bitmaps instead of accumulating them. It also
> copies the AP MLD address into the command, and fixes the
> CRTL_F_DYNC_FORCE_LINK_NUM typo.
> 
> Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
> follows vif->valid_links. A link that is only deactivated keeps its link
> vif, and a disconnect (valid_links == 0) removes all remaining link vifs.
> 
> Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
> context. A deactivated link keeps its vdev up in firmware but has
> released its channel context, so it must not be used to derive the
> target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
> is kept.
> 
> Patch 5 stops clearing is_started for a STA vdev in
> unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
> keeps matching the firmware state. assign_vif_chanctx() then compares the
> new channel with started_chandef: if it is unchanged nothing is done.
> Otherwise the vdev is restarted on the new channel, or stopped and started
> if it is not up. Station removal clears is_started once the STA vdev has
> been stopped, so that a reconnect on targets with vdev_start_delay starts
> the vdev again.
> 
> Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
> The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
> WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
> WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
> The checks now use the constant of the array they guard.
> 
> Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
> sta->valid_links that are not yet in links_map. Link STA removal is
> still left to STA removal, as firmware does not support it. Once the STA
> is authorized, a link holding a channel context is active, and a link
> with a link STA and link vif but no channel context is inactive. The
> result is compared with ahvif->fw_active_links and
> ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
> when it differs. It is sent to each device that holds vdevs of the STA,
> with that device's links, and the driver waits for each device's
> response, except in the INACTIVE_LINK_NUM case, which is sent without
> waiting. If a device holds some of the STA's links but none of them is
> active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
> ath12k_core_pre_reconfigure_recovery() releases the waiter before it
> takes the wiphy lock.
> 
> Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
> from patch 1, the ap_mld_addr argument from patch 2, link vifs that
> survive deactivation from patch 3, and a STA link vdev that stays
> started across deactivation from patch 5. Patches 1-6 each apply to the
> base on their own, and the whole series applies in order.
> 
> 
> Miaoqing Pan (7):
>   wifi: ath12k: add WMI response handling for MLO link set active
>     command
>   wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
>     active
>   wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
>     updates
>   wifi: ath12k: skip links without channel context in
>     ath12k_mac_get_vif_up()
>   wifi: ath12k: restart STA link vdev on chanctx assign if channel
>     changed
>   wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
>   wifi: ath12k: handle MLO active link updates
> 
>  drivers/net/wireless/ath/ath12k/core.c |  15 ++
>  drivers/net/wireless/ath/ath12k/core.h |  25 ++
>  drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
>  5 files changed, 405 insertions(+), 35 deletions(-)
> 
> 
> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a

My review agent notes there is a pre-existing issue that isn't addressed by
this series.

The review:
"file": "drivers/net/wireless/ath/ath12k/mac.c",
"line": 12683,
"summary": "arvif->is_started stays true when vdev_stop succeeds but
vdev_start fails, breaking the firmware/driver state invariant",
"failure_scenario": "In ath12k_mac_op_assign_vif_chanctx(), the !is_up
STA restart path calls vdev_stop (which does NOT clear is_started) then
vdev_start. If vdev_start fails, is_started=true but firmware has the vdev
stopped. started_chandef still holds the old channel (vdev_start_restart only
writes it on success). On the next assign_vif_chanctx for the new channel,
the same-channel check (line 12673) does NOT fire since
started_chandef≠ctx->def; however, calling vdev_stop again on an
already-stopped vdev hits the num_started_vdevs=0 WARN and corrupts the
counter. For the same-channel case a future assign_vif_chanctx would silently
return 0 without restarting, leaving the STA with a dead vdev in firmware
indefinitely."

My refute agent concurs:
is_started can diverge from firmware on a failed vdev restart ·
mac.c:12667-12693

Confirmed the mechanics: ath12k_mac_vdev_stop() (mac.c:1556) does not clear
is_started, and ath12k_mac_vdev_start_restart() only sets
started_chandef/num_started_vdevs on success. So in the new STA restart
branch, if vdev_stop succeeds but vdev_start fails, is_started stays true
while firmware has the vdev stopped — which violates the very invariant this
patch introduces ("driver state matches firmware state"). A later
assign_vif_chanctx for the same (old) channel would then hit the
cfg80211_chandef_identical check and return 0, leaving a dead vdev.

Caveat on severity: this is a firmware-error-only path, and it exactly mirrors
the long-standing switch_vif_chanctx() error handling (mac.c:12007-12019),
which has the same gap and clears nothing on failure. So it's a real but
pre-existing-pattern concern.

I also concur with the recommended action:
 — worth a note to the author (clear is_started on vdev_stop success / after a
failed vdev_start), not a submission blocker.

So resolve with a follow-up patch if necessary once this series lands.

/jeff
