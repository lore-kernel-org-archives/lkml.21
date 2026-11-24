Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485540;
	b=NpD/AKz8iltp5oYJxX8eWDWB6p2cdD3fytG2ahWPJ7oP6S4YTF2OMkz87ila8eQemI4j
	 Hacel7GGIK2aZtZHOl2gIgOpCBB7SpGpouoq+CRZ3G/kT34goSWCd0zpe3H/q14TMq6OF
	 87cFB86JxLP1O/E563t1Ns78XygVDuCfsrb63aQr7G0gjpiTPRDPuAAKSL5Jj2aQiXxrN
	 Y0R0V1QlUU4Nz2hGK9RqJ5C8qf+baAf8x8cYuMX7VYVuDpY4vFIy8lUA3M9+sA/4gvyT9
	 Msf6BfHVfYGUOf5vFctD9I7Z6Hsbo7DYVJYFs1FmBKgHFjYBiqWwnLSPm0ijVRoiA9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
	b=oatyljIAXHcA03nPCkIJBu/wxWeWhKlQo73Qd6D3K0RfevS3jHUPRmAVnInnnzQa9smU
	 jkqCUXsliRc+Ejg+Pa9+ZrUVbTas/lSR+8ZAcGdGQ5ansIWuaM7bRobWhz+uDea1p3hGy
	 zvmN3X1I5A5umggq39nQi4fuN+JnaoMhRaXiQNMEn1sv+j9LOmn6+esFWpK15ucBmJ0nK
	 ZxClsFMVOS56qDzwToCr/tLRK7lKS/KS6gtHhgaCDoWAAjfi0z3++jURJPbG6/bMJ74t+
	 OoB2QtHXnNlx6icSJfKfmW2gZhqMu7jUvbk9DSAZBX33MAMexHNi8tlQHGIDR1Pzodg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZoz4xhr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atqdbSgy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9E6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZoz4xhr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atqdbSgy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO1555d3481977
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=; b=IZoz4xhr8g1uVQEl
	6TWNmr67vbavrVBS14NiIfS/vAMuiMDji3n0juJQSsRWcSy6XmBF0Vvgh1nQBzWC
	TNxkkDRI9zd6o18r+oGN+lDFe06ln10EOK3IE4YmLCC6ja2sVdY+ETEd3aRvPwFj
	SmSMW059QC9XDIut8Wia334kKxLFPqHf7uPmvgW2VTOL0k9UmnKEc5dp8zmJRJiM
	aQvkrE9ViNUYOF/pbafcENuKueGiycJnQphKUqaVrlS0LswQj2xhbCSmFEFdF4oX
	OeaZ1ubXtHpXr801rcgVfCbYifZoQjit+6ZxvFwz15Mekff+RYr2Gzwbf5/qTHgW
	/fAwEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky04m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:58:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04580de55so20717855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795485538; x=1796090338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
        b=atqdbSgy0h3diuJ9eVdXF6skaVxRMMjdIdndubRPwQph4SL73u3MQqLFSv5fFcWr5m
         kOpAjwWNXiT3dvpAS8XPX7Kb2KNdpWqQTtUHGLPLyyoU20FmcUkH/q7R4CESZr0LmAYp
         bLE7rQXsOKCuN1wjcCZUcfuk2VIqzhyJQy8l08BCsm5dGHN9tPcDi2ySNcu0q5MYaSwQ
         ARIeAYxoxxGSgGRUvrXS6A0hyPNLHjIagCDLCbaTkUGn+oaQmsyz+kUn2fHQLsU0/sOU
         x6GubVHwSmM0BiaCadK+6B2M3o/dqVg4PE+KHrrVjaXm8QtPMZaOeP0oPNbuRUEi4pmm
         GfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485538; x=1796090338;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UvrlVxmAVHO3cEaHfpxSeEvyt+RONCD7RCf3riDDPY=;
        b=ktdPQmNycLTtNN4o2NwPw6OkirtQ54OgT3+I8LLd9TdJ6410ezWKeEM6T3mfpEjFM0
         /O98sCgMOjWdbNqGZ0SbFtx644nHwlEpWYozsCX2PnpQ/yWnDZQSAY7EX2uZB1Zdq63j
         CcoehF4ZWrMvsX24bWQ1FOqm+710OzOZpHjjeHaABHt1Iv2DmRiW1e6hOlDjv5nr3lmm
         0yMkzj9NzfgwHTF0RW9S/iJxGlKmzXdIuLHw95esFtAoH86aE9ilOIn3baxr/D/UKU/S
         27gkBzuhb4ST+ftCLEtfasIpkYwqU2CXD82a5MOL6pj3h6EgyJ3wmvacEq3TN+xCYyQq
         oRwA==
X-Forwarded-Encrypted: i=1; AL+hErG7FTt9BKhf9MgXJjSFBrbXSHt3ba68Wbtf63W3DeDTcJ+FltkdGSc4tP14up+Jt6ROnEhEdDVd6Qrv5yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z87FdQmrqujrnaLS+7FAyG41ykxEB0jiv1Ytv/H4AeICgigSXN0
	6yWLYFF5cjo954OLXHHm8AjSr1MAPojzgnO9UUolpXYmu+w/ZmmIFpwfBYeYnJ/s+dqC3sFIThy
	q+/DbCVTEDwiI0nsBg/6U7HZ+u28huIHlz9ofab4eS8r/XQXCv2uqR3ON3pQQm4NnMaw=
X-Gm-Gg: AZFdTZfFzf2BskI5Ud2mJBuLSpX2U13dsck28QxE35uBTT1IC6evpo+H9TEmQaGqc5a
	C/MbXFhHM3+og2xry9/5rx6r00mL276eOj8EVpHa3uouzfjpj4I0fZi3aTBwywKC7C+Huzd63/7
	ALyH/isHrjqQ4zlp4dl1wpIbzgl34WghFQPHEKZLaf5QtIsGEiUjo9lL4NKcVj8pOm1VL1T5XZE
	DkYhHgCnR5RZZr5b0EIorq1+nOMp9+yIiOCWNL1Z4SqQxpVHGUc+1zyT4uR8lodXMd3Q0T4FzyK
	leFx0Px293J7x7RoZNNBgbns+sWS73KAuTWE6BytL1EUxfwUMjq+S3Prflw9Kvda4YYkHQjSNX0
	ls49SGKh7EM9G0BG9SQh8czBzzoERxeeL8lka9OsQIeeAFzeIjPEQgZNCGzKwgMQm5lV4xvk3Na
	AlhAu1
X-Received: by 2002:a17:903:2f90:b0:2ef:e0f6:b8f2 with SMTP id d9443c01a7336-2f03f1dc68emr144210915ad.51.1795485537912;
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
X-Received: by 2002:a17:903:2f90:b0:2ef:e0f6:b8f2 with SMTP id d9443c01a7336-2f03f1dc68emr144210715ad.51.1795485537392;
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm60668045ad.21.2026.11.23.17.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:58:57 -0800 (PST)
Message-ID: <1ec4b727-a376-42e3-99bf-b5a4d1eb4959@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 09:58:53 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b04ef62 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2w8UifUEfps8qvg4efUA:9 a=EUlzmMyR4JpyyxVz:21
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: N61tXNz4ZYUfhwsxaHDocEKN3jE7asBJ
X-Proofpoint-ORIG-GUID: N61tXNz4ZYUfhwsxaHDocEKN3jE7asBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX4feFf2GeWuQX
 c011Tcd6chHgTUqtun8b2V/yjFASpXKzivautVe4xwn1rb01G44KC7uMXDsryMxgjdwGs5JTTqO
 fobrKhxCe9yAwHXQ8HipxJ81z7Bb56Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX9UQPRRWnwbL/
 KOYbC3/Z/UGCSCZrMQGsAPKDoVI9o034M1SDBfVCBfNaVTGSg5vTvlU6BBgXNBbtW5mfUBor7W3
 vWtPi5zsLDPiyFYCT+MAtZB2erxD/ORXC0/qZs1iUXb7oZ8d24wZjCBb+pfUVpGH05iATfXLGK9
 7kOR8uat+hBrZ3wiQDGnfvRSlSbZapvlieNExU7feSWIX+4pPMJLA65gIYnaxKLQchfF15k3I0w
 mMsFOihAqn0twrxfpBs0c9BzihYQXb40+AcUwdw4yrGqov6TsrlKqC8HhNALR2GGu5orwp8eZ4H
 fK25GoLHBR7Uc21VYF/6Xngqh2YDG6baWeFbmYabcbRfXhiqiVqLLjNs5Osp8aCFAdyKUb+9xOv
 FNMoVWHnn+RxXUH0Pc/ZZiAeUqjF0rSgIGVRNk64Mr/mMGq1rwI6uq7STw7rJD0J1Z4GyjGQC/s
 mwS3H84uZiqSq0OO+nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240007



On 11/18/2026 10:55 AM, Miaoqing Pan wrote:
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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

