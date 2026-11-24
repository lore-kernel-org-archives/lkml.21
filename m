Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555192;
	b=ETEteafnzqMw2PhDkL++Fr2dwtRc8AL/qmz6EN/FW31zQ3A6wvqLduAeYpFF87xeLMTh
	 r/QKj1eW8jOFXd9QQwMQ9ZvfxPHA0pge58G4oJ5x6SoazvIhAi+qJVXi4g1o8VyF9pX8V
	 5uq5J/pRSGh3Cc8G4WjsY0PgxYnNfuVutyD5qAXYutClm4SsCJ/t39hNwawpYZED9515+
	 SoRmMVj6vQV7HasIX7QpvW6XWjKwpFSEhrFFKp63nea5cWJPC6PtTqtRnwXIpZ5clWkl8
	 8LqdiFD6GU+vHhQPy1a08bKkdkVPZ/607zoFJMOgKGZ91UwysN3qJoLtH+VPmYUMGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
	b=cQEFXJZ/e64PZATyOUvecLxXpTs2B9Y6SKb0pc0GkbY5F2+HHbnyGcpJXh150H3gcVgk
	 okeF/tbN20OYZ+gIPi46wjnhSHxBkPLm68dC3ZzhguvN5IdpbA6flRh15WeRMb4addD7g
	 n4ycBNZKqA/Pk/0IBxA9NcesHqik1Y5ECOXU1PILpTscTFBeivayyFDBzNMUC3W80BVnW
	 2UG4AQCxf05BNeWmrnt6Qo4RGUpS4AwT39u0TgFpWh5VKo6AQQph4HTNNi6tYXd3t602M
	 USdapC/JR+YFCULtzmIoSO/KhQIXjRwMo1UJ5jEhED5MZJum/n5jmatcRUQ/M4ciOHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACr7VcTZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9iQ8GUd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C58606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C58606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACr7VcTZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9iQ8GUd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXM7W2306283
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=; b=ACr7VcTZT7KgMvkb
	f/riEMLagAVttUZbXJQup8HmnwrVymJIAFwa1DlqcPXhoe5vnTScPac8m4AKp6MG
	Wwo71pqbg2nr8WOm78tevSJMr9hh/gKJYpT/n55WKYDlgEr8D+2xA4zLt1qoDxwh
	j9wMpBH1fzo0O8XkldvjDMaYMKMtuikJBYz4I8Rs5z4EfSEjAqy5184Qi5NxMgG2
	T2FAQohhcUxLTvN3iD1vewKWOUOlPu6QySCGEB8mSWitYMNTdm1BC3j5yEmDPUUV
	8Zci2JF67xUD7Hl6KEmywPb3nvRfchAhnlWlibk/yqpWPRNbk0071XbvXU2VFKzZ
	E2BrCQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9k3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:19:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso8613219eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795555189; x=1796159989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
        b=J9iQ8GUdeibdU1Wjeznw7m9HsNzfcWpKaQ+61MvGHCTODfIxD0XWgSQTmo9ttJHD2Q
         iN1sEztG68jUGDXGrxjXzerDJOlfIRrnlGzPEkW+16kptvbDQyaNly9mT3AryjqXAL33
         b7xFM2s0pxZ5tvbCYYiyQLrNqDyq3CrdU5Y7gxvFNJ1VH1sZVQVShadTo/u0Y6htdvES
         XJrCTPCaumgaHfgnRBNt1zyLZTwRMWAbF+xOEwfFoYcjVFz3S0L/gA4Zz9ROOk0sgt0R
         fosPNrH8U5N3/m1PIADsvNbhC/Zmh+mbJqpV/+3V9ktniaZV255OhSI5vqvKvgZWP4vP
         C1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555189; x=1796159989;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jmc8x/uklGXQnfhDsK8nj9eRcxikV5Zu+dZzBzl6ZvY=;
        b=ctY+b2prhqbpyA/oD4xEkRHUmeX9s8ApTf7UyFD3QEMsfrVdPkdOl4xr5vQqgMTGxb
         K/xStPmRAI9O4dFatYIm9kkfFAQ7mK+dIKwFOOFRv1zhlU5in0jf4j0C9B1KLXQVbrF9
         aL44nWR+VzC+WZKxEDZuTcbr2mUWA7XoJIGkcVrqQK2G16TZig6dGlugCJwQLxgNAB1C
         wg3nwCapqm+J6QVXol0HGvYz/kLlgQFYTYPjtPaNaeORD28T5014z1vubfCT19XwaNR0
         em1mdWwGyhTV+kFf57jypiC/101MAoXrr4/mDi9LWoLQf9nxmWYQAgzzCRXmVUkxfK3K
         zokQ==
X-Forwarded-Encrypted: i=1; AL+hErFG003KXlPg8vQkMfBARa+1Gjs4RP2YlYbzQNKVq9W1004GnF7gfLfHBXRJAnLeedp1CPr/WQuFibQEsrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O7aCeneTgzpHXjKmjKWTT0crYSVLpVqr5/wLC1rZZXsf+vtcw
	wYxZgDZlxryalZOzpaDOlQLSXEGJJdc2Ukdh9uvNQXFUKdVHhJFXbMsiLcRNy5RxZhqbNJyuRzI
	f9gPzpMaN2nvunpI8vLDhMsa+FtHWodDgCquUknFGhvqoYf8GgprII5Hz93KhTyWLHso=
X-Gm-Gg: AZFdTZcKKHGuxEP/MaN0vtMdG5lY/zkT2TMMd9hJ9zOz9QYo9eE+o3wXpZqSL8o8S5a
	m7baupdtzQIV5qgVuTXL+vMQlminDz3VLt+YTnT2OVHOo+bexQBMLv9uNWMnf/NN9WuDHatTqZT
	hOCRzHXWx+9K9Cd74x73Svu44ffBdCu0912hArj7a58r9kB2SEGPVVKbgdq81UtsSsZH1o80Q/e
	ZEchlHE//U5YJkHMjBV5srPHtidSSuEDSseW0rCBp8fhqihA8FgG0wB22Hv6jyrpUIPp0o1bWC+
	BQcpl8p7fyAqAtLpSvSPitPCgVov0r+l6l7GGXJWDF3YpMWCyRgyExJepqTCCHGOyKfCWQykA0J
	V6+lXiAdgj5odaQhdZxzisj/+qcT8BbMiwkst/WLgaNRfY+QuqJAx2quoGdDccvz/JBkAgL0pUd
	jyE+Z4Zje014n+Cg6m
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12711152eec.17.1795555188367;
        Tue, 24 Nov 2026 13:19:48 -0800 (PST)
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12711127eec.17.1795555187818;
        Tue, 24 Nov 2026 13:19:47 -0800 (PST)
Received: from [192.168.11.103] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm14506896eec.9.2026.11.24.13.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 13:19:47 -0800 (PST)
Message-ID: <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 02:49:43 +0530
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
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX5QP3ZQlWrRNr
 qpp4B/3IOOIyg9l2BBgpAVIg6kVPD+KTPxLtZtM1aBIkYjfDfHeeHrUEKhFh5i7K7Vk+8OuT52d
 2X615gNP5cZx6j7mhikVmGpEE9AFQc88Sl2BWCNKoqojCBhwpNFx/UFb1DoWdh+DQX3+LPWm5kX
 AnhuE8bhA4QeNKmysDkNNjxynXMldE0M8wZgHRPrd0B+3su6hdw0c0T37REoTtTp/cLknmZQ7Ee
 Lwmxrbgs0c8cxtBxAomHizWqvZWa2Hr28GXWLMNdW5NShasbzVNoR3r0/HGdfm0VZyaENhqQCS7
 g7zjPSqItIH+CWuz2FKgV5jvrefzLSI+9DX89RMxSb9lxn5JMH5Ex9/gF2ymZnrE6Z4lp8l4rMS
 CCuJYRu0Ixfhp/GJRGeTcQBktVZPqzzzhOL0d6SmAJUUGzFGaTxGEYNi9KOYzAuXMJsb5pZz5Cr
 sOWBOX7SffXACRlAIww==
X-Proofpoint-GUID: wg33NEixnKqqvq0R6h_K7QvZM6Ggr2ne
X-Proofpoint-ORIG-GUID: wg33NEixnKqqvq0R6h_K7QvZM6Ggr2ne
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05ff75 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AXF9_A-i7_gDoTK9JAcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX8evPV6KTOVOb
 xFHBB2h2RbmTK3GwE8KXWWpzyAoItFjHLac5X7Z/F6b1T5GXORp2srbcph9tov/0CYO77sN+l0J
 JYgBw4IxfkyHFU6qqGBoBiq8TJxg4qI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240083

On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
> Currently, ath12k_mac_op_change_vif_links() derives the links to add and
> remove from the old_links/new_links arguments: it creates a link vif
> (arvif) for each link in ~old_links & new_links and frees the arvif of
> each link in old_links & ~new_links.
> 
> However, mac80211 invokes drv_change_vif_links() both when the valid
> links change and when the active links change. In the first case
> old_links/new_links are the valid links. In the second case they are
> only the active links, while vif->valid_links is not modified. A link
> that is deactivated is therefore reported as removed, although it is
> still a valid link of the MLD.
> 
> To fix this, derive the arvif lifetime from vif->valid_links, which
> mac80211 updates before calling the driver and which an active-link
> change leaves untouched. Create an arvif for each link in
> valid_links & ~links_map and remove those in links_map & ~valid_links.
> A link that is only deactivated keeps its arvif. On disconnect
> (valid_links == 0) every remaining arvif is removed. The WARN_ON() for
> adding a link that already has an arvif is dropped, since links already
> in links_map are not selected for creation.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 3f106ac6141c..28cb549b1f46 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>   			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
>   {
>   	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> -	unsigned long to_remove = old_links & ~new_links;
> -	unsigned long to_add = ~old_links & new_links;
>   	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
> +	unsigned long to_remove, to_add;
>   	struct ath12k_link_vif *arvif;
>   	u8 link_id;
>   
> @@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>   			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
>   			   vif->addr, old_links, new_links);
>   
> -	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
> -		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> -		/* mac80211 wants to add link but driver already has the
> -		 * link. This should not happen ideally.
> -		 */
> -		if (WARN_ON(arvif))
> -			return -EINVAL;
> +	/*
> +	 * Link objects follow vif->valid_links, which mac80211 updates before
> +	 * calling us. old_links/new_links only describe the active links and
> +	 * must not be used to decide object lifetime.
> +	 */

This seems quite ambiguous from the mac80211 code flow,

Consider a 2-link STA associated with an AP, where one link is removed 
by the AP:
wlan0: MLO Reconfiguration: work: valid=0x3, removed=0x2

In ieee80211_ml_reconf_work(),
Initially:
valid_links = 0x3
active_links = 0x3

ieee80211_set_active_links() first removes the link from active_links:
valid_links = 0x3
active_links = 0x1

This calls drv_change_vif_links() with 0x3 -> 0x1, but ath12k would not 
remove the corresponding arvif/arsta since vif->valid_links is still 0x3.

Subsequently, ieee80211_vif_set_links() removes the link from valid_links:
valid_links = 0x1
active_links = 0x1

However, the call to drv_change_vif_links() uses:
old_links & old_active
new_links & sdata->vif.active_links

which evaluates to:
0x3 & 0x1 = 0x1
0x1 & 0x1 = 0x1
Since old_links == new_links, drv_change_vif_links() returns without 
calling the driver.

After this, mac80211 removes/frees its link object, while ath12k still 
seems to retain the corresponding arvif/arsta. Is this expected?

> +	to_add = vif->valid_links & ~ahvif->links_map;
> +	to_remove = ahvif->links_map & ~vif->valid_links;
>   
> +	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
>   		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
>   		if (WARN_ON(!arvif))
>   			return -EINVAL;


-- 
Ramesh
