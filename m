Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989072;
	b=qVIekVQUmh4XNM8UDaAIm0oapqjJ16dCexmcrE5gLyWMe/RMglzTBTPNBz31jKxI5mfL
	 IeH7YH3bActbOQP5hXbDd8AJM5Co+XoN7LpSKmZOcELU00KeeAV06y/SE/m+bd79i3v1x
	 96fDYPMUrKbWh1efZa7VImcP6FlaJOXkAi/Qcw1DX3ASDBrn+DUTsKNdQVD34EyoY0h+S
	 sXe1eYFioP08T9NFqUwRDD4BiU9tO8zMyCNNX6vhMLvIMuj3xUhTiPXbYYMnlf1YJ/Fmf
	 YDQMyWMdaPvP3j3N4jMimN79Dgvv7EYmh8xel1piGgRhSjXrQDJrLX3F6sWB09n8OTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=;
	b=nYc5vBEuit+FGtwkt+5lbdrwdlcvJ0tZxy/ywqFUOVcB6Yg1dkIsrfjj3te3FMwbml5I
	 +IH5uOBEboxj93o7jukE9jfhGxA22MCrDkzhnAOQYguMRvV/RN5gryVOVtuEDsG0KOpZS
	 OU8bulA6jf0qYG/pKzZ9GdGH4HaXrCLw6cBwUfFvyhg9ydFm6BkSXH32+J3+6shuaGicY
	 gu+YGgvHq19TTOdFNrPW1ijOlXKEbU5ZHd3j0wSu+YC+7VCdfkTNmY4GDXewHCDjAJf79
	 WQeIbwvZ1dnqwG65i9P3fuBwAhvYoa1Z1VXOUqBT5UVLchft7EV7tHC/hp1fbtHFL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RzvF3R6b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQ4dXF8Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39FF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RzvF3R6b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQ4dXF8Z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwI22602462
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=; b=RzvF3R6b4G1KVhWk
	3AQI4qjpD+PaHjvYzu1uKVXQrUCNhmuoRYuO6Rqu8m7s7mM8nRaYBYxcx4hOgVBL
	wNZ1on2jv2jcsnfOa8m+ctg7Vez8iMvMin9ltA1nkm7nwmo1PecV4tVS/B6nv6Ze
	JlAi/YSev/3j5YHMmwB7yslr+W0L8cXjxNasUAlKZh+pT7fSWlLPia3y9/XAujyF
	IvX1iKc8XaqnbrsG9B/hqb4hCcHZ2nUg7ViiHXqSqYl7/dIDuaUKF2kfdjGIczrD
	f4mnuyEQ6/mkyZ2AFH8rYHWfeYuNoigspuZ0HzUliDRf4WQ5EU83mv8z9spMSW45
	I2I1bA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71yeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:04:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso890203b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989070; x=1795593870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=;
        b=YQ4dXF8ZMakacVpbaV75Jv/3IAKiL521GAhORAz8ReEgp5QBbUiItwgfx7/i5O9wtw
         K3UJM6sElAv1XRJKfSlgo97Fc0NpDk+Wf2hiWUvHOmfsPc0o80TzweG6495Tnd3VAR5q
         LoSYeo6MBts0TvKrFGNk0i8QBZp8V4suBOm7Ao+I6oft3zWD8tsMVv+xmYssTNoUsQOQ
         VL4OHWTxpwe9nYSq/mWoCVDreOZWJnf4rmhCAkFjRwk/RWswTOed36utfocDcSHWs3ub
         6d5or4tLguxJgBJIsmhOF47E//bshttM1UNa8OxG2WrniMG4ZLjQ6D+QmPno0FHH2ZPf
         0Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989070; x=1795593870;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB8f89dbYlqE2M1NScOeDW/y2KYp1haTaxP1dpQhixw=;
        b=dwG+PAsjpPHICTROr14ZhH6kl3lWG/5BjDJ2c+F+HW8Q8SogfZ7eTtVUrVPFx79sip
         BARuWAs3U8FuJLH2g6K6utvClDT4yW1sTZMoh2HOD/Ft2dAyRI57H0QEIkn4aRxjPRxf
         DQvgbOaks8qLh+Qm36EtfPku4/+FE7es1rD3CTl/zt30dYGI9Yu0XsegcTyRGlx9AOdq
         wv2UtyM3aE4ig0/pIf4CfBcAUV78qLFIwZA6zWesn3G2ommOVvzivzw+3RN659wndynH
         98LPU+lV7AuVl88nX74YHJcrnkiJNPr3L8HjRVcb6T4YjbShJdZd3LqVg9tBdFOkmCD3
         TiPQ==
X-Forwarded-Encrypted: i=1; AL+hErG27UmCWvuYD8QJfyTXp69xqiKseHfPmIuIVhConufV5qRFK/HEelpkR+8gW59nPNWxDW8ReuJzjmQ3ef4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gH694TCiwVqIzifhE7E6TKoxHz78YCdJf7ENtZeMv7h3dIt5X
	tJPDyxp36/DpIKfsrS/2S/fp296DP40vOErG5t8Q9PCkmmC/OjWDTnWaYfx7RziBNmRR8cP2T/M
	39LDO6mhMmglFH19a5nlC/SSjUWriNIWly6wYyMg2jU7bqeKYUsBk5SHIMmn+SgolHL8=
X-Gm-Gg: AYBFou2ZuyzBkDiXjWdBpqWf4apgl5st3xrhRoWctP2sTHp4OKjhFsIm5XyX7v5LfM4
	r3xlxhe+uKxolJ9iq6XCKHFpDVcc3M6eTSkplcF8f2kBn4yWF9UZjJ16LtTDllWULtKp84AOEUB
	6PX0LZ01c8C/snKtgd0CM6vggLGPDKwnRg7pAvGJXXMT8bt70CYu8BPtyTwgp8Z9JDuniM3t2jX
	+ci9iBVdMYPfplRl+BRE1sttrb+qmp5jjf/0LWx7vFixlSCG68ofo7oFIb5wbFdv/BwCzDRQJo3
	saDy/NbVbuqCFb1vXUUkjWUC7+7PMZxt/bYPwzF93dU3GhUHVKHi7EjMymBpwj+xThx6T/U4Wjc
	KbZydj6z6Msl0HV3KJZ+HXwVk5IGbuC/S1BIUJ38tCVVMj6I5NUur0WvLR4wqsPUI4mzDstMZnP
	1sc2VmZHK6/Rvj1K30O5Q/dXPahPDcxalzJCelC1y/22rYCw==
X-Received: by 2002:a05:6a00:4c92:b0:8a0:4493:50b3 with SMTP id d2e1a72fcca58-8c5cfe8d666mr1680898b3a.2.1794989070351;
        Wed, 18 Nov 2026 00:04:30 -0800 (PST)
X-Received: by 2002:a05:6a00:4c92:b0:8a0:4493:50b3 with SMTP id d2e1a72fcca58-8c5cfe8d666mr1680865b3a.2.1794989069662;
        Wed, 18 Nov 2026 00:04:29 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93c255sm750578b3a.46.2026.11.18.00.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:04:29 -0800 (PST)
Message-ID: <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:04:26 +0800
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
Subject: Re: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability
 TLVs
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118012321.2861920-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118012321.2861920-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JAxE6m6ulYi2yJ6TOI-l6SbDmWEV-hy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX9UsWHu0DnIGT
 1G/PyKvLay5ZbJe1+jz643r/HcTqKafu0jVTVq431kM10VQeLAxk3LWo3PhFVBzgTSIMPmJDGPp
 vc/9UEw3NA/NI670UOcNY+Umj3vV4xkITkYBURszv6IFcRQUrngZI+nSKJkcdRd0iXGrAtQbzOX
 73I89yQpM927ttZMsIcCLbEpqa6A5Y9ZesteumKxvwFaL7HsbzaDTGi0PSIY5l1yeW/jo5frFgk
 FzTsY7M/0zQh3XnnUNUCJyUsQi4vTBcv5QczeW4Cm870WRNDj+NRqZzGvRI84NtVyLmWD2Bd2Ox
 9Ry8XROrv/+AV4AmRk7QBf7Ztq7t4DqS0I6B4LEl/og59nbjxit+NBWsCtFR3Fpp0qgD+lQfUa7
 mrqPD6AvPUszNalMCvXJIW3RaSasMj7nlJzizjM82xzH3ZOH/2ej0roxxyqAoigGqDKZ02E/VOs
 a6p67xqhrB6agE9hnTQ==
X-Proofpoint-ORIG-GUID: JAxE6m6ulYi2yJ6TOI-l6SbDmWEV-hy_
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd5c0f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YjeMgbq9AAAA:20 a=apydtGMFAAAA:8 a=YzE7GG5PtzhQLXrrimcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=_GdCGhGMWlTvChih0T78:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXwjPjOQcUhssG
 eoLFFh8yeX03kzVGAxSJAOV9Sax5sHbxVNEZD6wfyYKzK96bSKL5usE7jtdnPLmST2gyLpbpxER
 Gq+xxu08Z9PoOEUUPXbZSdbRDwM2VJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031



On 11/18/2026 9:23 AM, Jonathan Wolf wrote:
> The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> therefore points to an inner TLV header, not directly to struct
> ath12k_wmi_dbs_or_sbs_cap_params.
> 
> Casting the array pointer to that structure reads hw_mode_id as
> sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> partner-link deactivation.
> 
> Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
> unexpected tags and payloads shorter than the capability structure.
> Use the first record, matching the vendor host extractor, and leave
> the cutoff at zero when the array is empty. Only store the cutoff
> after the complete array has been validated. This leaves the existing
> hardware-mode and link-selection policy unchanged.
> 
> Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
> patch to Valve's matching 7.2 kernel source. MLO advertisement and
> radio-mapping diagnostics were enabled separately. The cutoff changed
> from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
> and AP-side data counters increased on both links during traffic.
> No driver recovery or association loss was observed during the test.
> An unmodified upstream kernel was not boot-tested.
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-parser-live-test.txt
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Tested-on: is not an official tag so we usually have it at a separate line before official
tags:

<leave a blank line>
Tested-on:
<leave a blank line>
Fixes:
Link:
Signed-off-by:

> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 75b259990..f43c9a359 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
>  	return 0;
>  }
>  
> +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
> +				       u16 len, const void *ptr, void *data)
> +{
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
> +
> +	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> +		return -EPROTO;
> +
> +	if (!*first)
> +		*first = ptr;
> +
> +	return 0;
> +}
> +
>  static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
>  					 u16 tag, u16 len,
>  					 const void *ptr, void *data)
>  {
> -	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
> +	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
>  	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
>  	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
>  	int ret;
> @@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
>  		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
>  			parse->htt_msdu_idx_to_qtype_map_done = true;
>  		} else if (!parse->dbs_or_sbs_cap_ext_done) {
> -			dbs_or_sbs_caps = ptr;
> +			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
> +						  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
> +			if (ret)
> +				return ret;


better to leave a warning before return


> +
>  			ab->wmi_ab.sbs_lower_band_end_freq =
> -				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
> +				caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
>  
>  			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
>  				   ab->wmi_ab.sbs_lower_band_end_freq);

to follow the convention, would be better to move the sbs_lower_band_end_freq cache and
debug print into the parser as well

> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index b508aa759..94bb6854b 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
>  	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
>  	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
>  	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
> +	WMI_TAG_DBS_OR_SBS_CAP_EXT = 0x400,
>  	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
>  	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
>  	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,

