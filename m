Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710680;
	b=v0LZNzG3D6KIhK1kZzUzjZyTRfHXL/fzNo0u78v3wNXpqwgAh1miFcTMRHVqqW2LVub5
	 kGE0j2F7209bSQeFItcXH6+QDWFxbUu76Nx8mTa+AQMBpI3MBZPLyDpJgroFCxKbc98pu
	 zwmxDfS1kaQ1aEiCEZVvKGBlYNUfpCXgPsC31PJJaldwITVoU3FAFkAdGO9CKPhMuFNgP
	 2ntJxG7HmdlTSIfFtwSkSphbM6CvfOjt//anBbGhH6t12nxTL9Adf/3a+Z4e9CI495Qc1
	 y/t5ZEPWQe+pJfToVQKh/SjW63AJtZIS/ZvQfcAMD7Em7U3TcTV43aFj/F9LhD8+nYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pmn0FtXxLKA2R9aU92JYzz/Y8uvInEGF5Y8VG+PgdjI=;
	b=qVMGRB32YWNEsAc6GCxYxjIDSdDfeKEjI2Vkjk3jnO+m+B5XGk5dhpXaepXPumT9tEQj
	 q8cVdZ6veYztz4vPSVCLfSnfL9EU9IuzC6SAyExuCTWE2jveTabyFFhd6U0MINHmiq+zR
	 jE/14+/he0nTAidZP9/fJIX+74fwWx3Nac6ciKPXRFq64SE8RcLpLf0mLGRPak2i78xiL
	 G6CSbHPYYJ7ZRqln2fWOOFxB0huG52X0PT6CpTgXvrlFAEs0OBK/vwHuOCoYULB3SQjMi
	 yi3JAIRVcV9kMusVfElLZX+wsVAAzc9jNIIKszZGgsUUe/Sz1sL33uISs7zHBwiasMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WrIRQ8hL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuV7dgKp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF351606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF351606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WrIRQ8hL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuV7dgKp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7aK3850526
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pmn0FtXxLKA2R9aU92JYzz/Y8uvInEGF5Y8VG+PgdjI=; b=WrIRQ8hLwmS0resS
	ZYtDjIHPzb49P3KaZI9vVriH1FsCrR1nrfxdxDE5r7RM5gAveMkLoNsLyYPwlBTJ
	VaP9iYcw9YxkAl4EIbwvJyRkZ7na8pDLbLYJ9FHy0uGW+zda7zKX8HrGpPWh0yR2
	7Any2OJyaEse+cgAGPnwYxwP80q8z7jrsj2gjz34U3dyKLz9Kuly4iCf4j35COuY
	RuNZ901un8/HbtlI7aOEAE748xo1XN4MmfK5wdJjAEIaNlAIfabFDcaC8esiMT1n
	PkZNTV9VWv5VCla5x14iqMBCvWkt3yJ1vLhz06IdcewWAwgh9EoTzVgl361/z9xv
	5gBvkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9pwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:31:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f053f95aadso60869405ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795710677; cv=none;
        d=google.com; s=arc-20260327;
        b=VFlsL6n44IHvUIFIau7Tc0ki7EJc8bGWvaNiax8fgMpRseKJZB40YeuadVRwghdxuw
         Lg93MS8BfcXGvVuVC4N3gYokyB/e/LDyhEU2lkF6SIOhv85X+jFsxThkLG+fTE68cxvv
         D2K4ZQ6uAmdorKuquLP4c4tNIUYZg2AJzsS4AmMhlippEvPddwIERTHitpKYLVN18n++
         6EKBBXxOww3HigUNcwsdPeK6+lM3AZUwNsNeX8JYRw/s3QXzlJNmA8+FZuFFO+kFO4vT
         yCjH8c/UwXJC/XqaHfJGm/50A9w0BnfL4LxF0AbJ8u8jFFAzWww1H3/mBxrkRIla8+jC
         bvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmn0FtXxLKA2R9aU92JYzz/Y8uvInEGF5Y8VG+PgdjI=;
        fh=ktfQRAG9VBgvinM7Nm/YMFGCnR2i5q0MhztUdZ0/wd4=;
        b=Yhj9cGQOp8W3jmR4UwNDCLa3+tyY8fkMuNQ7+RkR331G2C/08RtH1J7uj0v1GZQwQ8
         uHph3GMpwKEIIWjQ7k2o0kR3iLxdXF2yF4Jou0VUWz1ksFmnpr4zN7TDKs2WvhTX/yw/
         oSsWuKpV0zP2TGoZh52VUNtqN5LDsSfEGivWdMHZrwVGOGneIQMmbl6iesktczsOzKka
         22WQqif3QNRbaH4go9FugiJNkDOyu8+BjroDioJMpkYhRUmp7qwVT6ndnZ9bsiQYRauQ
         1a6rb4C8yWIctAGKg+iMbWgYqvgfSZXpSoSMnwxOsVfdk894/EmS2V0luuO+ZpBcNzMS
         bsPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795710677; x=1796315477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmn0FtXxLKA2R9aU92JYzz/Y8uvInEGF5Y8VG+PgdjI=;
        b=iuV7dgKpYtr+jL2i0K7pFn+VUeI44GwSaK705v68JyfFrWlLU8qVdxnBUlLPESY7CK
         sV7vjP5TKSEjEvQ7yfCUVzAk7cj9TNi7ijuuKYO1Lu+i7wc4kaUB4OcUyE0q2pzS6o95
         evev13l4Kv/F/j1v34nnMQCDjuulB9e7VPUiPjn6t4fpUZMMIW30Jiay3UnTwYp3vjBG
         mzfevAx45BWnCLhu5KApfKWx+5hmL4Ta6NkgjVP8FdyHco+pZQK+UqBJ7YU35+HJjIP5
         7oBju4SBcD5cJGpJdRrZ4LN5dib6qsI34PatCfR/rW1347/ITU+FkBdRirv26HMPizYC
         NoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710677; x=1796315477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmn0FtXxLKA2R9aU92JYzz/Y8uvInEGF5Y8VG+PgdjI=;
        b=0hZTvsmEQAbRadtEErdOfTPFQalYmMGN40WELhWXTAUrMWqSfhd21d5DOPN4JBpM2y
         k6pl6ZjRlLv9seAFF+wS76rMCQOtg8ioggRNA5BzXVaoIv5a1jfJRlA83OvKfyVaf5pH
         mUA0xhG1uelNcBLr5UHLs5sn3+SVsLgdacGY+fhuGMDHDP4uALl0o0uskwwpU4zsrz1W
         ISTKFRO48zwdp/KcDQpik3merChV/Q4HhlpFfeez4Y73+u46IzpYN8Mss7cDf6dWScfz
         s9up5Vn5lAtqKVknB1sbOomQd1B9orL8ly6t2mwSLCQQm0WE2gjdpvhVKDl7taTzbCf8
         OLvA==
X-Forwarded-Encrypted: i=1; AL+hErFRR0juQK7mjxF55sJ5VjMA3wi68n4j0PVVbffBz8t4jfrknxGy7uHDacCEhbCP9HNntEq4dIM9cSSwyxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z94IFMvwLCOSLBvF0j1L/PD+/aUxDjgxfk4h0bTsiT10vPFtS4y
	qveKc7GNxoN3REWiKBwyaZk3jrUu36UrZpHwvsba6meUleTGOaA9x+t9WPfnXj0WV9+hBmtfDg6
	xDbdL4JNwhADF7DD/t2AnHxTE6yXDFDSwnzquztFAqe5sCRixvVW5wj+NlC2EkIH3ucNW76Dsv2
	LMWIPgH52iL3r+bze87DDfxQJwjqbdYS5j0N/LnrHwnw==
X-Gm-Gg: AZFdTZdnEbHMS0DP0jkmZ0MIZQPSM6x5t6ogrz55xfvfdZd3lQqQJFprSUE/ZnzKEGN
	fQI8vLPptsge8IjcNBF3VKio12RksIPS16rBV+Cq00drqc/3aAnVLCE+JHmoGjEv3tOSrQ7K1zX
	A+qe1wqpjCBPvvuaLSvtWHRmc8bGC7XCcN7TEWfrn5JeO5N2lpIWuKhXYb9A==
X-Received: by 2002:a17:902:c443:b0:2e7:ff72:203f with SMTP id d9443c01a7336-2f03f1a52b5mr138232245ad.61.1795710677291;
        Thu, 26 Nov 2026 08:31:17 -0800 (PST)
X-Received: by 2002:a17:902:c443:b0:2e7:ff72:203f with SMTP id
 d9443c01a7336-2f03f1a52b5mr138231995ad.61.1795710676661; Thu, 26 Nov 2026
 08:31:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103185344752TLpWp9rb9fhJW6zaJT5TX@zte.com.cn>
In-Reply-To: <20261103185344752TLpWp9rb9fhJW6zaJT5TX@zte.com.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:31:04 +0100
X-Gm-Features: Aa3M54oMAs16SdpNYGtEr9578Sq-hyWptfNulukrcUuGONM4R1Hmxei-ZXSrmF4
Message-ID: <CAPx+jO8n=0mY7ASqA1Be-sVgsCw8ZaTf2F-Jne9hMHwmJCrvsA@mail.gmail.com>
Subject: Re: [PATCH] mmc: block: check mmc_blk_get() in the sysfs callbacks
To: shao.mingyin@zte.com.cn
Cc: ulfh@kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: IKvcGYAWcn_EikX8RvE0Syc74Q7WxfIZ
X-Proofpoint-GUID: IKvcGYAWcn_EikX8RvE0Syc74Q7WxfIZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NCBTYWx0ZWRfX9X6H4AyQySNd
 1G7Bf9XsFhKw72P9dBwiiIGI7asfrc+7Y/s9M47E/DROzzAjSSMcW5aX78mONt8roNf2pRSKPsb
 /AHW56AAp4+3tOApw/0A24h5iahJbICsGIU7MFDupKMZ86i8KhU6MYUga6dNjXyDBVORbgK18+e
 hZHRPzLGvhdh7v30l4uXhE7GB3CjQrEGqvoNLe4Fa3NsRBqkkYptKUU33ntILZK3RaftS+FdSuP
 b8MSYI+wsqcN+elv1EjJO+rgXXM4IiPLp7lHCj3GvavFOluJEzA6c185yUmwaEdLUoGoHdBw52r
 ALdNl/y5/WGbjT3+qdgyeRmL4zsv05HVYMF1olMWVaWSDkmYA0IxOI1RM/8Ml+PQTlXxYIyLqWK
 lkXmQoDp6PAfvv2tL1HNL92Kwyo3btAip8NPQE07mGrwGQiLjleGW8DQKNQlrAbE/vg2ts6YlRQ
 ukSsqIjGz0L89ObiWRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NCBTYWx0ZWRfXxiqt3M4xfY0D
 a56GmqVuoNXNGN05T/Hg9wf42A/HJ64ALjdc9Vm/htdEjBumBQGz5Hw8gf4W8GViNE7mxJLAIzJ
 dg55T912QWfEWpTJ2b6WrWeI8y5jdrE=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b085ed6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=1RTuLK3dAAAA:8 a=yHZN7Se_Px891H_nw7kA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260064

On Tue, Nov 3, 2026 at 11:54=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> power_ro_lock_show(), power_ro_lock_store(), force_ro_show() and
> force_ro_store() dereference the result of mmc_blk_get() without checking
> it.  mmc_blk_get() uses kref_get_unless_zero() and returns NULL once
> mmc_blk_kref_release() has run; an already open sysfs attribute can still
> invoke these callbacks after del_gendisk(), for example.
>
> Other entry points in this file (mmc_blk_ioctl(),
> mmc_blk_alternative_gpt_sector()) already handle a NULL return.  Do the
> same here.

How did you reproduce this? Did you verify this on HW?

>
> Fixes: add710eaa886 ("mmc: boot partition ro lock support")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Kind regards
Uffe

> ---
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index a02bb2fee874..a1e942435575 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -235,9 +235,14 @@ static ssize_t power_ro_lock_show(struct device *dev=
,
>  {
>         int ret;
>         struct mmc_blk_data *md =3D mmc_blk_get(dev_to_disk(dev));
> -       struct mmc_card *card =3D md->queue.card;
> +       struct mmc_card *card;
>         int locked =3D 0;
>
> +       if (!md)
> +               return -EINVAL;
> +
> +       card =3D md->queue.card;
> +
>         if (card->ext_csd.boot_ro_lock & EXT_CSD_BOOT_WP_B_PERM_WP_EN)
>                 locked =3D 2;
>         else if (card->ext_csd.boot_ro_lock & EXT_CSD_BOOT_WP_B_PWR_WP_EN=
)
> @@ -266,6 +271,9 @@ static ssize_t power_ro_lock_store(struct device *dev=
,
>                 return count;
>
>         md =3D mmc_blk_get(dev_to_disk(dev));
> +       if (!md)
> +               return -EINVAL;
> +
>         mq =3D &md->queue;
>
>         /* Dispatch locking to the block layer */
> @@ -305,6 +313,9 @@ static ssize_t force_ro_show(struct device *dev, stru=
ct device_attribute *attr,
>         int ret;
>         struct mmc_blk_data *md =3D mmc_blk_get(dev_to_disk(dev));
>
> +       if (!md)
> +               return -EINVAL;
> +
>         ret =3D sysfs_emit(buf, "%d\n",
>                          get_disk_ro(dev_to_disk(dev)) ^
>                          md->read_only);
> @@ -319,6 +330,9 @@ static ssize_t force_ro_store(struct device *dev, str=
uct device_attribute *attr,
>         struct mmc_blk_data *md =3D mmc_blk_get(dev_to_disk(dev));
>         unsigned long set;
>
> +       if (!md)
> +               return -EINVAL;
> +
>         if (kstrtoul(buf, 0, &set)) {
>                 ret =3D -EINVAL;
>                 goto out;
