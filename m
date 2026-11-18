Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033375;
	b=Jrf2SGMkxOCVxAqL6CVCBsJvs5XYn38vC5Zx4nRHM0gLwTWwafpT8lr6d0sjaEVdip7a
	 JLv9mI+9wdLB5F16k5NKsZfdxqp7BooDm7Sm7wESJif1oJAGFJHfgFijkPKT+QJ1wNyfg
	 T4BIyENMy3ez70rov5AnYw19toF4BhVNRX3EJDv1C+ibPlO8QOSuEUkjCR0UkWpJjKyCI
	 cx6SdptkuLKd++zSNlh21Nu+LzmSzsbo8GFtYalPzcsmZZ4f0Dx+AfHWVeghVt0eEQ14K
	 sL4x1wRziRliuVi9ZIPg9HPzgcCfHUldRgsMpqk6PFfWC7HjOjT4j/VyKeo6togX78Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hoK2xbseLTh4OhPRbFIj6MwssrqKcQWeYmF4tQfdihw=;
	b=gFtH3ABonBxLNKqxrWxKp5rH2OUrVsUEZ1Ubfm3JwWUd3as98BdFH54BOHiBmjLkbQYf
	 MSAcG4wj+3Sj1Rwxdm2BThYfTMj4wcBnstJIO2yFxrS9anZ5LXcdtU2xqfD4sJOODn9h7
	 WxX9fW9jlvZlV7mav6Lfgrb0/t9v/QECPpZuvsLYLExEVW93ugzONESEam0tx7wduG/KN
	 cNFNwIOPbN1lDNM5Q3g8CQUQcFn7WTLP3FBNrRoCOpLIlcNvOePTO3DJ/ZGH51SHhQnl9
	 +M4BA8szCDWzaS4Uppkoh6XtWlQR8JhVF5UVM9jnRhEaK4Pw6EO7OcqWafC+9RfFPRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaPwNDLP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcxztcN4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C20606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C20606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaPwNDLP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcxztcN4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJM51l3698492
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hoK2xbseLTh4OhPRbFIj6Mws
	srqKcQWeYmF4tQfdihw=; b=kaPwNDLPYUD+g4X5/1zBy0pInHs/A4pMFq8vSiNq
	S6XhA71bUvcv+BbIwpEHARbDQiMSQIj2Z1AIc2mWFkIPNQO0mJN8HBO5ZkdPe2N/
	rKwIdLKNvAOvqoW1iUWKm4tCxLi6Wyi+i34qSmKsAMq9e35bG343wc8aICAuXn23
	EK5e/c14RCXoOW+bFF1MecPHT6etI8JBMrmZeYvmgxnOLv/J1f9pPl6FuV5MjqOw
	NPpvjYFpHv8SBxuYcHat6VNq/pf8Zavi6TxiiAkMAzHawZKUDCURXxMFxXHZd7YE
	stY9IAGTaV+9Xyj90pgbSQPYMITPdozkdFDMEYBS3h8XmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etns9dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:22:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso146431585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033373; x=1795638173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoK2xbseLTh4OhPRbFIj6MwssrqKcQWeYmF4tQfdihw=;
        b=CcxztcN4S9r5+dozqnj0fePzbS6YjZkMfH8ESzJdtEDACC7DbhzDwuILzlxEwNAgfm
         SvdtmqrJUMi7nU232C14vccBLfJaGK/h4lEVSn1Szm6xzPLHLCidp7vWVmkoykeFpY0K
         sAkG6c6nvDuTGNqtZofOVACfkQKD5LIknG09OOrgri24MmzKAXbR0jGMOK+Dfk/vK5WT
         bxTjFdFiZaVZ/QACxgwtNwaOzTTfp7Vzzx0Dq+9Jb7/HTfWSlf4DBM+kKUGBcSm4b1o6
         ut0VIoxTU4h0Sa0MNf4tZx1qP5xSEnY/0uGwaTji02ME9YlPtp9rnS3WPa6AGyBllzV4
         DKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033373; x=1795638173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoK2xbseLTh4OhPRbFIj6MwssrqKcQWeYmF4tQfdihw=;
        b=HnqQlXMMxS7mNg/yOJ94JmjWGb/LddZLzzzL8Ut3OHGZRujvZ2eNlB/72KAICuVVNB
         760iCRCR/QTMTwJ6RZKYRb3eyQYHmc5mxZbGp7YDpW9fqDpn3nUE9V45A8cHBPJivQgA
         tVfOtVgy5F4m8W04auZllEL1zUpHsVXwJTyduIe0vAzrCbn+DrbGnj6/BcvgLwgQcG/2
         U+MNuCxQbZ/mdAOp/IA5woqGdcab7RRMEyus4izKKwk0LOl1gV3MXAtAOG7MeoUU2eoy
         K6iLdwCTKwOsCXig8GVYhkJnQzha/APrLrFtzdwJPmLYhPYPHCmldCa2dRMxvNaO+F/9
         YKxw==
X-Forwarded-Encrypted: i=1; AL+hErEzVKZV5iSeXMFHYBHDaUBoTqjhREor7CTi6LwqS/CXHOuwvVIOCm5RhHhEGhLHgTg7b9XwwewnjZjYpE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2PqaZr8Mi9B9YHZn+SlgShr9rhlvLsfvDwMGWyuEo7OlkXIu7
	fWzITr75hJ2C2asS8N1uYVETi9cOBh+p5/LKuYWEM4VfJmCdkqcdKJmtJD1w6phXrrc1mbT7VUk
	GPLujgVijKGwzVFYZ3a1WeHzBBNE8LMSYbGIOhBMh2AON7uuNt3LghMQWvVIqMjX1f2s=
X-Gm-Gg: AYBFou1hZq95oLrJEneg6Ewaug6yAN6jgxOk/i16BabLa9kTGaJBoOp7Wka3oMjkdHk
	vakjYzsqrxFjJqo39X1f5+0naMBsBxotfeIEhuBLOOx9RdR9YaaAbk5t4aAFf1zgtg4LOd+qQBv
	lZsuuLPT4G9j6rm5heA7EF0x08G93GKnSs/RjPL9FD+VFLWsoX4nwuANrV4Ic0LSQ7BoncsovXT
	20yA2mktQK+KAKmfG62qAvmxl6Mg2axaUEx7fiqnd12DCxjAPCJ9am2HspyyA3IJ0WtroOR8mGY
	vpxfuqK/QTD5Cj5O/8z1MVWNtdRd6yoU4vj50cEk3kk8RRqAPHXLmVcVUZYaacUXzQBoCXrrRpQ
	T/x5bedjbwgbcYur3zjpTlmUIOy8KsHsV6KLWpBNvbpqG5lq5QBWWUm/nWUTpcCk1xeRttumz1Y
	5JLtrPUSbwGJxLPm5W0LetzeOYcuGydfTrJYBlW+SkkZFpRecBmAogpzPo46ekuw==
X-Received: by 2002:a05:620a:270d:b0:949:7bb1:ac62 with SMTP id af79cd13be357-9499965a4c3mr611767285a.25.1795033372832;
        Wed, 18 Nov 2026 12:22:52 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:7bb1:ac62 with SMTP id af79cd13be357-9499965a4c3mr611762285a.25.1795033372290;
        Wed, 18 Nov 2026 12:22:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ebe874bsm2924491fa.34.2026.11.18.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:22:51 -0800 (PST)
Date: Wed, 18 Nov 2026 22:22:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erik Tagirov <erik@tagirov.ch>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] drm/msm/dpu: set possible_crtcs on cursor planes
Message-ID: <7jyydebmplngfnie7sfidwkeomi4xrgaytey6522q7qqsybg47@obppph6ea4ta>
References: <av4OfY5sML97l2F_@oasis>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av4OfY5sML97l2F_@oasis>
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afe091d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=lh5ckT7KmLwKjNu5S8MA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: xinHOBY83mJYnFBd9mpdpj6PgO3edATR
X-Proofpoint-ORIG-GUID: xinHOBY83mJYnFBd9mpdpj6PgO3edATR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX4KFkJ/8SVdof
 MhcamVmYqUQ9xosRrKUgCR/9vIr+OaR2yZFQcm/5tEHmNwvRdW3+E0oef2h6FwQW78x+akf9G3B
 5HxCJLzOgkDgh+ytw/tFSCXcVPR6DBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXx7V8cFmweg8q
 5gYlIdwj03LrtWJzNz5F7740smZK0oAWtfKn3NDke7yZElTnIDm547U162qdXzG15DzMSnlAFb7
 sTgCgB8MKuIs7gGSMr0xWNaHk0ajoixSIX6yBW6U1Aznm9YmsJYNV2txlQVamWvR9kjKbJVVWX6
 TrRCZufp7FlBYQpEieJMT9/YZlxmuR5gGmzwUAhP+ZwAgUhnhL7Q8OvvDYBByiw+XrnIBn9G5Xx
 NF32J0F/zExXBfEJtHhu5X+nA3kfVUfpxm57uNg4EFPU8qyfCIxeEsdDGRKiGbI+elZDiUoUr6a
 os9K1cQU2pkG45APW7XoA4I+dTnRcENR5kOCsmNJ6XEBo8dF3CKkXWQDmZPuIjaeX7fupByx7D4
 ulawIWP7cvaqotdtA2Y7bVVHDKewFWnzl6R2d/YhQFTcxD5W1GAlG+RGcGeY0dUjklRxEADxVHW
 g8iUbZpvqerrrF1er8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 09:47:42PM +0100, Erik Tagirov wrote:
> I am using a lesser known wayland compositor that uses the possible_crtcs field of a plane to detect
> which one to use for the cursor. On the Lenovo T14s two cursor planes are created, each with possible_crtcs set
> to 0xff. Which from my understanding means that they can be used with any crtc.
> 
> However, the compositor picks the wrong cursor plane which results in a lag of ~17ms
> on each DRM_IOCTL_MODE_SETPLANE call. Making the cursor movements sluggish.
> 
> After some investigation, I found out that this is due to the legacy_cursor_update flag not being set
> in drm_atomic_helper_update_plane() which has an impact in msm_atomic_commit_tail() where the fallback branch
> is taken.
> 
> The lag is solved with the patch below.
> 
> Best regards
> - Erik Tagirov
> 
> The cursor plane must be used with the correct crtc to ensure an
> asynchronous commit
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index da3556eb6ecc..4e0e9c2d8062 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -877,6 +877,9 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>  			ret = PTR_ERR(crtc);
>  			return ret;
>  		}
> +		/* Ensure that cursor planes are commited asynchronously */
> +		if (cursor_planes[i])
> +			cursor_planes[i]->possible_crtcs = drm_crtc_mask(crtc);

Here you are setting that the plane can only be used on a particular
CRTC. This is not true for these planes (even being cursor, it still can
be used on all the CRTCs).

>  	}
>  
>  	/* All CRTCs are compatible with all encoders */
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
