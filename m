Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489311;
	b=y8fqtHqEbQBPDZDIU8OLWeNgIS3dH2zmL7KZ7LM1ngnP5YzMhM9CYjo/n08AE4hacxNq
	 eWkZiTHaggpYkOlEFRIhCz6bRWQ7yplG0GzZoEHSK0sJT+wOknNG12KxLrsbRf15XUjzg
	 f5rRidgIaR4RdtRgGbPdrNyrmUeNP8CagXbRxrxDLgxvyEpI6R1SdfcL8FQPxGNO+uP4/
	 S0OWzOWREwmStX6wqKfmrL6ro97+WuoW9GoJjDJuEhJPkb5b8r2ICAQyKqQD9FNvTQCfS
	 2h/lm88j3w1nQwUVJL/wnONG32A7a5FIj1jIh80Hs8ebdyUlGPl/2nFIFA3Jof+iSdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
	b=TiYQ2KtX2Kkw9MBZHOGAwDU6aXL0WRX3xifoycpCU0IarqGuLGPgh9pJBtVogXMFHNV/
	 ZRYt7CjnUiDVWxNN2vN0RHhElES8gwAF9iNhebKq3C0j55VhfB07VNBlByOtJV5az52v6
	 LQY4p6Y3LRmAEKiQ0jVl/Dp0v5F2OyQSiWA07GT/4+iU9+/NHsdZzw4yr2R5jWEK0LHle
	 SEKdOlAFx5kWyTUrmLAnoH9XU3Ud8vyK/f3y4BkfW8DMbUFXFGmucmQ5izl2VCUXNJvfE
	 QsjgqN3MOdgcyx8Js5OvF1dPXTGQPiO1UWS2Dy1weIWct/GE7w53r+AhA/scBK8jULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UHvxTIF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDenmzFz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF82606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF82606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UHvxTIF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDenmzFz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kUBP647161
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=; b=UHvxTIF6tq86T9CZ
	vPUfeezi9q52Mm9ZAiqA1HoB8DQBmvf8A1qYlcRLE6U6Z/3kwMeTg8oOVvdakrnP
	6WOYyorBnwZUcIKLVKj7tm5bIjyepFWbISHwMHoO0vBdsI9/5H0H3a54bbzf6U7E
	wak7+9TWY1q6FlxC9V6sjtIPDQ8tyPeb7WdPIZsAqT+ujuHndmrFLdRgSgz3b5j3
	seP7dDPvMxeaQ8NAtZl109N75+XhPj3/33cU6Tj3S5yrdalBsLx6ZAwxd0yn2rc5
	gaIp3TPH/k1JKK5Fn0Z66AaxW/r4QeXqEThamLzoQF+8YboG2l2VlMkWnVxmwPs8
	uJyzVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd0fk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:01:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4447626eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489309; x=1796094109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
        b=EDenmzFzucGOU7JuePw9rfv1vUqbSvPf05vg1EjiNZZormuPOdoj8gBzNyxLOEH0jv
         DkeetPmrW6kJlPEKz8JEijJyZzXvZCI8l/swzi86yAvSaT+CqgK5y6SOWovIrklkk8ZE
         zXczc8krVU5Jyzh1fRg6wSffq+Wqrve3K+bsozmXZJjB8p8xDCDWwqVvXS18DZ4LO+qC
         0K1WM/r9sjp8ch3cjp8/b79+taLFGbNjKEkqJ34esXyxgCaMT4PqzcbeECBpePOTW6yt
         vXFIHnlg1PQy7u+fGxcLahcYSbNTmzOirmoSkDjzzB7js4JAQpQtCDTRB1fWiu44a2md
         BP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489309; x=1796094109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jcv4U8VnYT2CoI3pu6i6z6aA0Kuv8MjArtRpycYPcuo=;
        b=1iRASNWfEekjn0KmofOKSc1ascfnIiEpKR3lQeXr1llosDal2vIi+kpE9BPI29tmL2
         p+/Gmu0Tl8ap+QSdWc7VoGxrfJrAQbAf4q40Rke6uLwXYF2GQSqNyToE8+Z/q732rIQ2
         8we0K72Sv2DnAb6+M3x08iKSGDctDCO+IZ2rzu8/r0K+8pi7g1gRlyW1tLnQe2GmWjr1
         88Y5WFd/ELjJKDNrBAj++XXIumeYfh7afAfxeCqz84I+6NkL2rtPCyopfRkUyTNBolj1
         3tgjaZfY2nvNiBH0tQNH29VCzvCGVqobwNSWNzwMQ9DoRE2WVApJOWdA4wNj88yIntBX
         4+XA==
X-Forwarded-Encrypted: i=1; AL+hErHJThTTnIc6sZPChNHm5QYe97FELuDeqePV3OuvfpQRX+kLb+S2/eJieUPDcG//KBbjluMGv7FCtXMeQ+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P4EdRRMTmT9xFBZ18kN1XRcg+h/rMQrgGsAdNZdc+pnlmCNxU
	4PKpiEAd5F8iWC/K7eJlUW6Ra0tqtpdHom1RDv8Ubss/8OUQ+aPS4N6ijcq1qyyZEeCDqQxU/Uf
	sn10XdOPXqs/ZNATAi87QbjEihDNopBfB6cpoKEx/KP4krq19k+YCwh7O26bXylfnvkM=
X-Gm-Gg: AZFdTZc8ulMcN2mu7uomSPEul0ESTnwsddFUpP8oWkoUJz2OcL9c8rtw7QhaV26U6rl
	p1iEqCJmRID21nPEJnF1aF8mLTFFFCoS7iLROc0mx9x6L4yeeQnC9SLZ/rZ4NDDvFMPWBwimOeL
	eJT0d1m0VzmgKIDLPoNN1wHE9MJdhUa2uuynNI4Ds33qTNWyAG8VgvESxbrGjNg26ZXcg8WMIE7
	ypu+wXrxI2shHSc5/5Y0NNlfPXsaonO28pJ+F6KMoBijtHclhMYaZtjB1lKVbkFaTuXdLphcJTB
	mPd2Ty29UxAWrO8HkRvlNSQgL+4Jn3RlY6WlbIqSQIsMAXrpTyoa0L/DhoDD9LwhqOKeq8jvKsc
	mq3lBIC0EbnSQZudWFvnbVKEeOG4nbp/TT2uORdOJGwWauPJmhw2MuORVRiWE9G/wKtZt0dBJHm
	9J1INrVxKLu9OA4FSds7UP
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5028546eec.26.1795489308494;
        Mon, 23 Nov 2026 19:01:48 -0800 (PST)
X-Received: by 2002:a05:7301:d804:b0:386:b076:a940 with SMTP id 5a478bee46e88-386b076a9e4mr5028508eec.26.1795489307870;
        Mon, 23 Nov 2026 19:01:47 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43491619eec.14.2026.11.23.19.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:01:47 -0800 (PST)
Message-ID: <6c3c9468-af47-47e9-941e-49619c35a5fe@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 19:01:46 -0800
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
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
 <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
 <82a57df7-a3c5-4986-a724-44f00b22a532@oss.qualcomm.com>
 <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <026c4fd4-cae7-41e6-88e7-be8387031eb7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b04fe1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=cJ9xjPLimF7whQLiEp8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX1Bxqx+/eMD23
 +cS0jrmrOCd3A8LD2i0LX9nftS5fqPIMM6D9kVlzCQ4yUD95bn1OOe6xPWSppnsi42ntZkGQEZ7
 7gNwqLHpMVDS9z4vyhhNfn53h9A7nuzybEEmic3dbMja6evPCP6I120jfxhxVCv7kUhMkYqC8HM
 PGohPyAWjEsp12yZ4k/EbznsJyWaUO0DqPWvt/AIW6ogG3+OdfJjDIYruZvF2fpUMgZQWoO5Wid
 07e1vaHBrqdGpZBEMLs/nch9Z3qbA6XUnZdWQogvuNkMDhikSQDwlSpfSkVAnDGW4BAjZ2tyHsd
 SgGcWweKlAnLqTNHoiodP+DXc4jQSBcuPv4jGmvXkh6C8b3ikRdDAbagiIm3bLzC/MYSgIFFACX
 B/UmXtl4v9bvg90gyG6L9YnJRpEojaIA/G2VsshXaESS3Om72QlTP1YJwMLJ9Vmp3UWC7Xz8Zw6
 6pBoaimHrRBHlMnHRgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX5jIB0s15RCQi
 JoMeGFqvtx/xKJo2gpF9V+fg2KeHSI3yFP7RmUXN5xFn/GDusLjhhn+cdpRPOv0W9Da2+925D4u
 SzZlTgSJZe9V+LSYe71q1PbTL45ndPE=
X-Proofpoint-ORIG-GUID: V2p-gADXogmFVEPJRTzlQ6m2s4dAlqW9
X-Proofpoint-GUID: V2p-gADXogmFVEPJRTzlQ6m2s4dAlqW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011



On 11/19/2026 7:26 AM, Mathias Nyman wrote:
> On 11/19/26 00:30, Wesley Cheng wrote:
>>
>>
>> On 11/17/2026 1:59 AM, Mathias Nyman wrote:
>>> Hi
>>>
>>>>>
>>>>
>>>> Hi Mathias,
>>>>
>>>> Was wondering if this design looked a bit more acceptable?  Was able to 
>>>> figure out a way to achieve what you had suggested earlier mitigating 
>>>> the dma free problem I mentioned in my previous email.  If there are 
>>>> any issues w/ this please let me know.
>>>>
>>>> Thanks
>>>> Wesley Cheng
>>>
>>> Big picture looks good
>>> I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 
>>> 2/4].
>>>
>>> It reveals and reminds me of how poorly designed existing 
>>> xhci_free_dev() is.
>>>
>>> I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
>>> inside the lock, preventing it from being dereferenced based on slot_id
>>> somewhere else, and then free it without the lock.
>>>
>>> I ended up with a huge mess that rewrites vdev free/allocation,
>>> slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().
>>>
>>> Seems like best solution for now is to add "no_pool_rings[]" to support the
>>> larger page size, and then later rework the vdev allocation/free and
>>> slot enabling/disabling. I'll take a look at the details of the series.
>>>
>>> I also have another sideband change attempting to fix the use-after-free
>>> stale vdev pointer in sideband. It basically swaps vdev to udev.
>>> I'll post it on the list. Let me know your thoughts on it.
>>>
>> Sure, I assume you're talking about:
>> https://lore.kernel.org/all/20261118125109.1429538-1- 
>> mathias.nyman@linux.intel.com/
>>
>> If so, let me look it over, pull it into my branch and test it out if it 
>> looks good.  I wasn't able to reliably reproduce the issue that Lianqin 
>> initially reported, so I'll see if I can figure out a way to exercise 
>> that call path.
>>
> 
> Yes, but sashiko found one missing sideband_to_vdev(sb) check that would be 
> good to fix.
> Rest of warnings were expected.
> 
> I'll fix it, and clean up some other minor things, and send a v2
> 

I'll end up needing to rebase this series on top of that submission.  Let 
me know if you have any other feedback.  I'll followup with the rebase 
submission next week.

Thanks
Wesley Cheng

