Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140836;
	b=Ty6uV8gDs1XUV2rFDrsSoPInhjATUChWiOXgZ5Y6Z2tj6nd1HPu2w86vjCHVGX1DWLfi
	 cNFmtcgdt8XuVo6khE5as9tHfv71QbQbmvDAdTK66yx7xHC64GoyBkXHj5baQR+A/AqdA
	 wY7IMkBc+Htjc0GXhwpHvUeHY8lw90/DmhTGTOfoZmVKPdH2dgBKo+71MWd9Az0r5eFGJ
	 NHD60nxxhAC3vSjUCEUfJs/8Enq0Gvq3GvFb04m7dcB84/9Uv1N0R/2Xr7fvRwdD003xC
	 zzGpTB0bqmnZ3CR3QMHEFIBixnQMdn88YDpFqviZwP+ozHJU1Y5B+uiS1E+wI6IfJqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
	b=gnrsP7qjzYWgwl9SH+WsX/89n6OsuCuX2bYn016blhX8nsBxh37F+/PW0DwOKna6vHxe
	 GWYn8sEzqnWQyENiQpiar+dG8SM+ze8C9XUuKsriU823oxOu0/93pjuSUyJNCdIDBpg76
	 lArf1SF0CtQgDbZZucXQa6+b1/3iziBf6oxVfpNDCZPTmEYTPTIJ3MfpnGawzKreCP8I+
	 3Z6HegNVGi+7veXSCRk7fSvzh53NKU7I7TGi6j2pn/x1IIVCRo6lAlCwG6ndjavSlL4Wa
	 w5iqa3B/s/CIqyNHZoJHkf1rw6VgZh4S24Ti2nhoV+12A2zJ6BhSYnqLataFib31uqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVBjjFEX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevDY3YL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD750606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD750606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVBjjFEX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevDY3YL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G7bn3295129
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=; b=MVBjjFEXgtLpmWhH
	sXBbA9lgTsZ/Rnt9bxbCQe2G9xb6DSX9FtTmFMapfQqy91pdtMZBVjliNNr2AAM2
	sV6XHtts4sy5gYUMSfv7bVre2ZLNH37v5jFgqSKsC2YYYQA/eDjKqgZeePMtbRta
	aJCo/ORVZsHc2wr6rG7rDFVmfJP78Ow5Hvu1XjF3vtfLBEKTQselVOHxBDP4ZyEL
	V+5gb47AOea7MnmrGijFPmLAMASJu2xnoQr73APpWaBb6jW8Ah8COzgwRzXYPaBD
	48S08PjMzBrKdwkTqS561EYpSYVededMc0hqwHr+5z0+AECT+Ux0AUq749GZVVZq
	5vXEXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghkwy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:13:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so799689a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795140834; x=1795745634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
        b=fevDY3YLCZx/hny4n0qQoPMK/h1kgXPBR7Blqrr94AcUGaEzsN/UKUc7qFFgaB4yHt
         cFJlAjG8uzIR1/fmupPdeQ+2OYxzkvzk8IRuG5eByIFCiDTwxq82G49EzG88Lr1SLVpY
         +AefQqEnNwhQxPVJb4/qNcjXgrIa9kmsT0YJhr/RfAsn+qJResimPGpd6Cjtv5VoUhO9
         JpQmoMqjDLrd1AaemIrEXswXe3vq2Yemu8L97derGgsEazHSavvUm/2T26//5yFqbURE
         4+mYL7n8/SvhVNwB0pAJe3MXDlw22dhLZkyI6DwedSFAM6QE5tfQVEfjqdKzqPojI4pC
         Yqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140834; x=1795745634;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9yc2VkkPuc/RNg0RZUbGHPvC6vp9oOQHo0RP401KUI=;
        b=ZlbR3VGKQb3P5RyB+48O8rc+cb8LPxRRGrwHcqkusjfKfXpulngb7ASKqLHQw60EVV
         CGeCYf2IhWuCTI0NmnU8hFOk8MynbX0aaYu2NVVBShZX65ZGqCC/K0HcYilrsG2l7QMr
         /7q9pqVM0lJejmi/7fiZtgUTfxu6U9fBfBhvPs76VcqD1E2w8exSH/f9vujywOv9QAXv
         QbRqIucGqBJQ+aF0o1jHUCF8rNNbePzRWLqtK5F0jRU7hxAC9SvdGcx0KR85nEa+jUo3
         4cwOyl7W2ocshLOhKjrs+/wBVQwAiiJvHET0GwPGGROOHDaDMhjK8j1SOhIK5QxWI+vB
         ZHMg==
X-Forwarded-Encrypted: i=1; AL+hErFYprWsptDMJeyNySg00IbMpHsj6xU1Jp8fhtW4AmOrvKElDfPNJgJSwBx3LYMfwXpueyi2GSCyEecJf5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9/3/kTHVY2A1JD/5rk+nj2iO9vVylxpUecgDyQBYoQqtNO2uG
	xyqrPg12jhdKarVyCXfd89NE1WWj3dhj91nZwhrrVAZ0K3GhrX1ChSkVyvO/IxR27QV0K39GWxr
	dzFFP6PVdz5oAfnRfOgtJXBgKxkWyWH3IZuV4YtKYGxxtCF5rMVzlCKT4wWwnOAyQq/g=
X-Gm-Gg: AZFdTZfIsytARGuwcLKUxulXLu/vOdMH2SoWJuvCZIUfKZvtdArLH2erJuSyu/h0MZ2
	ikd8MJzpFBMqOD9zDvY9N2fp6f7wPIqndCaKGB7Ps1NJ/+ptfyRbLkYphOPsURPR1NDIlL0eJOb
	n9dnxrE1whnPH5iIBO1VrYfGwE+NHbOj727jejIFd1+ByGD9SPU2KDXhiHVTAcY3UBQa/gPK8KR
	01pP/JYjpl8DBg64PSbq1Z1ilPDBGFda0D6HCUB70paXSlBl8VMdVbRbtgE9bgD6QvFGVzmgqq9
	8aq298d8W+XoFqTap2432f8Kwz36O9WIRjBtk2d5eDrGHcXUrImIxdjy2F3uaf1PGSP9TIFUdKl
	5Uuk0srf7V6DPt4Wjrmk63Zc+d+7HIXZosR4Hwdh6xHbNVD4piwB09bzE3K/a1lpyBoKR0OYtEE
	pQEmcOm9zVsdIapmjrc7pODrxxy4Zmb3OY8TNPRdWfzTMy
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr1394768a91.9.1795140834160;
        Thu, 19 Nov 2026 18:13:54 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr1394743a91.9.1795140833690;
        Thu, 19 Nov 2026 18:13:53 -0800 (PST)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm893758a91.7.2026.11.19.18.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:13:53 -0800 (PST)
Message-ID: <46ad0af4-b719-48c3-b653-7367c5b2a136@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:13:50 +0800
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
Subject: Re: [PATCH ath-current v3] wifi: ath12k: parse the nested DBS/SBS
 capability TLV
To: Jonathan Wolf <wolf@pi0.com>, ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119191717.215161-1-wolf@pi0.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119191717.215161-1-wolf@pi0.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwOCBTYWx0ZWRfXxJIfFcljlZdc
 bioLNNMl0b4Wfr4rK143kMBvLPqDJJFmYafhAGUDlj+TXM7CIh+/qBwwyaY4Sz9iffilW7Gb6/i
 /R+/j8royGYUl5ZuDkAuIqWyFmGAz3QUGAyroi+YuRzGdhAkhRoyi8bEVt+z8Qpc2ovtlsqngxj
 ylYFbwcjjwcBWe1a4Ls0Yy5nNYBKA/idHtSQoNhiuTboAZBzDlkwk3+J0YhoFamlcx81246/ft6
 SaBHedx8SpZT0WSsgZoBuTYqRxn/Gs2PN+U0HHIL/h8cObwO8K6wUI6bJC0xoyY7nhCSM2Z7tws
 sW6A5QKqLQ4oFDrHCEw8PegrrPzFz83Kxg6C1oT0Va/p1I0Qr2X28Qb2ZHOQ92F8t9mk08u05TD
 p/u20qCCcPy2tw3b1C4bmZRDljOqzQ==
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6afface2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=apydtGMFAAAA:8 a=EUspDBNiAAAA:8 a=ZrLfHWaURdO93HeJtlEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=_GdCGhGMWlTvChih0T78:22
X-Proofpoint-GUID: bnwCyP6OSRzCuBCKyP4xodZMLlTdaUe6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwOCBTYWx0ZWRfX03xRN2revSxZ
 ywoPisg/4TlmhMXKNo9A4ZpzuCXyCoI5PkVuyF4SLt3o7ni1g2ZdjcrShtbMg6+RZnoYskBoMbj
 L6wkJAmUFW0AuGvD8ctYniB3bc1AUPk=
X-Proofpoint-ORIG-GUID: bnwCyP6OSRzCuBCKyP4xodZMLlTdaUe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611200008



On 11/20/2026 3:17 AM, Jonathan Wolf wrote:
> The DBS/SBS capability in WMI_SERVICE_READY_EXT2_EVENTID is inside a
> WMI_TAG_ARRAY_STRUCT. The array payload starts with the inner TLV
> header. Casting that pointer to struct ath12k_wmi_dbs_or_sbs_cap_params
> makes ath12k read hw_mode_id as sbs_lower_band_end_freq.
> 
> On WCN7850 with hardware mode 5 and a 5900 MHz cutoff, this gives an
> SBS frequency range of 4900-5 MHz. The driver can then map the 5 GHz
> and 6 GHz links to the same MAC and request deactivation of one link.
> 
> Use ath12k_wmi_tlv_iter() to reach the capability payload. Check the
> tag and minimum payload length before converting the cutoff to CPU byte
> order. Clear the cached cutoff before parsing so an empty array leaves
> it at zero.
> 
> Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
> Signed-off-by: Jonathan Wolf <wolf@pi0.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
