Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676723;
	b=WJDenh1jzxwd8SAkX6BnP6vU6HRgXk4EtH7F45TdfYY6mVK4TR1rD9qVLJyzD4Dp967i
	 na82nyj2VBC9a7CbShRI9dO47PhYFDNM8hT0t7zjQpZLkdk/8POcJyuCR+tqaMWDntV3Q
	 QfKQ+wqWEhA0uFxEEM4SUkPx9xBgWuTQb8waFFIh1Cf4iW5MDrgezKZvYfxKnsyLPuTba
	 t0kf2ojUQIThYH6wnquW/DZd+wSaulRKsSasbcpKuVl9hw1tO/BhkLXBT9OU+7vzSDVyM
	 AjbRXaV7ywCykAYDHHklZZrRw9QDWcST+Nkn9mAbPnwOqQUkwm7C33YUWhpSTGR/QtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
	b=AdWXj9yFhgalyREPDK5po5rDNm8uEgkYqK2ZVbcABYVNclrowpoxEHJ4nm7VMV5sX9iR
	 ix1T3IZ/dd8bQ6pHw8QnDIqe36QLkDfSOczvyEqAk9+BchlvBk6/dg2x1QIvpchlWhur+
	 BX4zAVpK5/FukTk5GiLriJ8VWTSnDQQWlN07/xJbMJUYzEQZPqnPSX8TQLvDhKvcMi1LT
	 dxQewmXhLjLPgRMTtrxIZFEjGOFH0vqeqVzmBPYuvfZpIVZuA57FMOe3zG2NBjlQP3UNq
	 UcJgBgFv8Kr8iIhAKrpss3yhhzF86SZSdecaG4FsbTD5lEKVYzdLY03ROV/2wmCIvbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfxZnJwX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxwxjM82;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EBA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EBA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfxZnJwX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxwxjM82
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ43BVk2294535
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=; b=SfxZnJwXGrwhNTWt
	6E1PcOPbFWlJN5+VhVOtIC+U8qq3OtacG67E5sVGrFA0PCObYHOkoklBl0gIm5uk
	kp7vWHCGRb5pXcQktvNG3g7oCugN4STy0GPSeRmz6z+Z9zR1pq47zrIXnVGuFWsa
	/tumpI+/NfDlbmNQAT5JBYLTFpy0R3/xd4WEXkC7Eh9BJBR3386FvNi35DbAfjK6
	E19PnmCndJEykOakP7c9rqtny7SkJa7vlYQIpsRzodrsFpQn3nNYm0wkIszzDmiN
	f1T4JGUPkvEqdWD19Y299iIsaYCKaOtFuQdjZAzAzvaCXg/WWEzRAdvttVAemez9
	qZVulg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhveed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:05:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde9044a96aso3449265a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676721; x=1796281521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
        b=RxwxjM82pYWqNPepd4n1TPnbOOabNzW9iJSq9hX5pJn7Q4ydojLGaRLl5MaYsLRovw
         D8HrorbyVwna1GQusix9X8Ij/8nZXZKe7SqIVsyCdqBZsSOdNPNYqB7gyVOiStomVRXJ
         WPfKX9FbhtvzxG5XIIEq+wEVzDLBSxSMxicmkpe6PEowcMNl5k0/VzUmEi74hbnXxWgl
         mPPuT+dk7zrMudZwccBuN2UaZxaGYbERDWa/bpHzGZOM1fcl6rQ7fzCjk5w6vZHg/5pM
         RlDQlHlqcYLOOKvQzxtB0JKO3Xe6w1rIDHiOSWZP884UITjHHBszx7RNJUkB6uMtoR1W
         WcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676721; x=1796281521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
        b=Z7p80V6eocBpRzsMef6rStTrtq2i9WjvsjKm9Rfqv6RQLpjKGUBdADkkgNnlHn4XVu
         YDAEZXkrTh3aWQku3Uwya+CNeN8cd2FM7Ft3wvURBY6Z7M0/rfIaZAOpqUpYEBLX05Kf
         AF68I+oANrdZSOe1nYKd/2F1PlAexUUHxahHK21QxB888amFKTFWxrLMhfw6HY/1C5/q
         hg4OSdsDYoX8YqqNYvZPBMV1tk0fGZPV9WUhH3SK9gtf1KzZUaYdOEzSk+EsZjEWI07V
         Moq+yVQWQ1syGHb58Iu0DEvwcylRn14ziA0Ak3/Rotvu9a31in3Z9diU6dn4HobFVhgK
         gGoA==
X-Forwarded-Encrypted: i=1; AL+hErEZ+z4nbzOx70qd5kbHO6LdaG3IGPPN+3CntCl2biuVqDQ3rzYEkgdI5knRiX6ujX00bxKApZj0nPhTzbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7yry2Z3St5ZqFe3lmp2kEBZl4Xte/K8PANNCJcxGRxVN/Clkj
	ROnXP/zQpxbCeYW6FtZ/uC19K1D9U6XNtudqc319zNhOfJizW7sKL24xkl22gGHJKWZ5qJ0FqIF
	DuuEc32kwDbgZ8xCOSAgqbCee6TFoQur0s9Yxpww6tnuHWS8KbBerTlhQVtmOLO1GVlE=
X-Gm-Gg: AZFdTZd9ZS8lmOxvZ/3lTIYJPhkWuRCHEy6JxR64QfXPRrYy7TXITNY/3p28MZi3zhl
	JhgtClgpBlsoEIEZZ2CNBHn/SdmaT06Tp2oW1ajRupIWyu+H18LUewvB7nHTLtZJ2Xk0qsp9QnE
	HBE9CufoU04RzLuGiF2maM1xLhYTM0dRD4OD749l/dTA5NnlED5rQMp4n7lFqzEoSYoZSNoNdt1
	Lltf94G+WEJ+2KXUltA6vd6reADXevCnaLP7VnChrtcBmRZ0rKB5a6YlNtZjkjrNtAr45gj62tf
	Nt6K4jVbMjNI1i2VjOA+GLmSPI20UxI8rEqXAkRnUfjKHMTygfe/T0CZm9Y20mJGtBE/DTo40JY
	ow4rorqBY7FewkY/RYZceGvC1JcJWP2I/BTHED1YPhy39fGTKgHgyPk2Rm7nYEGIiIkIrndZ6jn
	+9xoPr7/38QfS6sSwTkUkDnwVr5qSEY3/8mTehC1Qbvg==
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr135854125ad.59.1795676720750;
        Wed, 25 Nov 2026 23:05:20 -0800 (PST)
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr135853805ad.59.1795676720167;
        Wed, 25 Nov 2026 23:05:20 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm41415355ad.49.2026.11.25.23.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:05:19 -0800 (PST)
Message-ID: <7e396e37-d70b-4091-8764-f416b1ddc7aa@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:05:16 +0800
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
Subject: Re: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
 <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07da31 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4gwAILDwourXv-2xtFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: W7AR7KT_WGqw2SkdlBSI0AnD3mS8DvXe
X-Proofpoint-ORIG-GUID: W7AR7KT_WGqw2SkdlBSI0AnD3mS8DvXe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX+CjgPClPX0sE
 4BqQ7J2pkORJOxx/mvFMlWu4KEtTerUzUMN0cd/ABVsybVSaBAJRxpyL72xivLAN9JNoOdiBzMo
 b7IdFyS9Ybx7ThoCh1ZpPLAgIxgiNLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX8rg7fiEBakM2
 G0L219ZveLPSEjFgUTuSfcpsLPwwA5tYrohsfz7uIR4c6VP9zKBywY+7lq5DJ3NH9MwKPp6PV0Y
 GNbSa+HBRNtiYuxiPLB3kasA8DeOHuBbwhCxsN+1J7Xkzz4sTp34Dv9aJwddyNSpIIR1jX8/fMv
 fM1MOz5vKdvACgEEyiGVGcwiuDT/QZIb8oLeoI3fnXys1pWbVTSOHXek6AKiQBCiYBUmJwb8cSm
 yucZNrleVUqEjFoVs+L1sjDEFlKo82cXV60luLmKXMbpMM/deDDbQvuhyJzVeNAaYn1tJCuVrBf
 ShekMUTvP48BMZMUecuBPt0b/j22pNKnchfIn6vRfM0CiZ06/JS0wRXJdxoKA1G1aOTYuna5CKn
 CU0ssslhM+CFcfRGvaWE4VrG6vdP9Hd9snEU9ZvxlsvzgwFcM5VcYUGa1DPHZ8bZ+A5KXrsd91Q
 ixT2kgObNYGfS+A+Y+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260026



On 11/25/2026 6:29 PM, Loic Poulain wrote:
> On Fri, Nov 20, 2026 at 9:42 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
>> hardware is unreliable") added a fail-count based transition
>> to ATH10K_STATE_WEDGED after repeated recovery failures.
>>
>> When recovery starts, ath10k_core_restart() sets
>> ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
>> the time the failure is detected. However, additional waits
>> may be created later while the recovery attempt is still in
>> progress.
>>
>> If recovery ultimately fails and the device transitions to
>> ATH10K_STATE_WEDGED, those later waiters continue sleeping
>> until their individual timeouts expire even though no further
>> progress is possible.
>>
>> On suspend/resume, these extra wait timeouts consume watchdog
>> budget. Crash logs show cases where one or two such timeouts
>> are enough to cause the suspend watchdog to fire before the
>> driver finishes shutting down.
>>
>> Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
>> handling when entering ATH10K_STATE_WEDGED so blocked callers
>> fail immediately once the driver gives up.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
>>   1 file changed, 29 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index b536c21630b1..3bb4d2742c30 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>          return 0;
>>   }
>>
>> +static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>> +{
>> +       complete(&ar->scan.started);
>> +       complete(&ar->scan.completed);
>> +       complete(&ar->scan.on_channel);
>> +       complete(&ar->offchan_tx_completed);
>> +       complete(&ar->install_key_done);
>> +       complete(&ar->vdev_setup_done);
>> +       complete(&ar->vdev_delete_done);
>> +       complete(&ar->thermal.wmi_sync);
>> +       complete(&ar->bss_survey_done);
>> +       wake_up(&ar->htt.empty_tx_wq);
>> +       wake_up(&ar->wmi.tx_credits_wq);
>> +       wake_up(&ar->peer_mapping_wq);
>> +}
>> +
>> +static void ath10k_core_enter_wedged(struct ath10k *ar)
>> +{
>> +       ar->state = ATH10K_STATE_WEDGED;
>> +
>> +       set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>> +
>> +       ieee80211_stop_queues(ar->hw);
>> +       ath10k_core_wake_all_waiters(ar);
>> +}
>> +
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>>          struct ath10k *ar = container_of(work, struct ath10k,
>> @@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>>
>>          ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
>>                     jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
>> -       ar->state = ATH10K_STATE_WEDGED;
>> +       ath10k_core_enter_wedged(ar);
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>> @@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>
>>          ieee80211_stop_queues(ar->hw);
>>          ath10k_drain_tx(ar);
>> -       complete(&ar->scan.started);
>> -       complete(&ar->scan.completed);
>> -       complete(&ar->scan.on_channel);
>> -       complete(&ar->offchan_tx_completed);
>> -       complete(&ar->install_key_done);
>> -       complete(&ar->vdev_setup_done);
>> -       complete(&ar->vdev_delete_done);
>> -       complete(&ar->thermal.wmi_sync);
>> -       complete(&ar->bss_survey_done);
>> -       wake_up(&ar->htt.empty_tx_wq);
>> -       wake_up(&ar->wmi.tx_credits_wq);
>> -       wake_up(&ar->peer_mapping_wq);
>> +       ath10k_core_wake_all_waiters(ar);
>>
>>          /* TODO: We can have one instance of cancelling coverage_class_work by
>>           * moving it to ath10k_halt(), so that both stop() and restart() would
>> @@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>                  /* hw restart might be requested from multiple places */
>>                  break;
>>          case ATH10K_STATE_RESTARTED:
>> -               ar->state = ATH10K_STATE_WEDGED;
>> +               ath10k_core_enter_wedged(ar);
> 
> ath10k_core_enter_wedged call ieee80211_stop_queues(), which is also
> called earlier in this function, is it expected and harmless?


mac80211 will make this harmless:
static void __ieee80211_stop_queue(struct ieee80211_hw *hw, int queue,
				   enum queue_stop_reason reason,
				   bool refcounted)
{
	struct ieee80211_local *local = hw_to_local(hw);

	if (WARN_ON(queue >= hw->queues))
		return;

	if (!refcounted)   // refcounted=false
		local->q_stop_reasons[queue][reason] = 1;
	else
		local->q_stop_reasons[queue][reason]++;

	trace_stop_queue(local, queue, reason,
			 local->q_stop_reasons[queue][reason]);

	set_bit(reason, &local->queue_stop_reasons[queue]);
}




> 
>>                  fallthrough;
>>          case ATH10K_STATE_WEDGED:
>>                  ath10k_warn(ar, "device is wedged, will not restart\n");
>>
>> --
>> 2.34.1
>>

