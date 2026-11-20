Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193134;
	b=VleuLjYahtUDJeV9Q7D7zF+UiFRrxfM8jsyWs+u8Sg6yzqYdkDr/X9ve1Q0QKlWcgx2C
	 +PRm20Sg5DkViEVdV441dnByO44vVf9scTP2/w4fmTOpWLZTb1M9Kxgp5sqx9oKmYdsnx
	 3s5+oNbrh8VZtH13rHM5DLWAczpIsDQYwVtFKrdTiTcMQ/mMk03pFdhcWnaF7uix36f3o
	 ApsQvKtkiXCvA7l+EjHI+8PKvMi7KPw/O0uSEFA98sF1zmdzVykK8RV3poZ9d+RI9jHyn
	 S+k5RgEUrWcsk68+VsgIUW8wmRs7UUxCyqUhO+CnE6JGLS+k7ropcXw1kIHHcdn2hWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
	b=2nfHXBh2adK5MojoFDYh1x4AK1sdc9f+kPeGodqiz3RvlEab5pU46Zc/1MryRF5hCsdX
	 suHTqKMSvOkjba1Eo4MID9M2S1wT2VK9wmHj3BgM7ucZq4iUUrzY1sZVnBF2So60ZC1oW
	 EVD+9f18fYgqNisE6YePYcsGPV7MiD3F5VJDOxlnLCWkn/w+EbZkgpg0IJV8NNlg16+rV
	 i4zvmpRXQx4c6Chm4QrALqp3ezMeig6UruzjbX0ylLAaMwvGQNt9nksxsC5jB0Gbn9/u9
	 kBI3s/GuEDuX6sive9vMx/0XW0U07pAe6s6ViyOgJb4p992nt4aee31QBtmImzWvfYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4SgVwVh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEr7E6hu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3E606A61E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F3E606A61E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4SgVwVh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEr7E6hu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfS8c048804
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=; b=Y4SgVwVhvElqL7gM
	AuSh76nTy6d07wAWzQzAByaL8WNeDbQOQT5zJS5pta+Ws1fYjmdZjPnBJxgiL4w0
	GhPfMtuR8uCYU/RRAt94Iob+xSvCO+qTg3rNqUAL+y8lLKHkpF3MZ7Saxn0IGnDI
	EKntjdJy5BWBvejh1PTSi4ssjKiXLm7z7sefqI1ak3dVrUaoTJroQs01a1DbJUB/
	Uef+g1a7fB7tv05HUU8m+jo3yxnV+BoJn9y3WB2JUKJXwrlmoLjkQwIMp6sq0Gk8
	1A3AKDO99MtLsIIVOXYBTaaOg89Us31EPpaSR+N+hosLbOmXyZHoKOcWRHNg9rJ6
	pZi97A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4hdep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:45:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1665394eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795193132; x=1795797932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
        b=iEr7E6hurkE6sq89FOOL7ozBM6i3HW1b3bO7IyX2RPbOtt+2w44DjRoGTJbYH8J+9R
         fgH2omQKCTmxmbIV+ZseWcu6DK4CVzfRJcDNouH2erW3PfwawF+QKMvtAla2kHbBNzyA
         cBSSYybNXkB1/aRzi3jqxDxVAvMnxE4pYfqUxrbgAYq/MBLl/bnMPhO6lh1/goWwr89l
         Ch3QFeClyEj3XedhsG4yZzCmCnjLcpziHtQcOPGzn1vjn96pVOeyWwlr0d7yHpcNLQOv
         qu+skBXeHh7JiXv+LuTt+wpQoaNq1w2UsOcj1ZiFptLFo2ZYWfJ02uIUOUg4Q0Bx4aqg
         qZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193132; x=1795797932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
        b=vzqkdBlb7O5XMGXo2cRGa0LuonJmK6nB9ZCaPvvtNZlIoyzMTKBMOst/B6wW3d90+v
         OKkmee4xULXq1M4VJx/qZGdkGXYjdOCE1sQDsiw8hOwcSC/6PMIb5gYf8vQnvJITq0xb
         0Pey9xIBg2zNeo7AjAqxPOzjn3OxBJcNbNLNZoSud1Duy9rXAXtVEYlMxWOTyZopzZbs
         TXqK2Wfc82MDWGiBC1nHh2dcyKwcxMgL4Mz8FjMSGJd/mKMJ3zCCVaep3HowTnsNRvqa
         ujHFTa+QIJyJWWqr/tKtVo5CsATcP1ZGbe7P2SViVfW9u/jKqo7rLgwF2sExSHZN7jtZ
         tDgQ==
X-Forwarded-Encrypted: i=1; AL+hErHj9wXqtJ3UkHEpDKJt/nsWvWHC84ZkveeE299y634DBkrcymM4jzxKmTq2COM6PerjFt/sEdCIhTP7Khc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A1piLCeSrpeEyZKGyEHUdV7gBo8Rl1YFPNbjdzpNHy8hq/vdz
	9cGHI8fiY5l4i6yLUhwnNqRZMszweWlhV1zEqRX0kFnhH4IaLyp2fzA6WIAdceeEhfpFUsfzVkD
	jgtZzAyAa1I8bDn5bXoU9A+T31OHqUjPmG07ueYwHSC6H6YKqMBuUcT0mlDtLAToXmRw=
X-Gm-Gg: AZFdTZeAeEFrdgHMPUG/TdxGdtQhqUjcpPe3IqQNC6Pb+8WJ7+OC0zFFJj8lQ9TbNEo
	y8YiR4X131QZbFllglQh3t+0mhT+XVHy2aVeh7rd3KzHQx3Vyg2XcetyRTj6RSFHSr27a2WuRO2
	qp0nu+3jRacllL9GZ/63o1jlu593tV+dVB2HSnIM5OjqNMsv56DkuH2SljWWnrYWrLp26kCrRsa
	DIAD/B4RPsNivPzd4zDFVryJRFl7bhmEnEIXIlWyU+J9zTkSpoZQ5slm8lGhVu+0La1fWpYVtTq
	pucra6BA3KsOrrmzhjtYjimZWvw41cDv/sVVG8wTGRO93c7TF1NqH4BbVYloFwoTSuMpxs7eF3r
	HS0hNCjL6fXMiAoKGs6YpbS2mP9Z3iFrodbXUtbEG9YxE7kmdFOADnyLyTsdO2lykNjVRaINlTq
	MCt5nzmjOyW6I/MzucibaF3PQ=
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr3430887eec.38.1795193131871;
        Fri, 20 Nov 2026 08:45:31 -0800 (PST)
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr3430845eec.38.1795193131141;
        Fri, 20 Nov 2026 08:45:31 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm9309301eec.9.2026.11.20.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:45:30 -0800 (PST)
Message-ID: <ca6de262-80e3-4c38-8f3c-122712d3f54d@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:45:30 -0700
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
Subject: Re: [PATCH] bus: mhi: host: Only expose controller sysfs attributes
 on the controller device
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111115659.11943-1-slark_xiao@163.com>
 <826c1746-137b-4a5a-968e-8e0449a25e78@oss.qualcomm.com>
 <3cb75687.54e4.1a1ed794488.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <3cb75687.54e4.1a1ed794488.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lCf8Q3Z3hVSp_k6IR8CUuQGNyOLnS-V3
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00792d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_J-3HC_dJu7vbrgoKJ8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX3lDop+xYsqY0
 6S6HotXv4+qv3sIH4fwmcuSe7OqBuyfUJsgStWW6g2Cly02+AkR2fOSlmEzFV3H8hY5/2z/J7hj
 bIfhYw3tXXGGImDL4/qHmRzXNx9YG/c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX2od1Mlxl5OtA
 nnewkvYVfRymb9b3d4p4IrLJYQeUUz5H/msaeQKvrHoPDfy3Qpbgi8QESC0QtY+PupSPEM5ohnm
 Ntpl4fKM7M3WbXKlle9p1GVxvjj5vTpXFxs974Aeg+faZcG3J9Po5EZHt/PejJI+dclmv9PAQew
 i2YDQ1a5TaHZHr/ONL70dD/yD0pAQNEmtMQMdwQ70UHeywb9xV92UPpze1zj1k3AxBKamCa8jRE
 s8LdKisj4Rdt9rX3n4vPUaNFNrs8d0B0BQPTl1Ee1utaWMU+yaU+dvSxttod5DwYmWko+HFMaiE
 ivtFPf+ll9031hY8tJG2Z29+Ty3HWBiuUgIWmBCSboOyKo9GtNgpgQqBv/4MLqaf28cFpCEQnNx
 hRWz3zld2982dSBjp9xC0SKPnLoKAcOffm/p9of4FjFKVLf02BSTkLLAgRxmVpbTiA1B5/Yy4Dj
 L4t1UHrbD0RvIqWh4rQ==
X-Proofpoint-GUID: lCf8Q3Z3hVSp_k6IR8CUuQGNyOLnS-V3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200066

On 11/18/2026 12:05 AM, Slark Xiao wrote:
> 
> At 2026-11-14 02:42:46, "Jeff Hugo" <jeff.hugo@oss.qualcomm.com> wrote:
>> On 11/11/2026 4:56 AM, Slark Xiao wrote:
>>> The serial_number, oem_pk_hash and soc_reset attributes are registered
>>> through mhi_bus_type.dev_groups, so the driver core creates them for
>>> every device on the MHI bus.  MHI client devices (the per-channel
>>> devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
>>> each of them ends up with its own copies of these files even though
>>> they all operate on the same mhi_controller:
>>>
>>>     $ ls /sys/bus/mhi/devices/mhi0_DUN/
>>>     driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent
>>>
>>> This is wrong for several reasons:
>>>
>>>     - The attributes describe the controller, not the channel.  Their
>>>       callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
>>>       or issue a controller-wide SoC reset, so writing soc_reset through
>>>       mhi0_DUN resets the whole device while looking like a per-channel
>>>       operation.
>>>     - oem_pk_hash reports failures with dev_err(dev, ...), so a single
>>>       failing controller produces one log line per registered channel
>>>       device instead of one.
>>>     - Userspace has no way to tell which copy is authoritative.
>>>
>>> Move the attributes off the bus and attach them to the controller
>>> device only.  mhi_register_controller() now installs the group via
>>> mhi_dev->dev.groups before device_add(), while the channel devices
>>> created by mhi_create_devices() are left untouched.  No functional
>>> change for the controller device; the files stay at the paths listed
>>> in Documentation/ABI/stable/sysfs-bus-mhi.
>>>
>>> Note that trigger_edl was already handled this way, through an explicit
>>> sysfs_create_file() on the controller kobject, which is why it never
>>> appeared on the channel devices.
>> I agree with the rationale, but this does appear to change uAPI. Are you
>> sure no one is using these on the channel devices?
>>
>> -Jeff
> Hi Jeff,
> For oem_pk_hash and serial_number, all interface returns same value.
> I think there is no need to keep these interfaces under the channel
> devices.
> 
> For soc_reset, it write the register directly and it works for the entire
> device rather than a single channel.
> 
> So I think there is no problem to remove them.

These are uAPI. The golden rule of the kernel is that we do not break 
userspace. It does not matter that their existence is a "bug", if there 
is userspace using them, then we must keep them.

I could agree with you assessment that having these items on the channel 
device is a mistake (and I do), but that does not change the rule.

So far you have not provided any data to say that userspace is in fact 
not using these, and therefore removing them would have no impact.

Without that analysis, I am sorry to say I am uncomfortable proceeding 
with this change.  Mani is free to ignore my concerns and apply this 
patch at his own risk.

-Jeff
