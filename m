Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679544;
	b=xPLcqmHJXhhKtmJGEUv7UN+Y9BOK8Gi7dh1SEFtJlV4HsZfON+TNUkj9CSNxs/kM1nxB
	 QyDpKFLs8YLBZRlA7pyFH9oxVJP5IUdl4bpxnBbk/EoW4mE0FDQtk8eErUsBlnxX5fD9M
	 cQO0L9EowwMiEVH7WQFMJrFu6L1iSx3l+VxqwcK2+sTNI4VYp0FxL/AyP7QzOBjnO+MNU
	 uScYggrvasIH7yRlMwCdhKH8FlGqydGOr5tfODKx1YKwkVBX+t5WUVtkjp2Dov8Y1nN1W
	 wksdItmaOBKohrjyAl07UR4wujL8xem9Z5udqo3QULTCvB00edKWyDSEDytq6V0jZZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g0WLhfiE5DorSynzsEGzn+PZRreC4LEd27ix6JEKYvw=;
	b=OET6H0vY+AHHlka+uhEy0MdYEqc7JzXy+SZs7KeH/yH6B8x8wv0nibXW6MKTigC5JB7Q
	 UCZZfQejqdh62jWK8rg9xP1OVmt7Nk9+wvPeW8hMjiRPvxIkjJxg+etlV7lLriJfgN/6I
	 sFmhpO6XBGQcWkoFB2fQSjSVSWD+JpYGvfkm7ksateyJuPChmI0f7Jb3CQsqErvZ+lli0
	 zcoez4uyy6MFZWYWI6LbOUucH+odYm2we8QUpAxKHgaaybSETRnOwhOlB+S4jEEdOr/Z9
	 OjobtisW5X6UviplUT613h4+TijajB/howl0NGGkDEdUPWvpL0eeWtMuFIB4mv8j3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=axEs1+La;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etd1Xsd4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94835606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94835606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=axEs1+La;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etd1Xsd4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BDMB3548533
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0WLhfiE5DorSynzsEGzn+PZRreC4LEd27ix6JEKYvw=; b=axEs1+LaHdZzB0T1
	8Xipt/3wh3t5izodDVeDr9LQZJujMCbyjmLGSYM58+3SoQ+GuAgPcnfXMtN2z3k2
	zX+lRMwjiotBkHbexFm7+DaMOKu/1Y8DRLft9fYuxOPxFBIPvXnk6V9dvHbr8Eqp
	ihd6N3RDkhpcjJv9i0MP8GrY0zTJrs48NIyhivqayRINmNV6jEGi9RXPtcrm26fc
	vKO86VrkT5Qjx2RigSyfgl5YAHXEdappzt7DcgNNDyxQmiicaDS+Jn2EG6MvQLa4
	hMkxFpAByFUjQ2FoWipj35Oaq6C5umCkMzo0Mv3BbROt7fxIeaf4018fTTpqnEmD
	omYjAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatvpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:52:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so1139237785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795679542; x=1796284342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0WLhfiE5DorSynzsEGzn+PZRreC4LEd27ix6JEKYvw=;
        b=etd1Xsd4ArIuf9odUQYyz8RM09LVg/Gas+iqOnQdAtjfsrpMUrESp4OuNFJAK1jy/P
         MLplz2aocz5t5Ml+PyTKa/6kkJnOsFOMpcoi7WQX1tFP/FMR3vqoDVEZ15Kg8uSBplOQ
         0++pJO9DMqcVatmNvQTsx365vGVKS7b1c5NMxnew+sDRdtGfxvCsAAr86/JttB8qOx6a
         bAUoT7a2/uyQdj9XKjdsACQFilncxQYC+nFCtKxQWaAB+d1SYRTbrQwIBco8Zrb/BMGn
         Hb2sR61EZSdVkSM2tWVcgFuYl4GIFHuMTFGG2VWkItA8pcGmSH/Cb38a6M1YyOT7uqdW
         Ybpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679542; x=1796284342;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0WLhfiE5DorSynzsEGzn+PZRreC4LEd27ix6JEKYvw=;
        b=yN5vyQPb9ihW3pR9pWmjvpra9SuD7hi7xhlQxF8RFq1FpoGdmMeLoyFyYz3JhkljZl
         i4MrhwtD5iJ/NNotEevjaS1kNyO8hEs8CVw8WFzhSiFhqZSXPG2nZms/KXWi86Dl4nhp
         aS1TFd2DlW3Vg/tTf2RxFmXJoKudpvTwjdJtkxEtogqzqTZrjX1FgSQ7vadwzR0MBAIh
         iYkGmXeyWI2rpY7q1YKpEvHukgZ3LZuRmdAcmYyWxtBGpkzlNGlmIKQ0AHaFJEbRXRsj
         N8Jayq2pr4DDjHcWtG7pbaNHgndxlX8QbbaXDvaEKgpsJIj531FrjYTU3ZOHOWEbjTXD
         hp3g==
X-Forwarded-Encrypted: i=1; AL+hErHYMkJW1RfqIdF49KeSAJXhZUHKX2QD08gaokGXta4SkcXOakr90Q/9wxppayv8h/Z6+M0ZgGuNGDVVHtg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dOfuPeLhcxNYmuTexxcGtdPG+1thMSWt5qjgjFDvfx8bLC48C
	VSYXF/W+pT4QYVgCJiRrHiNZI3PNVYPGQATMBHc5DpttSc7dIaNUZvjA773ShGbhEt1u4azOg2b
	+5JOSngi6ceLGN/rMPSyFNbfsJAb/RaCx/5jq4tBNPITGY7X6pDWA2OfFLxdjXbLfFzlVpRM8kc
	/8kw==
X-Gm-Gg: AZFdTZet+p0TeRMBMs4qPy3HzZmeMOPPaj2jCXikOE4M0dqFpJgQypvsDufQ1wLbMsz
	Xllg8ccJs7hknF06FliQkuUSwL6Ot4YdE0u0cUWD7D/8QxJ2qX/I3ZACSNelpSWcmDNq8ryzk/a
	tGcS83zAl/KFiDLiRfMDqPwYaYH8ZhnKJvG2uUX+PpwgTcjPYFT2XwpJTbc4Pivy7JDacRtetBY
	ceTU+BYhGKSfmrk8vO+lmM16UXdqIvhB2WXX+5oZ5FwV8SfitFV1fofS73r8SH8gj5Xb0xedTmk
	6Xfpys9ISmtf3QfjsxQXoN2h8XxtZnBeEQU7TYkYz4hyeBMvUIBCG14wPd/BYVDjn9Yb+XwZzgr
	FxD9m8r/wY/+XZdkw9XYzzjGCBr61oqeJTqQ0lw7ttSv5ook4nuSTRDP15QtFkPUR9NCrL+fofP
	xFCnjGOiAVnNgVxQ==
X-Received: by 2002:a05:620a:2b98:b0:939:a199:45b4 with SMTP id af79cd13be357-949ba9a85c1mr3582203485a.39.1795679541704;
        Wed, 25 Nov 2026 23:52:21 -0800 (PST)
X-Received: by 2002:a05:620a:2b98:b0:939:a199:45b4 with SMTP id af79cd13be357-949ba9a85c1mr3582201185a.39.1795679541117;
        Wed, 25 Nov 2026 23:52:21 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm575143315e9.1.2026.11.25.23.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:52:20 -0800 (PST)
Message-ID: <6ddbed80-bda4-44c4-b0a4-be2e87b278b1@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:52:19 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
 <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfXzLqdIH8Yk63N
 3vvD1nUJPGER5Z8nj80osMnaXRgFIkRftWARhKM+XBTf/u3Kbbzoy5cHhjKObTfqoV7f2gP3du7
 ZALMGIdF92ghEqp/LLpkPA3rgHeWUko=
X-Proofpoint-ORIG-GUID: 1sNjACdCOyodV-_pzoIkU9O7jeOspU70
X-Proofpoint-GUID: 1sNjACdCOyodV-_pzoIkU9O7jeOspU70
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07e536 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Dh003GKxTaA1BFmjTToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMCBTYWx0ZWRfX5+Ab5HNVdnQ0
 qbkAKDzKeukGBiP97VtofskH9ZN1LwgikaRzSBGOg/0yTvAJ5iSfs3gLiwACRQahuAnH3+k6Qva
 WO9UtbIBOvIO+rTNVYnEn8kIfyWkjkMbqWwVt8GTx92aaGURyN8/ybIUFD6DT7+l9UwMB4iEPJ1
 uJm3Kf1j80tCLQP0sWvi3qWQAYkLWTFoDI+Kvh7DXZcTTChW8L15aG4B2gexSG+2C+XpQwg71fg
 zXUjp8mBjq6wH06i4tI8zdzZ9KSzqOPraJ622R6GB+K1LXQCgBwczCClrbhK3ChFju2fUxIMwmC
 0eMqyyOQwyw9jSDQwNINkeXPwSLAtnNVtdX3b6pz5LqsuZbDbK+WP9tDZYmiu0dL+jSA9YTBYGT
 LG9yhW1tGf3b+3adxVz2pNfu6oB+FZWzhLLA+49CFKZRq2ZcePQPs306bTZO9xKBADtI/YL7ig+
 zsBzBLXwYxDyEJ9Q6Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260030



On 11/26/2026 9:00 AM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Loic,
> 
> Apart from hw timestamp propagation some other comments.
> 
> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>> The timestamp reported to userspace for a V4L2 event is taken when the
>> event is queued, which for an event signalling a hardware occurrence is
>> only as good as the latency between the two. A CSI decoder able to latch
>> the start-of-frame against the system counter knows that time to within a
>> few microseconds, whereas the interrupt handler that gets to queue the
>> event can be hundreds of microseconds late and is not consistent about
>> it.
>>
>> Take the timestamp from the event when the driver filled it in, falling
>> back to the current time when the field is cleared. Drivers have had no
>> reason to set it so far, and every in-tree caller either uses a
>> designated initialiser or memsets the event, so the field reads as zero
>> everywhere today.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>>  include/media/v4l2-event.h           |  9 ++++++++-
>>  2 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
>> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
>> --- a/drivers/media/v4l2-core/v4l2-event.c
>> +++ b/drivers/media/v4l2-core/v4l2-event.c
>> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>>  	wake_up_all(&fh->wait);
>>  }
>>  
>> +/*
>> + * Hardware able to timestamp the event itself reports that time in the event,
>> + * which is more accurate than the moment the driver gets to queue it. Fall
>> + * back to the current time for the drivers that leave the field cleared.
>> + */
>> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
>> +{
>> +	struct timespec64 ts = {
>> +		.tv_sec = ev->timestamp.tv_sec,
>> +		.tv_nsec = ev->timestamp.tv_nsec,
>> +	};
>> +	u64 ns = timespec64_to_ns(&ts);
>> +
>> +	return ns ? ns : ktime_get_ns();
>> +}
>> +
>>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>>  {
>>  	struct v4l2_fh *fh;
>> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>>  	if (vdev == NULL)
>>  		return;
>>  
>> -	ts = ktime_get_ns();
>> +	ts = v4l2_event_ts(ev);
> 
> The documentation states that:
>  
> "In order to queue events to video device, drivers should call:
> 
> v4l2_event_queue (vdev, ev)
> 
> The driver’s only responsibility is to fill in the type and the data fields. 
> The other fields will be filled in by V4L2. All other fields are filled from the v4l2. "
> 
> So here we are changing the driver-api. I am sure that there are drivers
> which does not set initialize the whole event struct. This will introduce new bugs with
> some uninitiated data send to userspace as timestamp.

My opinion is that similar to frame_sequence (which is different from event.sequence)
to add frame_timestamp in the frame_sync data field. Whether that is monotonic timestamp
or specific camera hw based timestamp is yet to be specified and decided.

> 
> ~Gjorgji
> 
>>  
>>  	spin_lock_irqsave(&vdev->fh_lock, flags);
>>  
>> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
>>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
>>  {
>>  	unsigned long flags;
>> -	u64 ts = ktime_get_ns();
>> +	u64 ts = v4l2_event_ts(ev);
>>  
>>  	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
>>  	__v4l2_event_queue_fh(fh, ev, ts);
>> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
>> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
>> --- a/include/media/v4l2-event.h
>> +++ b/include/media/v4l2-event.h
>> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
>>   * .. note::
>>   *    The driver's only responsibility is to fill in the type and the data
>>   *    fields. The other fields will be filled in by V4L2.
>> + *
>> + *    Drivers whose hardware timestamps the event more accurately than the
>> + *    moment the driver gets to handle it may also fill in the timestamp
>> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
>> + *    drivers must zero-initialize the whole &struct v4l2_event.
>>   */
>>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>>  
>> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>>   *
>>   * .. note::
>>   *    The driver's only responsibility is to fill in the type and the data
>> - *    fields. The other fields will be filled in by V4L2.
>> + *    fields. The other fields will be filled in by V4L2. As for
>> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
>> + *    CLOCK_MONOTONIC time of the event.
>>   */
>>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
>>  
>>
> 

