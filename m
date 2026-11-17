Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944807;
	b=uB9lmjE3AaU0cTSZL1i/cmrKdskcrMYdj8bZtn8ueSZEk5RBihdUKeU58pdihN3MhsKa
	 6CHxIYPtQ4IPi5UDRm6oky5JpPcw0ggcV46j7zteMdfpE9yDWCjf4wT1p6C25dRiNWGU6
	 9NyY+JIzhC+4N5fzjPkT8SibKgSXzKzIuxWU9mao/pr0xhef2T4CKzb73RQahezWZA7wu
	 qtzbuWm6LYk68JqV2hXYpvoteDfUN8ajYiZ/RFXLiM+F/BYZsPNa3XPyLXigYy2jJWrP0
	 mtt315xDn+yQ3/JzuR8LE0l3GRiWNJ1fEEAnjCZ6s3A+RCFk8Md0E4eBDVCgbkTzMiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944807;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
	b=cn1AIoQg3bW6byKrnNQXh//ZbGOpdPtiYzGXIotIMZZhdjg2kIQ9Ks3K9WcxK/if2gvz
	 9ulkZIVarIS3pgh7VOrZDJR1KezsYwhgA24Wmlomo8VjbZlBgBSQPNIHRiUJDgZZfsieS
	 5W2apNtmxk2x1Y20Wy7v79hXilr70GFNAqYX/UCsyYV2UAyfd0Ggy9vlMxa6mqV/0Dm3q
	 3LPlQWQlsinVMn3hOicPx+F2qQgvXu+oYofddnRUsXUtvVkGhjtjZ91T0P3TH3SsDBMmX
	 9wINwaGftNq/WwUvNEv7cPTuXoTQ7reaeIb20tn++UXc6ka9WAiriiUz1M4OpBm0ATw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CrJioLXS;
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C684E606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C684E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CrJioLXS
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-94961b68685so19317385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944806; x=1795549606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
        b=KgW3AexjjDR1T0s6K/9Hb0QtN4yMQkYhqW5yZH+eGq1kX9UwdmJ6m8sCcUNopOVAE3
         U1fDiVcebAWb1ApcuReEYfObDt9fOoD2Be8Mqwe0q6Q+gaZ9synVzOkjPOswf5/eJgyo
         XB+UlqCbTVpAzXT00BELJzNT5DJu23wzMf1Vi1gYeqQ914CwiMxI1dj1q1HnZacOvrOi
         YGgfzCdLqRerdkDhUCrucwffHn7/KQJrlFXFmhjg61Ef1xa3qsUtirOHNSbx4IDJvzpv
         JMQHkP/vTYNuSfdIgo5fz6IwkJgiQWaRcfUDBfVqqCDqhFcvfe2LM4S9Rkpddy3Qr4I9
         TUmQ==
X-Forwarded-Encrypted: i=1; AL+hErHHmIGgAu4ba2yXNHkbHdHxUH9p0G7blwf9hXvgkA+aDscap/CNxeCTRPrfK2/B0LCaPgxjTuJ0vb9qj+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qzCgWzKbf5KVoR3VSLLsay2DtCKusj2Lp3Ae1c9gCaSleNDL3
	8f4I7fcHC/JlR71LIPQpX/IlQfXPlyjIlDDLMhdQcLwJf4W9Sq6zsXG6Ei2elxLdLOVLrE7q9p2
	ikE/qfyL+a4NRqIYHIjOKp+wCmTo1ZiO6ZWzhn8KWxlW+6h+YLEVMbufb9Wlm6epAfMZ37hDdTP
	CQqTqMB1FVYwlsvp5z2VZJXvRzui7qBqaywuhYCsCtMLk4oDwdvjPMgBR7QO/kezhKiRA1uwtmf
	0RdIgeCeXAELZl7/RZDPlXcGA==
X-Gm-Gg: AYBFou3bBlvYRkD7dq57uEvWcdps2ymPBPHnIHcF9iEUD02oLJzmcp7iVGB7m3gQttx
	MFicWrmgZkRsIwwgRdLjQeDI2KDRjfGPmDqKDJ5TZ1TQ7o3A15P0iridEEEYzIhYC5ztr85nSDY
	uRbcx7/qdlo4oca0f7a23vsd6LgfETR7yCHKM5TAiRxppym/mw5wQsszeEgqduZK5vCI4dW6Q4J
	BhD5pE3/ylgxDuwUJr/DmEDXTnz5B8QpLm7lMc2FQ2Z0lSMWeeNKGvKMxizJglPlX/Qpm7jB7IS
	MQRdFZYbzwAEEdSFKxVWMVWj2NNPfcPwRsW093142DGLG0kIMiepOfI1ltHjHomWQpK5fLKhAXn
	477tRfPQDuTog0d3r+FBl2RlM3HgMCZXn0jebE3dNkHfTiOUHWNjRQg0msHQCm4S4gK9eOFoyV3
	gxG+1cVRVGj3qAHOnDHNiY6ejKPEhIOOQTIvLW8iY=
X-Received: by 2002:a05:620a:4506:b0:939:fde0:a71b with SMTP id af79cd13be357-94999351ba0mr143242385a.0.1794944805470;
        Tue, 17 Nov 2026 11:46:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-92114e505c7sm27466d6.35.2026.11.17.11.46.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:46:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50713860c0so6250666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794944803; x=1795549603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFd/RP58uuymd6sBgw7qEUvIDPwjlsp1rmxiXiW1mtY=;
        b=CrJioLXSrQrzjyCedrcFdZXOQlHTUrIFqi9+BjfX8Z7VPZaPMfbRajtr0NN9SPy3x5
         fHxPu9u37H07G/qmq6Mlf0d7L4RE+mSsZxssONsmMC2HsB9Blwv2vLl7qANzSdEpnJrS
         rvrGrGNaFTr7LHCSLh822aPcX9FkB/E3jtsak=
X-Forwarded-Encrypted: i=1; AL+hErF7/GdoDBuN8DD7Vx8J5Vs+W+bElFfaFzfowxk/w/BtFbx0LyCl7QGcm71OD6glGe3fcAVvavZNljhL7Hs=@vger.kernel.org
X-Received: by 2002:a17:907:728a:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c510e4fcb61mr21124866b.36.1794944803150;
        Tue, 17 Nov 2026 11:46:43 -0800 (PST)
X-Received: by 2002:a17:907:728a:b0:c50:48b8:22bf with SMTP id a640c23a62f3a-c510e4fcb61mr21123566b.36.1794944802720;
        Tue, 17 Nov 2026 11:46:42 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca09c82sm16249666b.21.2026.11.17.11.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:46:42 -0800 (PST)
Message-ID: <716869b3-adaf-4155-88bf-638952dd358f@broadcom.com>
Date: Tue, 17 Nov 2026 20:46:42 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Andre Eikmeyer <dev@deq.rocks>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Yossef Osman <Yossef.Osman@proton.me>
References: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
 <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <2FBC4AA9-16FE-4710-B43D-9004B0B17DFA@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/11/2026 18:50, Aditya Garg wrote:
> 
> 
>> On 17 Nov 2026, at 2:07 AM, Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>>
>> ﻿On Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>>> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
>>> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
>>> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
>>> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
>>> enables "txbf" by default, so the driver has to clear it.
>>>
>>> [...]
>>>
>>> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
>>> Tested-by: Aditya Garg <aditya.garg@linux.dev>
>>> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
>>
>> [...]
>>
>>> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>>>         goto done;
>>>     }
>>>
>>> -    /* Enable tx beamforming, errors can be ignored (not supported) */
>>> -    (void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
>>> +    /* Enable tx beamforming, errors can be ignored (not supported).
>>> +     * BCM4364 firmware enables it by default and then transmits a single
>>> +     * beamformed stream instead of two, halving its uplink throughput.
>>> +     */
>>> +    (void)brcmf_fil_iovar_int_set(ifp, "txbf",
>>> +                      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
>>> done:
>>>     return err;
>>> }
>>
>> The chip ID check has the same problem as in the ARP/ND offload patch [1]:
>> the issue is described as specific to the firmware shipped by Apple
>> (9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
>> restrict it as suggested there.
>>
>> Also, the comment says "Enable tx beamforming" while the code now
>> conditionally disables it. Please make the code self-explanatory, e.g. a
>> local variable or an explicit if (chip == BRCM_CC_4364_CHIP_ID) with the
>> txbf value spelled out, instead of passing a bool expression as the
>> iovar value.
>>
>> Minor: typo "refression" in the commit message, and the subject lacks
>> the target tree (wireless-next) which wifibot flagged.
>>
>> Since this is a throughput quirk (not a fix) I would also like to know
>> whether TX beamforming is functional at all on the BCM4364 or just
>> mis-selected by rate control, so the commit message can state the actual
>> root cause.
> 
> Unrelated but Airdrop conversation seems to have been stalled :(.

Indeed unrelated so let me respond to your earlier email that was more 
on the subject.

Regards,
Arend
