Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198317;
	b=gWa5vsrmnVd6FJcwzZugd9MwuSfU+DRasbq9s9FY3M3BsMO/d9HQyN4v9yldGWj7D3NX
	 x8YuRVAgUee03mvwTOTNzdGoesEkvdDTLK28dQVRHNc0ZSzUuZV9xixWBP61774GWs4hQ
	 7VK/zMUYJDA4ebXMX5wK1AeE3zBIaZasU3mk7bUdhkHvgIZClw/gQMNzEDcEwaFdni/Ln
	 YVAyW1ERaPpH6U9QgMJTMEfyxB3i7ixXQXWIJNWHIY0asjFE0BtDpbf1GHEuJzSBVvzRP
	 9jltIBbaMoh/iEDuejywIC7ZYtVekTEZfe/vDnOEbgfgHKEBSLbSkrvyJIkKB9S8YTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/HbvaKlMReeywZEgtd1iTQw4wI48noFpiEdqJYMVx94=;
	b=JcSrJRWhMSjgXIl0tVipIeU3Dk9+pFtynAyp5xnP/3Qd4e13N5zgCgYQDLoR4vGlhCz+
	 yuq1maIVw73TV9RKEPzMfDWhRgHqZ/5bSyWYEPuruJaqBAExdlU8AHaAVF7FNKUpOFW30
	 eNYSzDHDJQwC/9FzuSJsN/9KhzEUwXf8beyQ0MYnTmD7jW5GrxndmrlhvdBrx5E/41ZD+
	 PV4CT4h3ewbp0lJgQE6Z4DZxUt4QONoyWDuS8eR+Wsk1xMxB13iYIZRgzXlaZ59v2sOO2
	 nI92QTamaAGwVGRridG7nBy9ZJgdJIXEXm4a8K8n0mait0eDQHN8SuhDugOge3ofmYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=httni+mV;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=W3MOBKUz;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8CA60A3829
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8CA60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=httni+mV;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=W3MOBKUz
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHYMqH3764093
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=/Hbv
	aKlMReeywZEgtd1iTQw4wI48noFpiEdqJYMVx94=; b=httni+mVCXuCtLzKiwFw
	I3LKN37khKahrulF+Ibb9JlB9x+CeuPaqTemH2H+yRJGkB2SAsbW1B2qk3ZA7D6x
	p70p8zJlJ7iIJlDsU/spIc1f9ui+lydhJ1+qHK5pUvNQFGK4K+EPI6C7lHMBHbiy
	5jpKDxcoRKi9NeSavNQ/KtE/G5NBwrVTxA5eOz5gDrViGOAkyU5NlmKBmZ355TUN
	0Fbm988HbSsp2nfPCjrF3Xhf92k0cvvBXS+jIHjKNqBImnFbIy5vhVyoiquv0fPB
	mePQI8p8T5do6aKol4VvgyXawfe9tsV+M/gelCTgzSUqcFDaIdfZW/BevwYkem+A
	wg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j2myq3fmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:11:50 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5363763b556so24057851cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795198310; x=1795803110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HbvaKlMReeywZEgtd1iTQw4wI48noFpiEdqJYMVx94=;
        b=W3MOBKUzmoHPyGWbmT0Odi01CgCfQ387exjbfWaUwpqpitbME5S3zytn5Rqf0A98HW
         NXGo5vfgL1EVQnSLnITQWjGxud7bEOcgzvTaNsvhQS5WxzrU4HFUNfuz6NN74534XZvJ
         rT+YSPTve8kpew7VGeeLuhLQrxJUYd2OVHWwoVM82/XbUZvrvfRC6BScLUyqYVxJdjTh
         3gvN51AELY+qfB6NvV+EBXxbPPS3N5XyKYMuobnbw2vZr3grf76ZCGdHGVcLr4i+kWFb
         mIKoerdOR6mpefbkVTmOhDUWWnWVWbbWM8U1H7W1S0MeYngmsbbrtDerxefxyb0q2jeL
         /0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198310; x=1795803110;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HbvaKlMReeywZEgtd1iTQw4wI48noFpiEdqJYMVx94=;
        b=SC84kyfHcf18VEKzsRwyySFOUjh1NzrveqJX03S9EvQhJajg98qC+UpTVz6OeEN4Cb
         byGQIw5tSC97gtdLy0vc1SJshQmS+myQKUYz0+mMUDitWKmO+FixSQCpMR3LPzm+zDz4
         ddKzuy85584K5oA5TF6tA95+TPuaxyqmjrGRLD4stXDxDX7ve+4g7N9uTyHp7m9IX2Lg
         RhftMFhbkPBwEpNb1QuXKIVrELBgi74EdgFRNKaPYKWu8ZMGkdMBs2YhFGQZnqST8F2J
         XwFjBm0SC0vSjtR690/R0lBtrG/lTRma72veSc5gP/FkMFqGVjzMUsyU/GvPCfw+xdwT
         ucKw==
X-Forwarded-Encrypted: i=1; AL+hErFCvZyGmV3H/zN7Gwxb3EW+E5Soiguf4I2oJqRjqK+oh3Yg0s7zalylCnhzVarqvbnhJu6AXDfHoyD61RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K7Z0jwF7EGg1suuUn1SrVtd+KcVGtDyDAG8eo0M0l6qqUQqIV
	45JRC/lkx2qgYV2AHIWwR6bvGhQz0LNShpqOzdOj+oaFLLAqfYlGnJEwLlAiiuCWU3Bt7T4WdRE
	AdWq0I9WYBcAzvMaQYa6u/Y0O4t9Q+pO2p2juYi/K4AOUqcfaf5rqMAVF9hkDtw==
X-Gm-Gg: AZFdTZf8PAbDsHBctZgj3Jl64I8KVmucY4OEJxx900ReFgRENtiR27XWyklpwZJnrCa
	2WTBf9TI/x8/PCfw5+sW6+a81XtfJK7r/3YTYeFPVMy8fPa015WTn34JBga8sK0m7tgRqR1tmVZ
	6YcNVRikzQp0PDweFOQtbDivuQURzWtROUDYzJ/aXxBqj6tVzpVrY+Sfvdu4eLV5Pszv5nWe7wF
	X0XjVCKtqgdZJtKNCj2Q6XWd5/0tl2rSEOU2kYWOy0+2c0LMBodOXOCKoxOFeCDuKZ8zV/L8KZA
	8SfsB5tRzWDcO1zWdaIMJE4I6UXn7sBMHcIdQlQRnRLETTsf/o3LYjx20m7uN8ENLDs/xh14SLQ
	fOMtJNOw8BOWlu4PFtmJYZyePgAO880n1e134jjmVMRbJhq/EXSUYU3vleqQ37QwiPgHLO8nlRq
	bNpRoj943ha5ZOj0JPbqVQdoZU
X-Received: by 2002:a05:622a:53c4:b0:55c:840:1303 with SMTP id d75a77b69052e-55d76a26216mr72225281cf.14.1795198309680;
        Fri, 20 Nov 2026 10:11:49 -0800 (PST)
X-Received: by 2002:a05:622a:53c4:b0:55c:840:1303 with SMTP id d75a77b69052e-55d76a26216mr72224831cf.14.1795198309259;
        Fri, 20 Nov 2026 10:11:49 -0800 (PST)
Received: from [10.207.2.125] (nat-128-59-178-217.net.columbia.edu. [128.59.178.217])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788074desm28984051cf.7.2026.11.20.10.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 10:11:48 -0800 (PST)
Message-ID: <061b0cd2-8bd6-42fa-b716-b23cb3b0db33@columbia.edu>
Date: Fri, 20 Nov 2026 13:11:48 -0500
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
Subject: Re: [PATCH 0/3] gfs2: stop using struct page in the log code
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
 <CAHc6FU43KTAm-VvYXrR19BE1Q--2aHL6UALG9cj1pgdeqB_tBw@mail.gmail.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <CAHc6FU43KTAm-VvYXrR19BE1Q--2aHL6UALG9cj1pgdeqB_tBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3MiBTYWx0ZWRfX7VzKHsV7K3bV
 y7pJfuy+vlAQ+W4oEHP6FsuJSfpXAqWpOKpRlkqRoKQR9w1F6NOHr4UF1XWefOacqwgEXqNeUPN
 S5T38owMkNIc8CeK0AqBQ+vPsIc+GYnb/hmaOTCjtflzgbw3PnJ6
X-Authority-Analysis: v=2.4 cv=StYFe/O0 c=1 sm=1 tr=0 ts=6b008d66 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=lnglQuR7XRqnmjDHco/WZg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=K6asUsQ3W9vegPjSo-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Q-Ad7IspkfXYPBr49JNV1EHEw4U-c8KZ
X-Proofpoint-GUID: Q-Ad7IspkfXYPBr49JNV1EHEw4U-c8KZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3MiBTYWx0ZWRfX/VRvhNovksUP
 TA97Ze/ed1rCdigNOehkJVpT2r3+Tna7z1SDzpAO4LdXKusK0eDBP4BowHwYP1H9oBNn55R06qF
 e3X+nMzQtl1BKLXSiRG4FfA6KZMh5hMdfsYZ1lJ7bXelufWPAXIergLAszbgRx4d2O6rdV7vyaX
 KxPT6yxyt6+/HlC0j47bZzIAIr8BVVcXOGWp7+yAXDvGs55OGS1OQ3mY9QcXa3FwFLAZEfWLf6+
 1+Eg5xw7xzyfyYyNlHiJw1q9iEMW84lLBAFm3ry99vypohAW1RJ054m2YwgAqp0sCzfe8sbv7d9
 hI67Z2xi8pwGG9d302Gr60Qps0gSO2192yWz7cjWoZ5J0RvzMdY9xUzLftwDUFkB3YRwVC4vWXI
 hbiMCy+F32hfOx+ColV66fsn2N6TKUU6vrk+emGYXH4sELmMY/pTE/xNuniDXwbYl3J7+Ng/N3w
 qtsRGT4uGDJ/C+YOKng==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11972
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=10 priorityscore=1501 spamscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200072

On 11/19/26 6:47 PM, Andreas Gruenbacher wrote:
> Tal,
> 
> On Tue, Nov 17, 2026 at 8:46 AM Tal Zussman <tz2294@columbia.edu> wrote:
>> This series gets rid of the remaining struct page usage in the gfs2 log
>> code.
>>
>> The log headers, descriptors, revoke blocks, and escaped block copies
>> are allocated as pages from a mempool, and they end up in the same bios
>> as the page cache buffers being journaled. The completion handler then
>> calls page_folio() on every segment to figure out which kind it is
>> looking at. That won't work once memdescs land and those pool pages are
>> no longer folios.
>>
>> Patch 1 moves these blocks over to a kmalloc mempool, with their own
>> bios and completion handler. As a result each descriptor block is now
>> submitted as its own bio, so patch 2 adds a plug around the log flush to
>> let the block layer merge them back together. Patch 3 cleans up the
>> leftover page references in the log code.
>>
>> Tested with fio 4K write+fsync on gfs2 over virtio-blk and null_blk.
>> Without an I/O scheduler, patch 1 adds one write request per log flush
>> (196.7k to 229.5k for 32k fsyncs) and ~10 us to the p99.9 fsync latency
>> on null_blk (41 us to 51 us); the plug in patch 2 merges them and
>> restores both performance numbers to the baseline. With mq-deadline
>> nothing changes.
> 
> thank you for these patches. Could you please rerun that test with a
> block size smaller than the page size?
> 
> Thanks,
> Andreas
> 

I ran it with a 1k block size on 4k pages, and the result is the same:

job (fsyncs)      sched        base      p1        p2
----------------  -----------  --------  --------  --------
fsync4k (32768)   none         199519    232296    199514
fsync64k (2048)   none          15445     17503     15441
create (2000)     none          12228     14234     12226
fsync4k (32768)   mq-deadline  199509    200016    199505

p99.9 latency results are also the same.

Thanks,
Tal

