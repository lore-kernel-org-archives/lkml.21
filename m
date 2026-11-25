Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597666;
	b=Cj7kzugfGvTejl4V2ClQauIdvmU8yowQBRWruQlDDQlPOI1A/pFcMl1XUCcW9Ruxgetk
	 GbVJzp808FLKXgh768mU7RxT6Ykynj9zfAnGXu0wD/2BGaOctXQA3WkEZEV9vnVCBEbUZ
	 +JHyzj+j1grc6UKnwI6VKVeCMZni+ATn/pdRphYH2IrRxdvsiQoU/usLad/dMoqtHwmxE
	 8xtkOdZp0Q/75EK+4Pg4t2vWGc14fS4Yo12yjGjxSt/WU5cUCjwq2C1EQ1rPim8mtDdAc
	 mcnn/DfaHsI4eKIsMf96G6iKkONAZK5Bosl92z4afgfUDP5TNqAx4JlUoba5X93rNoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
	b=PzvtX1Javn1VJiFdI4tO8HDR7x/oeED7yPznO72BcqITG59QaX1/U3S1L8A06YvG/Pw/
	 AXUd9MUuLC9Bcbhs4hRgk/ra/5vAYX+eb4hldLjaKQ+WbufMiymN5G5hq+Ivsq59bldmu
	 kfdu9G0wzcb63JPOrTVUyMvxwyhY4h8UzWvXkl7dzviSaJx5GBEZmABPK76S1mNgqpfqP
	 klF6U3zzkb0a/6AzjcAP/pjs1xXQuoyuedd/KQb+lJuIxUQS1EfDae+pp/SUE7HudrDJS
	 aRXhyY6jPM8rJ6Jog2UboChvmJ9nNkcGY4iD2ToLG2Hl5VM6Z71Bwk3+AoTh8IgJj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="crtORTb/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369BB606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 369BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVD3cgM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crtORTb/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68l8t3113986
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=; b=fNVD3cgM34B4gPxT
	E1UqbEwqyXMf9dZr+DGGozrZkWlcFONDD6cGM2JkGYqO9/bN3M64ZdxQ0+BARvyj
	XoczQLcRZRSqn+nGcdiYOg/KuvnLOs/A5sYUb5EN1z7a510KT60lCbOn7GoXZcTM
	TaNhZuaFdGpMdGaAXxaCim3lSN79hRU2/5mecKERJQ6sCXxl1ROK55hVV2D+g2ca
	qIQ/nu6tJB2cDnftA/Soz6CN4mibqYo27PkPA0wjIv1AjWioQwjQrjfMzunBsTlm
	nSnrfn2azHJTxjYXLnhEbnacrUKG41A0lu9e/jLl/Lm0m/Tb9I5vEK9//y48285x
	IVAu6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsarwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:07:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4cd0f7abfso2335393a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597665; x=1796202465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=crtORTb/A8q6YB0gHeKoRwuXY6w0j2K7srhVEEF1Wd3udcMtJ8aJQVVafAjnoFk4fS
         54F1jZUfOXTypKdHyL6eaGfeJRJ/dMnJjJC7qgNcOtCeSFkTUK/CK5CW2UKTvM2IPmY0
         fMlSwNa7I+Uj5vrxxEfkX4eK7LfrC897lTUT/u6nOPkXSAFrx/UePx48IGlTFgYCpN9L
         +/GB5OcYcl34JTZfEHVdYWGmnEWYnW7dbHnFodvs3DVn6Dd+pH+SUG/EgRXbFIEfGhIH
         lcWPfDIxX8Av4OL/HkCpLWl9/1v1mjTGT7iOIJAdyPC9Bd6hz4SLWuO1ObUrm64rCcWK
         MIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597665; x=1796202465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbFjtNWWTKC1BbORibQeDjAoB7n26eQHzhKA8Pohz4w=;
        b=slBT4d/QZj8DwTHTYbKAFQdbbmR/w+ezOocSDegyxf/d9kv3OpUwxGsz9GQUQw7tW6
         DlaUlGfYviqqImSXtBLIjjHaMRDG7kAZyPo4IieMI0fD2rOavMM0SgVYVOqtidAXwS5h
         8YU6gwhneWGQ469ow7N7Bq7MF6r0Gq82uuWNFkWeJnjLlowxejf/LoWZ0Q+MiSe0FjGM
         UUl6mR5AcsG0QLyTSz4zqCvC5NoHyFxReBJKErJBOcZu4G38ZNdHF9Cth32uCOwtY7IS
         TWgiU6D0cwa8jxG7GdHfqmErYwcoOPjlG9eIDWTTnwxn8mip2Y0gaNDzeB7bIdRVtJXX
         CZEw==
X-Forwarded-Encrypted: i=1; AL+hErFFIKrUI1K/ZOGKiFSKa25NjVfpRyFREAQSyeimSinnkI1YdwH/cmEmIVlNfZOztnuddyW23kH0ChK3+zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EVqQEU7IvfYV24EikwJbvdX2zrhyiqYGQQudJVPp7XUp2vWpC
	OmFLgJSQeFnBs1XjH+ONVIk3pcvSjrP+Zshk2xusyAmYu3mgcwnMfpMfnCfdC0RxUW1PZ35U4GA
	uuAA9N05aA/YDK2lDdVtI7xPlqLqq9eeK7C8Umk1UO+SCqfWhDp4BIS4mYbDGiOy+e80=
X-Gm-Gg: AZFdTZeJQd5KtM8nzNKQoIXdiZiugDAym1zdb4MhJ49HQchKPjnNsCeMeYUkE1SKNA7
	r2bWGGapasPOXTvcybE8mvJpCs12Qt8IVBwt4YVDLC9wBug9a8Q5b7Xp868Wx7G0Md40pFsaAz5
	t9zqRMQdo9FuKTKke6/N/b/nGYjhKHiYuwabVbfm96dUGDexcKCTnIae9dP+wpV0z6HR6Rg1rdM
	8RHH++L+/14PKFfx4SNMtF0LdHHtkZGdVaA+oedeL0LSxbjocV7pfE1F4NRY5p+jt7J+Yz7I8yz
	if2+EM7LiPXENgUWLZplQHY80ABaohxmJgYXV/dBLf81p0MeewRFgWLLRQ6SdnW35CFBh7jEc4F
	zZJZRGbdK+a55uJ3CJGhGBvP7mdbBA286xRUTDyGh4rrTTSZgTvQh9I/Qx1nKHQ4KX0oSAeKwsa
	H0
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256704a91.67.1795597664779;
        Wed, 25 Nov 2026 01:07:44 -0800 (PST)
X-Received: by 2002:a17:90b:4d89:b0:3b4:3c33:3e5d with SMTP id 98e67ed59e1d1-3b43c334caemr8256260a91.67.1795597651179;
        Wed, 25 Nov 2026 01:07:31 -0800 (PST)
Received: from [192.168.1.12] ([223.230.5.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm25769550a91.7.2026.11.25.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:07:30 -0800 (PST)
Message-ID: <42920cf2-1587-47a9-a53d-d604bfb22b76@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:37:19 +0530
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
Subject: Re: [PATCH v4 23/25] accel/qda: Add DSP capability query
To: Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-23-88f2f24a5f0b@qti.qualcomm.com>
 <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r5ugvAdb_7s3vR6wKhVmwRIK1TH9MXlZ
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06a561 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=7CQlB+x2kvO/AZ184d7fkw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Uvs7DDoz1aZytBm4-AQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX2TejVf+m6R0D
 lHxCuDmw1/t2TaK+SXukocSo7/lgfsd2ma/QUvxtzlQ3Lmx0ZFnN389pi9DBKDxBDfUEYw7bE14
 gVOpCA2dzMEzC3bwL+gY/qnZCwsRYKo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX9znsaDIe8EQJ
 BG6Ldrp2s7XfB9LjUP8CTyf+XjtLLbajQvSMb+e/cObD8qmexC/mUYUqrbgGj0AOpbWZ33i5DoA
 z2V9iFuvb4jirn47p221cqIh1lEBnRn9vypxlbkBP+/E/T49n5dfpcJDsnCjyt8/MXPKFc2a/WS
 x18ruRY/FjFy10BBjhpj5Oz1P1OkfrV8YENIUhm+Es+2UtRGOlFH6c3KBiW3a9nLhMAopXF0Jdl
 4hZPXcx2TXy1ZxWq2WHg5S5IQqBoRcAR8TRyWEfGbwf7Uyfy5gGgSaU5ZdhaYI0yltcLGRUzJzX
 HrEdV4oTiZ0ixzf1HXsnIcw80WaVRz0GxEsITvathwDQN/DdYowFqlvHe6qUdyuOAQtKN7OtSxf
 rE3+f6JM05b2SoxSP9kaigW04HjdzD1hU0JKrQihNz7L7xmNBgQ1l3AyIyzIisFlt9UMbhj7R4W
 ACxvUeJvlI7+pbtoqrQ==
X-Proofpoint-ORIG-GUID: r5ugvAdb_7s3vR6wKhVmwRIK1TH9MXlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 02-11-2026 14:16, Arnd Bergmann wrote:
> On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:
> 
>>   *
>>   * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
>> - * based on @query_type.
>> + * based on @query_type. @dsp_name and @cap share storage, as only one query
>> + * is made per call.
>>   */
>>  struct drm_qda_query {
>>  	__u32 query_type;
>> -	__u8 dsp_name[16];
>> +	union {
>> +		__u8 dsp_name[16];
>> +		struct {
>> +			__u32 attribute_id;
>> +			__u32 capability;
>> +		} cap;
>> +	};
>>  };
> 
> I think it would be better to make this separate ioctl commands
> instead of a multiplexer for each thing you query. ioctl numbers
> are cheap, but complexity is not.
> 
>     Arnd
Apologies for the delay in responding.

I'd prefer to keep a single query ioctl, and likewise a single
SET_OPTION ioctl, for these reasons:

1. Precedent:
A selector-based query ioctl is the established DRM/accel pattern, e.g.
DRM_IOCTL_AMDGPU_INFO, DRM_IOCTL_AMDXDNA_GET_INFO,
DRM_IOCTL_IVPU_GET_PARAM and DRM_IOCTL_PANFROST_GET_PARAM.

2. Extensibility:
More queries and options are expected. With one ioctl, each is just a
new selector value. Separate ioctls would mean a new ioctl number, uapi
struct and shim mapping for every small addition.

3. Safe evolution:
Unknown selectors return -EINVAL, so userspace can detect an older
kernel and fall back. I'll also keep the struct size fixed (padded
union) so adding a type never changes the ABI.

To address the complexity concern, v5 will document each query type's
payload in the uapi header, and fields unused by a type must be zero.

Thanks,
Ekansh
