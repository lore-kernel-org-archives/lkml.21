Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683334;
	b=NOU7pKQGAQ0R4ooL9aAQK2r21Dg0egKQfB6COdrmjLQaIRC2riDj1ieNruTsOSxZdCIz
	 uefwVCKb3COIuwsESNuL0ad7jYtba3YUybIJ+XVi4uoqvVHUdwAsHwzJEDspti03b+a6S
	 hiTysQIHKnWhpcQjrCreDG95x967fc29UNFQ3Z86dymR9yZxD8lhOUnE+YFevLesGhlFz
	 WmbiG6ynd3SPpSIH9H7tDIiIam1Td4LBXJbn4YQzQmyVspurjrhvWwoVOJOW6DoYB+VB5
	 udhOrr2vmM42YGWpvyx/3YlEfRrCANB3QMO6ZliEI+610nDF4MMGPjHkjCcMMe0W8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
	b=c8CwHpYPQzWTCqJukQNqtLmyrSkz4ZC3Ltji4RhhAFjSeaxYi1UkOPgl0YBzs1/ILOJf
	 5Q01v1zBOt+3A8/bFZjOd7d/ddh4Jd0DBzu/oaJGwFIuOu3+sPtOCcoIDuDAlC3SoY7Nt
	 tIW5vKP+vnpfZR/AOCxuK7YIF5QRXk639CgulbFG98s3Q3US3wV+Q8mDZSkCUASbnSBeT
	 prL2+gSq96FIeMauXPvpRIeH2Q8LoDyeU0wzxxczSEdfnlMuDBth+8R0c+2VQS7bxXYB+
	 GUeFTvVPrWfwFSwXRrzkDDLqW5B/W/AY5U5zKzPf1gE5jcFIDHsoAhMxuP3qDLyUb1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjTKbw32;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="id6UvTJ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB7606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCB7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjTKbw32;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=id6UvTJ/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Ru2175797
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=; b=PjTKbw32XkzJBlR9
	YATVPukDjR3qnAcLBlXqs/vYXY5i6DmdhVg+KzDe8AApFHEBoZjWgsS2rUIejWmf
	fFmz1jZKtiHf1vlFEPSfX+WO8LgMetiqixuyCpWSdwvb//dBoQViXOVeTCEPJlDf
	zFi0Fum/lhciSLOIOZlmSJjW0lEjAjvWkdcGDjiLLtmZsZgUP+x9WrYXRC5VtFM8
	i7B4vlW+zDGYdrK+PVsdzAc0Z7eX4phduPwKsv8C1gHzYGhxP2rKvcaz81veWjN7
	tg9exfkBcSWbc6CBRl7zXX/HmzOekOjKL4xm+0pX8YmuRSmcvQHkkWbA0BFfQuhb
	odmC1g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahukvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:55:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso3895044a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683332; x=1796288132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
        b=id6UvTJ/hURLNayHXb0VRhd6ev13UZBo23YyRL0cUaJf9Jl9z/9fwmtOQaMrWqidHV
         0nEsmTTfBHZX/u7Bg/+rA1ZWwJlHx1ZE66CPWSNkuP9LZ/reL970cuJxfwr1uyw4NIID
         cMOh3cFWZzk0nWKL8jk5gfAWl5P4VD9hRar53SrSe6XeaadIsR5wbnLOYjWyFxdMSmab
         jFAu1x4k5n567hdbr1UXWAi9sJm/qapzaen9iHQSj0emjD5W8A8yGr1wyaeoTZ8xVrCK
         Pq7A8wf1GUW7zThbcygsHDoIYLis3gxPc+skBabd8ygeKU3NCOz+zfzbN4ZualmCNLRL
         CMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683332; x=1796288132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
        b=RBi1E92al/JIRL5WCyQ7uY/s9AXEValqYEs8C+Gz7H4bDHiKvkqkHApgSRJUQJm71K
         6bMbannpPwTqIG80+h2j2Uq/t8YMIyZsu0r+zX67oU0sNfwT+WEdVFxCIS4o49Kk+RIj
         GEiav9MHGLw7zqXCCxVK4ql7N5TV8BXiaBParOvZHbY/axHRNdhbeXze+opclhRNNcY4
         LygrCvknxbIyqM/4SKStWKnwkV5wfLRakos7gTuShcb+iA8kMQGFlYCA0PRXV5yWfdzY
         6pE8ayUsZiQ7NMeMP+4HCh9b2jKZUOxIKy2mPHO8Y7BvI9BvAaSxbDxbXbWs2Fcl3ZVm
         guog==
X-Forwarded-Encrypted: i=1; AL+hErFY2WtOWif8VuYRdFhBitFh/Bx7T3GaRlMXj1kUUQbUWUTurl0FDi0XYETbzae50chqG6bj8KdPt6xu0jQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g1AVCexp2rrBvf1A+STDTvw+RqQ3VYIPuc0yzGjaS7svpKgPH
	5d3QvjvghQBMTNQac7BW5mQ+DcSJJ+2hhq3HB10pcrg5ZUSufW8EdajAXMiL2WOfgNChBqughEM
	+5AI0h7H1bdXgpLOry0uZcBHrWc3k7nodle6x1T0MpalGKhDYHy5MkN/sRuOrmwr+a+A=
X-Gm-Gg: AZFdTZcbwJ/TUISSuwZw7t4YJ+3MEpUcdfL7Fmcn4ovVZ1Yozg+uH76Gs2PC7MHPf/O
	I+LMXlDUnXmnkNmmEG+sSREGX46lJpCWBJifHnV4+5r5k8nntJOoOcG7D0lJPw1Ux0PmqvcMbD8
	/bUccdlgrXt8U4ONmPTITt1cNsfMUevfi8q69CtZhrkZs8uc7d5VzDm5buj9WIPJ0h0NIrYy7R/
	rLvxFwPxFlFv8YEJoMKVX1uhJuv+y2JrjjoHu3H/Hd2g6MVczX5zhDD5X+0Dq4biEP6VnyerUjo
	92qWFhOW4NGWsBbYH/8Sx0GfKMEbOGhr7gZDmJVbvl/QulQ6qLYwlQ2HDuVmzQciHEnH56Q7tnT
	OFRxL9CvKqbAjaFwawzBhW2y3vwZ62Zs8i1R4rv4Crk6iaNgxqVgTl4V4/+XVr1ikvGs6JsKm8/
	Z0NAPdSSlJPafbXfvXJDK8ZHBC7SWCPlZVbuIDdEDcVT3i
X-Received: by 2002:a05:6a20:a10e:b0:3fb:2d3e:e602 with SMTP id adf61e73a8af0-4014db57a6bmr22570650637.33.1795683332028;
        Thu, 26 Nov 2026 00:55:32 -0800 (PST)
X-Received: by 2002:a05:6a20:a10e:b0:3fb:2d3e:e602 with SMTP id adf61e73a8af0-4014db57a6bmr22570632637.33.1795683331504;
        Thu, 26 Nov 2026 00:55:31 -0800 (PST)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm10293728b3a.14.2026.11.26.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:55:31 -0800 (PST)
Message-ID: <0bf1ebed-90fd-4f88-a5d8-e768d7278b12@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:55:28 +0800
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
Subject: Re: [PATCH ath-next 3/7] wifi: ath12k: fix
 ath12k_mac_op_change_vif_links() for active-link updates
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
 <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3Q-h0CfdsZPJmEbjEsPa3QC5dckbBoK5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX17RqjhvHyJWv
 VNxSFx0puiAxktYldXw010KdH8LcIU07uPpsSPgt1vUJSA8PyY6c0emrCdd2O1yYe9/DjCGBuzw
 MSEPo21Wd5gku6GiUUeLBVV8yQ3kMVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX4iQwifY90I6R
 eQuioIKFXNivjYuSGVANhD9E+jZSCy8ClEZmqxfUeHaPMtvyTxsQ8iZETrFqsiRNrk43m7yh4C0
 Q/7e4bUFOPhOecs/CnJro82LMWmd8p7vATrB6I3slEBfDRTILKxamkEm0zyDjjIM6RSC57mZ8gF
 Pk82tOjkaG2upv17cIox1JR0P516GqHcmQX+wEI5CIfbYCOWOPKc07wasky5SuDJI7NQECbs6d6
 tytPM6IPQ/9pVUzFdNhlg76oax0BUK2xNpCMcnUfc/LA9bt157ostciUpL2I65H6pj42VJvJesK
 STAUx8KD2enSf3T+iD5duYst+3IYQO+P5mljk/4w/CLLG2MsRMxFYF/6Kevkhk/xNmU5Pdza9vf
 HOeB+zmcOOp0ozXTeSojHEd6gG3k6ueMrENM8G9L1RGwhv3qVfk5HZV/UGTMihlmvYEtxiubtrW
 5zguGTn2O6zdQzeSoZg==
X-Proofpoint-ORIG-GUID: 3Q-h0CfdsZPJmEbjEsPa3QC5dckbBoK5
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07f404 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lRClungnl63yzTEoqPgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034



On 11/25/2026 5:19 AM, Rameshkumar Sundaram wrote:
> On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
>> Currently, ath12k_mac_op_change_vif_links() derives the links to add and
>> remove from the old_links/new_links arguments: it creates a link vif
>> (arvif) for each link in ~old_links & new_links and frees the arvif of
>> each link in old_links & ~new_links.
>>
>> However, mac80211 invokes drv_change_vif_links() both when the valid
>> links change and when the active links change. In the first case
>> old_links/new_links are the valid links. In the second case they are
>> only the active links, while vif->valid_links is not modified. A link
>> that is deactivated is therefore reported as removed, although it is
>> still a valid link of the MLD.
>>
>> To fix this, derive the arvif lifetime from vif->valid_links, which
>> mac80211 updates before calling the driver and which an active-link
>> change leaves untouched. Create an arvif for each link in
>> valid_links & ~links_map and remove those in links_map & ~valid_links.
>> A link that is only deactivated keeps its arvif. On disconnect
>> (valid_links == 0) every remaining arvif is removed. The WARN_ON() for
>> adding a link that already has an arvif is dropped, since links already
>> in links_map are not selected for creation.
>>
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277- 
>> QCACOLSWPL_V1_TO_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 315d80be304a ("wifi: ath12k: allocate new links in 
>> change_vif_links()")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index 3f106ac6141c..28cb549b1f46 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct 
>> ieee80211_hw *hw,
>>                      struct ieee80211_bss_conf 
>> *ol[IEEE80211_MLD_MAX_NUM_LINKS])
>>   {
>>       struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>> -    unsigned long to_remove = old_links & ~new_links;
>> -    unsigned long to_add = ~old_links & new_links;
>>       struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +    unsigned long to_remove, to_add;
>>       struct ath12k_link_vif *arvif;
>>       u8 link_id;
>> @@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct 
>> ieee80211_hw *hw,
>>                  "mac vif link changed for MLD %pM old_links 0x%x 
>> new_links 0x%x\n",
>>                  vif->addr, old_links, new_links);
>> -    for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
>> -        arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>> -        /* mac80211 wants to add link but driver already has the
>> -         * link. This should not happen ideally.
>> -         */
>> -        if (WARN_ON(arvif))
>> -            return -EINVAL;
>> +    /*
>> +     * Link objects follow vif->valid_links, which mac80211 updates 
>> before
>> +     * calling us. old_links/new_links only describe the active links 
>> and
>> +     * must not be used to decide object lifetime.
>> +     */
> 
> This seems quite ambiguous from the mac80211 code flow,
> 
> Consider a 2-link STA associated with an AP, where one link is removed 
> by the AP:
> wlan0: MLO Reconfiguration: work: valid=0x3, removed=0x2
> 
> In ieee80211_ml_reconf_work(),
> Initially:
> valid_links = 0x3
> active_links = 0x3
> 
> ieee80211_set_active_links() first removes the link from active_links:
> valid_links = 0x3
> active_links = 0x1
> 
> This calls drv_change_vif_links() with 0x3 -> 0x1, but ath12k would not 
> remove the corresponding arvif/arsta since vif->valid_links is still 0x3.
> 
> Subsequently, ieee80211_vif_set_links() removes the link from valid_links:
> valid_links = 0x1
> active_links = 0x1
> 
> However, the call to drv_change_vif_links() uses:
> old_links & old_active
> new_links & sdata->vif.active_links
> 
> which evaluates to:
> 0x3 & 0x1 = 0x1
> 0x1 & 0x1 = 0x1
> Since old_links == new_links, drv_change_vif_links() returns without 
> calling the driver.
> 
> After this, mac80211 removes/frees its link object, while ath12k still 
> seems to retain the corresponding arvif/arsta. Is this expected?
> 

This is expected: with this patch, the arvif of a removed link is kept 
for the rest of the connection. It is not leaked. The vdev of that link 
is not deleted at that point because deleting the vdev of a single link 
of an ML association makes the firmware crash. When the connection is 
torn down, valid_links becomes 0. ath12k_mac_op_change_vif_links() then 
removes every arvif left in links_map, including the one of the removed 
link. The debug log shows mac remove link interface and vdev ... deleted 
for both vdevs.

