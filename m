Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609767;
	b=LWO3/tpKO0RQSV+fvzrEY9sW7DsAansEjuY7DtaeBcxNIuWPbGBogYwFFxw0ayVsusFq
	 I3HSEi7hDAJOA8sAYMnGUs7ycOmKPTaJElA9B41LgF5SKcu8XMWUrK4KN+N7KXbYbvKQp
	 5ngG9cQlnTod09p14iIU28I6fOKqMVsas7obdYsj2mPWH3KkWOvqoGft2CvSQNovFo63E
	 uJr+w/va36Liw5Q6zocvr+RzpEj7WE3qmXErDr94kR2+igrCPY6ZaTHHWyIQom1nLfS1C
	 /K2EUiiZbKy5HcsD3j91bYTDlAWoE+xLdVW9I38jNcE1cXljdFj8RoiKQuxnkVvi3UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=;
	b=3CK71yfhaaTPocsaPrs6eWdNEdqn5wuh5fiQrXppWlnTNwwPhluLeJ2TyCVWsSIJkANT
	 T1PN+3TVPxCaWUw8u7LgvzZcaCC9DYHjk1AXavFq9O+bt0r+fpaInq0FmYJH9jZbIld1m
	 f4BgbAK5vVw7qWw+FAQN5MUmE8J4EmKvitaSLSTkpmUpyvhcVVn/v3rLFquD8S0NAJ5jo
	 pKy9x4DCLg8vQfGSNR5/m7I+zavXph4vJEVbR0Gq8vqwzH5xWTZQX0atsyCdLF3iXlGUA
	 CpusqVdkxRI5rh2/DttfQQMxgZ6lUtyY/VnX6lLzQsGL/n5RE/7R90eDkMNJ8gtOagQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzYk3oav;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BC4EGRqC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F48606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F48606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzYk3oav;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BC4EGRqC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBbL4130800
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=; b=DzYk3oav/XGIb1h4
	QiDlmQvm4HgUI5yT1Ux/rTqSMvDxeewckfrTHHcvGuXda7GElQK2GjTdqypPbVqJ
	uApOjh6sLUAdFHptLPZJR6WNbp6OHul5FkryLr4ZKe/AsJ10o/9pmpRYzl2/m7zG
	VXvVN3qm0gcZ6TIwh7e7lDxdoaeRxdUARIpmVxsSRKHb3T3bpDt5jYSZ0cvD2pT9
	lxDpOLUnD3WGnsdXU4O7MdXLuZXfNOfhdFBT/n/boRtKs73SRXdbG6NF5wC4FAwq
	IRUrVMKBsszC8XwE0VaHDSV1bFA3CgJlzeQQUes7Ciq3woaYQKd+7C89pFCpZPTS
	e8V5MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrty4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:29:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so384552785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795609766; x=1796214566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=;
        b=BC4EGRqCW7RbCjVtDUUCC8W8Hmn9h0sBT08xQphwiSEZfyi2VcFh01JUSdQjAcMmMr
         8JgLHNfheGSJ7iYO6N4RjLSzxB0bQn75XHarDoduknvoVsgcqqctbHhlsR3GbFObbUDU
         r5o7vXQ0cWxrJBCoVKGNTsbmaaljfvVM74l+qFt0T0WrpEgGddbVi1QPrmqP4C+IXN/5
         Q9tVSegax85KFbONKBUnk5U2L64o3g2u33a8eDxq9dpqPX7YZu53ujUpozxnomFzBF0N
         J9Bwp1R/hMfvV7xpvwuM1s0OrL/LcuNKwdwrq1hxWYQ+8wSwQCSdKyUTCcms2N1VCVlw
         9/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609766; x=1796214566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5n9P9Rk3sw0uyrSlgak95rJRdejRe3OTzZ6wjZE9yM=;
        b=hZICABLEPKFiCSbea+RpiQfOhINxEHfTuMHZhv/0wJlB9Jz+nBYABoJA7ShTc4JalM
         OpLUeal4LouX6v54lavDumH4fUpl+qUc1s7pMDC7i9HudeIK27dAuE0IdImdzw0V/yBz
         G3ULtXVNSJ/CiJnOvSxg0kSvrJac8AyG0qMUnb5zXJJ2NWd8iJiTRUwrvD2XileG985J
         rRkE0gZKXCSmhEloKJkZyh5wd8UnpdiFW+TqZf0ifcA8kdzFSIp/xPKslg6rUFm02dBd
         Xe3vl6WBn5RK7IlyXcPr/44nL9ZhlEGRUZvw9T5PxcNeEj9EyhlkzpSSQGt0og7m+khl
         m2zw==
X-Forwarded-Encrypted: i=1; AL+hErHd3FnZ2j2Hn6/lxT9Cd/yeHDrzcjndxaS1k5GSrVzTfcC7cR9iJLOnlqX7LezKru9HXpUvVajdAtgYCdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/npbGDYZkXY8ckWhU/zNR46UFIKIwvWaaJCShg5tuk/JOUNfpa
	rp7PJRezlpazJLncUpAdvWZKxOJKGOmQA3DnGUFjYOr31/33S0T5asOxN+nsRODRbatnLQ6lghX
	qr1gC22pxV50LKJQPtn7pP30SBcRiMnTs3ndZ6LYT6OvQEa5yDk+lU/sB8JPyj5prDws=
X-Gm-Gg: AZFdTZfuM7WPnLIVztfRsOVEx5hNPAvmbElQBwPcIkDhpR/kK3leMKQOairWzm/ZECB
	R1aNzs1FuwTDJTTFYnqrW43WL5WDPMYDL8uNngWJ1YzOKoPR356FLcy91MfaT5Da+PYOMBJLJQJ
	IcDFUR6hUybn+a7fgU8gsp5980q5+GKAiOx8yf1AGvLwI9mO1a1zzQ8uyAviKtL1K5intLuL51q
	qFiCq8f27qvG7vOqvFMcJX3uxetUJRRYvcu/FXDPFp2NoGZjV548Z6+2fDw0Kkqtdrd/gx8tju6
	WMvvlm0N9o8DAPCi8VZilTvj23L5KAGnGA+mA9pTcYpEY5c8iiG6IU9rR8LlNQLmk8NHvbJKXqN
	sHjqs/aRFNayYnIJ2IXyeN1tgyBqYh/fZ+l6F3r6q/oWNM6ggSkYnPSzIRCjkfj47Q1ZdWnNbHG
	sUvq8LNSejgBDGSg==
X-Received: by 2002:a05:620a:4046:b0:949:6476:91df with SMTP id af79cd13be357-949ba9b395bmr3433141485a.27.1795609765516;
        Wed, 25 Nov 2026 04:29:25 -0800 (PST)
X-Received: by 2002:a05:620a:4046:b0:949:6476:91df with SMTP id af79cd13be357-949ba9b395bmr3433137785a.27.1795609765059;
        Wed, 25 Nov 2026 04:29:25 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm31886868f8f.34.2026.11.25.04.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:29:24 -0800 (PST)
Message-ID: <3dd61a59-2376-414d-a136-287e2c26a3d6@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:29:22 +0200
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06d4a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H5SKo5UfUjvo3ROSXWYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QfqQMR7SpU_-AafyioiHzVv9dESd0ma3
X-Proofpoint-ORIG-GUID: QfqQMR7SpU_-AafyioiHzVv9dESd0ma3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfXy57d261vdW6F
 X2wZRPCHIr2ZHpdVb11IJaogw6WgSnAuQXwJwB0h2wLCDU5yDoSxplTyaeyj1wBXQHnrRL6Dm9M
 Am1tv64UzgVFCPmV5a7G6EAY3gvWDII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfXzBCMMGwbE1fG
 YMaoLX4muaBdXX0ocr0JHZEe8niRbJj9pbeYcAn47JUnOYJSDeoZCl6q0sqVd3g+AnzimDBBhTj
 84k/2k9J3zNH5BVkWsbmEppeiqfa3ScyW+Ie2vEUpzz4nAHTsr5pd3W3KEURt9QfPd2EBnRnfmr
 4L3C47oSKMdmTKiLBDtASrOVrH9OS1t4uRJB29jXzzZcmA+vS5QL0F7pv6WyUdGdJljt96nAht3
 sPnhFIzKnIkiQ/Muc83RMzXcwB4N2VKChAdnuRHNs6eVhyu0tuLl/QW/MJydQjbvQcK/pHe6dRg
 6PqReI+atgN0lcaA42uvZoGILVa8lf4h0+LWaGlxVYH/oTSEJjiz3p+Ny9kpp8T3u19HSGRfAbq
 TK2YGIfFIPlrYYoIwnvO6XpqHLtAxN3W2Q4X0IihvO2GTHQjGu+snioHCHCH3CAUXcKGzv6OS2b
 T/uS1IybWdSC9FnPk6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250049

Hello,

On 11/25/2026 12:19 PM, Loic Poulain wrote:
> The timestamp reported to userspace for a V4L2 event is taken when the
> event is queued, which for an event signalling a hardware occurrence is
> only as good as the latency between the two. A CSI decoder able to latch
> the start-of-frame against the system counter knows that time to within a
> few microseconds, whereas the interrupt handler that gets to queue the
> event can be hundreds of microseconds late and is not consistent about
> it.
> 
> Take the timestamp from the event when the driver filled it in, falling
> back to the current time when the field is cleared. Drivers have had no
> reason to set it so far, and every in-tree caller either uses a
> designated initialiser or memsets the event, so the field reads as zero
> everywhere today.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>  include/media/v4l2-event.h           |  9 ++++++++-
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
> --- a/drivers/media/v4l2-core/v4l2-event.c
> +++ b/drivers/media/v4l2-core/v4l2-event.c
> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  	wake_up_all(&fh->wait);
>  }
>  
> +/*
> + * Hardware able to timestamp the event itself reports that time in the event,
> + * which is more accurate than the moment the driver gets to queue it. Fall
> + * back to the current time for the drivers that leave the field cleared.
> + */
> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> +{
> +	struct timespec64 ts = {
> +		.tv_sec = ev->timestamp.tv_sec,
> +		.tv_nsec = ev->timestamp.tv_nsec,
> +	};
> +	u64 ns = timespec64_to_ns(&ts);
> +
> +	return ns ? ns : ktime_get_ns();
> +}

I think it makes sense to add an additional field for hardware-based timestamps.
Converting the timestamp to the monotonic time domain introduces precision loss,
so it's better to expose both to userspace and let userspace decide what to do with
them.

~Gjorgji

> +
>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>  {
>  	struct v4l2_fh *fh;
> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>  	if (vdev == NULL)
>  		return;
>  
> -	ts = ktime_get_ns();
> +	ts = v4l2_event_ts(ev);
>  
>  	spin_lock_irqsave(&vdev->fh_lock, flags);
>  
> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
>  {
>  	unsigned long flags;
> -	u64 ts = ktime_get_ns();
> +	u64 ts = v4l2_event_ts(ev);
>  
>  	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
>  	__v4l2_event_queue_fh(fh, ev, ts);
> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
> --- a/include/media/v4l2-event.h
> +++ b/include/media/v4l2-event.h
> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
>   * .. note::
>   *    The driver's only responsibility is to fill in the type and the data
>   *    fields. The other fields will be filled in by V4L2.
> + *
> + *    Drivers whose hardware timestamps the event more accurately than the
> + *    moment the driver gets to handle it may also fill in the timestamp
> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
> + *    drivers must zero-initialize the whole &struct v4l2_event.
>   */
>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>  
> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>   *
>   * .. note::
>   *    The driver's only responsibility is to fill in the type and the data
> - *    fields. The other fields will be filled in by V4L2.
> + *    fields. The other fields will be filled in by V4L2. As for
> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> + *    CLOCK_MONOTONIC time of the event.
>   */
>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
>  
> 

