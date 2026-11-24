Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510334;
	b=KarmXjVU6Cch0X778+X/Y7bGqqo5lljF0d3tu/X+CP1xm+QERaGey9TpKgG+BHm7D0tc
	 rIkBbLbw8zZaWlD8CEVOjA4J+fcUbWb8j7kK8VLSp3N37RjCxvruL2nboeHZcy3gbzw2k
	 h8zVDO3QA5kTyKqCICBcyHJVcB0FItKUby8VBIKh9XitkLszKElY9snOrePNNAckwEGZ2
	 Fc5rkSEntmO6iZHRZf7Sp4o/ZWfdwUOGa0f44Q44COAjX83+DaZVqpTupN0wyoWxOs+tQ
	 F/mO/wiSZgSiJE8NhItDg2agO7wpD6MYKtwMtqfcoYAy7bZ68OG88fq7MSi75cWmUfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IL7ykB//MICeY8UkBsqKUeetbddAABEUJHUTtFHkJSc=;
	b=duYoa9K0akbzg7uInjwOP8Cg1zfMWUzcDgTtIK8jfBfPORZ8jTme/qdWcxskfZjO3Zb4
	 uj6bRzjWkJAWJDE7l2k4QY+BI2TF1AK7gKKyXAv5m+7yHjkjQlOwV8RqRYiLrqxtqLHEs
	 dKAqwA2AjeZcufhYrHZzM8xwXGDlU+BjgfHtbxzmCjIjtSQLr+DqsKkDQiKzWqFicQu8D
	 DPgZHOC6efz/zVci88JT7Wt6YS1RGoG2cNetzqfDdb9WzY5pVA9KOrwhs62Q4lQd7VStP
	 7AOMl+qL7ngQPG/2dSFaPcqfWguNlccMSdAvwc/mTCPsSkbZixGm6SQpNoEypjiRCZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gULAaHek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJBkI7Ky;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AD606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gULAaHek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJBkI7Ky
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8dsSt646328
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IL7ykB//MICeY8UkBsqKUeetbddAABEUJHUTtFHkJSc=; b=gULAaHekKgIQsjv9
	G4FUbn8KOs70p9fRP3Z6T3j25V1tkmBhH8gLkOgJTNlifcpeNyppzllUTUDMOb3Y
	c0hCImuX/3jtOcOHliQTtYe966wxKG2VP7QA4bLNwn+5YHeWJskWeZi5GYxCbmLt
	IO1QQX/QN0E2Kf+okUJkOMZIBcjbBYUJc8N+s3uqSILvm87w3yAh7jWzNiPCx90v
	8VODdoptdGiLMKqaNK2zpMVWCZtBD6A40L5/ki1tqXYXWDnZoucvF4ILB6VUACUY
	qh43wOs0rzVfBEli7xv4ywaeJXGhfsrPK1WfMvtATAMk1GdZNY+xHn/+rzydye0v
	j68nEg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd1re9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:52:12 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67c0efb7b97so2179117d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:52:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795510332; cv=none;
        d=google.com; s=arc-20260327;
        b=BB5gOerX/0j53OyuAxxmSX9jEEVg5S/oMKl66srtkU5vy7O01GaV62HqgkFlB5w4e7
         OiaqgdC4w6RdBB5Coq1JDi3pyDBuJxk9ih/aIi2ALWS9uY81JRLe6/1VxLdXfg750gCZ
         e2PU3ZkJYWe0aGMufqKFE5fZJs+7ThdZIU8p8gafkwZxwoJXCWFDK5Bp7zs8bxAbVH/K
         ypPCzonZgP56DY0SB9Sb56daMEfxMqRguzM1/9QNHc6udpWtLntwK6Gw6VA28sTlo6KX
         3WziLh3WQY2Frw1NE0Lrs3WwLUFOXOzhB4f7Rcu4ZszDYE+fxLE0N0nfJ5KaiNzXtiYC
         ZPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IL7ykB//MICeY8UkBsqKUeetbddAABEUJHUTtFHkJSc=;
        fh=afYWhHDGJSQBwrbjv2B15jzrIjM/nDeI9i3BxJeJd4c=;
        b=ok2XMEQB2KzW53Recou+2dSiQS6VULoKV+/krnTHXyHVocTVtNe2fBqpWDkwGSFNYT
         2IpIWm5pYfRNcf93QL2Un5WHk7t12hs0yIEu63XiJSUjwm/2pXjNtVaKcx2F40MJZ39y
         GBW0KjxbZ+RuHTbcRzcISvL+VlGTK2OoH1h1m+pJFUoQFRMGkIUSg0CoHcAyBllGvWBe
         KJ9qAVRQ8Gy+cDtCxGsnnuFZr91s0I1myPb2v8abCB2CmEn/JJKLxbUomkZ8Qywk/LFb
         DeoZIT/K09CzkYBSPfyMLWjv6HP/TQ/V/RcmCNCf5Q64sb7+J5XRACzWNFAh3tWHoDPD
         poIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510332; x=1796115132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IL7ykB//MICeY8UkBsqKUeetbddAABEUJHUTtFHkJSc=;
        b=DJBkI7KyQYqYCIhYq1QI1/aMNkekO1BIJVTkEP/7qv9/TZ8NNpZIjd9yL5LI4RxgJW
         kPe02xxK4XfzCg+8psdyRKpIZvdV9WZTbiVC6wgR9PQ0PAhevjGUli7Yo3Z1C2voAXE5
         mt/tA0Ri2DBAdOpl9uBNovHd+dcvEtDqCN4/H03ty9kDfVRknA1IK3jWS3vpF7j234E1
         mxbLSL/+tkn3XeXV6/t9nNGewf/LwSp7fcAreTVlL81kX+Z+MDpOd9sQhNgOV4mjV29i
         zIBoRWsD3n00Q/4GUNS5sbUggIm606/sosIAOKtYVkC37psFfc+9YDH3IwM8Lvzas0jY
         OKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510332; x=1796115132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL7ykB//MICeY8UkBsqKUeetbddAABEUJHUTtFHkJSc=;
        b=rSV5hqek5f7+u3Wt1UbXFThvmOAbk7T2vEToeD7b1tJ2Is0/bVcd8VkoPDzr2qPB5d
         q/xV6plaOBmukB+n53B9ZvHf+jUS1hKOC7Qj4jVtJq/+3512spwG6yQ6rcrbP7cR3xhG
         fe+0VNK295Rwndik4XA+FlTjpVbV78kycGZz2BbU3nfj8coJWrljC3WRkRPxWC1d7Jwa
         HTXeQC8HoCV9s9B9mLnx7ovWZMyeUmjg3ltCFadgXtrlTSj6O8+e7NUedKhTI5DFwICS
         lpwp6M5dM7jpXFVrT9KtTa/Ec6+iQRvObs/7DUJtl1jAyeNe4lhFax2ThSRdK/bkKLoY
         8XJQ==
X-Forwarded-Encrypted: i=1; AL+hErFzF0/VkxTHKtADEwKGGbm2i2sZIppk86I0hdzsmF3QQbKlWzAoRCcAxRAhE/UDn8b3xE2C04VFR7JGXs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YMWZjWJe1bZbCNgkYPV+gqvvdkmpALIyPYyhD7dGfOvp4Y+dd
	8kKZUgUBkXgEDQGV7h6MpHsuWOtwmHGvUJUsDjIlsFMEGjMJXK3fch631loO/8oW4MF/Aig7Zfz
	/GUzgGUyToWlfZGn5SOFjZcKdPMs3opvCxY5BHNlxUoQ6Q/uKg9JOelJXapB2vcXOAdC9pmHhuP
	eM7Y9sEhcei4LLGQlxltAGDkyOtVA69Q6haadYgRvwDw==
X-Gm-Gg: AZFdTZfQsinwE9XkG/sA0BFat05lBoRaDOarknQ47PhYkD9GccIQRF+Fbqe0bw8kN5t
	3d2h01FeHNCTC/vs9RNflGnyIFe9JuPSdScwLzBJB29ZekGsYl1GviZB8O7BdWqpz7UXGs+ECAA
	Q/EhbfOH37uXLtiZb+FiuIIe7mcWHtsOlWDcgQBUgW65MfkZChJJVgvUkyhcmBOB4KbpGyCiele
	S9SZLHGvCwlduxHOrMxkQFAcuG/OCgshJ2X7lD9
X-Received: by 2002:a05:690e:450c:10b0:67d:eb6d:7458 with SMTP id 956f58d0204a3-67df44555damr2918997d50.55.1795510331838;
        Tue, 24 Nov 2026 00:52:11 -0800 (PST)
X-Received: by 2002:a05:690e:450c:10b0:67d:eb6d:7458 with SMTP id
 956f58d0204a3-67df44555damr2918995d50.55.1795510331414; Tue, 24 Nov 2026
 00:52:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-tee-shm-dma-sync-v1-1-19d4efdfb4cd@oss.qualcomm.com>
In-Reply-To: <20261113-tee-shm-dma-sync-v1-1-19d4efdfb4cd@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 09:52:00 +0100
X-Gm-Features: Aa3M54rFHqUJNXQjemvxf-Zt82SGX1HKER8XMMPmIBzLcusnrFpbxg6otAaKEJw
Message-ID: <CAGgiveWm-xH_SjA5QrBJx6NtQhWyQWMw2FvfSd9SfG-wghpwmw@mail.gmail.com>
Subject: Re: [PATCH] tee: shm: sync DMA memory for the device before it is lent
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05503c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=6jbKIeu7AAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=EUspDBNiAAAA:8 a=i7LB113YSaF0UBaY600A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=-0VUF4iAjVmhXKmeMUOz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX3QVDJFiEXQeZ
 fJ6ghM6wjxzK/BbmghghSDusnaFZ9Hwfh4eNzMHAj6VKoqxrKNsiKDAyeMpX4b/Mdcr52P4vtz8
 TznhjHasgYxFuUXvz1WFWnJrsn6dLz0RRSq5z0sRCgvkSDgNFmsMLIZM2d6rCRTvYgGBGEO+FqB
 TRMua+ovbsgnkDTO1xwZ6U+1GZnkfaEJYAx4HvjGCmfrJTnDUfzh5Ergz2J7hSF07wT/8HNYBIB
 2tev26478MewriBVlNjZZd0YqOrgJzLOROisBuD2XpYjeOu+gpOFR/MTqcR8CEPmxIDEhhauksn
 WLBwqvuw8gKa9BsapF6DHtN6IZH9aH+eXITBoAzajA1EoVbPe03Riu5B5jDV9Y5+MSv5JeushUc
 EfZAl11EMwBSPkh2VEupZlQPeTH4gwUaHjI/S/cu/zTggjwURmrJhVW7Rc7s2zBm6zKeCrHwqrJ
 Z9/n2BOMihKSlGToPNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX8C9LNaU4lNea
 V62tt5H40g5qOPn5vi9C/SRrge8fLjDM/ZqSytQZXylb0Ui6XIQYNdqHLrJJcy2zvicjIjgiKac
 eKIndyi8IZm7fmYaeBEvhdzc1fXpzqU=
X-Proofpoint-ORIG-GUID: 0pLBO1zdFF3v9_W_gYHJrEpkCjHoTTk0
X-Proofpoint-GUID: 0pLBO1zdFF3v9_W_gYHJrEpkCjHoTTk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

Hi,

On Fri, Nov 13, 2026 at 2:22=E2=80=AFPM Tyler Baker
<tyler.baker@oss.qualcomm.com> wrote:
>
> tee_shm_alloc_dma_mem() returns dma_alloc_pages() memory without the
> dma_sync_single_for_device() that the DMA API requires before a device
> uses it. dma_alloc_pages() zeroes the pages through the cacheable
> linear map, so the zeroes can still be dirty in the cache when the
> optee protected memory pool lends the pages and a Secure Data Path TA
> writes them through its secure mapping. A later eviction of those
> lines overwrites the TA's data.
>
> On an Eliza EVK with OP-TEE as the FF-A SPMC, a TA decrypts into a
> protected buffer, a read of all RAM through /proc/kcore evicts the
> lines, and the TA's digest of the buffer no longer matches:
>
>   frame 0: 0e534d8c..., reference d98ddba1...
>
> Sync the allocation for the device before returning it.
>
> Fixes: ab09dd6d9201 ("tee: add tee_shm_alloc_dma_mem()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Vincent's direct-map series [1] cleans the range in
> dma_zap_direct_map() before the lend, which also covers this when it
> can unmap. It returns -ENODEV without any cache maintenance when there
> is no lendable pool and the direct map cannot change (arm64 with
> rodata=3Dnoalias or rodata=3Doff), and it is not a stable candidate.
>
> On a dma-coherent TEE device the sync does nothing. teedev->dev is not
> configured from firmware, so it is not coherent today.
>
> Without the fix the TA's data is lost:
>   https://lava.infra.foundries.io/scheduler/job/554467#L2262
> With it, the data is intact after the scan and 50 lend rounds:
>   https://lava.infra.foundries.io/scheduler/job/563840#L1979
>   https://lava.infra.foundries.io/scheduler/job/563840#L2008
>
> [1] https://lore.kernel.org/all/20261111110738.872947-1-vdonnefort@google=
.com/
> ---
>  drivers/tee/tee_shm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 5c47a36916c45..70a273a425f88 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -297,6 +297,9 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_cont=
ext *ctx,
>         if (!page)
>                 goto err_put_teedev;
>
> +       dma_sync_single_for_device(&teedev->dev, dma_addr,
> +                                  page_count * PAGE_SIZE, DMA_BIDIRECTIO=
NAL);
> +
>         dma_mem =3D kzalloc_obj(*dma_mem);
>         if (!dma_mem)
>                 goto err_free_pages;
>
> ---

Looks good. Sumit, do you agree?

Cheers,
Jens
