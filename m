Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787930;
	b=puumsux5zO8MfCsIiQuV8hlD1Bn/QPtl+qP6Gn0eemL0ahyL8NXgI2kosUJzHWDaYYbg
	 Qq63tDyGT4unT908yTtYuck1UTVeD5VJKMYET3Of/LJwCy1wvyKpj8eWCxiZfJ+sI38og
	 N3hUzI2vH5zbhjsaO6eiA8jApwxhhHiUx1g3brmTXYTkx19oFQcKCfKlzLycxPXe2odn6
	 hT9jsk1jtpz7t8LjlgYhVP8FP64iJ1qSWcj5xZfB0IY9CuBNMHdEwC7IvL45lI9EEHmuG
	 bZltFkZi3BqZM1j07YaskNz8mIwl1fM0T1DsSBxz5swPfZmqs8AZ2aOgjV3058qsVfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
	b=2QTN9bXpudhX6gMi/XKDdktYw0H89Y2DgXtGKA+2w9rkVeGlc2xl0aCJcxswHN1bXqPU
	 iPO3+p1YANfTuNYjgT3a+2uSSdd1GZrKV50M6FlMetiOHl9SGmtGlO4dUDDDaHWVkJVyX
	 Vv7UltdsWjPVK10DRM1E0VL1heUY9lb/0H+acqTSZiZ5qTDXEW+eUJq8XMB2ciQMvhaGe
	 X4A5CsCHCiJHAwfyXd7DT6N7wRS2k7xqsAVCh7eAU4nafb4NlnhvOS2ynzyfKXTe+Ppey
	 Y6kkTc/mLALIYF2/Br9yi/93BI4nHjFgy8PSJKowdOcVfoQyBn01yx4syeuTw9akKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n8ppqP6k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLqO8wee;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD028606A691
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD028606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n8ppqP6k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PLqO8wee
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDu2432086381
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=; b=n8ppqP6kYFQ9GmjE
	EbsyxBbCL21dST0etq4DY4NcfHA4a8YCKJJwFEkaYOUHeb/lJEcoeaa0Ezq7K+Gv
	KPaSWVPrkNYsFJX626QQA2idA1UzBdFOI7UFW2YsxMSZZe9ZrYbUnl/RoUHvWFhe
	Wz/hbpbtji/F6oTLrcbYl2sza3wJhBpmeZaWpvE1sbblbO2VEh0MwAcBcJ1+C46y
	rpGRTDGQ2YJc6o0qlNfK8IjD4Eip72RK8HwrANfUryJQ6+7m5l2DDLcKwX98O5hZ
	oR38nCe3ed1UJu7HcOWSQe5u6N3zo7oudvF8ypehOqGj6xPmZdEEzoz1HVNMfWCQ
	LInydQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9hr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so11705506eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787928; x=1796392728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
        b=PLqO8weefJMSkYog+9sAX0nsymR1CSemcJNUvDeaF6C8G7SPJnh9qhe8v/NQke0+Yd
         abFLpCa/59rB++o/5Fn4riZ108JPKlvXVObtJjXniYC0NH4RGc6nhuntzUDbFf8E2smx
         4vtgO/VgweE1/G6UMDBgMeQDbpd7n8+WdKKsBY24yxUhRKU2TxZmY5B/vaCx4sQQQj77
         vUpvi2X7odwY3bjLLnaXX+YxXeEPERCeh+reaR7QdC27+MD3fa6ukVfCTjTgdFHpmmUC
         b0At6I64KYMz4q6YtTJapLPROpumSN3C67paKibSWBSly0j8wu1Hd6im+rXLzKjTwxc+
         JHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787928; x=1796392728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK0hfsO6LY84HqJrabEhSmxltsurGZr9GeMKtUMsBls=;
        b=zI/PgvzctP/rS1ptnfCZ1LGgL7eNtCyccf9pwPBb1DfsC8GkasfL4eWHTgxPtd2e7J
         aeuj62pGXPTnp2f3raPXPzzRCoysturSQVRCd9v6WRak0OtClnQkO6wgKxZQ+NW22x1O
         x1WT1mWmIvhlLa094GleUqtNRzITqwx6WT66AOWQZCubyW/3cIcKrugQQKEz8QD1WIZJ
         VQGAZH7ycKi+6peoPjhtVHdSwTOgw8GDHOBWHv38XkRpax0ioDXuKbSjt6MyMnNwlWKS
         6wBwRBdfR2BB7CDncl0F1UURoqRTByDynQ9eEknewyShMlMaaQMBffTpvRWBtFzaUgjq
         gcFw==
X-Forwarded-Encrypted: i=1; AL+hErGGXq6CXPIyD9gaxkqDWu+yTdoF4tpUJzvg8L6IWURZMhmc5T+W//DUBzzDuAL5rDMBq1B3GfEkvNPRE7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z87q5UsFQpeni1ZGbM1MVD5nOU+9zWQDqu6uWYKgFp+Iz6kndtF
	PnQ0NtzwATfp9SXpSYGJtk95G3/jk6bQzfwtdbnpLDbLUoGY+0PjQ9es5gGg0jFQNbrvIXHLmWX
	Wk5WqjupvgjXb4lP1CuBamPkNCdxCi8tbUK09FClLSXRBNEaCc3cnKIjKu37f4vILK+rk9WfCFj
	Y=
X-Gm-Gg: AZFdTZcLPvXrmJooBkL/0hDZNHHURgedtUnfjYplwbKdeAoM90pJrrFQQ76RcLNeWXz
	f4KiM7FCQbvDSpq1zTG9Bv8Znuv0hbx+N1HL43wPSlHFC5W1M7/ihhyZA3ufuBLdD3KBwmUruX3
	MBJdbz5EIP/qC2K7nhrh7yHbHWdKl5cIPrS9RWpeBWr8NXmgc7I1Z8ZF7CnN1aYBGwcz6CYk1is
	mC1ojd+Pax5vkbqY7gxB3+B5DrrVSG0aKF5gY+kbLYzx4UoAKncD/zvIqCuMeielAB1jmF/HArE
	dHWYWW15v9VapgUmIDSGwFwcDE+ZYRtEOKIAd+Cw/7ykIgNpQLnTdwEaJS1cCy95fNTt9gfnY0M
	vjsoJaPR6FFQeKNuBsOzHowb1HQiV5jAJrw7fj4T8Zu9yXSi+kIQxBksjhH2Mc+UNU3Z5p+xIbX
	wVFlFHaA==
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr21793710eec.37.1795787927656;
        Fri, 27 Nov 2026 05:58:47 -0800 (PST)
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr21793695eec.37.1795787927109;
        Fri, 27 Nov 2026 05:58:47 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm69037597eec.16.2026.11.27.05.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
Message-ID: <127c1c1e-4637-4bfa-a65d-4b820a8cb7ee@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:28:39 +0530
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
Subject: Re: [PATCH v3 2/3] media: qcom: iris: Fix IRQ disable depth imbalance
 on watchdog interrupt
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-2-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX+31m6kQGGzoV
 trEWHv/RrVpzlTtaBuK/ktGXDq/Hl0EB/13tFZsxK12LNG0XtQJMXzIAeibZhT/+9VrfYQcHV2Q
 Z/HkiOhkqHF/HbM9l2fq4gedGTrruwUgbF9HvAxueGtL3WAWcrasXnwuSnUUE0ibLqDrdwJeVJa
 mOfli6KEGWSZ4+1swQaqCGoLeQ2AmAwdjq8N+DeZPegQuATX5KKVPsKLkjxEWzvpmwSOB0Yc7RM
 EOoO8u0FoJPhsKKuZ0aZ7KEhUVyCPZRHSXkLWEZduUVt1NxdFS6DRowbT5KuC8eKegYsdbYgex0
 V/VleF91M36DhKJ59mpxvSNfbV/WUeZZPgFc9sJZ4ksUf7Me5AgaPZtFwL32+pmrnwVVZMFIcHO
 fm5vk7tqCMGDD/VIr+RM80ovsu97oEK97L/i7B+DUlXzulmM1+PuPrfF5JO/KuQRaHA8cDLkLwe
 F15ETW3EZhtCSnE+2UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXwc7AUU5InfqV
 j8W7L4cvov21A/u/AOBXKjWESRHa+atK5FpjCNF40tewln687qi4nFlJ/gBfwo58RYOYMUXSSM0
 4/gPFn6ZxZJrHwWVCTVsUH6zYyse/zc=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b098c98 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sp0_ih0bWsTyJVZjBMYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: SktkTY8UUKkz3_XNKaTr1cs6lWwlbufc
X-Proofpoint-ORIG-GUID: SktkTY8UUKkz3_XNKaTr1cs6lWwlbufc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> The hard IRQ handler disables the IRQ for every interrupt, and the
> threaded handler re-enables it for non-watchdog interrupts. This
> duplicates the masking and unmasking provided by IRQF_ONESHOT.
> 
> If power-off runs after the hard handler disables the IRQ but before
> the threaded handler updates core->intr_status, and the stale status
> indicates a non-watchdog interrupt, power-off disables the IRQ again.
> The watchdog handler does not re-enable the IRQ, so the two disables
> are not balanced by the single enable in power-on.
> 
> Request the IRQ with IRQF_ONESHOT and remove the hard IRQ handler.
> Explicitly disable the IRQ in the threaded handler for watchdog
> interrupts to prevent repeated triggering. Power-off always disables
> the IRQ once, and power-on balances that disable and any additional
> watchdog disable.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 14 ++++----------
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  7 +++++--
>   5 files changed, 14 insertions(+), 15 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
