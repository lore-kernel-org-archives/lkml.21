Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676847;
	b=SodJEE3zFPxzSBFFJWlO+STmQSJRemri9WTc08X0/5kheJFI9h0GYtOIbdA1binswryQ
	 8k/sDf0jpiP0P8nY9H7EV/gljDEcr/V0TblonUJzxmqEpZubl+FULAGX5uV3yFDIGcn25
	 wqLzJ87a2OhiWZDlkklbOLMzjkfGC5fNooHc3gnApNsb2LQdaSBjWKltNy8Mm3KB99Je/
	 V/Z9hFa1UZtdc0H+LXoQF/ZTOf7Br5fwOoGb5TLpY7NqoUT7n69byLRGW8TeN713wm2pd
	 ckx2bRgzxQ+pyb1qNoK7c+2dItA3vGZimcH0R7+QAsDreHCx8QUozqkoK8SeFTrhotg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
	b=oYFlQYglDrVys3xTp2fvFwB9n61Uo2aSW7Gko9Qd/1l9UGTn5j4+asWkYOF23mc8o+kC
	 icsUCISARAO7xz7t7DozBe46a6M8IVp8P8JyyjS2sf71M/IQAPH9IQGugJscdp7eezt27
	 CB84nEonxUZ0S/zDQTfNpj2ohu42s40bqto89bFNWIKhi2fl7SOWtFWWxx7jTl2azg4YY
	 VGU8xOP1TxHk/ZL45eT1TVv9uuMm7WBsPrh4DAwrUX+cm90cgTOzaDcy/PR0aLpYTvcxt
	 1uWOcCtYJreZFfWNpR7oJIuJf5RzqhV/0rTikjwYVOR/IT0591FD3oEUAEekCTxb0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrfsm567;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvF7LmQm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF55B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrfsm567;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvF7LmQm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ6ram8657857
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=; b=Jrfsm567H+fdNQx/
	lUrkwcVjzdUrijpNhqPBmsVygEcSaJbtAM8e17cIJ/6hbA5vxUDhBMOJicf71FKy
	rx/ordM1e4mpsCuEKID5GZfvz2yxTLeC5FdQC2TtqHRbRhzSiKBasS3OtKBLgPUa
	TC4wFCV32pawJDR4aUVKhhqZ9VvSbNY7glW4uUM3VL/ixMVVTFm9J3Hue+oyPcyL
	tzFkxd1yULQnEp8klV/v0ldTDhSlSOzkLSoEB9kZjR9YLXPjZ7wweSyA1G4vpeAI
	eODYU1JjGEhWpnHNYneeWogKZ3HPatKY0mpgm73BXznZw/z/0U8MLzoF/5vb+MQS
	oyVMDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7r1js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:07:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b97460a133so5129136b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676845; x=1796281645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
        b=HvF7LmQmiFbM21vF6ldNAGPedf43Gjp/K0lv03VxeWYq8UN6VglxtvFzVPgWHPscS7
         IFIG7cQpq6yfFydmAWaAfx5Oo7xuXFgMLeyuWNiuBAmiqrs9SZEDy4zNFgOmlOp3QAEk
         sQS6pY5Y+wVUyla4E2/ICXDFzimyRNR5pW/KAo6A89IVpNUGHcL/UhuGz+W8JvcI9dvS
         VhsT/EunCGFo95hayLcBa96HA9Fag/8SX8KtbWnPxYGVwK8oh4aoAmR2luv80WbpuWRf
         SZ23AUkMc/615FqmXbFt68nYs6IhySxzOLX0gS/l2AaNPUPyJASnRzyhc2SlbcOwIhS6
         kgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676845; x=1796281645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
        b=GIhbMgqPu6Il1EPhemQXW0nV346Nr0dVHA4Sh2UPA2rS3BoAp6RmtWSYjJPr2Ko+8e
         FYeB9mebY1Yy46id018iwC4kKf7sH/1rJ+UnbhNFhBvXf4Vk5rxADJEZvPjommNr5XTi
         oZ+jbbem78gOPTu5mPaFsYrWISIjkBOWX4yU2OMAp9AY1fa/Qc9GEJzxXXrcdgwdjOtY
         qH/PM2YBpMnYzsZodaBnUZjalTH3Cs8IgNMnUO1+d162aL6uFsj32qeHcAxiRsmhxHon
         dqBibcO3ggvIjGhSFbcnuIwR1QZc2ExX2SHl5TSbRLVqwvktm74so2OeNvRaojBYjtJr
         gdMQ==
X-Forwarded-Encrypted: i=1; AL+hErHP58FjoraEw1jjawsRvyNurwlz6o43ZUufmquWOkg0KLMDCfvrRf+ONW57wkH9CtQsS3bSdd79KdCHFxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3kEyVv++VFGgt6asWkez1CTc06bvMVvMTUthvKfdPT/F0+iDL
	I8m5ChbDUQh0yaOqDmaZ2wGCoE+izBKSm3XGjLGQ2cTiXdB3xxA7DJ836nL/TY3xpYKYJdCox8B
	kzBrxdPOXEwyCAsDz2qNSgLcD22icgzcPZDi1CfBb+/LTrIliTOpmpme73E56M1gVC6U=
X-Gm-Gg: AZFdTZe08AGS5GiWmSpL3eVVrHCUs+FU/xZfXtopxUfctHx64eKY4Kr4q8P94ZHvp3j
	W6NOLSic8dS3wwp44nSxFzQ3B0ZVYRtf4mQcZAzGWGjQMqlcQhjxhldCQzVhW/ssfqokirvYAUJ
	1g54RmsJD4FMzLwygQz+FHtEPA2HnRXTc0rkL7tjrBwkDOnHNKtXf+IsgDDHnYnZdrVFelg/9yl
	JHwLDMVUr8Mjv75YqdRkZ+YH4K7XWh0HPY0msAY5c96hRrkOMPUHkWhF2Vn0ZcI2PqoSlobQPp4
	sm6y5P3iofOO5JXTQi/ngaveZkBgzIwO9x4g7zKhQxlF3oux63kh1lCnwiJWeKzXPD6GFRODjiR
	UuDcdNkRPM1JMfj/7nnCqqvciTUnp0FdvLAXVC0shRgKjVR/tRXMUpXGt4+zjTd9C8/REKXDVap
	M11KDd+/ZWCdRLwTERNqPYCuT7hKWPPkEDAX+OHvaE
X-Received: by 2002:a05:6a00:2d14:b0:8b6:400d:7cc9 with SMTP id d2e1a72fcca58-8c87c671eabmr19440914b3a.29.1795676844679;
        Wed, 25 Nov 2026 23:07:24 -0800 (PST)
X-Received: by 2002:a05:6a00:2d14:b0:8b6:400d:7cc9 with SMTP id d2e1a72fcca58-8c87c671eabmr19440878b3a.29.1795676844204;
        Wed, 25 Nov 2026 23:07:24 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm10329081b3a.17.2026.11.25.23.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:07:23 -0800 (PST)
Message-ID: <0bf83f69-f069-444b-a45f-b4582b544405@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:07:20 +0800
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
Subject: Re: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
 <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX7/ooLEgS54UU
 paFFdxkhh38XDsvTJp7OF3GTO95pm9V6b51j+tw+LAEeixXy85bGFlSedgPmFthXcy5ZhFzpB3H
 Jf3NZBeRRVB1c4DW46Cdisf0Q8y9Sc4=
X-Proofpoint-GUID: 5FYfkhaJc3E6l0FNOlANb8W_c86k4qjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX2UEUiezpzSgU
 Kko2Z6OspEaicRIxJSUx3i5JjkXCnh+QoHpjOmLtsBVlGy4UvuhiET1vRC1CkUS2c95XjS6mGB9
 N9pv4fzfko8d2eIxYbKIVAEF4wkWA1qZrbj4JVzd5laAoXsl97WoNnPkPdkXaAObLPiENJvmYwL
 IH/UgmQ4+PnKxnU5jn4ZadebGWXc/J/FrPX2zr269W7ggrREeg9nW+NHi1ZmNwBqgcXi37KkGij
 dCGqOHKhlVQDTePP60nPTcffcA9AuBFnsBS2ipMq7UG0s3Kx9QZufUfabgIPxG54e74GylhE1eu
 r8nGDRnkJfvseUPTnPHsgfxYnmBj2ypQc2bL7dm/E3eyaY35ms47dsY3Lyyg6aMCRxlsMSxjviT
 gY64Ldw5wJOsJQ3cK2u9j2CiHy1usux+Q+DdcsHsQZgy1AsxX422llRLPqDlv1yCQ3c6h/vm+1Z
 ljCULlQiiVedtpy3lZg==
X-Proofpoint-ORIG-GUID: 5FYfkhaJc3E6l0FNOlANb8W_c86k4qjX
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07daad cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=468j3veBC24j7YoULXoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260027



On 11/25/2026 6:35 PM, Loic Poulain wrote:
> On Fri, Nov 20, 2026 at 9:42 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> ath10k_core_wake_all_waiters() still misses several completions,
>> leaving their callers blocked after the driver has given up on the
>> device.
>>
>> In particular, callers waiting on peer_delete_done, target_suspend,
>> wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
>> continue sleeping until their individual timeouts expire even though
>> no further progress is possible. The WoW and suspend waits are on the
>> suspend and resume paths, where these delays consume watchdog budget.
>>
>> Add the missing completions to ath10k_core_wake_all_waiters() so the
>> callers are released immediately.
>>
>> peer_delete_done is not otherwise reinitialized before every wait.
>> A completion left signaled by recovery would therefore make a later
>> peer-delete wait return immediately. Reinitialize it before sending
>> each peer-delete command.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>>   drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 3bb4d2742c30..99960f12dc66 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>>          complete(&ar->install_key_done);
>>          complete(&ar->vdev_setup_done);
>>          complete(&ar->vdev_delete_done);
>> +       complete(&ar->peer_delete_done);
>> +       complete(&ar->target_suspend);
>> +       complete(&ar->wow.wakeup_completed);
>> +       complete(&ar->peer_stats_info_complete);
>>          complete(&ar->thermal.wmi_sync);
>> +       complete(&ar->wmi.radar_confirm);
>>          complete(&ar->bss_survey_done);
>>          wake_up(&ar->htt.empty_tx_wq);
>>          wake_up(&ar->wmi.tx_credits_wq);
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 74aca0af11c8..695df1821e5c 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
>>
>>          lockdep_assert_held(&ar->conf_mutex);
>>
>> +       reinit_completion(&ar->peer_delete_done);
>>          ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
>>          if (ret)
>>                  return ret;
>> @@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>>   err_peer_delete:
>>          if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
>>              arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
>> +               reinit_completion(&ar->peer_delete_done);
>>                  ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>>                  ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>>                                                   vif->addr);
>> @@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
>>
>>          if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
>>              arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
>> +               reinit_completion(&ar->peer_delete_done);
>>                  ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>>                                               vif->addr);
> 
> So it would probably be cleaner to have a helper such as
> __ath10k_peer_delete() that performs both the reinit_completion() and
> the ath10k_wmi_peer_delete() call. Avoiding duplication.


Will change in next serion


> 
>>                  if (ret)
>>
>> --
>> 2.34.1
>>

