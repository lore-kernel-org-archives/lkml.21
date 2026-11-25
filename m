Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602397;
	b=Za3wuM3L+xOFLA67BvbDRysZTbaz0oTmfXU9JYfFDzPoh8xd9WSrVFJf+Yq65+Kqs27e
	 wljbmU41S40Wg8xluErFenaVeEf5fPQu4yPJSFKRcyypiMw47A3TLQWAAF0IPQoa9za2p
	 Uy/VPiNAZmh+cGy+Yy3/fwpkShQ6xx+l/PZBB5l8wnBTW+JHNxncYW/P/+h0FnyTfpBhR
	 2KYG06AuxPpquxpcwXVXsfdedQWT9sgg32V5cDDVAiQ3umgI9nf73f15AvDmImxQlSWaj
	 rENcEFQlVzJnSI2GVJHSkGv1suuLAjCT+mn3L/7HoZiiVUFIyi2N/PHiqnUFkXHYzYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
	b=YEGGBECkj4EovBF5StTLvpG6CMIAV7PYhWdJUq1h7rDde9ibgrbBJhq6YL7ENxu/Bwz1
	 0O8NjNNt3uazLxCpo2Z3uD1yV2iKLYDhMCjK0GW4uBcC8nx7SjuvKjwK0o08tZ693AdTC
	 Fu4m/1R6lxK24dYhNdID4NsegP2oYIP8g0nIyCxg3qHHT7ndW5QQWAvLMa2COg2ryUlWJ
	 aNgxG9n7R4RpRUCiykSEWC6UfnQ4HWT2z9JSjhSYVdMy7ndK7ZoyQ8nGXTEh7eC6fl08a
	 tFDJokfwCDZIXLQtgsf9ib7haVg+2ojPbtpdzT8HjYbY/zk43ZCyMrZyLLCJDQlJqrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMulSzXC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kFaOPrZ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1673606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1673606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMulSzXC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kFaOPrZ3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOmB3764000
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=; b=oMulSzXCiUoJH7kF
	IIZGVo5vdon9UD11anYrJr4YAYEATeTNaNwG1cBsfB41hNrS+cdg6iQ9EB5yrrXL
	zaGIxoIxo8mq4/xbNq+Jde1AskIMPOcDGQpFK1g6r6QwsoE7g8fGDLo8aCo5kPbU
	dXE5gjvVm/38lOxAQzpwksEfWdYGEhGtE4y0l2F5pnabmI74iRaXb+fPUvYZgh88
	MjOx5ynN6TRURPdIgAb9P6Kjxk9ot+/YzSRne3jwIR1xOa4yg7wuKZw/DhOJastg
	/DXtqzpwrG4ghK1qirctUHe+pcAlbaSroMyXqT7dauLAGSOwgj0S3Cg5xKpQp+UF
	3nO9zQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rasp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:26:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so867177185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602395; cv=none;
        d=google.com; s=arc-20260327;
        b=bW22ZLULfCDrcHVB5HSdXqMSA1TMHbRqBIg3wUZNlX1LWK+fxvQcqbiQoYfnzQ4cQa
         +rbRxkh9cp8/c5LhwbNFoC28UKny+eV9Qd6VGTtfcVz0AzYXt3c+wn6tmrUaUpx8rM+/
         aBPZ8QcUOehyjL8L9ES1bP3AW+rlnsu9uIakD3I9uPkWgZT3qPMf/6pLlP1CTnh1NyGd
         UYxVjPKbvmughjs/sNxcVRApbKBY2BVwug2LqCbWMFlrJ4kDaLVZCsacIiEP5FFr7IaJ
         5qzFlXG05ZsmtVfuGlIUaz/WahcjZlF9WXSWEuyLKW4hhvjZ3lrH7VbsmKc4uGOOWbEu
         yUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        fh=z5hyKxzQBOBHkasW6+/DxG/QsHLrxBI6KMpMoV9QJOE=;
        b=i3bVygUFcodQboLwBduO/sb184+/O+wW9oC1VMeZDBa13CPU78BbGBwArbLTuAZZlP
         MgOPeFIIUmuTPy9WlM4pNbimO02jmHWqKLcUbbTk1KV0QQZ5ZTHhdJd6FlG2X82WKbOX
         k/9oSEwY6YyZuos0/QIr67RQa5C3X8TOlhbEoKFU03e8YB0ywKRVyN8jnOCZy3+mM5AR
         ZJ9mmWm2XCxXeB/C8OXQ7FJL2V7MY4h8VN8jwtfhtUlxpa4g/co8NY0QVkHuwRMUApr9
         +nLv2MaD32sOTjR63OuBaSvKHuyEEaqVI1+3a1yqZbYwDKXqzBVzXhTHpuvNyMYonYHE
         LN4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602395; x=1796207195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        b=kFaOPrZ326QVGwH7N1vc0v4AFrKvQbWVFuajc2H7Qezhi9kN0z4mmt4fdFSdRlNLKV
         mtNATao9bYNw0hCvloCwAGheqWcDD4CIluE1bPR6yl6e+XMnJ64p/Vph/P71b9XrgOij
         fRzcsfH7ceVQeh0EGPj0yvU88gBx2pwbHYqrNkQLqVefYtDCGQgLbznfsGHR+DYoBjDW
         DAtVpJpABgp610P6H7/sw+yt2vH6/AUNjphYAn3kiZDDcI1L7BLYBWJdMJLmEZ84oWWG
         pWI/JCXmWXevf7154OeU/2Vdr8X60THMnNmDtKdUOUPRLFj/M80t136L7pe7OmAsl8GL
         svpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602395; x=1796207195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sW6d6JDq/zeXHSX5/4rlTpcE+ESULAxw3FqFdj5Gyjs=;
        b=JP/fLdBFxoRFqTLxLFuFJHWrX1Yz00AjEZ7A10NltGoKwas9i4giYVTW5qi5JcTzHw
         S7qfvhcATPTCS74/xOeRUkVnupqSMlV2Sd+BR/gMlo0Ei2hxT64rAvTGD95tGtADTMm6
         MZDNf9SXQQWuWAZ3/U9aQou2MFV5BSgW1/SmPcjEO9/OvZ+XnxgMUiVElVrqrLyTitYd
         0X2QdXwMt2UQ06UVh/6yGiB4leDhzrWClgzdVpibdT42aZpSncNykOZCqDpUCjh2DFz0
         ugccLqsPak+nApRMCjKb3G9wfrV/RYvpnjaxkxRN4QDlSxu9EXQZ08P+ga3GiavItMA3
         GhAg==
X-Forwarded-Encrypted: i=1; AL+hErF8ATa7fi6X02kzisrL3JTU1hbzf0klIfJ94un8Bz3w/B9FVk28uFWv6KyN0UvElcnXkNN0nN+WJWPHHrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+JVgm6uqPkp4l/Hdhy6UrPGjqBMW10ctXF4KQlRMvqS2QZayA
	8Lhd2115MMLLhj1Nil33x8aUtyPTi7SMVjW9FXaHCt7sbFcVfg4lzLuux2fu63PENJ3cq5dpqeZ
	3EbNZDRY62Jc6LbCCYiWTjTGHqAG3eR+YgKhPgb2XAgMwwd5PAY0GE/8MEnUBWKd3tiuwXGfVEs
	UZ4OtU/9qH7/UXwwZsGBIaSiZhQP/d9akdpqcODrHqvQ==
X-Gm-Gg: AZFdTZdZbN6AiYaJ2wQoaYwxAF1WMROFD4cRYtPs6vS+xGfco1C9GdxL40b+UUAOecw
	D3ON9a308HQIh0mSAPrCdjle0E10cuQFM4sgTVcA7lfUTOjYQS+rtSEJSBvB6FiaBDKZfsB905F
	cw0PukUeAjy7lLDq9745EW/Ktw1y9kAE8v2ueygNLdJF6vxNq4JcI40ZqyR+URBlhVzaHGGF33O
	bvh7Oc1w6cm1tOcztZuUtCnzfvlBXi73rZsH8AEaJ9IVsahD67gK9qlZQTdpJS+nJGAvIluH5M=
X-Received: by 2002:a05:620a:448c:b0:93a:82a:71e5 with SMTP id af79cd13be357-949ba95560bmr2997969285a.19.1795602394967;
        Wed, 25 Nov 2026 02:26:34 -0800 (PST)
X-Received: by 2002:a05:620a:448c:b0:93a:82a:71e5 with SMTP id
 af79cd13be357-949ba95560bmr2997966985a.19.1795602394422; Wed, 25 Nov 2026
 02:26:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:26:22 +0100
X-Gm-Features: Aa3M54pDilQgmdQ_iplbP4xTthogyJeysaRUo2ZcdIbsLLaIHGQCESKKQsu7iDE
Message-ID: <CAFEp6-1UR8eSK+nPeQ+wAHsb50VD8iyrHs2DoyNqtPpKV9mJUQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX6hI/B3MA4P0m
 xEziBQ64wbyRZr+fNOUSAcl7FtNRaJhCEJFqOD89bGO2x2cNHNq7JY38AqbUuFFn8priyiksYjr
 0jAMRaK1PRCXZOsyTtts8KV83d4Wivs=
X-Proofpoint-GUID: wNUJrOWGEahWU5JmB-j-70w-ayJQf9-S
X-Proofpoint-ORIG-GUID: wNUJrOWGEahWU5JmB-j-70w-ayJQf9-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXxerh2jj0X1Lz
 sw/QNeQRsYn8BgoDoILOUKNJ9m9lBbR+cN1+McTGvSiGlNPwEAf0/wXMReah7dMjXczFomtIO2K
 FBuEfNQ1Aogf1NR8NY6grfvrd7VZ1/zPc/YZkUjGzVdZBkulVpwTqmjVxaNvUdSDelNWldZOouc
 Q05GPkPw3DW2dTokHr8c2zyUPkQB4wp//3djiY3vDtbjeEwRv+VO2pMT1AZHl06zIkQP7Be5Qtg
 w1FOWITeiJWFbIjjuKppitT2MDyh9zi5OtHeH9D/pTk1j3kWN2rLhWrC2vLnzur2cUUXMPUIL6X
 KbGHjboOwIQJbazC50QPttrvAipI1bAQ/scDM6OpCV7rK67nY5efNwe3bN4Z6mQCrBj78MAoODl
 v5JlSulncV//lhzh3VCQ2m+XA22SOJYVRbKwpixRS7bc56qbaSKr4oBvqb+4S/9FzOQap6TTi01
 Aj5pDG8HA5xE5oka5vg==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06b7db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=RL1vT02WTRJ250hdzHgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250041

On Fri, Nov 20, 2026 at 9:42=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> Each recovery trigger queues recovery_check_work on workqueue_aux. If
> a recovery is already pending, the work blocks for up to 5 seconds
> waiting for it to finish, and marks the device WEDGED after four
> failed waits.
>
> On SDIO, one firmware crash can raise several triggers. workqueue_aux
> also runs SDIO RX and WMI SERVICE_READY handling, so the blocked
> check stalls the traffic the recovery itself is waiting for. Recovery
> then fails with "ctl_resp never came in (-110)", and a recoverable
> crash ends up WEDGED.
>
> Stop waiting on workqueue_aux. Let only the first trigger start a
> recovery, using atomic_cmpxchg() on pending_recovery, and ignore the
> rest. Replace the wait-and-count logic with a single 20 second
> delayed work, the same bound as four 5-second waits. If recovery has
> not completed when it fires, mark the device WEDGED. Since the
> deadline already covers elapsed time, fail_cont_count is no longer
> needed and is removed.
>
> Because pending_recovery is now set only once per recovery, any path
> that abandons a recovery must clear it. Otherwise the next crash is
> ignored: the device is neither restarted nor marked WEDGED. Clear it
> in ath10k_stop(), and in ath10k_core_restart() when the device is OFF
> and there is nothing to restart. The OFF case was found by code
> inspection and has not been reproduced.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.c | 75 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  7 +---
>  drivers/net/wireless/ath/ath10k/mac.c  | 15 ++++++-
>  3 files changed, 56 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 2aa18adb31cc..b536c21630b1 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2535,48 +2535,45 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> -       struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       struct ath10k *ar =3D container_of(work, struct ath10k,
> +                                        recovery_check_work.work);
>
> -       /* Sometimes the recovery will fail and then the next all recover=
y fail,
> -        * so avoid infinite recovery.
> -        */
> -       if (atomic_read(&ar->fail_cont_count) >=3D ATH10K_RECOVERY_MAX_FA=
IL_COUNT) {
> -               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> -                          atomic_read(&ar->fail_cont_count));
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
>                 return;
> -       }
> -
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
> -
> -       if (atomic_read(&ar->pending_recovery)) {
> -               /* Sometimes it happened another recovery work before the=
 previous one
> -                * completed, then the second recovery work will destroy =
the previous
> -                * one, thus below is to avoid that.
> -                */
> -               time_left =3D wait_for_completion_timeout(&ar->driver_rec=
overy,
> -                                                       ATH10K_RECOVERY_T=
IMEOUT_HZ);
> -               if (time_left) {
> -                       ath10k_warn(ar, "previous recovery succeeded, ski=
p this!\n");
> -                       return;
> -               }
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> -
> -               /* Avoid having multiple recoveries at the same time. */
> +       /*
> +        * Pure deadline monitor: it is armed by
> +        * ath10k_core_start_recovery() and cancelled once recovery
> +        * completes. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
>                 return;
> -       }
>
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);
> +       ath10k_err(ar, "recovery did not complete in %u ms, will shutdown=
 driver!\n",
> +                  jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
> +       ar->state =3D ATH10K_STATE_WEDGED;
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle. Losers do nothing
> +        * while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Arm the monitor before queueing restart_work so that restart_w=
ork
> +        * can cancel it if there turns out to be nothing to restart.
> +        */
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
> +       queue_work(ar->workqueue, &ar->restart_work);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>
> @@ -2655,6 +2652,13 @@ static void ath10k_core_restart(struct work_struct=
 *work)
>                  * or if the crash happens during FW probing
>                  */
>                 ath10k_warn(ar, "cannot restart a device that hasn't been=
 started\n");
> +               /* Nothing will be restarted, so no recovery is pending a=
ny
> +                * more. Leaving pending_recovery set would block the nex=
t real
> +                * recovery and let the monitor wedge a device that is st=
arted
> +                * later.
> +                */
> +               cancel_delayed_work(&ar->recovery_check_work);
> +               atomic_set(&ar->pending_recovery, 0);
>                 break;
>         case ATH10K_STATE_RESTARTING:
>                 /* hw restart might be requested from multiple places */
> @@ -3769,7 +3773,7 @@ struct ath10k *ath10k_core_create(size_t priv_size,=
 struct device *dev,
>
>         INIT_WORK(&ar->register_work, ath10k_core_register_work);
>         INIT_WORK(&ar->restart_work, ath10k_core_restart);
> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_wo=
rk);
> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_=
check_work);
>         INIT_WORK(&ar->set_coverage_class_work,
>                   ath10k_core_set_coverage_class_work);
>
> @@ -3806,6 +3810,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>
>  void ath10k_core_destroy(struct ath10k *ar)
>  {
> +       cancel_work_sync(&ar->restart_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>         destroy_workqueue(ar->workqueue);
>
>         destroy_workqueue(ar->workqueue_aux);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..2e100dd246e2 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -87,8 +87,7 @@
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
>  #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
>                                   IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVE=
R)
> -#define ATH10K_RECOVERY_TIMEOUT_HZ                     (5 * HZ)
> -#define ATH10K_RECOVERY_MAX_FAIL_COUNT                 4
> +#define ATH10K_RECOVERY_TIMEOUT_HZ                     (20 * HZ)
>
>  struct ath10k;
>
> @@ -1207,14 +1206,12 @@ struct ath10k {
>
>         struct work_struct register_work;
>         struct work_struct restart_work;
> -       struct work_struct recovery_check_work;
> +       struct delayed_work recovery_check_work;
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
>         atomic_t pending_recovery;
>         unsigned int recovery_count;
> -       /* continuous recovery fail count */
> -       atomic_t fail_cont_count;
>
>         /* cycle count is reported twice for each visited channel during =
scan.
>          * access protected by data_lock
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..74aca0af11c8 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5427,7 +5427,14 @@ static void ath10k_stop(struct ieee80211_hw *hw, b=
ool suspend)
>         cancel_work_sync(&ar->set_coverage_class_work);
>         cancel_delayed_work_sync(&ar->scan.timeout);
>         cancel_work_sync(&ar->restart_work);
> -       cancel_work_sync(&ar->recovery_check_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
> +        * recovery state after the works are cancelled so a later
> +        * ath10k_start() can start a fresh cycle instead of being blocke=
d
> +        * by a stale pending_recovery that nothing will clear.
> +        */
> +       atomic_set(&ar->pending_recovery, 0);
>  }
>
>  static int ath10k_config_ps(struct ath10k *ar)
> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80=
211_hw *hw,
>                 ar->state =3D ATH10K_STATE_ON;
>                 ieee80211_wake_queues(ar->hw);
>
> +               /* Cancel the deadline monitor first so it cannot declare=
 the
> +                * device wedged after recovery has completed.
> +                */
> +               cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>                 /* Clear recovery state. */
>                 complete(&ar->driver_recovery);
> -               atomic_set(&ar->fail_cont_count, 0);
>                 atomic_set(&ar->pending_recovery, 0);
>
>                 if (ar->hw_params.hw_restart_disconnect) {
>
> --
> 2.34.1
>
